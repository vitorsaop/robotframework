*** Settings ***
Documentation     Esta suite testa o site da Amazon.com.br
Resource          amazon_resources_gherkin_bdd.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***


Caso de teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto.
    [Tags]             busca_produtos  lista_busca
    Dado que eu acesso o home page da Amazon
    Quando eu digito o nome de produto "PlayStation®5 Slim Edição Digital com 2 Jogos" no campo de pesquisa
    Então o título da página deve ser "Amazon.com.br : PlayStation®5 Slim Edição Digital com 2 Jogos"
    E um produto da linha "PlayStation®5 Slim Edição Digital com 2 Jogos" deve ser listado

    
