Feature: Goodbye

  Background:
    * url baseUrl

  @ITGOODBYE-UC01
  Scenario: ITGOODBYE-UC01 - Get /api/v1/goodbye
    * print 'ITGOODBYE-UC01 - Get /api/v1/goodbye'
    Given path '/api/v1/goodbye'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match $.message == 'Goodbye World'
    * print 'END - ITGOODBYE-UC01 - Get /api/v1/goodbye'

  @ITGOODBYE-UC02
  Scenario: ITGOODBYE-UC02 - Get /api/v1/goodbye/fifi
    * print 'ITGOODBYE-UC01 - Get /api/v1/goodbye/fifi'
    Given path '/api/v1/goodbye/fifi'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match $.message == 'Goodbye fifi'
    * print 'END - ITGOODBYE-UC02 - Get /api/v1/goodbye/fifi'
