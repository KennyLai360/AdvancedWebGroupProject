<jsp:include page="../templates/headerTemplate.jsp"/>
<script type="text/javascript" src="../../js/draw.js"></script>

<div class="container preventSelection" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-3">
            <div style="border: black 1px solid; height:175px; border-radius: 20px;">
                <div style="padding-top:5px; padding-left:5px;">
                    <h5><b><u>Users in-lobby [4/4]</u></b></h5>

                    <div style="padding-left:10px;">
                        <!-- PUT THE ACTIVE USERS BELOW -->
                        <p>User1</p>

                        <p>User1</p>

                        <p>User1</p>

                        <p>User1</p>
                    </div>
                </div>
            </div>
            <div style="padding:5px;"></div>
            <div style="border: black 1px solid; height:310px; border-radius: 20px;">
                <div style="padding-top:10px; padding-left:5px;">
                    <h5><b><u>Chat</u></b></h5>

                    <div id="scrollChat">
                        <!-- ENTER YOUR CHAT CODE BELOW -->
                        <p>amsdmakasdadasdasdasdasdsad asdadasda asdaa sda dasd admdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>

                        <p>amsdmakmdkad</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-offset-3" id="canvasDiv" style="border: black 1px solid;height:500px; border-radius: 20px">
        </div>

    </div>
    <div class="row preventSelection" style="padding-top:5px;">
        <div class="col-md-4" style="border: black 1px solid; height:50px;  border-radius: 20px; padding-top:5px">
            <label title="Brush tool"><img src="../icons/pencil_btn.png" onClick="pencilButtonClick()"
                                           height="30"/></label>
            <label title="Eraser tool"><img src="../icons/eraser_btn.png" onClick="eraserButtonClick()"
                                            height="30"/></label>
            <label title="Colour of the brush">
                <input type="color" id="colourSelector" onchange="onColourChange(this.value)" value="#000000"/></label>
            <label title="Width of the brush">
                <input class="form-control" type="number" min="1" id="lineWidthSelector" style="width:75px;" value="5"
                       onchange="autoValidateLineWidthInput()"/></label>
            <label title="Clear the canvas">
                <button type="button" class="btn btn-warning" data-toggle="tooltip" data-placement="top"
                        title="Clear the Canvas" onclick="clearCanvas()">
                    Clear
                </button>
            </label>

            <div class="btn-group dropup"
            ">
            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                Room Info
            </button>
            <ul class="dropdown-menu">
                <li><a>Room id: 192371327813</a></li>
                <li><a>Room number: 123</a></li>
            </ul>
        </div>
        <hr>
    </div>
    <div class="input-group col-md-8 preventSelection" style="padding:7px;">
        <input type="text" class="form-control" placeholder="Send some message here!"/>
                    <span class="input-group-btn">
                        <div onclick="scrollToBottomOfChat()">
                            <button class="btn btn-secondary" type="submit">Send</button>
                        </div>
                    </span>
    </div>
</div>
<script type="text/javascript">
    prepareCanvas();
</script>

<jsp:include page="../templates/footerTemplate.jsp"/>

</body>
</html>



