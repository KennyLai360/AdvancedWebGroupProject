window.onload = function() {
    var roomNumber = document.getElementById('roomNumber');
    var joinRoomButton = document.getElementById('connectLobbyBtn');


}

var path = window.location.pathname;

function scrollToBottomOfChat() {
    var wtf = $('#scrollChat');
    var height = wtf[0].scrollHeight;
    wtf.scrollTop(height);
}

function roomNumberInput() {
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
        document.getElementsByName("joinButton")[0].disabled = true;
        document.getElementsByName("joinButton")[0].style.cursor = "not-allowed";
    } else {
        document.getElementsByName("joinButton")[0].disabled = false;
        document.getElementsByName("joinButton")[0].style.cursor = "hand";
    }
}

