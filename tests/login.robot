*** Settings ***
Documentation        Suíte de Testes de Autenticação!

Resource    ../resources/base.resource

*** Test Cases ***
Login do Administrador
    Go To Login Page    
    Fill Credentials    admin@smartbit.com    qacademy     
    Submit Credentials
    User Should Be Looged In    Admin

Email não cadastrado
    Go To Login Page
    Fill Credentials     404@smartbit.com    qacademy         
    Submit Credentials
    Verify Toaster       Suas credenciais são inválidas, por favor tente novamente!    

Senha incorreta
    Go To Login Page
    Fill Credentials     admin@smartbit.com    abc123      
    Submit Credentials
    Verify Toaster       Suas credenciais são inválidas, por favor tente novamente!    

Email no formato incorreto
    Go To Login Page
    Fill Credentials     admin#smartbit.com    qacademy
    Submit Credentials
    Field Type Should Be Email

Senha em branco
    Go To Login Page
    Fill Credentials     admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Credentials     ${EMPTY}    qacademy
    Submit Credentials
    Alert Text Should Be   email    O e-mail é obrigatório

Email e senha são obrigátorios
    Go To Login Page
    Submit Credentials
    Alert Text Should Be    email       O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória