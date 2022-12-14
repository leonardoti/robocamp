*** Settings ***
Documentation        Suíte de Testes de Autenticação!

Resource    ../resources/base.resource

Test Setup        Start App
Test Teardown     Finish App

*** Variables ***
${ERROR_401}    Acesso não autorizado! Entre em contato com a equipe de atendimento. 

*** Test Cases ***
Deve logar com sucesso
    
    ${falcao}    Get Fixture    falcao
    
    Login With Student Id    ${falcao}[student][id]
    Wait Until Page Contains    text=Olá, ${falcao}[student][name]!

Código de aluno incorreto
    Login With Student Id       9999
    Wait Until Page Contains    text=${ERROR_401}

Código de aluno negativo
    Login With Student Id       -1
    Wait Until Page Contains    text=${ERROR_401}

Código de aluno alfanumérico
    Login With Student Id       abc123
    Wait Until Page Contains    text=${ERROR_401}