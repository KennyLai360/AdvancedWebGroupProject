<jsp:include page="../templates/headerTemplate.jsp"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin page</title>
    <script type="text/javascript" src="../../js/game.js"></script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center">
                <h2>Dear <strong>${user}</strong>,Welcome to the Admin Page!</h2>
            </div>
        </div>
    </div>

    <div class="row">
        <div style="border: black 1px solid; height:500px; border-radius: 20px;">

            <div  style="padding-left:20px; padding-right:20px;">
                <div class="row">
                    <h3><b>Admin Control Panel</b></h3>

                    <hr>
                    <div class="row">
                        <div class="col-md-12">
                            <div style="padding:10px;" id="tableContent">
                                <div class="table-responsive table-bordered">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>User Id</th>
                                            <th>Username</th>
                                            <th>User Profiles</th>
                                            <th>Score</th>
                                            <th>Medal</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${listOfUsers}" var="user">
                                            <tr>
                                                <td><c:out value="${user.id}"/></td>
                                                <td><c:out value="${user.ssoId}"/></td>
                                                <td><c:out value="${user.userProfiles}"/></td>
                                                <td><c:out value="${user.score}"/></td>
                                                <td><c:out value="${user.medal}"/></td>
                                            </tr>
                                        </c:forEach>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
