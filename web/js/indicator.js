/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// JS is for prototype examples only, this will not be in the production code

// Fill range:
// -90, -75, -50, -25, 0, 25, 75, 90
alert("check");
var table = document.getElementById("table3");
var fill = table.rows[2].cells[0].innerHTML;
if(0.005>fill>0)
    fill=-1;
if(0.06>fill>0.05)
    fill=25;
alert(fill);
var meter = document.getElementById("js-meter");

meter.className = meter.className + " fill-" + fill + " fill-lump-" + fill;
alert("OK");