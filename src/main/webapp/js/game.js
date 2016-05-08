var path = window.location.pathname;
var roomName = document.getElementById("roomName");

/**
 * Function used for chat
 */
function scrollToBottomOfChat() {
    var wtf = $('#scrollChat');
    var height = chat[0].scrollHeight;
    chat.scrollTop(height);
    sendMessage();
    $('#messagebox').val("");
}

/**
 * Function used to validate the modal when the user enters something. Enables the create room button depending on if
 * both fields are filled in.
 */
function validateNewRoomSettings() {
    var createRoomBtn = document.getElementById("createRoomBtn");
    var rounds = document.getElementById("rounds");
    var roomName = document.getElementById("roomName");
    console.log(roomName.value);
    console.log(rounds.value);
    if (roomName.value === '' || rounds.value === '') {
        document.getElementById("createRoomBtn").disabled = true;
    } else {
        document.getElementById("createRoomBtn").disabled = false;
    }
}

function doSomething(value) {
    console.log("HELLO: " + value);
}

