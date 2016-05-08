window.onload = function () {
    var roomNumber = document.getElementById('roomNumber');
    var joinRoomButton = document.getElementById('connectLobbyBtn');
}

var path = window.location.pathname;

function scrollToBottomOfChat() {
    var wtf = $('#scrollChat');
    var height = wtf[0].scrollHeight;
    wtf.scrollTop(height);
    sendMessage("testroom");
    $('#messagebox').val("");
}

function roomNumberInputValidation() {
    if (roomNumber.value < 1) {
        roomNumber.value = 0;
        document.getElementsByName("connectLobbyBtn")[0].disabled = true;
    } else {
        console.log(path);
        document.getElementsByName("connectLobbyBtn")[0].disabled = false;
    }
}


function gameMenuButtonClick() {
    if (path === "/game") {
        document.getElementById("gameMenuBtn").className += " disabled";
        document.getElementById("gameMenuBtn").style.cursor = "not-allowed";
    } else {
        document.getElementById("gameMenuBtn").className.replace(" disabled", "");
        document.getElementById("gameMenuBtn").style.cursor = "hand";
    }
}

function userList(userObj) {
    var newRoomList = userObj;
}
