var path = window.location.pathname;
var roomName = document.getElementById("roomName");

function scrollToBottomOfChat() {
    var wtf = $('#scrollChat');
    var height = wtf[0].scrollHeight;
    wtf.scrollTop(height);
    sendMessage();
    $('#messagebox').val("");
}

/**
 * Function used to validate the modal when
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

