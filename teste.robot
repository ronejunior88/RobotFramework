*** Settings ***
Library    SeleniumLibrary

Suite Setup     Abrir Navegador   ${set_site}    ${set_browser}           
Suite Teardown  Fechar Navegador

*** Variables ***
${input_username}    //*[@id="user-name"]
${input_password}   //*[@id="password"]
${set_username}     standard_user
${set_password}     secret_sauce
${set_site}         https://www.saucedemo.com/
${set_browser}      chrome  
${valida_login}     //*[@id="add-to-cart-sauce-labs-backpack"]

*** Test Cases ***
Logar no site
    Gerar ID Temporário
    Preencher Campo    id=tempIdUserName    ${set_username}
    Preencher Campo    id=tempPassowrd    ${set_password}
    Submit Formulário
    Valida Login        ${valida_login}
    

*** Keywords ***
Valida Login
    [Arguments]     ${campo}
    Element Should Be Visible 	 locator=${valida_login}

Abrir Navegador
    [Arguments]     ${link}     ${browser}
    Open Browser    ${link}     ${browser}
    Go To    ${link}

Fechar Navegador
    Close Browser    

Gerar ID Temporário
    Assign Id To Element 	 locator=${input_username} 	 id=tempIdUserName
    Assign Id To Element 	 locator=${input_password} 	 id=tempPassowrd

Preencher Campo
    [Arguments]    ${locator}    ${value}
    Input Text    ${locator}    ${value}
    

Submit Formulário
    Click Button 	 locator=//*[@id="login-button"]
    Sleep       2