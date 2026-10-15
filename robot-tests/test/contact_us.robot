*** Settings ***
Documentation  Verify contact us button is visible and clickable
Resource         ../keywords/common.robot
Suite Setup      Launch training App
Suite Teardown   Close browser


*** Test Cases ***
Click on Contact Us button
    [Documentation]    This test is to verify that the contact us button is visible and clickable
    Run Keyword And Ignore Error  Register New User    werock    12345
    Enter Login Username         werock
    Enter Login Password         12345
    Click Login Button      
    Wait For Elements State  text=Login successful  visible  timeout=10s
    Click Open Protected Site
    Wait For Element To Be Visible   ${COMPANY_LOGO}    timeout=10s
    Click on Contact Us button
    Wait For Element To Be Visible   ${GET_IN_TOUCH}    timeout=10s

