var stompClient = null;
var drawer = 0;
var curUser;
var curRoom;
var musicPlaying = 0;
var audio = new Audio('../../static/game.mp3');
var round = 0;
var maxRounds = 0;
var winner;
var drawUser;

//Creates connection for sending draw data
function drawConnect(theRoom) {
    if(theRoom != 0 || null) {
        var socket = new SockJS('/draw');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/topic/drawings/' + theRoom, function (drawing) {
                showDrawing(JSON.parse(drawing.body).content);
            });
            stompClient.subscribe('/topic/greetings/' + theRoom, function (greeting) {
                showGreeting(JSON.parse(greeting.body).content);
            });
            stompClient.subscribe('/topic/roomOps/' + theRoom, function (connectionInfo) {
                updateInGameInfo(JSON.parse(connectionInfo.body).content);
            });
            stompClient.subscribe('/topic/wordOps/' + theRoom, function ( Answer) {
                getTheWord(JSON.parse(getWordAnswer.body).content);
            });
            sendInGameInfo("connect"); // Sends message to all users in room to retrieve updated list from server. This also retrieves the joined room info.
            toggleAudio();
        });
    } else {
        window.location.href = "/join";
    }

}

//Start/stop music
function toggleAudio(){
    if(musicPlaying){
        $('#soundBtn').attr('src','../icons/musicOff.png');
        musicPlaying = 0;
        audio.pause();
    } else{
        musicPlaying = 1;
        $('#soundBtn').attr('src','../icons/musicOn.png');
        audio.addEventListener('ended', function() {
            this.currentTime = 0;
            this.play();
        }, false);
        audio.play();
    }
}
//Creates connection for sending user and room data
function connectMainChannel(){
    var socket = new SockJS('/chat');

    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/main', function(maininfo){
            updateRoomInfo(JSON.parse(maininfo.body).content);
        });
        getUser();
        addToUserList();
        getUserList();
    });

}

//Gets the number of rounds in a room
function getMaxRounds() {
    maxRounds = curRoomData.numberOfRounds;
}

//Disconnects the main channel
function disconnectMainChannel() {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}

function sendRoomCommand(msg){
    stompClient.send("/app/chat/global", {}, JSON.stringify({ 'message': msg }));
}

function sendInGameInfo(msg){
    stompClient.send("/app/chat/roomOps/" + curRoom, {}, JSON.stringify({ 'message' : msg}));
}

//Used to call Javascript functions for all connected users in room
function updateInGameInfo(message){
    switch (message) {
        case "connect":
            getJoinedRoom();
            break;
        case "Update room":
            console.log("Calling update room");
            getJoinedRoom();
            break;
        case "Start":
            startGame();
            console.log("Switch start")
            break;
        default:
            getJoinedRoom();
    }
    // getJoinedRoom();
}

//Hides modal, allowing the game to begin
function sendWordOps(msg){
    stompClient.send("/app/chat/wordOps/" + curRoom, {}, JSON.stringify({ 'message' : msg}));
}

//Gets the word that the user is shown to draw2
function getTheWord(message){
    theWord = message;
}

function startGame() {
    hideWaitingForUserModal();
    updateRoom();
    // startTimer();
}


function updateRoomInfo(message){
    getRoom();
    getUser();
}

//Disconnects draw channel
function drawDisconnect(thisUser) {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    sendDisconnection();
    console.log("Disconnected");
}

//Sends disconnect message
function sendDisconnection() {
    var msg = userData.name + " has disconnected.";
    stompClient.send("/app/chat/"+ curRoom, {}, JSON.stringify({ 'message': msg }));
}

//Sends text messages for guessing/chat
function sendMessage() {
    var msg = document.getElementById('messagebox').value;
    msg =  curUser + ": " + msg;
    stompClient.send("/app/chat/"+ curRoom, {}, JSON.stringify({ 'message': msg }));
    var objDiv = document.getElementById("scrollChat");
    objDiv.scrollTop = objDiv.scrollHeight;
}

//Sends draw data
function sendDrawing(x,y,drag,size,color) {
    var hextoInt;
    if(color != null) {
        hextoInt = color.substring(1);
        hextoInt = parseInt(hextoInt, 16);
    }
    var arr = [x,y,drag? 1:0,size,hextoInt];
    stompClient.send("/app/draw/" + curRoom, {}, JSON.stringify({'drawing': arr}));
}

