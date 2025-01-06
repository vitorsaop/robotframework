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
    Capture Page Screenshot
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

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text   //input[@id='twotabsearchtextbox']    ${PRODUTO}

Clicar no botão de pesquisa
    Click Element    //input[@id='nav-search-submit-button']

Verificar o resultado da Pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    //h2[@aria-label='PlayStation®5 Slim Edição Digital com 2 Jogos'][contains(.,'${PRODUTO}')]


# GHERKIN STEPS

Dado que eu acesso o home page da Amazon
    Acessar o home page da Amazon
    Verificar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"  

Quando eu digito o nome de produto "PlayStation®5 Slim Edição Digital com 2 Jogos" no campo de pesquisa
    Digitar o nome de produto "PlayStation®5 Slim Edição Digital com 2 Jogos" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ser "Amazon.com.br : PlayStation®5 Slim Edição Digital com 2 Jogos"
    Verificar se o título da página é "Amazon.com.br : PlayStation®5 Slim Edição Digital com 2 Jogos"

E um produto da linha "PlayStation®5 Slim Edição Digital com 2 Jogos" deve ser listado
    Verificar o resultado da Pesquisa se está listando o produto "PlayStation®5 Slim Edição Digital com 2 Jogos"

