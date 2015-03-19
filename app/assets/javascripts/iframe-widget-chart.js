// canvas support detection
function isCanvasSupported() {
  var elem = document.createElement('canvas');
  return !!(elem.getContext && elem.getContext('2d'));
}

if ( isCanvasSupported() ) {
	// canvas element
	var c = document.getElementById("widget-chart");

	// get percentage
	var percentage = c.getAttribute("data-percentage")

	// set canvas width
	c.width = 150;

	var ctx = c.getContext("2d");

    var x          = Math.floor(c.width / 2); // circle x position
    var y          = Math.floor(c.height / 2) + 1; // circle y position
    var radius     = c.width/ 2.8;   // circle radius
    var startAngle = 1.5*Math.PI;            
    var endAngle = percentage / 100 * 2 * Math.PI + 1.5 * Math.PI;
    var clockwise  = false; // clockwise or anticlockwise

    // background for percentage
    ctx.beginPath();
    ctx.arc(x,y,radius, 0, 2 * Math.PI, clockwise);

    ctx.strokeStyle = "#E9E9E9";
    ctx.lineWidth = 10;

    ctx.stroke();

    // percentage circle
    ctx.beginPath();
    ctx.arc(x,y,radius,startAngle,endAngle, clockwise);

    ctx.lineWidth = 10;
	ctx.strokeStyle = "#00A285";

    ctx.stroke();
    
}