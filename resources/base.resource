*** Settings ***
Documentation     Todos os resources para execução do projeto são
...               importados neste centralizador.   

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource

*** Keywords ***
#Helpers!
Do Login
    [Arguments]    ${user}
    Go To Login Page    
    Fill Credentials    ${user}[email]    ${user}[pass]     
    Submit Credentials
    User Should Be Looged In    ${user}[name]