<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../templates/headerTemplate.jsp"/>

<div class="container" style="padding-top:30px;">
    <div class="row">
        <div style="border: black 1px solid; height:550px; border-radius: 20px;">

            <div class="row">
                <div>
                    <h3 class="text-center">Pictionary!</h3>
                </div>
            </div>

            <div class="row" style="margin:0px;">
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
                        <div id="tableContent" class="table-responsive table-bordered">

                            <table class="table">
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
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr> <tr>
                                <td>uWotm8</td>
                                <td>345</td>
                                <td>1/4</td>
                                <td>12</td>
                                <td>
                                    <button class="form-control btn btn-danger">Join</button>
                                </td>
                            </tr>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>uWotm8</td>
                                    <td>345</td>
                                    <td>1/4</td>
                                    <td>12</td>
                                    <td>
                                        <button class="form-control btn btn-danger">Join</button>
                                    </td>
                                </tr>
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

                <div class="col-md-3">

                    <button type="button" class="btn btn-success form-control" data-toggle="modal"
                            data-target="#createGameModal">
                        Create a room
                    </button>
                </div>


            </div>

        </div>
    </div>
</div>

<jsp:include page="../templates/footerTemplate.jsp"/>
</body>
</html>

<!-- Modal -->
<div class="modal fade" id="createGameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Enter settings for the new room</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8">
                            <span><b>Room Name</b></span>
                            <input id="roomName" type="text" class="form-control" onchange="validateNewRoomSettings()">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-8">
                            <span><b>Rounds</b></span>
                            <select id="rounds" class="input-small form-control" onchange="validateNewRoomSettings()">
                                <option value="" selected="selected">--Select amount of rounds--</option>
                                <option value="4">4 - (one round of drawing each)</option>
                                <option value="8">8 - (two rounds of drawing each)</option>
                                <option value="12">12 - (three rounds of drawing each)</option>
                            </select>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-8">
                            <span><b>Room Password</b></span>
                            <input type="password" class="form-control" placeholder="Leave empty if not required">
                        </div>
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                    <a href="<c:url value='/game' />">
                        <button id="createRoomBtn" class="btn btn-success" disabled="disabled">Create Room</button>
                    </a>
                </div>
        </div>

    </div>
</div>
