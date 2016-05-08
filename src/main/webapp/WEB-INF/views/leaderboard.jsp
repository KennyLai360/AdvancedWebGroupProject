<jsp:include page="../templates/gameHeaderTemplate.jsp"/>

<div class="container preventSelection" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-12">
            <div style="border: black 1px solid; height:500px; border-radius: 20px;">
                <div class="row">
                    <div class="text-center col-md-12">
                        <h4>Leaderboards</h4>
                        <hr>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div id="joinGameLobbyTable" class="table-responsive table-bordered">

                            <table class="table" style="padding-left:10px; padding-right:10px;">
                                <thead>
                                <tr>
                                    <th>Room Name</th>
                                    <th>Room Number</th>
                                    <th>Players</th>
                                    <th>Rounds</th>
                                    <th>Join?</th>
                                </tr>
                                </thead>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>

                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../templates/footerTemplate.jsp"/>

</body>
</html>



