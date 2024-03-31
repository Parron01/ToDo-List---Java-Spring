<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Lista De Tarefas</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
            

    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>

</head>
<body>

    <div class="container">

        <h1 class="p-3"> Lista de Tarefas: Itens</h1>

        <form:form>

            <table class="table table-bordered">
            	<tr>
            		<th>Id</th>
            		<th>Titulo</th>
            		<th>Data</th>
            		<th>Status</th>
            		<th>Marcar Concluida</th>
            		<th>Editar</th>
            		<th>Deletar</th>
            	</tr>

            	<c:forEach var="todo" items="${list}">
                    <tr>
                		<td>${todo.id}</td>
                		<td>${todo.title}</td>
                		<td>${todo.date}</td>
                		<td>${todo.status}</td>
                		<td>
                            <button type="button" class="btn btn-success" onclick="window.location.href='/updateToDoStatus/${todo.id}'">Marcar Concluida</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" onclick="window.location.href='/editToDoItem/${todo.id}'">Editar</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="window.location.href='/deleteToDoItem/${todo.id}'">Deletar</button>
                        </td>

                	</tr>

            	</c:forEach>

            </table>

        </form:form>

        <button type="button" class="btn btn-primary btn-block" onclick="window.location.href='/addToDoItem'">
            Adicionar Novo Item
        </button>


    </div>

    <script th:inline="javascript">
                window.onload = function() {
                    var msg = "${message}";
                    
                    if (msg == "Sucesso ao salvar") {
        				Command: toastr["success"]("Item adicionado com sucesso!!")
        			} else if (msg == "Sucesso ao deletar") {
        				Command: toastr["success"]("Item deletado com sucesso!!")
        			} else if (msg == "Erro ao deletar") {
        			    Command: toastr["error"]("Algum erro ocorreu, não foi possível deletar item.")
        			} else if (msg == "Sucesso ao editar") {
        				Command: toastr["success"]("Item atualizado com sucesso!!")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>