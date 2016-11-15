Given(/^I am logged in as a Manager$/) do

end

When(/^the Manager (starts|stops) the voting$/) do |starts_stops|
  visit votings_path
  if starts_stops == "starts"
    click_on "Alusta"
  else
    click_on "Peata"
  end
end
