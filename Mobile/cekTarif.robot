*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4725
${PLATFORM_NAME}    Android
${DEVICE_NAME}      RRCX608SVTW
${APP_PACKAGE}     com.lionparcel.services.consumer
${APP_ACTIVITY}    com.lionparcel.services.consumer.view.main.MainActivity
${AUTOMATION_NAME}  UiAutomator2


*** Test Cases ***
Scenario: [TC01-P] Berhasil Menampilkan list harga ketika cek tarif pengiriman Jakarta-Balikpapan
    Given Berhasil membuka aplikasi Lion Parcel
    And User klik menu cek tarif
    When User pilih alamat asal
    And User pilih alamat tujuan
    And User klik tombol "Cek Tarif"
    Then Menampilkan list harga pengiriman

Scenario: [TC02-N] Gagal Menampilkan list harga,tombol Cek Tarif disable ketika cek tarif pengiriman tanpa input alamat tujuan
    Given Berhasil membuka aplikasi Lion Parcel
    And User klik menu cek tarif
    When User pilih alamat asal
    And User tidak memilih alamat tujuan
    Then User melihat tombol "Cek Tarif" Disable


*** Keywords ***

##[TC01-P]

Given Berhasil membuka aplikasi Lion Parcel
    Open Application    ${APPIUM_SERVER}  
...    platformName=${PLATFORM_NAME}  
...    deviceName=${DEVICE_NAME}  
...    appPackage=${APP_PACKAGE}  
...    appActivity=${APP_ACTIVITY}  
...    automationName=${AUTOMATION_NAME}
...    newCommandTimeout=10
...    noReset=${True}
...    fullReset=${False}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTitle" and @text="Cek Tarif"]    timeout=10s

And User klik menu cek tarif
    Click Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTitle" and @text="Cek Tarif"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]  timeout=10s

When User pilih alamat asal
    Click Element     xpath=//android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtOriginAddress"]
    Input Text    xpath=//android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtRouteSearch"]   Jakarta
    Click Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName" and @text="Cakung, Jakarta Timur (CGK)"]
    Wait Until Page Contains Element   xpath=//android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtDestinationAddress"]  timeout=10s


And User pilih alamat tujuan
    Click Element     xpath=//android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtDestinationAddress"]
    Input Text    xpath=//android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtRouteSearch"]   Balikpapan
    Click Element    xpath=//android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName" and @text="Balikpapan Barat"]
    Wait Until Element Is Visible  xpath=//android.widget.Button[@resource-id="com.lionparcel.services.consumer:id/btnCheckTariff"]  timeout=10s

And User klik tombol "Cek Tarif"
    Click Element    xpath=//android.widget.Button[@resource-id="com.lionparcel.services.consumer:id/btnCheckTariff"]

Then Menampilkan list harga pengiriman
    Element Should Be Visible    xpath=//android.widget.TextView[@text="Jenis Pengiriman"]


##[TC02-N]

And User tidak memilih alamat tujuan
    Log    "User sengaja tidak memilih alamat tujuan"

Then User melihat tombol "Cek Tarif" Disable
    Element Should Be Disabled  xpath=//android.widget.Button[@resource-id="com.lionparcel.services.consumer:id/btnCheckTariff"]




