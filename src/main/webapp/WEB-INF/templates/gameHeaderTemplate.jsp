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
        }
        #joinGameLobbyTable {
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
        <%@include file="../../bower_components/toastr/toastr.css" %>
        <%@include file="../../bower_components/sweetalert/sweetalert.css" %>
    </style>
    <script type="text/javascript" src="../../bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/json3/lib/json3.min.js"></script>
    <script type="text/javascript" src="../../bower_components/handlebars/handlebars.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/sockjs/sockjs.min.js"></script>
    <script type="text/javascript" src="../../../bower_components/stomp-websocket/lib/stomp.min.js"></script>
    <script type="text/javascript" src="../../js/connectSocket.js"></script>
    <script type="text/javascript" src="../../js/room.js"></script>
    <script type="text/javascript" src="../../js/game.js"></script>
    <script type="text/javascript" src="../../js/draw.js"></script>
    <script type="text/javascript" src="../../../bower_components/toastr/toastr.js"></script>
    <script type="text/javascript" src="../../../bower_components/sweetalert/sweetalert-dev.js"></script>


</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" id="quitBtn" data-toggle="modal"
               data-target="#confirmationModal" style="cursor:hand">Quit</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">

                        <span style="color: white">Hello ${user}!</span>
                        <%--<a href="<c:url value='/logout' />">--%>
                            <a><button class="btn btn-danger">Logout</button></a>


            </div>
        </div>

    </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Confirmation</h4>
            </div>
            <div class="modal-body">
                Are you sure you wish to quit the game?
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                <%--<a href="<c:url value='/home' />">--%>
                <a>
                    <button class="btn btn-success" onclick="resetUser()">Yes</button>
                </a>
            </div>
        </div>

    </div>
</div>

