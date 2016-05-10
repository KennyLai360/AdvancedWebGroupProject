<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }

        #scrollChat {
            max-height: 250px;
            overflow-y: auto;
            max-width: 100%;
            overflow-x: hidden;
        }
        #joinGameLobbyTable {
            max-height: 380px;
            overflow-y: auto;
        }
        #deleteTable {
            max-height: 380px;
            overflow-y: auto;
        }
        .preventSelection {
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -o-user-select: none;
            user-select: none;
        }
        <%@include file="../../bower_components/bootstrap/dist/css/bootstrap.css" %>
    </style>
    <script type="text/javascript" src="../../bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../bower_components/handlebars/handlebars.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/json3/lib/json3.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/sockjs/sockjs.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/stomp-websocket/lib/stomp.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/toastr/toastr.js"></script>





</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<c:url value="/home" />" id="homeBtn">Home</a>
            <a class="navbar-brand" href="<c:url value="/about" />" id="aboutBtn">About us</a>
            <a class="navbar-brand" href="<c:url value="/contact" />" id="contactBtn">Contact us</a>
            <a class="navbar-brand" href="<c:url value="/login" />" id="GameBtn">Game</a>

        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <c:choose>
                    <c:when test="${empty user}">
                        <a href="<c:url value='/login' />"><button class="btn btn-success">Log In</button></a>
                    </c:when>
                    <c:when test="${user == 'anonymousUser'}">
                        <a href="<c:url value='/login' />"><button class="btn btn-success">Log In</button></a>
                    </c:when>
                    <c:otherwise>
                        <span style="color: white">Hello ${user}!</span>
                        <a href="<c:url value='/logout' />"><button class="btn btn-danger" onclick="removeFromUserList();">Logout</button></a>
                            <a href="<c:url value='/admin' />"<button class="btn btn-info">Admin Panel</button></a>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>

    </div>
</nav>

