*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${BASE_URL}    https://reqres.in

*** Test Cases ***
Scenario: Create a new user
    [Documentation]    Membuat pengguna baru dan memverifikasi response
    Given the API endpoint is "${BASE_URL}/api/users"
    And the request payload is
        ...    {"name": "Anugerah", "job": "QA"}
    When I send a POST request to the endpoint
    Then the response status code should be 201
    And the response should contain the created user details

*** Keywords ***
Given the API endpoint is "${endpoint}"
    Set Suite Variable    ${ENDPOINT}    ${endpoint}

And the request payload is
    [Arguments]    ${payload}
    ${payload_fixed}    Convert String To JSON    ${payload}
    Set Suite Variable    ${PAYLOAD}    ${payload_fixed}

When I send a POST request to the endpoint
    ${response}    POST    ${ENDPOINT}    json=${PAYLOAD}
    Set Suite Variable    ${RESPONSE}    ${response}

Then the response status code should be 201
    Status Should Be    201    ${RESPONSE}

And the response should contain the created user details
    ${json}    Set Variable    ${RESPONSE.json()}
    Log    ${json}
    Dictionary Should Contain Item    ${json}    name    Anugerah
    Dictionary Should Contain Item    ${json}    job    QA
    Dictionary Should Contain Key    ${json}    id
    Dictionary Should Contain Key    ${json}    createdAt
