*** Settings ***
Documentation     Todos os resources para execução do projeto são
...               importados neste centralizador.   

# Resources - WEB!
Resource    components/navbar.resource
Resource    components/toast.resource
Resource    components/notification.resource
Resource    pages/login.resource
Resource    pages/enroll.resource
Resource    database.resource

# Resources - API's!
Resource    services/sessions.resource
Resource    services/students.resource

# Resources - Banco de Dados!
Resource    database.resource

# Bibliotecas! 
Library     JSONLibrary

*** Keywords ***
# Helpers!
Do Login
    [Arguments]    ${user}
    Go To Login Page    
    Fill Credentials    ${user}[email]    ${user}[password]     
    Submit Credentials
    User Should Be Looged In    ${user}[name]

Get Fixture    
    [Arguments]    ${fixture_file}

    ${fixture}       Load Json From File
    ...              ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...              encoding=UTF-8

    [Return]         ${fixture}