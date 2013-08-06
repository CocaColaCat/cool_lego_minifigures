Feature: List Lego Series 11 minifigures
  In order to collect Lego Series 11 minifigures
  I want to know what are inclued

  Scenario: List minifigures
    Given the system knows about the series 11
      | name |
      | Scientist |
      | Lady Robot |
      | Evil Mech |
    When the client request GET /series/11
    Then the response should be JSON: 
      """
      [
        {"name" : "Scientist"}, 
        {"name" : "Lady Robot"}, 
        {"name" : "Evil Mech"} 
      ]
      """
