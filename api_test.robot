*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://127.0.0.1:5000

*** Test Cases ***
Test Home Endpoint
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()["message"]}    Welcome to my Flask API!

Test GetCode Endpoint
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /getcode
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()["message"]}    hello link

Test Plus Endpoint
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /plus/5/6
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Integers   ${resp.json()["sum"]}    11

Test_x_is_3dot7
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is2hornor/3.7
    Should Be Equal As Strings    ${resp.status_code}    200
    Should not Be True   ${resp.json()["gpax"]}    

Test_x_is_3dot4
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is2hornor/3.4
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be True   ${resp.json()["gpax"]}    

Test_x_is_3dot1
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is2hornor/3.1
    Should Be Equal As Strings    ${resp.status_code}    200
    Should not Be True   ${resp.json()["gpax"]}    