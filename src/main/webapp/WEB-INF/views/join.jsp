<jsp:include page="../templates/headerTemplate.jsp"/>

<div class="container" style="padding-top:30px;">
    <div class="row">
        <div style="border: black 1px solid; height:550px; border-radius: 20px;">

            <div class="row">
                <div>
                    <h3 class="text-center">Pictionary!</h3>
                </div>
            </div>

            <div class="row">
                <hr>
            </div>

            <div class="row">
                <div class="col-md-9">
                    <h4 class="text-center"><u>Current Lobbies</u></h4>
                </div>
            </div>

            <div class="row" style="padding:10px;">
                <div class="col-md-9">
                    <div style="padding:10px;">
                        <div id="joinGameLobbyTable" class="table-responsive table-bordered">

                            <table class="table" style="table-layout:fixed;width:100%;">
                                <thead>
                                <tr>
                                    <th>Room Number</th>
                                    <th>Players</th>
                                    <th>Join?</th>
                                </tr>
                                </thead>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>654</td>
                                    <td>3/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                                <tr>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td><button class="form-control btn btn-danger">Join</button></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <a href="<c:url value=''/game' />"><button class="form-control btn btn-success">Create a room</button></a>
                </div>

            </div>

        </div>
    </div>
</div>

<jsp:include page="../templates/footerTemplate.jsp"/>
</body>
</html>
