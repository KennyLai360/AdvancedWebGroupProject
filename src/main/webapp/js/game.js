var path = window.location.pathname;
var roomName = document.getElementById("roomName");

/**
 * Function used for chat
 */
function scrollToBottomOfChat() {
    sendMessage();
    $('#messagebox').val("");
}

$(document).ready(function(){
    $('#messagebox').keyup(function(e){
        if(e.keyCode==13 && document.getElementById("messagebox").value !== '' && document.getElementById("messagebox").disabled === false)
            scrollToBottomOfChat();
    });
});

/**
 * Function used to validate the modal when the user enters something. Enables the create room button depending on if
 * both fields are filled in.
 */
function validateNewRoomSettings() {
    var createRoomBtn = document.getElementById("createRoomBtn");
    var rounds = document.getElementById("roundBox");
    var roomName = document.getElementById("rnBox");
    console.log(roomName.value);
    console.log(rounds.value);
    if (roomName.value === '' || rounds.value === '') {
        document.getElementById("createRoomBtn").disabled = true;
    } else {
        document.getElementById("createRoomBtn").disabled = false;
    }
}

function deleteUser(value) {
    window.location.href = "/admin/deleteUser?id=" + value;
}

function userList(userObj) {
    var newRoomList = userObj;
}
