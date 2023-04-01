*** Settings ***
Resource    ${CURDIR}/../imports.robot

*** Variables ***
${expect}    planning

*** Keywords ***
Open website
    SeleniumLibrary.Open browser    ${browser['url']}    ${browser['type']}

Close website
    SeleniumLibrary.Close browser

*** Test Cases ***
TC_01
    [Tags]  tc_01
    # Open website
    Open website
    #หน้า ADD ITEM
    Input Text    xpath=//div/input[@id = "new-task"]    planning
    Click Element    xpath=//div[@id = "add-item"]/button
    #หน้า TO-DO-LIST
    Click Element    xpath=//div/a[@href="#todo"]
    ${result_1}=    Get Text    xpath=//div[3]/ul/li/label/span[1]
    Should Be Equal    ${result_1}    ${expect}
    Log To Console    Correct
    Sleep    1s
    Click Element    xpath=//div[3]/ul/li/label/span[4]   
    #หน้า COMPLETED
    Click Element    xpath=//div/a[@href="#completed"]
    # ${result_2}=    Get Text    xpath=//span/text()
    Sleep    1s
    Wait Until Element Is Visible    xpath= //*[@id="completed-tasks"]/li/span/i[@class='material-icons mdl-list__item-icon']
    Log To Console    Complete

TC_02 
    # case กดปุ่ม Delete ที่หน้า TO-DO-LIST
    [Tags]  tc_02
    # Open website
    Open website
    #หน้า ADD ITEM
    Input Text    xpath=//div/input[@id = "new-task"]    planning
    Click Element    xpath=//div[@id = "add-item"]/button
    #หน้า TO-DO-LIST
    Click Element    xpath=//div/a[@href="#todo"]
    click Element    xpath=//*[@id="1"]/span
    Log To Console   Delete complete
    
TC_03 
    # case กดปุ่ม Delete ที่หน้า COMPLETED
    [Tags]  tc_03
    Open website
    #หน้า ADD ITEM
    Input Text    xpath=//div/input[@id = "new-task"]    planning
    Click Element    xpath=//div[@id = "add-item"]/button
    #หน้า TO-DO-LIST
    Click Element    xpath=//div/a[@href="#todo"]
    ${result_1}=    Get Text    xpath=//div[3]/ul/li/label/span[1]
    Should Be Equal    ${result_1}    ${expect}
    Log To Console    Correct
    Sleep    1s
    Click Element    xpath=//div[3]/ul/li/label/span[4]   
    #หน้า COMPLETED
    Click Element    xpath=//div/a[@href="#completed"]
    click Element    xpath=//*[@id="1"]/span
    Log To Console   Delete complete