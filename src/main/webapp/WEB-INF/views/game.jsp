<jsp:include page="../templates/gameHeaderTemplate.jsp"/>

<script>

    // Stores the user object data here.
    var userData;

    // Global Room List
    var availableRooms = [];

    // Stores current logged-in username. Takes the value from the database.
    curUser = '${user}';

    // Global User List. Useres that are logged in to the game server are stored here.
    var globalUserList = [];

    // Current Room Object.
    var curRoomData;

    /*
        This creates the user room display list and updates it when a change has been made.
        Shows users in the room.
     */
    function createUserListDisplay(){
        if($('#userDisplay').length > 0){
            $('#userDisplay').remove();
        }

        var source   = $("#users-template").html();
        var template = Handlebars.compile(source);
        var newPage = template(curRoomData);

        $('#userList').append(newPage);
    }

    /*
        Retrieves the current joined room Object Data by the user.
    */
    function getJoinedRoom(){
        $.ajax({
            url:"/getJoinedRoom",
            type:'GET',
            success:function(data) {
                getUserList();
                console.log(data);
                curRoomData = data;
                createUserListDisplay();
                initialiseDrawer();

                if (curRoomData.listOfUsers.length == 3) {
                    document.getElementById("waitingForUserModal").innerHTML = "Waiting for Users: " + curRoomData.listOfUsers.length + "/4";
                    document.getElementById("startGameBtn").innerHTML = "Ready!";
                    //First user in game

                        console.log("You are the first!");
                        document.getElementById("startGameBtn").disabled = false;
                        document.getElementById("startGameBtn").removeAttribute("style");

                    chooseDrawer();
                    makeDrawer();
                    getMaxRounds();
                } else {
                    $('#myModal').modal('show');
                    document.getElementById("waitingForUserModal").innerHTML = "Waiting for Users: " + curRoomData.listOfUsers.length + "/4";
                    document.getElementById("startGameBtn").innerHTML =  curRoomData.listOfUsers.length + "/4";

                }
                return false;
            }
        });
    }



    function hideWaitingForUserModal() {
        $('#myModal').modal('hide');
    }

    function newRound() {
        round++;
//        var oldcanv = document.getElementById('canvasDiv');
//        document.removeChild(oldcanv);
        $('canvas').remove();
        initialiseDrawer();
        incrementDrawer();
        makeDrawer();
        time = 60;
//        var word = ${word};
//        console.log(word.toString());
//        Command: toastr["success"]("Congratulations, you guessed correctly!",
//        "The word was " + word.toString() + "!");

//        toastr.options = {
//            "closeButton": true,
//            "debug": false,
//            "newestOnTop": false,
//            "progressBar": false,
//            "positionClass": "toast-top-full-width",
//            "preventDuplicates": false,
//            "onclick": null,
//            "showDuration": "300",
//            "hideDuration": "1000",
//            "timeOut": "500000",
//            "extendedTimeOut": "100000",
//            "showEasing": "swing",
//            "hideEasing": "linear",
//            "showMethod": "fadeIn",
//            "hideMethod": "fadeOut"
//        }


    }



    /*
        Called on load.
        On load - Get User Object Data.
    */
    $(window).load(function(){
        $.ajax({
            url:"/getUser",
            type:'GET',
            success:function(data) {
                userData = data;
                curRoom = userData.gameRoomId;
                drawConnect(curRoom);
                getJoinedRoom();
//                chooseRole();
                return false;
            }
        });
    });
    /*
     Removes user from GlobalList.
     Indicating that the user has logged out from the game server.
     */
    function removeUser(){
        var thisUser = curUser;
        $.ajax({
            url:"/removeUser",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(curUser),
            success:function(data) {
                sendDisconnection(curRoom);
                drawDisconnect(curRoom);
                return false;
            }
        });
    }

    // Remove current user from roomlist.
    function spliceTheArray() {

        for(i=0;i<curRoomData.listOfUsers.length;i++){
            if(curRoomData.listOfUsers[i].name === userData.name){
                curRoomData.listOfUsers.splice(i,1);
                console.log(curUser);
            }
        }
        updateRoom();
        sendInGameInfo("Update room");
    }
    /*
     Removes user from GlobalList.
     Indicating that the user has logged out from the game server.
     */
    function updateRoom(){
        $.ajax({
            url:"/updateRoom",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(curRoomData),
            success:function(data) {
                window.location.href = "/";
                return false;
            }
        });
    }

    window.addEventListener("beforeunload", function (e) {
        resetUser();

        (e || window.event).returnValue = null;
    });
    function sendClear() {
        clearCanvas();
        sendDrawing(-1);
    }
    function sendColor(val) {
        onColourChange(val);
//        sendDrawing(-2,1,false,1,val);
    }

    function makeDrawer() {
        var userPosition = 0;
        //Finds current user in curRoomData in order to access isDrawer
        for (i = 0; i < curRoomData.listOfUsers.length; i++) {
            if (curRoomData.listOfUsers[i].name == userData.name) {
                userPosition = i;
            }
        }
        if (curRoomData.listOfUsers[userPosition].isDrawer == 1) {
            console.log()
            var buttonsToDisable = document.getElementsByClassName("disableButtonForGuesser");
            for (var i = 0; i < buttonsToDisable.length; i++) {
                buttonsToDisable[i].removeAttribute("style");
            }
            //Indicates drawer
            prepareCanvas(1);
        }
        else {
            //Indicates guesser
            while ($('canvas').length > 1) {
                $('canvas').remove();
            }
            var buttonsToDisable = document.getElementsByClassName("disableButtonForGuesser");
            for (var i = 0; i < buttonsToDisable.length; i++) {
                buttonsToDisable[i].style.display = "none";
            }
            prepareCanvas(0);
        }
    }

    function getPositionInUserList(name) {
        for (i = 0; i < curRoomData.listOfUsers.length; i++) {
            if (name == curRoomData.listOfUsers[i]) {
                return i;
            }
        }
    }


