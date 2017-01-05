Transform /^(-?\d+)$/ do |number|
  number.to_i
end

# Used in place of voter number
default_voter_number = "randomNAMEstring123!=(%"

When(/^the Voter(?: "([^"]*)")? sends SMS with content "([^"]*)"$/) do |voter_name, content|
  voter_name = default_voter_number if voter_name.nil?
  post "/vote/sms",  {Body:content, From:voter_name}
end

Given(/^the voters number is restricted$/) do
  create(:restricted_number, {number:default_voter_number})
end


Given(/^there is a( running| stopped)? voting(?: "([^"]*)")? ?with (\d+) registrations?$/) do |running, voting_name, registration_count|
  running = running==" running"
  args = [:voting]
  args.push(:running) if running
  args.push(name: voting_name) unless voting_name.nil?
  voting = create(*args)

  registration_count.times do |i|
    order_no = i + 1
    create(:registration, {voting: voting, order_no: order_no})
  end
end

Then(/^competitor number (\d+) should have (\d+) votes?$/) do |order_no, vote_count|
  registration_vote_count = Voting.current.registrations.find_by(order_no:order_no).votes.active.count
  expect(registration_vote_count).to eq(vote_count)
end

Then(/^SMS is (accepted|rejected)$/) do |response|
  if response == "accepted"
    expect(last_response.status).to eq 204
  else
    expect(last_response.status).to eq 403
  end
end

Then(/^no votes are registered$/) do
  expect(Voting.current.votes.count).to eq(0)
end


Given(/^I am on votings page$/) do
  visit votings_path
end

When(/^I create a new voting "([^"]*)"$/) do |voting_name|
  click_link "Lisa hääletus"
  fill_in 'Nimi', with: voting_name
  click_button 'Lisa'
end

Then(/^I should( not)? see the voting "([^"]*)" in the list$/) do |negate, voting_name|

  if negate
    expect(page).not_to have_content(voting_name)
  else
    expect(page).to have_content(voting_name)
  end

end

When(/^I change the voting name to "([^"]*)"$/) do |voting_name|
  visit votings_path
  click_link "Muuda"
  fill_in 'Nimi', with: voting_name
  click_button 'Muuda'
end

When(/^I delete the voting "([^"]*)"$/) do |arg1|
  visit votings_path
  click_link "Kustuta"
end

When(/^I copy registrations from "([^"]*)" to "([^"]*)"$/) do |source_name, target_name|
  visit voting_registrations_path(Voting.find_by(name: target_name))
  select source_name
  click_button "Kopeeri registreeringud"
end

Then(/^I should see a voting "([^"]*)" have same registrations as "([^"]*)"$/) do |name_1, name_2|
  participants_1 = Voting.find_by(name: name_1).registrations.map(&:participant).map(&:id)
  participants_2 = Voting.find_by(name: name_2).registrations.map(&:participant).map(&:id)
  expect(participants_1).to eq participants_2
end

Then(/^I should see a voting "([^"]*)" have (\d+) registrations$/) do |name, count|
  expect(Voting.find_by(name: name).registrations.count).to eq count
end





