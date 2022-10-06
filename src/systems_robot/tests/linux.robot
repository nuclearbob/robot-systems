*** Settings ***
Resource    systems_robot/keywords/Process_Keywords.robot
Force Tags    linux

*** Test Cases ***
Test Linux Network Info
    [Tags]    Network    Info
    Comment    Run both commands to log info
    ${Result0}=    Run Process    ip    a
    ${Result1}=    Run Process    ip    link
    Comment    Assert that the commands worked right
    Should Be Equal As Integers    {Result0.rc}    0
    Should Be Equal As Integers    {Result1.rc}    0

Test Expected To Fail
    [Tags]    Fail
    Process Should Succeed    false
