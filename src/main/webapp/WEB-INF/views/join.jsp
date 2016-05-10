<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../templates/headerTemplate.jsp"/>
<script type="text/javascript" src="../../js/connectSocket.js"></script>
<script type="text/javascript" src="../../js/room.js"></script>
<script type="text/javascript" src="../../js/game.js"></script>
<script>
    var availableRooms = [];
    var userData;
    curUser = '${user}';
    var globalUserList = [];
    var curRoomData;

    /*  Call this function when after the rooms have been successfully retrieved.
     This connects the user to the MAIN Channel which consists of messages to prompt certain actions.
     This function also creates the room lobby.
     */
    function callThisOnLoad(data){
        // This connects the user to the main channel
        if(stompClient == null) {
            connectMainChannel();
        }

        // This creates the handlebars room template and displays it.
        var source   = $("#entry-template").html();
        var template = Handlebars.compile(source);
        var newPage = template(data);

        $('#joinGameLobbyTable').append(newPage);
    }

    /*
     Add user to global user list.
     This indicates the user has logged into the game server.
     */
    function addToUserList(){
        var userName = '${user}';
        var user = {
            name: userName,
            gameRoomId: 0,
            state: 0
        };
        $.ajax({
            url:"/addUser",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(user),
            success:function(data) {
                return false;
            }
        });
    }
    /*
     Removes user from GlobalList.
     Indicating that the user has logged out from the game server.
     */
    function removeFromUserList(){
        var thisUser = '${user}';
        $.ajax({
            url:"/removeUser",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(thisUser),
            success:function(data) {
                return false;
            }
        });
    }

    /*
        Called when a user joins a room.
        Sends the user data to the controller.
     */
    function joinRoom(roomId){
        var userName = '${user}';
        var user = {
            name: userName,
            gameRoomId: roomId,
            state: 1
        };
        $.ajax({
            url:"/joinRoom",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(user),
            complete:function(data){
                sendRoomCommand("join");
                window.location.href = "/game";
                return false;
            }
        });
    }

    // Creates a room.
    // Gets the values of the boxes and adds it to an array.
    // AJAX POST call to send the data to the server to be stored in the current gameList.
    // Sends the addRoom function to the webSocket to be received by everyone connected to MAIN Channel.
    // Creates a room and dynamically updates the rooms.
    function createRoom(){
        var rName = $('#rnBox').val();
        var nRounds = $('#roundBox').val();
        var d = new Date();
        var n = d.getTime();
        var room = {
            gameRoomId: n,
            gameRoomName: rName,
            numberOfRounds: nRounds,
            gameState: "WAITING",
            listOfUsers: []
        };
        $.ajax({
            url:"/addRooms",
            type:'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(room),
            complete:function(data) {
//                sendRoomCommand("add");
                joinRoom(n);
                return false;
            }
        });
    }
    // Creates a room.
    // Gets the values of the boxes and adds it to an array.
    // AJAX POST call to send the data to the server to be stored in the current gameList.
    function checkRoom(roomId){
        getRoom();
        for(i=0; i < availableRooms.length; i++){
            if(userData.state == 1){
                alert("Apparently... You're already in-game. Removing you from existing game.");
                resetUser();
                window.location.href = "/join";
            } else {
                if (availableRooms[i].gameRoomId == roomId) {
                    if(availableRooms[i].gameState == "IN GAME"){
                        alert("Room is in session!");
                    } else {
                        if (availableRooms[i].listOfUsers.length < 4) {
                            // Room is not full
                            joinRoom(roomId);
                        } else {
                            alert("Room is full!");
                        }
                    }
                }
            }
        }
    }

    // Retrieves room list from server.
    getRoom();
    // Disconnects from the MAIN Channel when the window is closed or page is changed.
    window.addEventListener("beforeunload", function (e) {
        disconnectMainChannel();

        (e || window.event).returnValue = null;
    });

</script>
<script id="entry-template" type="text/x-handlebars-template">
    <table id="roomsTable" class="table">
        <thead>
        <tr>
            <th>Progress</th>
            <th>Room Name</th>
            <th>Room Number</th>
            <th>Players</th>
            <th>Rounds</th>
            <th>Join?</th>
        </tr>
        </thead>
        {{#each this}}
        <tr>
            <td><span class="label label-warning">{{gameState}}</span></td>
            <td>{{gameRoomName}}</td>
            <td>{{gameRoomId}}</td>
            <td>{{listOfUsers.length}}/4</td>
            <td>{{numberOfRounds}}</td>
            <td>
                <%--<a href="<c:url value='/game'/>">--%>
                <a>
                <button class="form-control btn btn-danger" onclick="checkRoom({{gameRoomId}})">Join</button></a></td>
        </tr>
        {{/each}}
    </table>
</script>
<div class="container" style="padding-top:30px;">
    <div class="row">
        <div style="border: black 1px solid; height:550px; border-radius: 20px;">

            <div class="row">
                <div>
                    <h3 class="text-center">Pictionary!</h3>
                </div>
            </div>

            <div class="row" style="margin:0px;">
                <hr>
            </div>

            <div class="row">
                <div class="col-md-9">
                    <h4 class="text-center"><u>Current Lobbies</u></h4>
                </div>
            </div>

            <div class="row" style="padding:10px;">
                <div class="col-md-9">
                    <div style="padding:10px;">
                        <div id="joinGameLobbyTable" class="table-responsive table-bordered">
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <button type="button" class="btn btn-success form-control" data-toggle="modal"
                            data-target="#createGameModal">
                        Create a room
                    </button>
                </div>

            </div>

        </div>
    </div>
</div>

<jsp:include page="../templates/footerTemplate.jsp"/>
</body>
</html>

<!-- Modal -->
<div class="modal fade" id="createGameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Enter settings for the new room</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8">
                            <span><b>Room Name</b></span>
                            <input id="rnBox" type="text" class="form-control" onchange="validateNewRoomSettings()">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-8">
                            <span><b>Rounds</b></span>
                            <select id="roundBox" class="input-small form-control" onchange="validateNewRoomSettings()">
                                <option value="" selected="selected">--Select amount of rounds--</option>
                                <option value="4">4 - (one round of drawing each)</option>
                                <option value="8">8 - (two rounds of drawing each)</option>
                                <option value="12">12 - (three rounds of drawing each)</option>
                            </select>
                        </div>
                    </div>

                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                    <%--<a href="<c:url value='/game' />">--%>
                    <a>
                        <button id="createRoomBtn" class="btn btn-success" disabled="disabled" onclick="createRoom()" >Create Room</button>
                    </a>
                </div>
        </div>

    </div>
</div>
