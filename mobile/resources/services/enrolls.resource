*** Settings ***
Documentation      Keywords para consumir a rota enrolls 
...                da API - REST do SmartBit!  

Library    RequestsLibrary
Library    DateTime

*** Keywords ***
POST New Enroll
    [Arguments]      ${token}    ${student_id}

    ${headers}       Create Dictionary        Authorization=${token}

    ${start_date}    Get Current Date
    
    ${enroll}        Create Dictionary
    ...              start_date=${start_date}
    ...              plan_id=1
    ...              student_id=${student_id}
    
    ${response}      POST            http://localhost:3333/enrollments
    ...                              json=${enroll}
    ...                              headers=${headers}
    ...                              expected_status=201
    ...                              msg=Não foi possível criar uma nova matrícula, verifique os logs da execução dos testes!