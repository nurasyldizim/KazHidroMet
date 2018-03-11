<%-- 
    Document   : datamonth
    Created on : 07.03.2018, 22:07:55
    Author     : Dizim Nurasyl
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
        <script type="text/javascript" src="../js/mainjs.js"></script>
        <title>Расчеты</title>
        
    </head>
    <body>
      <ul>
               <li><a href="qaverage.jsp?month=1">Прогноз q ср</a></li>
               <li><a href="datamonth.jsp?month=1&name=<%=URLEncoder.encode("Январь", "UTF-8")%>">Январь</a></li>
               <li><a href="datamonth.jsp?month=2&name=<%=URLEncoder.encode("Февраль", "UTF-8")%>">Февраль</a></li>
               <li><a href="datamonth.jsp?month=3&name=<%=URLEncoder.encode("Март", "UTF-8")%>">Март</a></li>
               <li><a href="datamonth.jsp?month=4&name=<%=URLEncoder.encode("Апрель", "UTF-8")%>">Апрель</a></li>
               <li><a href="datamonth.jsp?month=5&name=<%=URLEncoder.encode("Май", "UTF-8")%>">Май</a></li>
               <li><a href="datamonth.jsp?month=6&name=<%=URLEncoder.encode("Июнь", "UTF-8")%>">Июнь</a></li>
               <li><a href="datamonth.jsp?month=7&name=<%=URLEncoder.encode("Июль", "UTF-8")%>">Июль</a></li>
               <li><a href="datamonth.jsp?month=8&name=<%=URLEncoder.encode("Август", "UTF-8")%>">Август</a></li>
               <li><a href="datamonth.jsp?month=9&name=<%=URLEncoder.encode("Сентябрь", "UTF-8")%>">Сентябрь</a></li>
               <li><a href="datamonth.jsp?month=10&name=<%=URLEncoder.encode("Октябрь", "UTF-8")%>">Октябрь</a></li>
               <li><a href="datamonth.jsp?month=11&name=<%=URLEncoder.encode("Ноябрь", "UTF-8")%>">Ноябрь</a></li>
               <li><a href="datamonth.jsp?month=12&name=<%=URLEncoder.encode("Декабрь", "UTF-8")%>">Декабрь</a></li>
           </ul>
        <%  
            request.setCharacterEncoding("UTF-8");
            String month = request.getParameter("month");
            String monthName = request.getParameter("name");
            PnzDataDao pnzDataDao = new PnzDataDao();
            PnzDao pnzDao = new PnzDao();
            List<Pnz> list = pnzDao.listPnzs();
            for (Pnz p : list) {
                String pnzName = p.getPnzName();
        %>
    <center><h3><%=monthName%></h3></center>
    <table id="table<%=pnzName%>" width="220" border="1">
            <tr><th><%=pnzName%></th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
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
                <td id="1id<%=pnzName%>"><script>calculateAvg(1, "<%=pnzName%>");</script></td>
                <td id="2id<%=pnzName%>"><script>calculateAvg(2, "<%=pnzName%>");</script></td>
                <td id="3id<%=pnzName%>"><script>calculateAvg(3, "<%=pnzName%>");</script></td>
                <td id="4id<%=pnzName%>"><script>calculateAvg(4, "<%=pnzName%>");</script></td>
                <td id="5id<%=pnzName%>"><script>calculateAvg(5, "<%=pnzName%>");</script></td>
                <td id="6id<%=pnzName%>"><script>calculateAvg(6, "<%=pnzName%>");</script></td>
                <td id="7id<%=pnzName%>"><script>calculateAvg(7, "<%=pnzName%>");</script></td>
                <td id="8id<%=pnzName%>"><script>calculateAvg(8, "<%=pnzName%>");</script></td>
                <td id="9id<%=pnzName%>"><script>calculateAvg(9, "<%=pnzName%>");</script></td>
                <td id="10id<%=pnzName%>"><script>calculateAvg(10, "<%=pnzName%>");</script></td>
                <td id="11id<%=pnzName%>"><script>calculateAvg(11, "<%=pnzName%>");</script></td>
                <td id="12id<%=pnzName%>"><script>calculateAvg(12, "<%=pnzName%>");</script></td>
                <td id="13id<%=pnzName%>"><script>calculateAvg(13, "<%=pnzName%>");</script></td>
                <td id="14id<%=pnzName%>"><script>calculateAvg(14, "<%=pnzName%>");</script></td>
                <td id="15id<%=pnzName%>"><script>calculateAvg(15, "<%=pnzName%>");</script></td>
                <td id="16id<%=pnzName%>"><script>calculateAvg(16, "<%=pnzName%>");</script></td>
                <td id="17id<%=pnzName%>"><script>calculateAvg(17, "<%=pnzName%>");</script></td>
                 <td id="18id<%=pnzName%>"><script>calculateAvg(18, "<%=pnzName%>");</script></td> 
            </tr>
            </table>
        <%  }%>
    
    <%  
            PnzDataDao pnzDataDaoAll = new PnzDataDao();
        %>
    <center><h3>Среднее по всем ПНЗ за <%=monthName%></h3></center>
    <table id="table" width="220" border="1">
            <tr><th></th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
            <%
                for(int i = 2012; i<2026; i++){
                    List pnzAvglistByYear =  pnzDataDaoAll.listAllPnzDatasByMonth(Integer.parseInt(month), i);
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
                <td id="1id"><script>calculateAvgAll(1);</script></td>
                <td id="2id"><script>calculateAvgAll(2);</script></td>
                <td id="3id"><script>calculateAvgAll(3);</script></td>
                <td id="4id"><script>calculateAvgAll(4);</script></td>
                <td id="5id"><script>calculateAvgAll(5);</script></td>
                <td id="6id"><script>calculateAvgAll(6);</script></td>
                <td id="7id"><script>calculateAvgAll(7);</script></td>
                <td id="8id"><script>calculateAvgAll(8);</script></td>
                <td id="9id"><script>calculateAvgAll(9);</script></td>
                <td id="10id"><script>calculateAvgAll(10);</script></td>
                <td id="11id"><script>calculateAvgAll(11);</script></td>
                <td id="12id"><script>calculateAvgAll(12);</script></td>
                <td id="13id"><script>calculateAvgAll(13);</script></td>
                <td id="14id"><script>calculateAvgAll(14);</script></td>
                <td id="15id"><script>calculateAvgAll(15);</script></td>
                <td id="16id"><script>calculateAvgAll(16);</script></td>
                <td id="17id"><script>calculateAvgAll(17);</script></td>    
                <td id="18id"><script>calculateAvgAll(18);</script></td> 
            </tr>
            </table>

    </body>
</html>
