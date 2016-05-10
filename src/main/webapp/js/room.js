/**
 * Created by Xyline on 09/05/2016.
 */
/*
 Retrieves Global User List.
 A list of all users logged in.
 */
function getUserList(){
    $.ajax({
        url:"/getUserList",
        type:'GET',
        success:function(data) {
            globalUserList = data;
            console.log(data);
            return false;
        }
    });
}

function getUser(){
    $.ajax({
        url:"/getUser",
        type:'GET',
        success:function(data) {
            userData = data;
            return false;
        }
    });
}

// Retrieves the information of rooms using a GET AJAX call.
// This method gets checks if a roomTable already exists or not. (Prevents duplicate table creations).
function getRoom(){
    if($('#roomsTable').length > 0){
        $('#roomsTable').remove();
    }
    $.ajax({
        url:"/getRooms",
        type:'GET',
        success:function(data) {
            availableRooms = data;
            console.log(data);
            callThisOnLoad(data);
            return false;
        }
    });
}


/*
 Removes user from GlobalList.
 Indicating that the user has logged out from the game server.
 */
function resetUser(){
    $.ajax({
        url:"/resetUser",
        type:'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(userData),
        complete:function(data) {
            sendRoomCommand("remove");
            spliceTheArray();
            sendDisconnection(curRoom);
            drawDisconnect(curRoom);
            console.log("Success!!");
            return false;
        }
    });
}
