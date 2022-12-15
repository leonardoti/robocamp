*** Settings ***
Documentation      Keywords para consumir a rota session 
...                da API - REST do SmartBit!  

Library    RequestsLibrary

*** Keywords ***
GET Service Token
    [Arguments]    ${user}

    ${response}    POST            http://localhost:3333/sessions
    ...                            json=${user}
    ...                            expected_status=200
    ...                            msg=Não foi possível efetuar o login, verifique os logs da execução dos testes!
    
    ${token}       Set Variable    Bearer ${response.json()}[token]

    [Return]       ${token}