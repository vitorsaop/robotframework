*** Settings ***
Library           SeleniumLibrary

*** Variables ***
#variáveis de contexto global
${URL}                           https://www.amazon.com.br
${MENU_ELETRONICOS}              //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}            //h2[@class='a-size-base a-color-base apb-browse-refinements-indent-1 a-text-bold'][contains(.,'Eletrônicos e Tecnologia')]

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
    
Entrar no menu "Eletrônicos"
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a mensagem "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}

#método genérico para verificar o título da página
Verificar se o título da página é "${TITULO}" 
    #title é uma variável de contexto local
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    ${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Wait Until Page Contains Element    //div[@class='dcl-container d-page-type-browse d-widget-group-dossier-browse d-visual-nav dcl-centered'][contains(.,'${NOME_CATEGORIA}')]  timeout=10s
    Element Should Be Visible    //div[@class='dcl-container d-page-type-browse d-widget-group-dossier-browse d-visual-nav dcl-centered'][contains(.,'${NOME_CATEGORIA}')]  timeout=10s