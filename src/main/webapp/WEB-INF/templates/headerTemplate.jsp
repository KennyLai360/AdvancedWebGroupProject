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
    </style>
    <script type="text/javascript" src="../../bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/game.js"></script>

</head>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/home" id="homeBtn">Home</a>
            <a class="navbar-brand" href="/about" id="aboutBtn">About us</a>
            <a class="navbar-brand" href="/contact" id="contactBtn">Contact us</a>
            <a class="navbar-brand" href="/join" id="GameBtn">Game</a>

        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <div class="navbar-form navbar-right">
                <span style="color: white">Welcome Blah Blah</span>
                <button type="submit" class="btn btn-danger">Sign Out</button>
            </div>
        </div>

    </div>
</nav>

