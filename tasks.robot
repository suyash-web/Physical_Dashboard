*** Settings ***
Documentation     Interfacing robot with arduino
# All the libraries needed for the robot
# Here
Library           Arduino.py

*** Variables ***
${ON_1}=          1
${ON_2}=          2
${ON_3}=          3
${ON_4}=          4

*** Tasks ***
Task #1
    [Documentation]     First Task
    # Your Code
    # Here
    Turn LED 1 ON       # Will turn LED 1 ON if task is a success
                        # Just make sure to check for the last keyword to succeed

Task #2
    [Documentation]    Second Task
    # Your Code
    # Here
    Turn LED 2 ON       # Will turn LED 2 ON if task is a success
                        # Just make sure to check for the last keyword to succeed

Task #3
    [Documentation]    Third Task
    # Your Code
    # Here
    Turn LED 3 ON       # Will turn LED 3 ON if task is a success
                        # Just make sure to check for the last keyword to succeed

Task #4
    [Documentation]    Fourth Task
    # Your Code
    # Here
    Turn LED 4 ON       # Will turn LED 4 ON if task is a success
                        # Just make sure to check for the last keyword to succeed

*** Keywords ***
Turn LED 1 ON
    [Documentation]    Turning LED 1 ON
    ${on}=    Convert To String    ${ON_1}
    Talk To Arduino    ${on}
    Loop Through
Turn LED 2 ON
    [Documentation]    Turning LED 2 ON
    ${on}=    Convert To String    ${ON_2}
    Talk To Arduino    ${on}
    Loop Through

Turn LED 3 ON
    [Documentation]    Turning LED 3 ON
    ${on}=    Convert To String    ${ON_3}
    Talk To Arduino    ${on}
    Loop Through

Turn LED 4 ON
    [Documentation]    Turning LED 4 ON
    ${on}=    Convert To String    ${ON_4}
    Talk To Arduino    ${on}
    Loop Through
