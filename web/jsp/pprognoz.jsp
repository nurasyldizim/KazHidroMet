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
        <script type="text/javascript" src="../js/mainjs.js"></script>
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
                <table id="table" width="220" border="1">
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
            <td><%=objData[16]%></td>
                
        </tr>
        <%}}}%>
        <tr>
                <td></td>
                <td>макс</td>
                <td id="2max"><script>calculateQMaxToP(2);</script></td>
                <td id="3max"><script>calculateQMaxToP(3);</script></td>
                <td id="4max"><script>calculateQMaxToP(4);</script></td>
                <td id="5max"><script>calculateQMaxToP(5);</script></td>
                <td id="6max"><script>calculateQMaxToP(6);</script></td>
                <td id="7max"><script>calculateQMaxToP(7);</script></td>
                <td id="8max"><script>calculateQMaxToP(8);</script></td>
                <td id="9max"><script>calculateQMaxToP(9);</script></td>
                <td id="10max"><script>calculateQMaxToP(10);</script></td>
                <td id="11max"><script>calculateQMaxToP(11);</script></td>
                <td id="12max"><script>calculateQMaxToP(12);</script></td>
                <td id="13max"><script>calculateQMaxToP(13);</script></td>
                <td id="14max"><script>calculateQMaxToP(14);</script></td>
                <td id="15max"><script>calculateQMaxToP(15);</script></td>
                <td id="16max"><script>calculateQMaxToP(16);</script></td>
                <td id="17max"><script>calculateQMaxToP(17);</script></td>
                <td id="18max"><script>calculateQMaxToP(18);</script></td> 
                <td id="19max"><script>calculateQMaxToP(18);</script></td> 
                <td id="19max"><script>calculateQMaxToP(19);</script></td> 
            </tr>
            <tr>
                <td></td>
                <td>мин</td>
                <td id="2min"><script>calculateQMinToP(2);</script></td>
                <td id="3min"><script>calculateQMinToP(3);</script></td>
                <td id="4min"><script>calculateQMinToP(4);</script></td>
                <td id="5min"><script>calculateQMinToP(5);</script></td>
                <td id="6min"><script>calculateQMinToP(6);</script></td>
                <td id="7min"><script>calculateQMinToP(7);</script></td>
                <td id="8min"><script>calculateQMinToP(8);</script></td>
                <td id="9min"><script>calculateQMinToP(9);</script></td>
                <td id="10min"><script>calculateQMinToP(10);</script></td>
                <td id="11min"><script>calculateQMinToP(11);</script></td>
                <td id="12min"><script>calculateQMinToP(12);</script></td>
                <td id="13min"><script>calculateQMinToP(13);</script></td>
                <td id="14min"><script>calculateQMinToP(14);</script></td>
                <td id="15min"><script>calculateQMinToP(15);</script></td>
                <td id="16min"><script>calculateQMinToP(16);</script></td>
                <td id="17min"><script>calculateQMinToP(17);</script></td>
                <td id="18min"><script>calculateQMinToP(18);</script></td> 
                <td id="19min"><script>calculateQMinToP(18);</script></td> 
                <td id="19min"><script>calculateQMinToP(19);</script></td> 
            </tr>
        <tr>
                <td></td>
                <td>ср</td>
                <td id="2id"><script>calculateQAvgToP(2);</script></td>
                <td id="3id"><script>calculateQAvgToP(3);</script></td>
                <td id="4id"><script>calculateQAvgToP(4);</script></td>
                <td id="5id"><script>calculateQAvgToP(5);</script></td>
                <td id="6id"><script>calculateQAvgToP(6);</script></td>
                <td id="7id"><script>calculateQAvgToP(7);</script></td>
                <td id="8id"><script>calculateQAvgToP(8);</script></td>
                <td id="9id"><script>calculateQAvgToP(9);</script></td>
                <td id="10id"><script>calculateQAvgToP(10);</script></td>
                <td id="11id"><script>calculateQAvgToP(11);</script></td>
                <td id="12id"><script>calculateQAvgToP(12);</script></td>
                <td id="13id"><script>calculateQAvgToP(13);</script></td>
                <td id="14id"><script>calculateQAvgToP(14);</script></td>
                <td id="15id"><script>calculateQAvgToP(15);</script></td>
                <td id="16id"><script>calculateQAvgToP(16);</script></td>
                <td id="17id"><script>calculateQAvgToP(17);</script></td>
                <td id="18id"><script>calculateQAvgToP(18);</script></td> 
                <td id="19id"><script>calculateQAvgToP(18);</script></td> 
                <td id="19id"><script>calculateQAvgToP(19);</script></td> 
            </tr>
            
    </table>
    </body>
</html>
