*** Settings ***
Documentation        Suíte de Testes de Recebimento de Dúvidas
...                  dos Alunos!

Resource    ../resources/base.resource

Test Teardown    Take Screenshot

*** Test Cases ***
Deve receber uma notificação de pedido de ajuda
    
    ${admin}    Get Fixture    admin
    ${joao}     Get Fixture    joao

    Reset Student    ${joao}[student][email]

    ${token}         GET Service Token    ${admin}
    ${student_id}    POST New Student     ${token}     ${joao}[student]

    POST Question    ${student_id}    ${joao}[question]

    Do Login    ${admin}
    Open Notifications
    Notification Should Be    ${joao}[question]