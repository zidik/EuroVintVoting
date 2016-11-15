Feature: Vote with SMS
  As a Manager
  I want to manage votings (create/update/delete)
  In order to execute a  voting

  Background:
    Given I am logged in as a Manager

  Scenario: Create Voting
    Given I am on votings page
    When I create a new voting "Minu eriline hääletus"
    Then I should see the voting "Minu eriline hääletus" in the list

  Scenario: Update Voting
    Given there is a voting with 1 registration
    When I change the voting name to "Tänane hääletus"
    Then I should see the voting "Tänane hääletus" in the list

  Scenario: Delete Voting
    Given there is a voting "Tühi hääletus" with 0 registrations
    When I delete the voting "Tühi hääletus"
    Then I should not see the voting "Tühi hääletus" in the list

  Scenario: Delete Voting with registration
    Given there is a voting "Registreeringuga hääletus" with 1 registrations
    When I delete the voting "Registreeringuga hääletus"
    And I should see the voting "Registreeringuga hääletus" in the list
