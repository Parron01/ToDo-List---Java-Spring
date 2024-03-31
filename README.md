Aplicação em Java utilizando Spring Boot, MySql e JSP para implementação de uma ToDo-List e utlizando arquitetura MVC.

Para que a aplicação funcione, instale todas as dependências necessárias definidas pelo maven, e após isso basta criar um servidor MySql e conectá-lo à aplicação através das configurações do arquivo "src/main/resources/application.properties".

Após conectar o banco de dados MySql, modifique o código de:
=> spring.jpa.hibernate.ddl-auto = update
para
=> spring.jpa.hibernate.ddl-auto = create
Execute a aplicação para criação do das tabelas no banco de dados e também como forma de teste de funcionamento da conexão.

Após criação das tabelas do banco de dados e estabelecimento da conexão de maneira correta, Volte o código para a maneira original.
=> spring.jpa.hibernate.ddl-auto = update
A partir daqui pode utilizar a aplicação normalmente.

Aplicação é acessada na url "http://localhost:8080/viewToDoList".