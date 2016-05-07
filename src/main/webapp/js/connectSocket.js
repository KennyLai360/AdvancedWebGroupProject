var stompClient = null;
var drawer = 0;
function setConnected(connected) {
    document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
}

function drawConnect() {
    var socket = new SockJS('/draw');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/drawings', function(drawing){
            showDrawing(JSON.parse(drawing.body).content);
        });
        stompClient.subscribe('/topic/greetings', function(greeting){
            showGreeting(JSON.parse(greeting.body).content);
        });
    });
}

function drawDisconnect() {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    setConnected(false);
    sendDisconnection();
    console.log("Disconnected");
}

function sendDisconnection() {
    var msg = "test has disconnected.";
    stompClient.send("/app/chat", {}, JSON.stringify({ 'message': msg }));
}

function sendMessage() {
    var msg = document.getElementById('messagebox').value;
    msg = "test: " + msg;
    stompClient.send("/app/chat", {}, JSON.stringify({ 'message': msg }));
}

function sendDrawing(x,y,drag,size,color) {
    var hextoInt;
    if(color != null) {
        hextoInt = color.substring(1);
        hextoInt = parseInt(hextoInt, 16);
    }
    var arr = [x,y,drag? 1:0,size,hextoInt];
    stompClient.send("/app/draw", {}, JSON.stringify({'drawing': arr}));
}

function showGreeting(message) {
    // var response = document.getElementById('response');
    // var p = document.createElement('p');
    // p.style.wordWrap = 'break-word';
    // p.appendChild(document.createTextNode(message));
    // response.appendChild(p);
    $('#scrollChat').append('<p>' + message + '</p>');
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

