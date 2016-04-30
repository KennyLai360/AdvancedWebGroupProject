<html>
<jsp:include page="../templates/headerTemplate.jsp" />

<body>
    <script type="text/javascript" src="../../js/draw.js"></script>

<div class="container" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-3">
            <div style="border: black 1px solid; height:500px; border-radius: 25px">
                <!--User in game info here-->
            </div>
        </div>

        <div class="col-md-offset-3" id="canvasDiv" style="border: black 1px solid;height:500px; border-radius: 25px">
        </div>

    </div>
        <div class="row" style="padding:10px;">
            <div class="col-md-3" style="border: black 1px solid; height:50px;  border-radius: 25px;">
                <img src="../icons/pencil_btn.png" onClick="pencilButtonClick()" height="45"/>
                <img src="../icons/eraser_btn.png" onClick="eraserButtonClick()" height="45"/>
                <button onclick="clearCanvas()">Clear</button>
                <input type="color" id="colourSelector" onchange="onColourChange(this.value)" value="#000000"/>
                <select>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                </select>
            </div>
            <div class="input-group col-md-9" style="padding:5px;">
            <input type="text" class="form-control" placeholder="Send some message here!">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Send</button>
                    </span>
        </div>
        </div>

</div>

<div class="container">
    <div class="row">
        <jsp:include page="../templates/footerTemplate.jsp" />
    </div>
</div>

<div style="padding: 10px;"></div>

<script type="text/javascript">
    prepareCanvas();
</script>

</body>

</html>

