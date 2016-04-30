var PENCIL_POINTER = "url('../icons/pencil_cur.png'), default";
var ERASER_POINTER = "url('../icons/eraser_cur.png'), default";
var BLACK_COLOUR = "#000000";
var WHITE_COLOUR = "#FFFFFF";

var colourOfBrush = BLACK_COLOUR;
var storePreviousColourBrush;

var clickX = new Array();
var clickY = new Array();
var clickDrag = new Array();
var paint;
var clickColor = new Array();

window.onload = function() {
var colourSelector = document.getElementById('colourSelector');
colourSelector.value = BLACK_COLOUR;
};

/**
 * Executed when the pencil button in the tool box is clicked.
 * Changes the cursor to the pencil, then change the colour of the brush back to what it was originally
 * if the eraser was used before this was clicked.
 */
function pencilButtonClick() {
    changeCursor(PENCIL_POINTER);
    if (canvas.style.cursor !== PENCIL_POINTER) {
        colourSelector.value = storePreviousColourBrush;
    }
};

/**
 * Executed when the eraser button is pressed in the tool box.
 * Changes the cursor to the eraser pic, then stores the current colour before it is turned to white (for erasing purposes)
 * so when the user presses the pencil button it will return back and load up the previous colour.
 */
function eraserButtonClick() {
    changeCursor(ERASER_POINTER);
    storePreviousColourBrush = colourSelector.value;
    colourSelector.value = WHITE_COLOUR;
}

/**
 * When the colour picker has been changed this function executes.
 * @param colourToChangeTo - the hex colour which has been selected
 */
function onColourChange(colourToChangeTo) {
    changeCursor(PENCIL_POINTER);
    storePreviousColourBrush =  colourSelector.value;
    colourSelector.value = colourToChangeTo;
}

/**
 * Function just to change the cursor directly from css.
 * @param a - a string which contains the URL for the image and the settings of property of icon..
 */
function changeCursor(cursor) {
    canvas.style.cursor = cursor;
};

/**
 * Basically clearing the canvas
 * Essentially this clears our the array coordinates of the drawings and selected colours!
 */
function clearCanvas() {
    clickX = [];
    clickY = [];
    clickDrag = [];
    clickColor = [];
    context.clearRect(0, 0, $("#canvasDiv").width(), $("#canvasDiv").height());
}

/**
 * Function that creates a canvas then attached to the property that has the id of "canvasDiv"
 * NOTE: Canvas is available in HTML5 but creating canvas manually in javascript ensures back-compatibility.
 */
function prepareCanvas() {
    var canvasDiv = document.getElementById('canvasDiv');
    canvas = document.createElement('canvas');
    canvas.setAttribute('width', $("#canvasDiv").width());
    canvas.setAttribute('height', $("#canvasDiv").height());
    canvas.setAttribute('id', 'canvas');
    changeCursor(PENCIL_POINTER);
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

    function addClick(x, y, dragging)
    {
        clickX.push(x);
        clickY.push(y);
        clickDrag.push(dragging);
        clickColor.push(colourSelector.value);
    }

    function redraw() {
        context.strokeStyle = colourSelector.value;
        context.lineJoin = "round";
        context.lineWidth = 5;

        for(var i=0; i < clickX.length; i++)
        {
            context.beginPath();
            if(clickDrag[i] && i){
                context.moveTo(clickX[i-1], clickY[i-1]);
            }else{
                context.moveTo(clickX[i]-1, clickY[i]);
            }
            context.lineTo(clickX[i], clickY[i]);
            context.closePath();
            context.strokeStyle = clickColor[i];
            context.stroke();
        }
    }
}
