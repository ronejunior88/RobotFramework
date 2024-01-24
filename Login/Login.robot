*** Settings ***
Library    SeleniumLibrary
Resource   ..\\Resources\\keywords.resource

Suite Setup     Abrir Navegador   ${set_site}    ${set_browser}           
Suite Teardown  Fechar Navegador

*** Variables ***
${input_username}    //*[@id="user-name"]
${input_password}   //*[@id="password"]        
${set_site}         https://www.saucedemo.com/
${set_browser}      chrome  
${valida_login}     //*[@id="add-to-cart-sauce-labs-backpack"]
${login_invalido}   //*[@id="login_button_container"]/div/form/div[3]/h3

*** Test Cases ***
Logar no site
    Gerar ID Temporário     ${input_username}       ${input_password}       tempIdUserName      tempPassowrd
    Preencher Campo    id=tempIdUserName    standard_user
    Preencher Campo    id=tempPassowrd    secret_sauce
    Submit Login
    Valida Login Correto        ${valida_login}
    Fechar Navegador
    
Teste de Login Incorreto
    Abrir Navegador   ${set_site}    ${set_browser} 
    Gerar ID Temporário     ${input_username}       ${input_password}       tempIdUserName      tempPassowrd
    Preencher Campo    id=tempIdUserName    standard_user
    Preencher Campo    id=tempPassowrd    secret_sauc
    Submit Login
    Valida Login Incorreto  ${login_invalido}       

*** Keywords ***
Valida Login Correto
    [Arguments]     ${campo}
    Element Should Be Visible 	 locator=${valida_login} 

Valida Login Incorreto
    [Arguments]     ${mensagem}
    Element Should Be Visible 	 locator=${mensagem} 

Submit Login
    Click Button 	 locator=//*[@id="login-button"]
    Sleep       2