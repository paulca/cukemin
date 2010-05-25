Feature: Managing <%= plural_name.humanize.titleize %>
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
  
  Scenario: Editing an existing <%= singular_name %>
    Given a <%= singular_name.humanize.downcase %> "Goravia"
      And I am on the admin dashboard
      And I follow "<%= plural_name.titleize %>"
      And I follow "Edit"
      And I fill in "Name" with "Gooravia"
      And I press "Save"
    Then I should see "Gooravia"
      And I should not see "Goravia"
  
  Scenario: Deleting an existing <%= singular_name %>
    Given a <%= singular_name.humanize.downcase %> "Goravia"
      And I am on the admin dashboard
      And I follow "<%= plural_name.titleize %>"
      And I follow "Delete"
    Then I should not see "Goravia"