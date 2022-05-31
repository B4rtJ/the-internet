*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         http://172.26.160.140/7082:5000
${BROWSER}        Google Chrome
${DELAY}          0
${VALID USER}     tomsmith
${VALID PASSWORD}    SuperSecretPassword!
${BASE URL}       http://${SERVER}
${LOGIN URL}      http://${SERVER}/login
${WELCOME URL}    http://${SERVER}/secure
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Create Webdriver    Chrome    executable_path=C:/projects/chromedriver
#    Open Browser    ${LOGIN URL}   ${BROWSER}
    Go To   ${LOGIN URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    The Internet

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Open My Page
    [Arguments]     ${page_url}
    Go To           ${BASE URL}/${page_url}

Input Username
    [Arguments]    ${username}
    Input Text    //input[@id='username']   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    //input[@id='password']    ${password}

Submit Credentials
    Click Button    //button[@type='submit']

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    The Internet
