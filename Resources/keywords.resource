*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir Navegador
    [Arguments]     ${link}     ${browser}
    Open Browser    ${link}     ${browser}
    Go To    ${link}

Fechar Navegador
    Close Browser    

Gerar ID Temporário
    [Arguments]     ${input_username}   ${input_password}   ${tempName}     ${tempPassword}
    Assign Id To Element 	 locator=${input_username} 	 id=${tempName}
    Assign Id To Element 	 locator=${input_password} 	 id=${tempPassword}


Preencher Campo
    [Arguments]    ${locator}    ${value}
    Input Text    ${locator}    ${value}