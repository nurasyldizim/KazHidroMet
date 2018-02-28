/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function refreshFunction() {
    var pnzList = document.getElementById("pnzList");
    location.href ="pnzdata.jsp?pnzId=" + pnzList.options[pnzList.selectedIndex].value +"&pnzName=" + pnzList.options[pnzList.selectedIndex].text;
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