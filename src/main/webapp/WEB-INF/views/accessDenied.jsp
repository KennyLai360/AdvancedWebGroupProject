<jsp:include page="../templates/headerTemplate.jsp" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>AccessDenied page</title>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-center">
                    <h2>Dear <strong>${user}</strong>, You are not authorized to access this page</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="text-center">
                <a href="<c:url value='/logout' />"<button class="btn btn-danger">Logout</button></a>
            </div>

        </div>

    </div>
</body>
</html>
