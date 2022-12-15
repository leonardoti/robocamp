*** Settings ***
Documentation     Todos os resources para execução do projeto são
...               importados neste centralizador.   

# Bibliotecas! 
Library    AppiumLibrary
Library    JSONLibrary

# Resources - Mobile!
Resource    screens/login.resource
Resource    screens/help.resource
Resource    components/popup.resource
Resource    components/footer.resource

# Resources - API's!
Resource    services/sessions.resource
Resource    services/students.resource

# Resources - Banco de Dados!
Resource    database.resource

*** Keywords ***
Start App
    Open Application    http://localhost:4723/wd/hub
    ...                 alias=SmartBit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android SmartBit
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Wait Until Page Contains    Informe seu código de acesso

Finish App
    Capture Page Screenshot
    Close Application

# Helpers!   
Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load Json From File    
    ...           ${EXECDIR}/resources/fixtures/${fixture_file}.Json
    ...           encoding=UTF-8

    [Return]    ${fixture}