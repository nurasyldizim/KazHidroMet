<%-- 
    Document   : qaverage
    Created on : 11.03.2018, 21:42:38
    Author     : Dizim Nurasyl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.PnzData"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="model.Pnz"%>
<%@page import="dao.PnzDao"%>
<%@page import="dao.PnzDataDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/mainjs.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <%
            request.setCharacterEncoding("UTF-8");
            String month = request.getParameter("month");
            request.setAttribute("monthId", month);
            LinkedHashMap map = new LinkedHashMap();
            map.put("1", "Январь");
            map.put("2", "Февраль");
            map.put("3", "Март");
            map.put("4", "Апрель");
            map.put("5", "Май");
            map.put("6", "Июнь");
            map.put("7", "Июль");
            map.put("8", "Август");
            map.put("9", "Сентябрь");
            map.put("10", "Октябрь");
            map.put("11", "Ноябрь");
            map.put("12", "Декабрь");
    request.setAttribute("MyMap", map);
%>
<select id="monthListId" onchange="refreshFunctionMonth()">
         <c:forEach items="${MyMap}" var="mapItem">
             <option value="${mapItem.key}" ${mapItem.key eq monthId ? "selected": ""}>${mapItem.value}</option>
         </c:forEach>
</select>   

 <table id="table" width="220" border="1">
            <tr><th></th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
<%  
            int monthInt = Integer.parseInt(month);
            Date date = new Date();
            int currentYear = Year.now().getValue();
            int lastYear = Year.now().getValue()-1;
            int monthCurrent = date.getMonth()+1;
            if(monthInt > monthCurrent){
                currentYear = currentYear-1;
                lastYear = lastYear-1;
            }
            PnzDataDao pnzDataDao = new PnzDataDao();
            ArrayList<PnzData>[] qAvglist = pnzDataDao.qAvgPnzDatas(monthInt);
                for (int i = 0; i<4; i++) {
                    Iterator iterQAvgList = qAvglist[i].iterator();
                    Object[] objQAvg = (Object[]) iterQAvgList.next();
            %>
            <tr>
                <c:choose>
                    <c:when test = "${param.month == 1}">
                        <%if(i==0){%>
                        <td><%=map.get("12")%> <%=currentYear-2%></td>
                        <%}if(i==1){%>
                        <td><%=map.get(month)%> <%=currentYear-1%></td>
                        <%}if(i==2){%>
                        <td><%=map.get(String.valueOf(monthInt+1))%> <%=currentYear-1%></td>
                        <%}if(i==3){%>
                        <td><%=map.get("12")%> <%=currentYear-1%></td>
                        <%}%>
                    </c:when>
         
                    <c:when test = "${param.month == 12}">
                       <%if(i==0){%>
                       <td><%=map.get(String.valueOf(monthInt-1))%> <%=currentYear-1%></td>
                       <%}if(i==1){%>
                       <td><%=map.get(month)%> <%=currentYear-1%></td>
                       <%}if(i==2){%>
                       <td><%=map.get("1")%> <%=currentYear%></td>
                       <%}if(i==3){%>
                       <td><%=map.get(String.valueOf(monthInt-1))%> <%=currentYear%></td>
                       <%}%>
                    </c:when>

                    <c:otherwise>
                       <%if(i==0){%>
                       <td><%=map.get(String.valueOf(monthInt-1))%> <%=currentYear-1%></td>
                       <%}if(i==1){%>
                       <td><%=map.get(month)%> <%=currentYear-1%></td>
                       <%}if(i==2){%>
                       <td><%=map.get(String.valueOf(monthInt+1))%> <%=currentYear-1%></td>
                       <%}if(i==3){%>
                       <td><%=map.get(String.valueOf(monthInt-1))%> <%=currentYear%></td>
                       <%}%>
                    </c:otherwise>
                </c:choose>
                <td><%=objQAvg[0]%></td>
                <td><%=objQAvg[1]%></td>
                <td><%=objQAvg[2]%></td>
                <td><%=objQAvg[3]%></td>
                <td><%=objQAvg[4]%></td>
                <td><%=objQAvg[5]%></td>
                <td><%=objQAvg[6]%></td>
                <td><%=objQAvg[7]%></td>
                <td><%=objQAvg[8]%></td>
                <td><%=objQAvg[9]%></td>
                <td><%=objQAvg[10]%></td>
                <td><%=objQAvg[11]%></td>
                <td><%=objQAvg[12]%></td>
                <td><%=objQAvg[13]%></td>
                <td><%=objQAvg[14]%></td>
                <td><%=objQAvg[15]%></td>
                <td><%=objQAvg[16]%></td>
                <td><%=objQAvg[17]%></td>  
            </tr>
     <%  }%>
            <tr>
                <td><%=map.get(month)%><%=currentYear%></td>
                <td id="1id"><script>calculateQAvg(1);</script></td>
                <td id="2id"><script>calculateQAvg(2);</script></td>
                <td id="3id"><script>calculateQAvg(3);</script></td>
                <td id="4id"><script>calculateQAvg(4);</script></td>
                <td id="5id"><script>calculateQAvg(5);</script></td>
                <td id="6id"><script>calculateQAvg(6);</script></td>
                <td id="7id"><script>calculateQAvg(7);</script></td>
                <td id="8id"><script>calculateQAvg(8);</script></td>
                <td id="9id"><script>calculateQAvg(9);</script></td>
                <td id="10id"><script>calculateQAvg(10);</script></td>
                <td id="11id"><script>calculateQAvg(11);</script></td>
                <td id="12id"><script>calculateQAvg(12);</script></td>
                <td id="13id"><script>calculateQAvg(13);</script></td>
                <td id="14id"><script>calculateQAvg(14);</script></td>
                <td id="15id"><script>calculateQAvg(15);</script></td>
                <td id="16id"><script>calculateQAvg(16);</script></td>
                <td id="17id"><script>calculateQAvg(17);</script></td>
                 <td id="18id"><script>calculateQAvg(18);</script></td> 
            </tr>
                
            </table>
    </body>
</html>
