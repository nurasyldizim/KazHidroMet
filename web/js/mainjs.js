/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 function calculateQAvg(cell){
    var table = document.getElementById("table"), sumVal = 0, rowCount = table.rows.length - 2;
        for(var i = 1; i < table.rows.length-1; i++){
            sumVal = sumVal + parseFloat(table.rows[i].cells[cell].innerHTML);
        }
        if(isNaN(parseFloat(sumVal / rowCount))){
            document.getElementById(cell+"id").innerHTML = "";
        }else{
            document.getElementById(cell+"id").innerHTML = parseFloat(sumVal / rowCount);
        }
 }

function calculateAvgAll(cell){
    var table = document.getElementById("table"), sumVal = 0, rowCount = table.rows.length - 2;
        for(var i = 1; i < table.rows.length-1; i++){
            sumVal = sumVal + parseFloat(table.rows[i].cells[cell].innerHTML);
        }
        if(isNaN(parseFloat(sumVal / rowCount))){
            document.getElementById(cell+"id").innerHTML = "";
        }else{
            document.getElementById(cell+"id").innerHTML = parseFloat(sumVal / rowCount);
        }
 }

 function calculateAvg(cell, pnz){
    var table = document.getElementById("table"+pnz), sumVal = 0, rowCount = table.rows.length - 2;
        for(var i = 1; i < table.rows.length-1; i++){
            sumVal = sumVal + parseFloat(table.rows[i].cells[cell].innerHTML);
        }
        if(isNaN(parseFloat(sumVal / rowCount))){
            document.getElementById(cell+"id"+pnz).innerHTML = "";
        }else{
            document.getElementById(cell+"id"+pnz).innerHTML = parseFloat(sumVal / rowCount);
        }
 }
 
function refreshFunction() {
    var pnzList = document.getElementById("pnzListId");
    var pnzId = pnzList.options[pnzList.selectedIndex].value;
    var pnzName = encodeURIComponent(pnzList.options[pnzList.selectedIndex].text);
    location.href = "pnzdata.jsp?pnzId=" + pnzId +"&pnzName=" + pnzName + "&month=1";
    }

function refreshFunctionMonth() {
    var monthList = document.getElementById("monthListId");
    var month = monthList.options[monthList.selectedIndex].value;
    location.href = "qaverage.jsp?month="+month;
    }

function getEditConfirmation(id){
    var retVal = confirm("Вы действительно хотите изменить этот запись?");
    if( retVal == true ){
        var f=document.frm;
         f.method="post";
         f.action='../PnzDataController?id='+id;
         f.submit();
       return true;
    }
    else{
       return false;
    }
 }
 
 function getDeleteConfirmation(id){
    var retVal = confirm("Вы действительно хотите удалить этот запись?");
    if( retVal == true ){
         var f=document.frm;
         f.method="post";
         f.action='../PnzDataController?id='+id;
         f.submit();
       return true;
    }
    else{
       return false;
    }
 }
 
 
 
