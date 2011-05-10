@wip
Feature: API
   In order to provide integration
   An API
   Should be provided
   
   Senario: Push recalc
      Given that I am no where
      When I visit "/" with a PUSH
      Then I should see nothing
      And  a programmer recalc should be kicked off