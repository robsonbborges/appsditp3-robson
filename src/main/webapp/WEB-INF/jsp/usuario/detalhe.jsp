<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>APP TP3</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
			<div class="container">	
				<form action="/usuario/incluir" method="post">
					<div class="form-group">
						<label>Informa seu nome:</label>
						<input type="text" name="nome" required>
					</div>
						
					<div class="form-group">
						<label>Informe seu email:</label>
						<input type="email" name="email" required>
					</div>
						
					<div class="form-group">
						<label>Informe sua senha:</label>
						<input type="password"  name="senha" required>
					</div>

					<button type="submit">Cadastrar</button>
				</form>
			
			<c:if test="${not empty usuarios}">	
			<h2>Listagem de usuários</h2>
			<table class="table">
			<thead>
					<tr>
			        <th>Nome</th>
			        <th>Email</th>
			        <th></th>
				    </tr>
			    </thead>
			    <tbody>
			      <c:forEach var="u" items="${usuarios}">
			      <tr>
			        <td>${u.nome}</td>
			        <td>${u.email}</td>
			        <td><a href="/usuario/${u.id}/excluir">excluir</a></td>
			
			      </tr>
			      </c:forEach>
			    </tbody>
			  </table>
			</c:if>	
			
			<c:if test="${empty usuarios}">
				<h2>Nenhum usuário cadastrado!</h2>
			</c:if>
					
</body>
</html>