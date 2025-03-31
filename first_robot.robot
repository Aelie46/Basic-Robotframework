*** Settings ***
Variables    variables.py
Variables    config.py
Library      SeleniumLibrary

*** Variables ***
${GLOBAL_VAR}    Tesla

*** Test Cases ***
Validate Age as 16
    Validate Age    16

Validate Age as 20
    Validate Age    20

Fruit List
    Print Fruits    apple    banana    cherry

User Info
    Print User Info    name=Alice    age=30    city=Bangkok

Greeting no user
    Greet User

Greeting with user
    Greet User    Gasby

Items
    Print All Items    apple    banana    cherry

Global vs Local
    Log To Console    ${GLOBAL_VAR}
	Local

Variables in Another File
    Log To Console    ${user["name"]}
    Log To Console    ${user["age"]}
    Log To Console    ${user["city"]}

Config in Another File
    Log To Console    App URL: ${app_url}
    Log To Console    Username: ${credentials["username"]}
    Log To Console    Password: ${credentials["password"]}
    Log To Console    Name: ${user["name"]}
    Log To Console    City: ${user["city"]}

Login
    Open Browser    ${app_url}    chrome
    Input Text      id=basic_username    ${credentials["username"]}
    Input Text      id=basic_password    ${credentials["password"]}
    Click Button    css:button.btn-login
    Sleep           1s
    Close Browser

Calculate
    ${answer}    Calculate Square    4
    Log To Console    ${answer}

Fruit Return
    @{my_fruits}    Create Fruit List    apple    banana    cherry
    Log To Console    ${my_fruits[0]}
    Log To Console    ${my_fruits[1]}
    Log To Console    ${my_fruits[2]}

User Return
    &{user}    Create User Info    name=John    age=30    city=Bangkok
    Log To Console    Name: ${user.name}
    Log To Console    Age: ${user.age}
    Log To Console    City: ${user.city}

Age
    Age Verification    14
    Age Verification    18

Fruit Loop
    Print Fruit List    apple    banana    cherry

Loop Control
    FOR    ${number}    IN RANGE    1    10
        Run Keyword If    ${number} == 5    Exit For Loop
        Run Keyword If    ${number} == 3    Continue For Loop
        Log    ${number}
    END

Error Handling Example
    ${status}    Run Keyword And Return Status    Click Element    invalid_locator
    Log To Console    Status: ${status}

    Run Keyword And Ignore Error    Input Text    invalid_locator    value
    Log To Console    Ignored the error and continued

Test Factorial Calculation
    ${result}    Calculate Factorial    5
    Should Be Equal As Numbers    ${result}    120

Setup And Teardown
    [Setup]    Open Browser    https://sit.doppio-tech.com/    chrome
    [Teardown]    Close Browser
    Log    Test is running

*** Keywords ***
Validate Age
    [Arguments]    ${age}
    Run Keyword If    ${age} > 18    Log To Console    Eligible for voting
    ...    ELSE    Log To Console    Not eligible for voting

Print Fruits
    [Arguments]    @{fruits}
    FOR    ${fruit}    IN    @{fruits}
        Log To Console    ${fruit}
    END    

Print User Info
    [Arguments]    &{user_info}
    Log To Console    Name: ${user_info["name"]}
    Log To Console    Age: ${user_info["age"]}
    Log To Console    City: ${user_info["city"]}

Greet User
    [Arguments]    ${name}=Guest
    Log To Console    Hello, ${name}

Print All Items
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
    Log To Console    ${item}
    END

Local
    [Arguments]    ${LOCAL_VAR}=Local Value
    Log To Console    ${LOCAL_VAR}

Calculate Square
    [Arguments]    ${number}
    ${result}    Evaluate    ${number} * ${number}
    [Return]    ${result}

Create Fruit List
    [Arguments]    @{fruits}
    ${fruitlist}    Create List    @{fruits}
    [Return]    ${fruitlist}

Create User Info
    [Arguments]    &{user_info}
    ${userdict}    Create Dictionary    &{user_info}
    [Return]    ${userdict}

Age Verification
    [Arguments]    ${age}
    Run Keyword If    ${age} > 18    Log To Console    You are an adult
    ...    ELSE IF    ${age} == 18    Log To Console    You just became an adult
    ...    ELSE    Log To Console    You are underage

Print Fruit List
    [Arguments]    @{fruits}
    FOR    ${fruit}    IN    @{fruits}
    Log To Console    ${fruit}
    END

Calculate Factorial
    [Arguments]    ${number}
    ${number}    Evaluate    int(${number})
    Run Keyword If    ${number} == 1    Return From Keyword    1
    ${previous}    Calculate Factorial    ${number - 1}
    ${result}    Evaluate    ${number} * ${previous}
    Return From Keyword    ${result}
