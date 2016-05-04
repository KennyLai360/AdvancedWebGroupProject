<jsp:include page="../templates/headerTemplate.jsp"/>
<script type="text/javascript" src="../../js/draw.js"></script>

<script type="text/javascript" src="../../bower_components/json3/lib/json3.min.js"></script>
<script type="text/javascript" src="../../bower_components/sockjs/sockjs.min.js"></script>
<script type="text/javascript" src="../../bower_components/stomp-websocket/lib/stomp.min.js"></script>
<script type="text/javascript" src="../../js/connectSocket.js"></script>

<script>
    //        $(window).load(messengerConnect());
    // $(window).unload(messengerDisconnect());
    $(window).load(function(){
        drawConnect();
        chooseRole();
//                    var tid = setInterval(sendDrawing,500);
//                    var tip = setInterval(showDrawing,500);
    });
    function sendClear(){
        clearCanvas();
        sendDrawing(-1);
    }
    function sendColor(val){
        onColourChange(val);
//        sendDrawing(-2,1,false,1,val);
    }
    function chooseRole() {
        if (confirm("Choose a role! OK is Drawer. Cancel is Guesser.") == true) {
            // Indicates Drawer
            prepareCanvas(1);
        } else {
            // Indicates Guesser
            prepareCanvas(0);
        }
    }
</script>


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
            <div style="border: black 1px solid; height:310px; border-radius: 20px;" id="conversationDiv">
                <div style="padding-top:10px; padding-left:5px;">
                    <h5><b><u>Chat</u></b></h5>

                    <div id="scrollChat">
                        <!-- ENTER YOUR CHAT CODE BELOW -->
                        <p id="response"></p>
                        <p>u wot m8</p>
                        <p>stfu u skrubl0rd</p>
                        <p>wut r u drawing blad</p>
                        <p>git rekt m8</p>
                        <p>rekt.</p>
                        <p>rektmastah</p>
                        <p>u wot m8</p>
                        <p>stfu u skrubl0rd</p>
                        <p>wut r u drawing blad</p>
                        <p>git rekt m8</p>
                        <p>rekt.</p>
                        <p>rektmastah</p>
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
                <input type="color" id="colourSelector" onchange="sendColor(this.value)" value="#000000"/></label>
            <label title="Width of the brush">
                <input class="form-control" type="number" min="1" id="lineWidthSelector" style="width:75px;" value="5"
                       onchange="autoValidateLineWidthInput()"/></label>
            <label title="Clear the canvas">
                <button type="button" class="btn btn-warning" data-toggle="tooltip" data-placement="top"
                        title="Clear the Canvas" onclick="sendClear()">
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
        <input id="messagebox" type="text" class="form-control" placeholder="Send some message here!"/>
                    <span class="input-group-btn">
                        <div onclick="scrollToBottomOfChat()">
                            <button class="btn btn-secondary" type="submit">Send</button>
                        </div>
                    </span>
    </div>
</div>
<script type="text/javascript">
//    prepareCanvas();
</script>

<jsp:include page="../templates/footerTemplate.jsp"/>

</body>
</html>



