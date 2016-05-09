function findCorrectGuesser() {
    var x = document.getElementById("myList").lastChild.innerHTML;
    var y;
    for(user in usersInRoom) {
        y = x.substring(0, x.indexOf(user))
        if (user.name === y) {
            console.log("hello123");
        }
    }
}

