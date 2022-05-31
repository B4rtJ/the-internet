*** Settings ***
Documentation    Suite description

Resource    ../base/resource.robot
*** Variables ***
${CHECKBOX 1}   //input[1]
${CHECKBOX 2}   //input[2]

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Open Browser To Login Page
    Open My Page    checkboxes
    Element Should Be Visible   ${CHECKBOX 1}
    Element Should Be Visible   ${CHECKBOX 2}
    Select Checkbox     ${CHECKBOX 1}
    Unselect Checkbox   ${CHECKBOX 2}
    Checkbox Should Be Selected     ${CHECKBOX 1}
    Checkbox Should Not Be Selected  ${CHECKBOX 2}
    [Teardown]  Close Browser