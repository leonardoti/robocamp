*** Settings ***
Documentation      Keywords da Tela de Pedido de Ajuda!  

Library    AppiumLibrary

*** Variables ***
${help_button}    xpath=//android.widget.TextView[@text="Enviar dúvida"]
${help_form}      xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]

*** Keywords ***
Submit Help Order
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${help_button}    timeout=5  
    Click Element                    ${help_button}

    Wait Until Element Is Visible    ${help_form}    timeout=5
    Input Text                       ${help_form}    ${text}
    Click Text    Enviar