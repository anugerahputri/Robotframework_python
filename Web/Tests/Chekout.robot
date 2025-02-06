*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Given user open in browser "https://www.saucedemo.com/"
And user sucess login
And user add to cart product sauce labs backpack
And user click icon cart
When user click chekout button
Then user see form chekout information page
And user input chekout information,"Anugerah","putri","234556"
When user click continue button
Then user see chekout overview page
And user click finish button
Then user sucess chekout product


*** Keywords ***
Given user opens browser to "${url}"
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    data-test="username"

And user successfully logs in
    Input Text    data-test="username"   ${USERNAME}
    Input Text    data-test="password"    ${PASSWORD}
    Click Button    data-test="login-button"
    Wait Until Location Is   ${url}inventory.html  timeout=10s

And user add to cart product sauce labs backpack
    Click Button    data-test="add-to-cart-sauce-labs-backpack"

And user clicks the cart icon
    Click Element    data-test="shopping-cart-badge"
    Wait Until Location Is        ${url}cart.html timeout=10s

When user clicks the checkout button
    Click Button    data-test="checkout"
    Wait Until Location Is        ${url}checkout-step-one.html timeout=10s

Then user sees the checkout information page
    Location Should Be    &{url}checkout-step-one.html

And user inputs checkout information "${first_name}" "${last_name}" "${zip}"
    Input Text    data-test="firstName"   ${first_name}
    Input Text    data-test="lastName"    ${last_name}
    Input Text    data-test="postalCode"    ${zip}

When user clicks the continue button
    Click Button    data-test="continue"
    Wait Until Location Is        ${url}checkout-step-two.html timeout=10s

Then user sees the checkout overview page
    Location Should Be    &{url}checkout-step-two.html

And user clicks the finish button
    Click Button    data-test="finish"
    Wait Until Location Is        ${url}checkout-complete.html timeout=10s

Then user successfully checks out the product
    Location Should Be    &{url}checkout-complete.html




