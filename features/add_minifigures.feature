Feature: add new minifigure 
  Adding new minifigures will be awesome

  Scenario: add minifigure
    Given the system knows the following: 
      | name |
      | Lady Robot |
    When add the following minifigure: 
      | name | 
      | Scientist |
    Then the system should list the following: 
      """
      [
        {"name" : "Lady Robot"}, 
	{"name" : "Scientist"}
      ]
      """


