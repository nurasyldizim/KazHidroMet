<%-- 
    Document   : datamonth
    Created on : 07.03.2018, 22:07:55
    Author     : user-22112
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Pnz"%>
<%@page import="dao.PnzDao"%>
<%@page import="dao.PnzDataDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <title>Расчеты</title>
        
    </head>
    <body>
      <ul>
               <li><a href="datamonth.jsp?month=1&name=<%=URLEncoder.encode("Январь", "UTF-16")%>">Январь</a></li>
               <li><a href="datamonth.jsp?month=2&name=<%=URLEncoder.encode("Февраль", "UTF-16")%>">Февраль</a></li>
               <li><a href="datamonth.jsp?month=3&name=<%=URLEncoder.encode("Март", "UTF-16")%>">Март</a></li>
               <li><a href="datamonth.jsp?month=4&name=<%=URLEncoder.encode("Апрель", "UTF-16")%>">Апрель</a></li>
               <li><a href="datamonth.jsp?month=5&name=<%=URLEncoder.encode("Май", "UTF-16")%>">Май</a></li>
               <li><a href="datamonth.jsp?month=6&name=<%=URLEncoder.encode("Июнь", "UTF-16")%>">Июнь</a></li>
               <li><a href="datamonth.jsp?month=7&name=<%=URLEncoder.encode("Июль", "UTF-16")%>">Июль</a></li>
               <li><a href="datamonth.jsp?month=8&name=<%=URLEncoder.encode("Август", "UTF-16")%>">Август</a></li>
               <li><a href="datamonth.jsp?month=9&name=<%=URLEncoder.encode("Сентябрь", "UTF-16")%>">Сентябрь</a></li>
               <li><a href="datamonth.jsp?month=10&name=<%=URLEncoder.encode("Октябрь", "UTF-16")%>">Октябрь</a></li>
               <li><a href="datamonth.jsp?month=11&name=<%=URLEncoder.encode("Ноябрь", "UTF-16")%>">Ноябрь</a></li>
               <li><a href="datamonth.jsp?month=12&name=<%=URLEncoder.encode("Декабрь", "UTF-16")%>">Декабрь</a></li>
           </ul>
        <%  
            String month = request.getParameter("month");
            String monthName = request.getParameter("name");
            PnzDataDao pnzDataDao = new PnzDataDao();
            PnzDao pnzDao = new PnzDao();
            List<Pnz> list = pnzDao.listPnzs();
            for (Pnz p : list) {
        %>
    <center><h3><%=URLDecoder.decode(monthName, "UTF-16")%>></h3></center>
        <table width="220" border="1">
            <tr><th><%=p.getPnzName()%></th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
            <%
                for(int i = 2012; i<2026; i++){
                    List pnzAvglistByYear =  pnzDataDao.listPnzDatasByMonth(p.getPnzId(),Integer.parseInt(month), i);
                    Iterator iterAvgListByYear = pnzAvglistByYear.iterator();
                    Object[] objAvgByYear = (Object[]) iterAvgListByYear.next();
                    if (objAvgByYear[0]!=null){
            %>
            <tr>
                <td><%=i%></td>
                <td><%=objAvgByYear[0]%></td>
                <td><%=objAvgByYear[1]%></td>
                <td><%=objAvgByYear[2]%></td>
                <td><%=objAvgByYear[3]%></td>
                <td><%=objAvgByYear[4]%></td>
                <td><%=objAvgByYear[5]%></td>
                <td><%=objAvgByYear[6]%></td>
                <td><%=objAvgByYear[7]%></td>
                <td><%=objAvgByYear[8]%></td>
                <td><%=objAvgByYear[9]%></td>
                <td><%=objAvgByYear[10]%></td>
                <td><%=objAvgByYear[11]%></td>
                <td><%=objAvgByYear[12]%></td>
                <td><%=objAvgByYear[13]%></td>
                <td><%=objAvgByYear[14]%></td>
                <td><%=objAvgByYear[15]%></td>
                <td><%=objAvgByYear[16]%></td>
                <td><%=objAvgByYear[17]%></td>  
            </tr>
            <%}}%>
            <tr>
                <td>q ср.м</td>
                  
            </tr>
            </table>
        
        <%  }%>
    </body>
</html>
