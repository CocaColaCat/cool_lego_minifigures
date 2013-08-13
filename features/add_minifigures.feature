Feature: add new minifigure 
  Adding new minifigures will be awesome

  Scenario: add minifigure
    Given the system knows the following: 
      | name |
      | Lady Robot |
    When client adds the following minifigure: 
      | name | 
      | Scientist |
    Then the system should contain the following:
      | name |
      | Lady Robot |
      | Scientist |


