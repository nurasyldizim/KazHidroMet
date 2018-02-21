<%-- 
    Document   : pnzdata
    Created on : 21.02.2018, 13:37:52
    Author     : Nurasyl Dizim
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.PnzDataDao"%>
<%@page import="model.PnzData"%>
<%@page import="dao.PnzDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Pnz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PNZ Data</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <select id="pnzList" onchange="myFunction()">
        <%
            PnzDataDao pnzDataDao = new PnzDataDao();
            List<PnzData> pnzDatalist =  pnzDataDao.listPnzDatas(1);
                    
                    
            PnzDao pnzDao = new PnzDao();
            List<Pnz> list = pnzDao.listPnzs();
            for (Pnz p : list) {
         %>
          <option value="<%=p.getPnzId()%>"><%=p.getPnzName()%></option>
          <%}%>
        </select>
        <script>
            function myFunction() {
                var pnzList = document.getElementById("pnzList");
                document.getElementById("pnzName").value = pnzList.options[pnzList.selectedIndex].text;
                document.getElementById("pnzId").value = pnzList.options[pnzList.selectedIndex].value;
                List<PnzData> pnzDatalist =  pnzDataDao.listPnzDatas(pnzList.options[pnzList.selectedIndex].value;);
            }
        </script>
    
        <form method="POST" action="../PnzDataController">
            <input type="text" id="pnzName" name="pnzName" value="ПНЗ1"/>
            <input type="text" id="pnzId" name="pnzId" value="1"/>
            <input type="datetime-local" min="2015-01-01 00:00" max="2030-01-01 00:00" step="3600"  name="pnzDateTime" required/>
            <input type="number" name="bsh"/>
            <input type="number" name="ds"/>
            <input type="number" name="sr"/>
            <input type="number" name="ou"/>
            <input type="number" name="do_"/>
            <input type="number" name="oa"/>
            <input type="number" name="ozon"/>
            <input type="number" name="serovodorod"/>
            <input type="number" name="fenol"/>
            <input type="number" name="fv"/>
            <input type="number" name="hlor"/>
            <input type="number" name="hv"/>
            <input type="number" name="ammiak"/>
            <input type="number" name="skIs"/>
            <input type="number" name="formaldigid"/>
            <input type="number" name="nsm"/>
            <input type="number" name="hromSh"/>
            <input type="number" name="sumU"/>
            <input type="submit" value="Submit"/>
        </form>
        
        <table width="220" border="1">
            <tr><th>Дата</th><th>Срок</th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
            <%
                
            for(PnzData pd : pnzDatalist){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dateWithoutTime = sdf.parse(sdf.format(pd.getPnzDateTime()));
                SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
                String time = localDateFormat.format(pd.getPnzDateTime());
            
            %>
            <tr>
            <td><%=dateWithoutTime%></td>
            <td><%=time%></td>
            <td><%=pd.getBsh()%></td>
            <td><%=pd.getDs()%></td>
            <td><%=pd.getSr()%></td>
            <td><%=pd.getOu()%></td>
            <td><%=pd.getDo_()%></td>
            <td><%=pd.getOa()%></td>
            <td><%=pd.getOzon()%></td>
            <td><%=pd.getSerovodorod()%></td>
            <td><%=pd.getFenol()%></td>
            <td><%=pd.getFv()%></td>
            <td><%=pd.getHlor()%></td>
            <td><%=pd.getHv()%></td>
            <td><%=pd.getAmmiak()%></td>
            <td><%=pd.getSkIs()%></td>
            <td><%=pd.getFormaldigid()%></td>
            <td><%=pd.getNsm()%></td>
            <td><%=pd.getHromSh()%></td>
            <td><%=pd.getSumU()%></td>    
            </tr>
            <% }%>
        </table>
    </body>
</html>
