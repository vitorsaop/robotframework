*** Settings ***
Documentation     Esta suite testa o site da Amazon.com.br
Resource          amazon_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica se o menu "Eletrônicos" do site da Amazon.com.br
    ...                e verifica se a categoria "Computadores e Informática" está disponível.
    [Tags]             menus  categorias
    Acessar o home page da Amazon
    Verificar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a mensagem "Eletrônicos e Tecnologia"
    Verificar se o título da página é "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Celulares e Comunicação"

#Caso de teste 02 - Pesquisa de um Produto
#    [Documentation]    Esse teste verifica a busca de um produto.
#    [Tags]             busca_produtos  lista_busca
#    Acessar a home page da Amazon
#    Digitar o nome de produto "Xbox Seroes S" no campo de pesquisa
#    clicar no botão de pesquisa
#    Verificar o resultado da Pesquisa se está listando o produto pesquisado. 
