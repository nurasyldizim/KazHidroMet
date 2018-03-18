<%-- 
    Document   : pprognoz
    Created on : 12.03.2018, 22:13:30
    Author     : Dizim Nurasyl
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Pnz"%>
<%@page import="dao.PnzDao"%>
<%@page import="dao.PnzDataDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.PnzData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/datepicker.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.js"></script>
        <script type="text/javascript" src="../js/datepicker.js"></script>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String date = request.getParameter("date");
        %>
        
   <div class="date-picker">
	<div class="input">
            <div class="result">Select Date: <span><%= date %></span></div>
		<button><i class="fa fa-calendar"></i></button>
	</div>
	<div class="calendar"></div>
</div>
    <table width="220" border="1">
        <tr>Расчетная матрица для "P"</tr>
        <tr><th></th><th>Срок</th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
        <%
            PnzDataDao pnzDataDao = new PnzDataDao();               
            PnzDao pnzDao = new PnzDao();
            List<Pnz> list = pnzDao.listPnzs();
            for (Pnz p : list) {   
                ArrayList<PnzData>[] pnzDatalist = pnzDataDao.listPnzDatasToPP(p.getPnzId(),date); 
            for (int i = 0; i<4; i++) {
                    Iterator iterDataList = pnzDatalist[i].iterator();
                    if(pnzDatalist[i].size()!=0){
                    Object[] objData = (Object[]) iterDataList.next();
    %>
        <tr>
            <td><%=p.getPnzName()%></td>
                <%if(i==0){%>
                <td>13:00</td>
                <%}if(i==1){%>
                <td>19:00</td>
                <%}if(i==2){%>
                <td>1:00</td>
                <%}if(i==3){%>
                <td>7:00</td>
                <%}%>
            <td><%=objData[0]%></td>
            <td><%=objData[1]%></td>
            <td><%=objData[2]%></td>
            <td><%=objData[3]%></td>
            <td><%=objData[4]%></td>
            <td><%=objData[5]%></td>
            <td><%=objData[6]%></td>
            <td><%=objData[7]%></td>
            <td><%=objData[8]%></td>
            <td><%=objData[9]%></td>
            <td><%=objData[10]%></td>
            <td><%=objData[11]%></td>
            <td><%=objData[12]%></td>
            <td><%=objData[13]%></td>
            <td><%=objData[14]%></td>
            <td><%=objData[15]%></td>
            <td><%=objData[16]%></td>
                
        </tr>
        <%}}}%>
    </table>
    </body>
</html>
