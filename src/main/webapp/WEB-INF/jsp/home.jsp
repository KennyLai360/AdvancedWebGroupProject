<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
        <%@include file="../../bower_components/bootstrap/dist/css/bootstrap.css" %>
    </style>
</head>
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
            <a class="navbar-brand" href="#home">Home</a>
            <a class="navbar-brand" href="#about">About us</a>
            <a class="navbar-brand" href="#contact">Contact us</a>
            <a class="navbar-brand" href="#start">Start Game</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

            <form class="navbar-form navbar-right" role="form">
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control">
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

<!--
Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc molestie consectetur hendrerit. Duis tincidunt placerat lacus, ut iaculis nisi luctus ac. Curabitur ut elementum enim. Sed aliquam lorem ac tellus interdum sagittis. Duis eleifend nulla eget semper aliquet. Vivamus placerat eleifend magna, ut lobortis sapien ultrices ac. Integer porttitor accumsan nunc, in efficitur nulla ullamcorper sed. Sed vitae fermentum sem, vitae lobortis odio. Proin rutrum elit enim, sed ornare massa volutpat sed. In gravida laoreet faucibus.</p>

    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <jsp:include page="about.jsp" />
        </div>

        <div class="col-md-12">
            <jsp:include page="contact.jsp" />
        </div>

        <div class="col-md-12">
            <jsp:include page="game.jsp" />
        </div>

    </div>


    <hr>

    <footer>
        <p>&copy; Group10 - COM3018 Web Project</p>
    </footer>
</div>

</body>
</html>

