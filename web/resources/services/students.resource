*** Settings ***
Documentation      Keywords para consumir a rota students 
...                da API - REST do SmartBit!  

Library    RequestsLibrary

*** Keywords ***
POST New Student
    [Arguments]    ${token}    ${student}

    ${headers}     Create Dictionary        Authorization=${token}
    
    ${response}    POST            http://localhost:3333/students
    ...                            json=${student}
    ...                            headers=${headers}
    ...                            expected_status=201
    ...                            msg=Não foi possível criar um novo estudante, verifique os logs da execução dos testes!

    [Return]    ${response.json()}[id]

POST Question
    [Arguments]    ${student_id}    ${question}

    ${payload}     Create Dictionary        question=${question}
    
    POST                           http://localhost:3333/students/${student_id}/help-orders    
    ...                            json=${payload}
    ...                            expected_status=201
    ...                            msg=Não foi possível enviar uma dúvida, verifique os logs da execução dos testes!    