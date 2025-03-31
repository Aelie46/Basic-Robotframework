*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
Login Chrome
    Open Browser    https://sit.doppio-tech.com/login    chrome
    Input Text      id=basic_username    perapat@gmail.com
    Input Text      id=basic_password    Perapat123*
    Click Button    css:button.btn-login
    Sleep           1s
    Close Browser

Login Edge
    Open Browser    https://sit.doppio-tech.com/login    edge
    Input Text      id=basic_username    perapat@gmail.com
    Input Text      id=basic_password    Perapat123*
    Click Button    css:button.btn-login
    Sleep           1s
    Close Browser

Open Gmail Login Page On Edge
    Open Browser    https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&ddm=1&emr=1&flowName=GlifWebSignIn&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&hl=en&ifkv=AXH0vVuYpLIkd0jgZ8XamSwQp-seMGUbrHxgcdbTzaPe-Czzdtm0310YruBlx6c8iQMfVf0RhjLjgA&osid=1&service=mail&flowEntry=AccountChooser    edge
    Sleep    2s
    Close Browser