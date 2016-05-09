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
