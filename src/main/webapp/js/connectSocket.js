var stompClient = null;

function setConnected(connected) {
    document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
    document.getElementById('response').innerHTML = '';
}

function messengerConnect() {
    var socket = new SockJS('/chat');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings', function(greeting){
            showGreeting(JSON.parse(greeting.body).content);
        });
    });
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
    });
}

function messengerDisconnect() {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendMessage() {
    var msg = document.getElementById('messagebox').value;
    stompClient.send("/app/chat", {}, JSON.stringify({ 'message': msg }));
}

function sendDrawing() {
    var arr = [clickX,clickY,clickDrag,clickSize];
    stompClient.send("/app/draw", {}, JSON.stringify({ 'drawing':  arr}));
}

function showGreeting(message) {
    var response = document.getElementById('response');
    var p = document.createElement('p');
    p.style.wordWrap = 'break-word';
    p.appendChild(document.createTextNode(message));
    response.appendChild(p);
}

function showDrawing(drawing) {
    clickX.push(drawing[0]);
    clickY.push(drawing[1]);
    clickDrag.push(drawing[2]);
    clickSize.push(drawing[3]);
}

