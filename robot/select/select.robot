*** Settings ***
Documentation    Suite description

Resource    ../base/resource.robot
*** Variables ***
${SELECT 2}   //select/child::*[2]
${SELECT 3}   //select/child::*[3]
${Select}   //select[@id='dropdown']

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Open Browser To Login Page
    Open My Page    dropdown
    Element Should Be Visible   ${Select}
    Select From List By Index    ${Select}  1
    Element Attribute Value Should Be   ${SELECT 2}  selected    true

    [Teardown]  Close Browser