<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Expenses</title>
</head>
<body>
	<div class="m-3">
		<div class="mb-4">
			<h1>Save Travels</h1>
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Expense</th>
						<th>Vendor</th>
						<th>Amount</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${expenses}" var="oneExpense">
						<tr>
							<td><a href="/expenses/${oneExpense.id}">${oneExpense.name}</a></td>
							<td>${oneExpense.vendor}</td>
							<td>${oneExpense.amount}</td>
							<td>
								<a href="/expenses/${oneExpense.id}/edit">Edit</a> |
								<form action="/expenses/${oneExpense.id}/delete" method="post" class="d-inline">
									<input type="hidden" name="_method" value="delete"/>
									<input type="submit" value="Delete" class="btn btn-danger text-light"/>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<h2>Add an expense:</h2>
			<form:form action="/expenses/create" method="post" modelAttribute="expense">
				<p>
					<form:label for="name" path="name">Expense Name:</form:label>
					<form:input type="text" name="name" path="name" class="d-block"/>
					<form:errors path="name" class="text-danger"></form:errors>
				</p>
				<p>
					<form:label for="vendor" path="vendor">Vendor:</form:label>
					<form:input type="text" name="vendor" path="vendor" class="d-block"/>
					<form:errors path="vendor" class="text-danger"></form:errors>
				</p>
				<p>
					<form:label for="amount" path="amount">Amount:</form:label>
					<form:input type="number" step=".01" name="amount" path="amount" class="d-block"/>
					<form:errors path="amount" class="text-danger"></form:errors>
				</p>
				<p>
					<form:label for="description" path="description">Description:</form:label>
					<form:textarea name="description" path="description" rows="5"/>
					<form:errors path="description" class="text-danger"></form:errors>
				</p>
				<input type="submit" value="Submit" class="btn btn-primary submit"/>
			</form:form>
		</div>
	</div>
</body>
</html>