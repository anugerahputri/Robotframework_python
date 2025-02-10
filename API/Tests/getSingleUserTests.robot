*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://reqres.in

*** Test Cases ***
Scenario: Get single user by id
    [Documentation]    Mengambil data pengguna dengan ID 2 dan memverifikasi response
    Given the API endpoint is "${BASE_URL}/api/users/2"
    When I send a GET request to the endpoint
    Then the response status code should be 200
    And the response should contain the user details

*** Keywords ***
Given the API endpoint is "${endpoint}"
    [Documentation]    Menyimpan endpoint API untuk request
    Set Suite Variable    ${ENDPOINT}    ${endpoint}

When I send a GET request to the endpoint
    [Documentation]    Mengirimkan GET request ke endpoint yang disimpan
    ${response}    GET    ${ENDPOINT}
    Set Suite Variable    ${RESPONSE}    ${response}

Then the response status code should be 200
    [Documentation]    Memverifikasi bahwa status kode response adalah 200
    Status Should Be    200    ${RESPONSE}

And the response should contain the user details
    [Documentation]    Memverifikasi isi response JSON
    ${json}    Set Variable    ${RESPONSE.json()}
    Log    ${json}
    ${id}    Convert To Integer    ${json['data']['id']}
    Should Be Equal As Integers    ${id}    2
    Dictionary Should Contain Item    ${json['data']}    email    janet.weaver@reqres.in
    Dictionary Should Contain Item    ${json['data']}    first_name    Janet
    Dictionary Should Contain Item    ${json['data']}    last_name    Weaver