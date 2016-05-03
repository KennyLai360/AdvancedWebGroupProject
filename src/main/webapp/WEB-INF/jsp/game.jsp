<html>
<jsp:include page="../templates/headerTemplate.jsp" />
<body>
<script type="text/javascript" src="../../bower_components/sockjs/sockjs.min.js"></script>
<script type="text/javascript" src="../../bower_components/stomp-websocket/lib/stomp.min.js"></script>
<script type="text/javascript" src="../../js/connectSocket.js"></script>
    <script>
        $(window).load(messengerConnect());
        // $(window).unload(messengerDisconnect());
    </script>
    <script type="text/javascript" src="../../js/draw.js"></script>


<div class="container" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-3">
            <div style="border: black 1px solid; height:500px; border-radius: 25px" id="conversationDiv">
                <!--User in game info here-->        <p id="response"></p>

            </div>
        </div>

        <div class="col-md-offset-3" id="canvasDiv" style="border: black 1px solid;height:500px; border-radius: 25px">
        </div>

    </div>
        <div class="row">
            <div class="col-md-3" style="border: black 1px solid; height:50px;  border-radius: 25px; padding-top:10px">
                <label title="Brush tool"><img src="../icons/pencil_btn.png" onClick="pencilButtonClick()" height="30"/></label>
                <label title="Eraser tool"><img src="../icons/eraser_btn.png" onClick="eraserButtonClick()" height="30"/></label>
                <label title="Clear the canvas"><button onclick="clearCanvas()">Clear</button></label>
                <label title="Colour of the brush">
                <input type="color" id="colourSelector" onchange="onColourChange(this.value)" value="#000000"/></label>
                <label title="Width of the brush">
                <input type="number" min="1" id="lineWidthSelector" style="width:50px;" value="5" onchange="autoValidateLineWidthInput()" /></label>
            </div>
            <div class="input-group col-md-9" style="padding:5px;">
            <input type="text" id="messagebox" class="form-control" placeholder="Send some message here!">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button" onclick="sendMessage()">Send</button>
                    </span>
        </div>
        </div>

</div>

<div class="container">
    <div class="row">
        <jsp:include page="../templates/footerTemplate.jsp" />
    </div>
</div>

<div style="padding: 10px;"></div>

<script type="text/javascript">
    prepareCanvas();
</script>

</body>

</html>

