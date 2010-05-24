Feature: Managing <%= plural_name.titleize %>
  In order to ...
  As a ...
  I want to be able to manage <%= plural_name %>
  
  Background:
    Given an admin "edgar@hoover.com" with password "monkeys"
     And I log in as admin "edgar@hoover.com" with password "monkeys"
     And I am on the admin dashboard
  
  Scenario: Creating a new <%= singular_name %>
    When I follow "<%= plural_name.titleize %>"
      And I follow "Add New <%= singular_name.titleize %>"
      And I fill in "Name" with "Biggles"
      And I press "Save"
    Then I should see "Biggles"