//Shows guess/chat message, detects correct guess
function showGreeting(message) {
    $('#scrollChat').append('<p>' + message + '</p>');
    var lastMessage = document.getElementById("scrollChat").lastChild.innerHTML;
    if (lastMessage.startsWith("Correct")) {
         findCorrectGuesser();
    }
    if(message == ""){

    }
}

//Initiailises all users to not be drawers
function initialiseDrawer() {
    for (i=0; i < curRoomData.listOfUsers.length; i++) {
        curRoomData.listOfUsers[i].isDrawer = 0;
    }
}

//
function chooseDrawer() {
    curRoomData.listOfUsers[0].isDrawer = 1;
    drawUser = 0;
}

function incrementDrawer() {
    drawUser++;
    onlyDoOnce = 1;
    onlyCanvasOnce = 1;
    if(drawUser >= curRoomData.listOfUsers.length){
        drawUser = 0;
    }
    curRoomData.listOfUsers[drawUser].isDrawer = 1;
    if(curRoomData.listOfUsers[drawUser].name == userData.name){
        // getWord();
    }
    makeDrawer();
}

function getDrawUser() {
    return drawUser;
}


function findCorrectGuesser() {
    var x = document.getElementById("scrollChat").lastChild.innerHTML;
    var y;
    for (i = 0; i < curRoomData.listOfUsers.length; i++) {
        console.log(i);
        y = x.substring(0, x.indexOf(curRoomData.listOfUsers[i].name))
        if (x.indexOf(curRoomData.listOfUsers[i].name) !== -1) {
            console.log(i);
            if (curRoomData.listOfUsers[i].points == undefined) {
                curRoomData.listOfUsers[i].points = 0;
            }
            if (curRoomData.listOfUsers[i].isDrawer == undefined) {
                curRoomData.listOfUsers[i].isDrawer = 0;
            }
            curRoomData.listOfUsers[i].points += time;
            document.getElementById(curRoomData.listOfUsers[i].name).innerHTML =
                    curRoomData.listOfUsers[i].name + ": " + curRoomData.listOfUsers[i].points + " Pts.";
//            findDrawer();
            if (userData.name === curRoomData.listOfUsers[i].name) {
                // Command: toastr["success"]("Correct!", "Nice, you guessed correctly!");
                swal({title: "Correct!",  type: "success", text: "You guessed it correctly! This box will close in 3 seconds.",   timer: 3000,   showConfirmButton: false });
            }
            else {
                // Command: toastr["error"]("Oh no!", "You didn't guess the word in time!");
                swal({title: "Oh no!",  type: "error", text: "Someone else has guessed the word! This box will close in 3 seconds.",   timer: 3000,   showConfirmButton: false });
            }
        }
    }
    if (round < maxRounds - 1) {
        round++;
        newRound();
        console.log(round);
    }
    else {
        chooseWinner();
    }
}

function chooseWinner() {
    var biggest = 0;
    var best = 0;
    for (i = 0; i < curRoomData.listOfUsers.length; i++) {
        if (curRoomData.listOfUsers[i].points > biggest) {
            biggest = curRoomData.listOfUsers[i].points;
            best = i;
        }
    }
    for (i = 0; i < curRoomData.listOfUsers.length; i++) {
        if (i == best) {
            curRoomData.listOfUsers[i].isWinner = 1;
        }
        else {
            curRoomData.listOfUsers[i].isWinner = 0;
        }
    }
    endGame();
}

function startTimer() {
    setInterval(refreshTimer, 1000);
}



function showDrawing(drawing) {
    if(!drawer) {
        // This indicates the clear button was clicked.
        if (drawing[0] == -1) {
            clearCanvas();
        // This indicates the color picker button was selected.
        } else {
            // Colors that begin with '0' will cause an issue where the int will convert to an invalid Hex Color code.
            // This is because parsing it to an 'Integer' will remove the '0's in front.
            // To solve this, we find the missing number of '0's based on the length of the String and add the needed.
            var intToHex = drawing[4].toString(16);
            if(intToHex.length < 6){
                var sArr = Array(7-intToHex.length).join("0");
                intToHex = "#" + sArr + intToHex;
            } else {
                intToHex = "#" + intToHex;
            }
            clickX.push(drawing[0]);
            clickY.push(drawing[1]);
            clickDrag.push(drawing[2] ? true : false);
            clickSize.push(drawing[3]);
            clickColor.push(intToHex);

        }
    }
}

