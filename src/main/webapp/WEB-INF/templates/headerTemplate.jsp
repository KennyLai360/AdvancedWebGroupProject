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
            overflow-y:auto;
        }
        <%@include file="../../bower_components/bootstrap/dist/css/bootstrap.css" %>
    </style>
    <script type="text/javascript" src="../../bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</head>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/home">Home</a>
            <a class="navbar-brand" href="/about">About us</a>
            <a class="navbar-brand" href="/contact">Contact us</a>

            <div class="btn-group">
                <a style="cursor: hand;" class="navbar-brand dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Game</a>
                <ul class="dropdown-menu">
                    <li><a href="/game">Create Gameoom</a></li>
                    <li><a href="/join">Join a Game</a></li>
                </ul>
            </div>

        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" role="form" onsubmit>
                <div class="form-group">
                    <input type="text" placeholder="Username" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>
                <button class="btn btn-info">Register</button>
            </form>

        </div><!--/.navbar-collapse -->
    </div>
</nav>

