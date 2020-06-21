Feature: Feature file for reading the data from CSV file and execute

  Background:
    * url 'https://43db3005-4ed9-4bab-b0a3-bb066e79e816.mock.pstmn.io'
#    Common URL which will be used in all the Scenarios.

  Scenario Outline: create a user from given details.
# This is used for running single scenarios multiple times using data from the CSV file.
    Given path '/POSTUser'
    And request {firstName:<firstName>, lastName:<lastName>,username:<userName>,email:<email>}
# request section is used to define keys which has < >-delimited parameters
    When method post
    Then status 201
    Then print response

    And match $.Status == '#present'
    And match $.Status == 'OK'
# Assertions to be put up on the request.
    Examples:
      | read('karateTestData.csv') |
# A Scenario Outline must contain an Examples (or Scenarios) section.
#  feature reads the CSV file in the examples section.
