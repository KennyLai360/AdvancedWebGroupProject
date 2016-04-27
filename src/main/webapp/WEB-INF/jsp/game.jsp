<!doctype html>

<jsp:include page="../templates/headerTemplate.jsp" />
<script type="text/javascript" src="../../js/draw.js"></script>
<body>

<div class="container">
<div class="row">
    <div class="col-md-3">
        <h5><b>Users in-game</b></h5>
        <div style="border: black 1px solid; height:250px; border-radius: 25px">
            <ul>
                <li>
                    User1
                </li>
                <li>
                    User2
                </li>
                <li>
                    User3
                </li>
                <li>
                    User4
                </li>
                <li>
                    User5
                </li>
                <li>
                    User6
                </li>
                <li>
                    User7
                </li>
                <li>
                    User8
                </li>
            </ul>
        </div>
        <h5><b>Chat</b></h5>
        <div style="border: black 1px solid; height:250px; border-radius: 25px">
            <div style="padding:5px;">
                <p>[15:13:42] Doge</p>
                <p>[15:13:45] Bag</p>
                <p>[15:13:56] Bob</p>
                <p>[15:13:59] Cat</p>
                <p>[15:14:01] wat</p>

            </div>
        </div>
    </div>
    <div class="col-md-7">
        <h5><b>XXXXX is drawing...</b></h5>
        <canvas style="border: 1px solid; border-radius:25px;" height="500" width="650" id="drawing-canvas"></canvas>
        <div class="input-group" style="padding-top:10px">
            <input type="text" class="form-control" placeholder="Send some message here!">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Send</button>
                    </span>
        </div>
    </div>
    <div class="col-md-2">
        <h5><b>Draw settings</b></h5>
            <%--<button id="drawing-mode" class="btn btn-info">Enter drawing mode</button>--%>
            <div style="display: none;" id="drawing-mode-options">
                <%--<label for="drawing-mode-selector">Mode:</label>--%>
                <%--<select id="drawing-mode-selector">--%>
                    <%--<option>Pencil</option>--%>
                    <%--<option>Circle</option>--%>
                    <%--<option>Spray</option>--%>
                    <%--<option>Pattern</option>--%>

                    <%--<option>hline</option>--%>
                    <%--<option>vline</option>--%>
                    <%--<option>square</option>--%>
                    <%--<option>diamond</option>--%>
                <%--</select><br>--%>
                <label for="drawing-line-width">Line width:</label>
                <input type="range" value="10" min="0" max="150" id="drawing-line-width"><br>
                <label for="drawing-color">Line color:</label>
                <input type="color" value="#000000" id="drawing-color"><br>
            </div>
    </div>

</div>
</div>

</body>

</html>

