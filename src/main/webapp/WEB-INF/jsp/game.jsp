<html>
<jsp:include page="../templates/headerTemplate.jsp" />

<body>
    <script type="text/javascript" src="../../js/draw.js"></script>

<div class="container" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-3">
            <div style="border: black 1px solid; height:500px; border-radius: 25px">
                <!--User in game info here-->
            </div>
        </div>

        <div class="col-md-offset-3" id="canvasDiv" style="border: black 1px solid;height:500px; border-radius: 25px">
        </div>

    </div>
        <div class="row">
            <div class="col-md-3" style="border: black 1px solid; height:50px;  border-radius: 25px;">
                <!-Some other info icon etc etc here?-->
            </div>
            <div class="input-group col-md-9" style="">
            <input type="text" class="form-control" placeholder="Send some message here!">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Send</button>
                    </span>
        </div>
        </div>

</div>

<div class="container">
    <div class="row">
        <jsp:include page="../templates/footerTemplate.jsp" />
    </div>
</div>

<div  style="padding: 10px;"></div>

<script type="text/javascript">
    prepareCanvas();
</script>

</body>

</html>

