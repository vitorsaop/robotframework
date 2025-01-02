*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]

*** Keywords ***
Abrir o navegador
    [Arguments]    ${url}=${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar o home page da Amazon
    Go To    ${URL}
    Wait Until Page Contains Element    ${MENU_ELETRONICOS}
    