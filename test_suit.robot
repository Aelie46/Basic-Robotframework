*** Settings ***
Library      SeleniumLibrary

Suite Setup    Open Browser    https://sit.doppio-tech.com/    chrome
Suite Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Test 1
     Log To Console   Running Test 1

Test 2
    Log To Console    Running Test 2

*** Keywords ***