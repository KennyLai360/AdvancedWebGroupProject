<!doctype html>

<jsp:include page="../templates/headerTemplate.jsp" />

<body>
    <script>
        var canvasWidth = 500;
        var canvasHeight = 500;
        function prepareCanvas() {
            var canvasDiv = document.getElementById('canvasDiv');
            canvas = document.createElement('canvas');
            canvas.setAttribute('width', canvasWidth);
            canvas.setAttribute('height', canvasHeight);
            canvas.setAttribute('id', 'canvas');
            canvasDiv.appendChild(canvas);
            if(typeof G_vmlCanvasManager != 'undefined') {
                canvas = G_vmlCanvasManager.initElement(canvas);
            }
            context = canvas.getContext("2d");

            $('#canvas').mousedown(function(e){
                var mouseX = e.pageX - this.offsetLeft;
                var mouseY = e.pageY - this.offsetTop;

                paint = true;
                addClick(e.pageX - this.offsetLeft, e.pageY - this.offsetTop);
                redraw();
            });

            $('#canvas').mousemove(function(e){
                if(paint){
                    addClick(e.pageX - this.offsetLeft, e.pageY - this.offsetTop, true);
                    redraw();
                }
            });

            $('#canvas').mouseup(function(e){
                paint = false;
            });

            $('#canvas').mouseleave(function(e){
                paint = false;
            });

            var clickX = new Array();
            var clickY = new Array();
            var clickDrag = new Array();
            var paint;

            function addClick(x, y, dragging)
            {
                clickX.push(x);
                clickY.push(y);
                clickDrag.push(dragging);
            }

            function redraw(){
                context.clearRect(0, 0, context.canvas.width, context.canvas.height); // Clears the canvas

                context.strokeStyle = "#000000";
                context.lineJoin = "round";
                context.lineWidth = 5;

                for(var i=0; i < clickX.length; i++) {
                    context.beginPath();
                    if(clickDrag[i] && i){
                        context.moveTo(clickX[i-1], clickY[i-1]);
                    }
                    else{
                        context.moveTo(clickX[i]-1, clickY[i]);
                    }
                    context.lineTo(clickX[i], clickY[i]);
                    context.closePath();
                    context.stroke();
                }
            }
        }
    </script>

    <div class="container" style="padding-top:30px;">
        <div class="row">
            <div class="col-md-3">
                <div style="border: black 1px solid; height:500px; border-radius: 25px">
                    <!--User in game info here-->
                </div>
                <div style="border: black 1px solid; height:50px;  border-radius: 25px">
                    <!-Some other info icon etc etc here?-->
                </div>
            </div>

            <div class="col-md-9">
                <div id="canvasDiv" style="border: black 1px solid; height:500px; border-radius: 25px;">
                </div>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Send some message here!">
                    <span class="input-group-btn">
                        <button class="btn btn-secondary" type="button">Send</button>
                    </span>
                </div>
            </div>

            </div>
        <div class="row">
        <jsp:include page="../templates/footerTemplate.jsp" />
        </div>
        </div>

<script type="text/javascript">
    prepareCanvas();
</script>

</body>

</html>

