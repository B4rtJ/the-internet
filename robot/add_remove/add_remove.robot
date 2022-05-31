*** Settings ***
Documentation    Suite description

Resource    ../base/resource.robot
*** Variables ***
${REMOVE BUTTON}    //button[@onclick='swapCheckbox()']
${INPUT CHECKBOX}   //input[@type='checkbox']
${P MESSAGE}    //p[@id='message']
*** Test Cases ***
Test title
    [Tags]    DEBUG
    Open Browser To Login Page
    Open My Page    dynamic_controls
    Element Should Be Visible   ${REMOVE BUTTON}
    Element Should Be Visible   ${INPUT CHECKBOX}
    Click Button   ${INPUT CHECKBOX}
    Click Button   ${REMOVE BUTTON}
    Wait Until Element Is Visible   ${P MESSAGE}    10
    Element Text Should Be  ${P MESSAGE}    It's gone!
    Click Button   ${REMOVE BUTTON}
    Wait Until Element Is Visible   ${P MESSAGE}    10
    Element Text Should Be  ${P MESSAGE}    It's back!
    Element Should Be Visible   ${INPUT CHECKBOX}
    [Teardown]  Close Browser

*** Keywords ***
Provided precondition
    Setup system under test