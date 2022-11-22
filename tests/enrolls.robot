*** Settings ***
Documentation        Suíte de Testes de Matrícula de Alunos!

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um Alunos
    
    ${admin}    Create Dictionary
    ...         name=Admin    
    ...         email=admin@smartbit.com
    ...         pass=qacademy
    
    Do Login    ${admin}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student     Gabriel Falcão
    Select Plan        Smart
    Fill Start Date

    Sleep    5