//    function chooseRole() {
//        if (confirm("Choose a role! OK is Drawer. Cancel is Guesser.") == true) {
//            // Indicates Drawer
//            prepareCanvas(1);
//        } else {
//            // Indicates Guesser
//            prepareCanvas(0);
//        }
//    }
    var time = 60;


    function refreshTimer() {
        if (time > 0) {
            time--;
            document.getElementById("timer").innerHTML= time;
        }
        else {

        }
    }

    window.onload = function() {
        document.getElementById("timer").innerHTML=time;
        $('#myModal').modal({
            backdrop: 'static',
            keyboard: false
        })
    }

    function endGame() {
        for (i = 0; i < curRoomData.listOfUsers.length; i++) {
            if (curRoomData.listOfUsers[i].name == curUser) {
                userPosition = i;
            }
        }
        if (curRoomData.listOfUsers[userPosition].isWinner = 1) {
            Command: toastr["success"]("Congratulations, you won!", "You won!");
        }
    }



toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-full-width",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "500000",
  "extendedTimeOut": "100000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}

</script>
<script id="users-template" type="text/x-handlebars-template">
        <div id="userDisplay" style="padding-left:10px;">
            <h5><b><u>Users in-lobby [{{listOfUsers.length}}/4]</u></b></h5>
        {{#each listOfUsers}}
            <p id="{{name}}">{{name}}: 0</p>
        {{/each}}
        </div>
</script>



<div class="container preventSelection" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-offset-3" style="padding-bottom:5px">
            <div style="border: black 1px solid; height:30px; border-radius: 20px; ">
                <div class="row">
                    <div class="col-md-12">
                        <c:choose>
                            <c:when test = "${curRoomData.listOfUsers[getPositionInUserList(userData.name)].isDrawer == 1}">
                                <b> Word: </b> ${word}
                            </c:when>
                        </c:choose>

                        <b>Timer:</b> <a id="timer"></a>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div style="border: black 1px solid; height:175px; border-radius: 20px;">
                <div id="userList" style="padding-top:5px; padding-left:5px;">

                </div>
            </div>
            <div style="padding:5px;"></div>
            <div style="border: black 1px solid; height:310px; border-radius: 20px;" id="conversationDiv">
                <div style="padding-top:10px; padding-left:5px;">
                    <h5><b><u>Chat</u></b></h5>

                    <div id="scrollChat">
                        <!-- ENTER YOUR CHAT CODE BELOW -->
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-offset-3" id="canvasDiv" style="border: black 1px solid;height:500px; border-radius: 20px">
        </div>

    </div>

    <div class="row preventSelection" style="padding-top:5px;">
        <div class="col-md-5" style="border: black 1px solid; height:50px;  border-radius: 20px; padding-top:5px">
            <div> <!--Add some sort of javascript thing to disable drawing tools if the user is a guesser -->
                <label title="Brush tool" class="disableButtonForGuesser"><img src="../icons/pencil_btn.png" onClick="pencilButtonClick()"
                                               height="30"/></label>
                <label title="Eraser tool" class="disableButtonForGuesser"><img src="../icons/eraser_btn.png" onClick="eraserButtonClick()"
                                                height="30"/></label>
                <label title="Sound tool"><img id="soundBtn" src="../icons/musicOn.png" onClick="toggleAudio();"
                                                        height="30"/></label>
                <label title="Colour of the brush" class="disableButtonForGuesser">
                    <input type="color" id="colourSelector" onchange="sendColor(this.value)" value="#000000"/></label>
                <label title="Width of the brush" class="disableButtonForGuesser">
                    <input class="form-control" type="number" min="1" id="lineWidthSelector" style="width:75px;"
                           value="5"
                           onchange="autoValidateLineWidthInput()"/></label>
                <label title="Clear the canvas" class="disableButtonForGuesser">
                    <button type="button" class="btn btn-warning" data-toggle="tooltip" data-placement="top"
                            title="Clear the Canvas" onclick="sendClear()">
                        Clear
                    </button>
                </label>

                <div class="btn-group dropup">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false">
                        Room Info
                    </button>
                    <ul class="dropdown-menu">
                        <li><a>Room id: ${curRoom}</a></li>
                        <li><a>Room number: 123</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="input-group col-md-7 preventSelection" style="padding:7px;">
            <input id="messagebox" type="text" class="form-control" placeholder="Send some message here!"/>
                    <span class="input-group-btn">
                        <div onclick="scrollToBottomOfChat()">
                            <button class="btn btn-secondary" type="submit">Send</button>
                        </div>
                    </span>
        </div>
    </div>
</div>
<script type="text/javascript">
    //    prepareCanvas();
</script>

<jsp:include page="../templates/footerTemplate.jsp"/>

</body>
</html>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div id="waitingForUserModal">
                    Waiting for Users... 1/4
                </div>
            </div>
            <div class="modal-footer">
                <button id="startGameBtn" type="button" class="btn btn-success" style="display: none" onclick="hideWaitingForUserModal()"></button>
                <a href="/join"><button type="button" class="btn btn-danger">Quit</button></a>
            </div>
        </div>
    </div>
</div>



