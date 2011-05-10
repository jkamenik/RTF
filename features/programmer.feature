@wip
Feature: Programmer Page
   As a viewer
   I would like to see the stats
   So that I know how things are progressing
   
   Senario Outline: Raw page
      Given that I am nowhere
      And   I have faked the programmer counts:
        | programmer | date       | commits |
        | foo        | 2000-01-01 | 0       |
        | bar        | 2000-01-01 | 1       |
        | baz        | 2000-01-01 | 10      |
      When I go to <page>
      Then I should see a table of 