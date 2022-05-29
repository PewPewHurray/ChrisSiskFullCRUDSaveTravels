<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Expense Details</title>
</head>
<body>
	<div class="m-4">
		<div class="d-flex justify-content-between">
			<h1>Expense Details</h1>
			<a href="/expenses" class="pt-4 fw-bold me-5">Go Back</a>
		</div>
		<div>
			<div class="d-flex mb-2">
				<p class="viewP">Expense Name:</p>
				<p class="viewName">${expense.name}</p>
			</div>
			<div class="d-flex mb-2">
				<p class="viewP">Expense Description:</p>
				<p class="viewDesc">${expense.description}</p>
			</div>
			<div class="d-flex mb-2">
				<p class="viewP">Vendor:</p>
				<p class="viewVendor">${expense.vendor}</p>
			</div>
			<div class="d-flex">
				<p class="viewP">Amount Spent:</p>
				<p class="viewAmount">${expense.amount}</p>
			</div>
		</div>
	</div>
</body>
</html>