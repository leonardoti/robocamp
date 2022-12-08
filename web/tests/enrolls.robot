*** Settings ***
Documentation        Suíte de Testes de Matrícula de Alunos!

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um Alunos

    ${admin}       Get Fixture    admin  
    ${falcao}      Get Fixture    falcao  

    Reset Student    ${falcao}[student][email]

    ${token}            GET Service Token    ${admin}
    POST New Student    ${token}    ${falcao}[student]
    
    Do Login    ${admin}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student     ${falcao}[student][name]
    Select Plan        ${falcao}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso