*** Settings ***
Documentation     Propero RPA Challenge robot with physical dashboard
Library           DateTime
Library           OperatingSystem
Library           RPA.Browser.Selenium
Library           RPA.Excel.Files
Library           RPA.HTTP
Library           RPA.Tables
Library           test

*** Variables ***
${ON_1}=          1
${ON_2}=          2
${ON_3}=          3
${ON_4}=          4
${OFF}=           0

*** Tasks ***
Open The Browser And Go To The Required Page
    # 1
    [Documentation]    Opening the browser
    Set Download Directory    ${CURDIR}${/}output
    Open Available Browser    https://prsindia.org/
    Click Element    xpath://*[@id="navbarSupportedContent"]/ul/li[8]/a
    Wait Until Page Contains Element    xpath:/html/body/div[3]/div[2]/aside/div    timeout=30
    # Click Element    xpath://*[@id="facetapi-link--3"]
    Wait Until Keyword Succeeds    30 sec    5 sec    Click Element    xpath://*[@id="facetapi-link--3"]
    Turn LED 1 ON
    Sleep    2

Waiting
    # 2
    [Documentation]    Waits until a keyword succeeds
    ${DATE}=    Getting Current Date
    Download The Csv File
    Wait Until Keyword Succeeds    30 sec    5 sec    File Should Exist    ${CURDIR}${/}output${/}COVID-19 Cases(${DATE}).csv
    Turn LED 2 ON
    Sleep    2

Create workbook
    # 3
    [Documentation]    Creating workbook
    Create Workbook    ${CURDIR}${/}output${/}Suyash_Covid_19_cases.xlsx
    Wait Until Keyword Succeeds    30 sec    5 sec    Save Workbook
    Turn LED 3 ON
    Sleep    2

Reading Table From CSV And Create A New One
    # 4
    [Documentation]    Reading table from csv and creating a new one
    ${DATE}=    Getting Current Date
    ${TABLE}=    Read Table From Csv    ${CURDIR}${/}output${/}COVID-19 Cases(${DATE}).csv    header=True
    @{ROWS}=    Find Table Rows    ${TABLE}    Region    ==    Madhya Pradesh
    Open Workbook    ${CURDIR}${/}output${/}Suyash_Covid_19_cases.xlsx
    FOR    ${ROW}    IN    @{ROWS}
        Append Rows To Worksheet    ${ROW}    header=True
    END
    Wait Until Keyword Succeeds    30 sec    5 sec    Save Workbook
    Turn LED 4 ON

*** Keywords ***
Turn LED 1 ON
    [Documentation]    Turning LED 1 ON
    ${on}=    Convert To String    ${ON_1}
    Talk To Arduino    ${on}

Turn LED 2 ON
    [Documentation]    Turning LED 2 ON
    ${on}=    Convert To String    ${ON_2}
    Talk To Arduino    ${on}

Turn LED 3 ON
    [Documentation]    Turning LED 3 ON
    ${on}=    Convert To String    ${ON_3}
    Talk To Arduino    ${on}

Turn LED 4 ON
    [Documentation]    Turning LED 4 ON
    ${on}=    Convert To String    ${ON_4}
    Talk To Arduino    ${on}
    Sleep    2
    ${off}=    Convert To String    ${OFF}
    Talk To Arduino    ${off}

Download The Csv File
    [Documentation]    Downloading the csv file
    Wait Until Page Contains Element    xpath://*[@id="block-system-main"]/div/div[2]/div[1]    timeout=30
    Click Element    id:mptrack-expor-link

Getting Current Date
    [Documentation]    Get current date
    ${CUR_DATE}=    Get Current Date
    ${T_DATE}=    Convert Date    ${CUR_DATE}    result_format=%d-%m-%Y
    [Return]    ${T_DATE}
