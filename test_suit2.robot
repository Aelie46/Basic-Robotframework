*** Settings ***
Library      SeleniumLibrary

Suite Teardown    Log    Suite Teardown is running

*** Variables ***

*** Test Cases ***
Test Case With Teardown
    [Teardown]    Log    Test Case Teardown is running
    Log    Running the test

*** Keywords ***
    [Teardown]    Log    Keyword Teardown is running
    Log    Running the keyword