*** Settings ***
Documentation  Verify that the user is able to logout successfully
Resource         ../keywords/common.robot
Suite Setup      Launch training App
Suite Teardown   Close browser

*** Test Cases ***
verify the user is logged out
    [Documentation]    This test is to verify that the user is able to logout successfully
    Run Keyword And Ignore Error  Register New User    werock    12345
    Enter Login Username         werock
    Enter Login Password         12345
    Click Login Button
    Wait For Elements State  text=Login successful  visible  timeout=10s
    Click Open Protected Site
    Wait For Element To Be Visible   ${COMPANY_LOGO}    timeout=10s
    Click Protected Site Logout Button
    Wait For Element To Be Visible   ${TRAINING_APP_TITLE}    timeout=10s
    Get Text    ${PROFILE_STATUS}    ==    Not logged in
