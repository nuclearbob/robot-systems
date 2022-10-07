*** Settings ***
Library    Process
*** Keywords ***
Process Should Succeed
    Comment    Documentation can be used to autogenerate html doc pages for keyword libraries
    [Documentation]    Run a process, assert that it succeeded (return value 0,) then return the results
    # Collect all arguments and pass through to the Run Process keyword
    [Arguments]    @{varargs}    &{kwargs}
    ${Result}=    Run Process    @{varargs}    &{kwargs}
    Should Be Equal As Integers    ${Result.rc}    0
    Comment    Return the result so callers can use it
    [Return]    ${Result}

Shell Process Should Succeed
    Comment    Documentation can be used to autogenerate html doc pages for keyword libraries
    [Documentation]    Run a process, assert that it succeeded (return value 0,) then return the results
    ...                Use shell=True to execute a string as a whole line
    # Collect all arguments and pass through to the Run Process keyword
    [Arguments]    @{varargs}
    ${Result}=    Run Process    @{varargs}    shell=True
    Should Be Equal As Integers    ${Result.rc}    0
    Comment    Return the result so callers can use it
    [Return]    ${Result}
