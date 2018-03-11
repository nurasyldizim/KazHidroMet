<%-- 
    Document   : qaverage
    Created on : 11.03.2018, 21:42:38
    Author     : Dizim Nurasyl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.List"%>
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
    </body>
</html>
