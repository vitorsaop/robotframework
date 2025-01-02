# Robot Framework

Repositório dedicado a experimentos e aprendizado com o Robot Framework. Este projeto apresenta exemplos práticos de automação para APIs e interfaces web, explorando funcionalidades como organização de casos de teste, uso de bibliotecas externas e boas práticas de automação.

## Ambiente Containerizado

Este repositório inclui um ambiente totalmente containerizado, permitindo executar os testes sem a necessidade de instalar dependências ou configurar o Robot Framework na máquina local. Basta ter Docker e Docker Compose instalados para começar.

### Como Usar

1. **Iniciar o container**  
   Para inicializar o ambiente:
   ```bash
   docker-compose up -d
   ```

2. **Acessar o container**  
   Caso queira entrar no container para realizar operações interativas:
   ```bash
   docker exec -it ambiente_robot bash
   ```

3. **Executar os testes sem acessar o container**  
   Você pode rodar os testes diretamente usando o comando abaixo, apontando para o diretório correto dos casos de teste:
   ```bash
   docker-compose run ambiente_robot robot tests/{estrutura_de_diretorios}
   ```

### Benefícios do Ambiente Containerizado

- **Portabilidade:** Execute os testes em qualquer máquina com Docker, sem necessidade de configuração adicional.
- **Isolamento:** O ambiente de execução é independente, evitando conflitos de dependências.
- **Simplicidade:** Basta subir o container para começar a usar.

Sinta-se à vontade para explorar os exemplos, executar os testes e adaptar o projeto para atender às suas necessidades!