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

    // Stores the word for guessing.
    var theWord;

    // Timer.
    var time = 60;

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
                
                //If there are 4 users in the room, show start button.
                if (curRoomData.listOfUsers.length == 4) {
                    document.getElementById("waitingForUserModal").innerHTML = "Waiting for Users: " + curRoomData.listOfUsers.length + "/4";
                    document.getElementById("startGameBtn").innerHTML = "Start Game!";
                    // If you are the first user in the room.
                    if(curRoomData.listOfUsers[0].name == userData.name){
                        //First user in game
                        console.log("You are the first!");
                        document.getElementById("startGameBtn").disabled = false;
                        document.getElementById("startGameBtn").removeAttribute("style");
                    }
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

    /*
        Retrieves a random word from the server.
        Only gets called by drawer.
     */
    function getWord(){
        $.ajax({
            url: "/getWord",
            type: 'GET',
            success: function (data) {
                theWord = data;
            }
        });
    }

    function hideWaitingForUserModal() {
        $('#myModal').modal('hide');
    }

    function newRound() {
        $('canvas').remove();
        sendClear();
        initialiseDrawer();
        incrementDrawer();
        time = 60;
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
        var room = {
            gameRoomId: curRoomData.gameRoomId,
            gameRoomName: curRoomData.gameRoomName,
            numberOfRounds: curRoomData.numberOfRounds,
            gameState: "IN GAME",
            listOfUsers: curRoomData.listOfUsers
        };
        $.ajax({
            url:"/updateRoom",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(room),
            success:function(data) {
                return false;}
        });
    }

    window.addEventListener("beforeunload", function (e) {
        resetUser();

        (e || window.event).returnValue = null;
    });
    
    //Clears the canvas for drawer and guessers 
    function sendClear() {
        clearCanvas();
        sendDrawing(-1);
    }
    
    //Sends color change data
    function sendColor(val) {
        onColourChange(val);
//        sendDrawing(-2,1,false,1,val);
    }

    //Creates the canvases, one for the drawer with drawing enabled, and one for each
    //guesser with drawing disabled.
    function makeDrawer() {
        theWord = "";
        document.getElementById("roomIdInfo").innerHTML = "<a>Room Id: <b>" + curRoomData.gameRoomId + "</b></a>";
        document.getElementById("roomNameInfo").innerHTML = "<a>Room Name: <b>" + curRoomData.gameRoomName + "</b></a>";
        document.getElementById("roundsInfo").innerHTML = "<a>Rounds: <b>" + curRoomData.numberOfRounds + "</b></a>";
        var userPosition = 0;
        //Finds current user in curRoomData in order to access isDrawer
        for (i = 0; i < curRoomData.listOfUsers.length; i++) {
            if (curRoomData.listOfUsers[i].name == userData.name) {
                userPosition = i;
            }
        }
        // Fix canvas bug.
        while ($('canvas').length > 0) {
            $('canvas').remove();
        }
        if (curRoomData.listOfUsers[userPosition].isDrawer == 1) {
            var buttonsToDisable = document.getElementsByClassName("disableButtonForGuesser");
            for (var i = 0; i < buttonsToDisable.length; i++) {
                buttonsToDisable[i].removeAttribute("style");
            }
            document.getElementById("messageSendButton").disabled = true;
            document.getElementById("messagebox").disabled = true;
            //Indicates drawer
            getWord();
            Command: toastr["success"]("You are now the drawer!", "The word is " + theWord);
            //Create canvas with drawing enabled
            prepareCanvas(1);
//            Command: toastr["success"]("You are now the drawer!", "The word is " + theWord);
            swal({title: "You are now the artist!", text: "The word is " + theWord + ". This box will close in 2 seconds.",   timer: 2000,   showConfirmButton: false });
            setTimeout(function(){ prepareCanvas(1); }, 2000);

        }
        else {
            //Disables drawing buttons for guessers
            var buttonsToDisable = document.getElementsByClassName("disableButtonForGuesser");
            for (var i = 0; i < buttonsToDisable.length; i++) {
                buttonsToDisable[i].style.display = "none";
            }
            document.getElementById("messageSendButton").disabled = false;
            document.getElementById("messagebox").disabled = false;
            //Create canvas with drawing disabled
            prepareCanvas(0);
            swal({title: "You are the guesser!", text: "Guess the word that the artist is drawing! This box will close in 2 seconds.",   timer: 2000,   showConfirmButton: false });
            setTimeout(function(){ prepareCanvas(0); }, 2000);
        }
        createWordDisplay(userPosition);
    }

    //Returns the position of a user in the list of users.
    function getPositionInUserList(name) {
        for (i = 0; i < curRoomData.listOfUsers.length; i++) {
            if (name == curRoomData.listOfUsers[i].name) {
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

    //Decrements timer. If it reaches 0, the next round is started.

    function refreshTimer() {
        if (time > 0) {
            time--;
            document.getElementById("timer").innerHTML= time;
        }
        else {
            nextRound();
            if(getPositionInUserList(userData.name).isDrawer == 1) {
                console.log("You'll never find...");
                sendWordOps();
            }
            swal({title: "Time Out!",   text: "The answer was " + theWord + ".",   timer: 2000,   showConfirmButton: false });
            setTimeout(function(){ newRound(); }, 2000);
        }
    }

    window.onload = function() {
        document.getElementById("timer").innerHTML=time;
        $('#myModal').modal({
            backdrop: 'static',
            keyboard: false
        })
    }

    //When the maximum number of rounds is reached, the game is over.
    //Show winners and losers.
    function endGame() {
        initialiseDrawer();
        makeDrawer();
        for (i = 0; i < curRoomData.listOfUsers.length; i++) {
            if (curRoomData.listOfUsers[i].name == curUser) {
                userPosition = i;
            }
        }
        if (curRoomData.listOfUsers[userPosition].isWinner == 1) {
            swal({
                    title: "Congratulations!",
                    text: "You have won! This is your score: " + points + ". Press 'OK' to leave the room.",
                    type: "success"
                },
                function () {
                    window.location.href = '/join';
                });
        } else {
            swal({
                    title: "Nice Try!",
                    text: "Better luck next time. This is your score:" + points + ". Press 'OK' to leave the room.",
                    type: "error"
                },
                function () {
                    window.location.href = '/join';
                });
        }
        //Stop drawing.
        initialiseDrawer();
    }

    function createWordDisplay(user){
        if($('#theWordBar').length > 0){
            $('#theWordBar').remove();
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
        if(curRoomData.listOfUsers[user].isDrawer == 1) {
            var source = $("#word-template").html();
            var template = Handlebars.compile(source);
            var newPage = template(theWord);

            $('#wordBarDiv').append(newPage);
        }
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
<script id="word-template" type="text/x-handlebars-template">
        <b id="theWordBar"> Word: </b> {{this}}
</script>

<div class="container preventSelection" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-offset-3" style="padding-bottom:5px">
            <div style="border: black 1px solid; height:30px; border-radius: 20px; ">
                <div class="row">
                    <div id="wordBarDiv" class="col-md-12">
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
                        <li id="roomIdInfo"><a>Room id:</a></li>
                        <li id="roomNameInfo"><a>Room Name</a></li>
                        <li id="roundsInfo"><a>Rounds</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="input-group col-md-7 preventSelection" style="padding:7px;">
            <input id="messagebox" type="text" class="form-control" placeholder="Send some message here!"/>
                    <span class="input-group-btn">
                        <div onclick="scrollToBottomOfChat()">
                            <button id="messageSendButton" class="btn btn-secondary" type="submit">Send</button>
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
                <button id="startGameBtn" type="button" class="btn btn-success" style="display: none" onclick="sendInGameInfo('Start');"></button>
                <a href="/join"><button type="button" class="btn btn-danger">Quit</button></a>
            </div>
        </div>
    </div>
</div>



