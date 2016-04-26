<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->

<jsp:include page="../templates/headerTemplate.jsp" />
<body>
    <div class="container" style="padding-top:30px;">
        <div class="row">
            <div class="col-md-3">
                <div style="border: black 1px solid; height:500px; border-radius: 25px">
                    <!--User in game info here-->
                </div>
                <div style="border: black 1px solid; height:50px;  border-radius: 25px">
                    <!-Some other info icon etc etc here?-->
                </div>
            </div>

            <div class="col-md-9">
                <div style="border: black 1px solid; height:500px;  border-radius: 25px;">
                    <!--Drawing canvas here-->
                </div>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Send some message here!">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Send</button>
                    </span>
                </div>
            </div>


            </div>
        <jsp:include page="../templates/footerTemplate.jsp" />
    </div>
</body>
</html>

