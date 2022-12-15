*** Settings ***
Documentation        Suíte de Testes de Pedido de Ajuda!

Resource    ../resources/base.resource
Resource    ../resources/services/enrolls.resource

Test Setup        Start App
Test Teardown     Finish App

*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}     Get Fixture    admin
    ${papito}    Get Fixture    papito

    Reset Student       ${papito}[student][email]

    ${token}         GET Service Token    ${admin}
    ${student_id}    POST New Student     ${token}     ${papito}[student]    
    POST New Enroll    ${token}    ${student_id}        

    Login With Student id    ${student_id}    
    Confirm Popup
    Go To Help Order
    Submit Help Order        ${papito}[help]

    Wait Until Page Contains         text=Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.