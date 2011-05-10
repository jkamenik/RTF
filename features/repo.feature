@wip @repo
Feature: repo
  As a admin
  I want to be able to add any number of repos
  So that I can monitor all features from all repos
  
  Scenario: List
    Given I am have repos:
      | name | repo_path | setup_command | cucumber_command |
      | Only |           |               |                  |
    When I visit the repos page
    Then I should see "Only"
    
  Scenario: Add
    Given I am on the repos page
    When I follow "add"
    And I fill in:
      | name | repos_path | setup_command | cucumber_command |
      | test | git://foo  | foo           | bar              |
    And I click "submit"
    Then I should be on the repos page
    And I should see "test"
    
  Scenario: Delete
    Given I am have repos:
      | name | repo_path | setup_command | cucumber_command |
      | Only |           |               |                  |
    When I visit the repos page
    And I click "delete"
    Then I should not see "Only"
    
  Scenario: Edit
  Given I am have repos:
    | name | repo_path | setup_command | cucumber_command |
    | Only |           |               |                  |
    When I follow "edit"
    Then field "name" should have "Only"
    When I fill in:
      | name | repos_path | setup_command | cucumber_command |
      | test | git://foo  | foo           | bar              |
    And I click "submit"
    Then I should be on the repos page
    And I should see "test"
    And I should not see "Only"