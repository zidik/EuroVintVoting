Transform /^(-?\d+)$/ do |number|
  number.to_i
end

When(/^the Voter(?: "([^"]*)")? sends SMS with content "([^"]*)"$/) do |voter_name, content|
  voter_name = "Mati" if voter_name.nil?
  post "/vote/sms",  {Body:content, From:voter_name}
end

Given(/^there is a( running)? competition with (\d+) registrations?$/) do |running, registration_count|
  if running
    voting = create(:voting, :running)
  else
    voting = create(:voting)
  end

  registration_count.times do |i|
    order_no = i + 1
    create(:registration, {voting: voting, order_no: order_no})
  end
end

Then(/^competitor number (\d+) should have (\d+) votes?$/) do |order_no, vote_count|
  registration_vote_count = Registration.find_by(order_no:order_no).votes.count
  expect(registration_vote_count).to eq(vote_count)
end

Then(/^SMS is (accepted|rejected)$/) do |response|
  if response == "accepted"
    expect(last_response.status).to eq 204
  else
    expect(last_response.status).to eq 403
  end
end
