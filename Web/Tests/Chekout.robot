*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${first_name}  Anugerah
${last_name}  Putri
${zip}  234556

*** Test Cases ***
Scenario: User successfully checkout product
    Given user opens browser to "${URL}"
    And user successfully login
    And user add to cart product sauce labs backpack
    And user click icon cart
    When user click checkout button
    Then user see checkout information page
    And user inputs checkout information "${first_name}" "${last_name}" "${zip}"
    When user click continue button
    Then user see checkout overview page
    And user click finish button
    Then user successfully checkout product


*** Keywords ***
Given user opens browser to "${URL}"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=[data-test="username"]

And user successfully login
    Input Text    css=[data-test="username"]   ${USERNAME}
    Input Text    css=[data-test="password"]   ${PASSWORD}
    Click Button    css=[data-test="login-button"]
    Wait Until Location Is   ${URL}inventory.html  timeout=10s

And user add to cart product sauce labs backpack
    Click Button    css=[data-test="add-to-cart-sauce-labs-backpack"]

And user click icon cart
    Click Element    css=[data-test="shopping-cart-badge"]
    Wait Until Location Is        ${URL}cart.html  timeout=10s

When user click checkout button
    Click Button    css=[data-test="checkout"]
    Wait Until Location Is        ${URL}checkout-step-one.html  timeout=10s

Then user see checkout information page
    Location Should Be    ${URL}checkout-step-one.html

And user inputs checkout information "${first_name}" "${last_name}" "${zip}"
    Input Text    css=[data-test="firstName"]   ${first_name}
    Input Text    css=[data-test="lastName"]    ${last_name}
    Input Text    css=[data-test="postalCode"]    ${zip}

When user click continue button
    Click Button    css=[data-test="continue"]
    Wait Until Location Is        ${URL}checkout-step-two.html  timeout=10s

Then user see checkout overview page
    Location Should Be    ${URL}checkout-step-two.html

And user click finish button
    Click Button    css=[data-test="finish"]
    Wait Until Location Is        ${URL}checkout-complete.html  timeout=10s

Then user successfully checkout product
    Location Should Be    ${URL}checkout-complete.html




