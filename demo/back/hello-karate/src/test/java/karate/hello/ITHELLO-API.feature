Feature: Hello

  Background:
    * url baseUrl

  @ITHELLO-UC01
  Scenario: ITHELLO-UC01 - Get /api/v1/hello
    * print 'ITHELLO-UC01 - Get /api/v1/hello'
    Given path '/api/v1/hello'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match $.message == 'Hello World'
    * print 'END - ITHELLO-UC01 - Get /api/v1/hello'

  @ITHELLO-UC02
  Scenario: ITHELLO-UC02 - Get /api/v1/hello/fifi
    * print 'ITHELLO-UC01 - Get /api/v1/hello/fifi'
    Given path '/api/v1/hello/fifi'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * match $.message == 'Hello fifi'
    * print 'END - ITHELLO-UC02 - Get /api/v1/hello/fifi'
