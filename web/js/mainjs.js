/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function refreshFunction() {
    var pnzList = document.getElementById("pnzListId");
    var pnzId = pnzList.options[pnzList.selectedIndex].value;
    var pnzName = encodeURIComponent(pnzList.options[pnzList.selectedIndex].text);
    location.href = "pnzdata.jsp?pnzId=" + pnzId +"&pnzName=" + pnzName + "&month=1";
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
 
 function calculateAvg(cell){
             alert("fasdfds");
    var table = document.getElementById("table"), sumVal = 0, rowCount = table.rows.length - 2;// minus the header  
        for(var i = 1; i < table.rows.length-1; i++){
            sumVal = sumVal + parseFloat(table.rows[i].cells[cell].innerHTML);
        }
        document.getElementById("ПНЗ1id"+cell).innerHTML = parseFloat(sumVal / rowCount);
 }
 
 function calculatAaa(cell){
     alert("fasdfds");
    var table = document.getElementById("table"), sumVal = 0, rowCount = table.rows.length - 2;// minus the header  
        for(var i = 1; i < table.rows.length-1; i++){
            sumVal = sumVal + parseFloat(table.rows[i].cells[cell].innerHTML);
        }
        document.getElementById("ПНЗ1id"+cell).innerHTML = parseFloat(sumVal / rowCount);
 }