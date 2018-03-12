<%-- 
    Document   : pnzdata
    Created on : 21.02.2018, 13:37:52
    Author     : Nurasyl Dizim
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.net.URLEncoder"%>
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
        <title>PNZ Data</title>
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script type="text/javascript" src="../js/mainjs.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            request.setCharacterEncoding("UTF-8");
            String pnzName = request.getParameter("pnzName");
            String pnzId = request.getParameter("pnzId");
            String month = request.getParameter("month");
        %>
        <h1><%=pnzName%></h1>
        <select id="pnzListId" onchange="refreshFunction()">
        <%
            PnzDataDao pnzDataDao = new PnzDataDao();               
            PnzDao pnzDao = new PnzDao();
            List<Pnz> list = pnzDao.listPnzs();
            for (Pnz p : list) {
                if(p.getPnzId()==Integer.parseInt(pnzId)){
         %>
         <option selected="selected" value="<%=p.getPnzId()%>"><%=p.getPnzName()%></option>
          <%}else{%>
          <option value="<%=p.getPnzId()%>"><%=p.getPnzName()%></option>
          <%       
                }
          }%>
        </select>   
        <form method="POST" action="../PnzDataController">
            <table width="220" border="1">
            <tr><th>Дата</th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
            <tr>
                
                <td style="display: none"><input type="hidden" id="pnzName" name="pnzName" value="<%=pnzName%>"></td>
                <td style="display: none"><input type="hidden" id="pnzId" name="pnzId" value="<%=pnzId%>"></td>
                <td style="display: none"><input type="hidden" id="month" name="month" value="<%=month%>"></td>
                <td><input type="datetime-local" min="2015-01-01 00:00" max="2030-01-01 00:00" step="3600"  name="pnzDateTime" required></td>
                <td><input type="number" step="0.001" name="bsh"></td>
                <td><input type="number" step="0.001" name="ds"></td>
                <td><input type="number" step="0.001" name="sr"></td>
                <td><input type="number" step="0.001" name="ou"></td>
                <td><input type="number" step="0.001" name="do_"></td>
                <td><input type="number" step="0.001" name="oa"></td>
                <td><input type="number" step="0.001" name="ozon"></td>
                <td><input type="number" step="0.001" name="serovodorod"></td>
                <td><input type="number" step="0.001" name="fenol"></td>
                <td><input type="number" step="0.001" name="fv"></td>
                <td><input type="number" step="0.001" name="hlor"></td>
                <td><input type="number" step="0.001" name="hv"></td>
                <td><input type="number" step="0.001" name="ammiak"></td>
                <td><input type="number" step="0.001"name="skIs"></td>
                <td><input type="number" step="0.001" name="formaldigid"></td>
                <td><input type="number" step="0.001" name="nsm"></td>
                <td><input type="number" step="0.001" name="hromSh"></td>
                <td><input type="number" step="0.001" name="sumU"></td>
                <td><input type="submit" step="0.001" name="ACTION" value="Save"></td>
            </tr>
            </table>
        </form>
        
           <ul>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=1">Январь</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=2">Февраль</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=3">Март</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=4">Апрель</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=5">Май</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=6">Июнь</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=7">Июль</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=8">Август</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=9">Сентябрь</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=10">Октябрь</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=11">Ноябрь</a></li>
               <li><a href="pnzdata.jsp?pnzId=<%=pnzId%>&pnzName=<%=URLEncoder.encode(pnzName, "UTF-8")%>&month=12">Декабрь</a></li>
               <li><a href="datamonth.jsp?month=1&name=<%=URLEncoder.encode("Январь", "UTF-8")%>">Расчеты</a></li>
           </ul>
               
                <form name=frm method="POST">
        <table width="220" border="1">
            <tr><th>Дата</th><th>Срок</th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
            <%
            List pnzMinlist =  pnzDataDao.minPnzDatas(Integer.parseInt(pnzId),Integer.parseInt(month));
            List pnzMaxlist =  pnzDataDao.maxPnzDatas(Integer.parseInt(pnzId),Integer.parseInt(month));
            List pnzAvglist =  pnzDataDao.avgPnzDatas(Integer.parseInt(pnzId),Integer.parseInt(month));
            Iterator iterMin = pnzMinlist.iterator();
            Iterator iterMax = pnzMaxlist.iterator();
            Iterator iterAvg = pnzAvglist.iterator();
            List<PnzData> pnzDatalist =  pnzDataDao.listPnzDatas(Integer.parseInt(pnzId),Integer.parseInt(month));  
            for(PnzData pd : pnzDatalist){
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                Date dateWithoutTime = sdf.parse(sdf.format(pd.getPnzDateTime()));
                SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
                String time = localDateFormat.format(pd.getPnzDateTime());       
            %>
            <tr>
                <td style="display: none"><input type="hidden" id="pnzName" name="pnzName" value="<%=pnzName%>"></td>
                <td style="display: none"><input type="hidden" id="pnzId" name="pnzId" value="<%=pnzId%>"></td>
                <td style="display: none"><input type="hidden" id="month" name="month" value="<%=month%>"></td>
                <td style="display:none"><input type="hidden" name="pnzDataId" value="<%=pd.getPnzDataId()%>"></td>
                <td><input name="dateWithoutTime<%=pd.getPnzDataId()%>" type="datetime" value="<%=sdf.format(dateWithoutTime)%>"></td>
                <td><input id="time" name="time<%=pd.getPnzDataId()%>" type="time" value="<%=time%>"></td>
                <td><input name="bsh<%=pd.getPnzDataId()%>" value="<%=pd.getBsh()%>"></td>
                <td><input name="ds<%=pd.getPnzDataId()%>" value="<%=pd.getDs()%>"></td>
                <td><input name="sr<%=pd.getPnzDataId()%>" value="<%=pd.getSr()%>"></td>
                <td><input name="ou<%=pd.getPnzDataId()%>" value="<%=pd.getOu()%>"></td>
                <td><input name="do_<%=pd.getPnzDataId()%>" value="<%=pd.getDo_()%>"></td>
                <td><input name="oa<%=pd.getPnzDataId()%>" value="<%=pd.getOa()%>"></td>
                <td><input name="ozon<%=pd.getPnzDataId()%>" value="<%=pd.getOzon()%>"></td>
                <td><input name="serovodorod<%=pd.getPnzDataId()%>" value="<%=pd.getSerovodorod()%>"></td>
                <td><input name="fenol<%=pd.getPnzDataId()%>" value="<%=pd.getFenol()%>"></td>
                <td><input name="fv<%=pd.getPnzDataId()%>" value="<%=pd.getFv()%>"></td>
                <td><input name="hlor<%=pd.getPnzDataId()%>" value="<%=pd.getHlor()%>"></td>
                <td><input name="hv<%=pd.getPnzDataId()%>" value="<%=pd.getHv()%>"></td>
                <td><input name="ammiak<%=pd.getPnzDataId()%>" value="<%=pd.getAmmiak()%>"></td>
                <td><input name="skIs<%=pd.getPnzDataId()%>" value="<%=pd.getSkIs()%>"></td>
                <td><input name="formaldigid<%=pd.getPnzDataId()%>" value="<%=pd.getFormaldigid()%>"></td>
                <td><input name="nsm<%=pd.getPnzDataId()%>" value="<%=pd.getNsm()%>"></td>
                <td><input name="hromSh<%=pd.getPnzDataId()%>" value="<%=pd.getHromSh()%>"></td>
                <td><input name="sumU<%=pd.getPnzDataId()%>" value="<%=pd.getSumU()%>"></td>  
                <td><input type="submit" name="ACTION" value="Edit" onclick="getEditConfirmation(<%=pd.getPnzDataId()%>)"></td>
                <td><input type="submit" name="ACTION" value="Delete" onclick="getDeleteConfirmation(<%=pd.getPnzDataId()%>)"></td>
            </tr>
            <% }
            Object[] objMin = (Object[]) iterMin.next();
            Object[] objMax = (Object[]) iterMax.next();
            Object[] objAvg = (Object[]) iterAvg.next();
            if (objMin[0]!=null)
            {
            %>
               <tr>
                <td></td>
                <td>Мин</td>
                <td><input name="bsh<%=objMin[0]%>" value="<%=objMin[0]%>"></td>
                <td><input name="ds<%=objMin[1]%>" value="<%=objMin[1]%>"></td>
                <td><input name="sr<%=objMin[2]%>" value="<%=objMin[2]%>"></td>
                <td><input name="ou<%=objMin[3]%>" value="<%=objMin[3]%>"></td>
                <td><input name="do_<%=objMin[4]%>" value="<%=objMin[4]%>"></td>
                <td><input name="oa<%=objMin[5]%>" value="<%=objMin[5]%>"></td>
                <td><input name="ozon<%=objMin[6]%>" value="<%=objMin[6]%>"></td>
                <td><input name="serovodorod<%=objMin[7]%>" value="<%=objMin[7]%>"></td>
                <td><input name="fenol<%=objMin[8]%>" value="<%=objMin[8]%>"></td>
                <td><input name="fv<%=objMin[9]%>" value="<%=objMin[9]%>"></td>
                <td><input name="hlor<%=objMin[10]%>" value="<%=objMin[10]%>"></td>
                <td><input name="hv<%=objMin[11]%>" value="<%=objMin[11]%>"></td>
                <td><input name="ammiak<%=objMin[12]%>" value="<%=objMin[12]%>"></td>
                <td><input name="skIs<%=objMin[13]%>" value="<%=objMin[13]%>"></td>
                <td><input name="formaldigid<%=objMin[14]%>" value="<%=objMin[14]%>"></td>
                <td><input name="nsm<%=objMin[15]%>" value="<%=objMin[15]%>"></td>
                <td><input name="hromSh<%=objMin[16]%>" value="<%=objMin[16]%>"></td>
                <td><input name="sumU<%=objMin[17]%>" value="<%=objMin[17]%>"></td>  
            </tr> 
            <tr>
                <td></td>
                <td>Макс</td>
                <td><input name="bsh<%=objMax[0]%>" value="<%=objMax[0]%>"></td>
                <td><input name="ds<%=objMax[1]%>" value="<%=objMax[1]%>"></td>
                <td><input name="sr<%=objMax[2]%>" value="<%=objMax[2]%>"></td>
                <td><input name="ou<%=objMax[3]%>" value="<%=objMax[3]%>"></td>
                <td><input name="do_<%=objMax[4]%>" value="<%=objMax[4]%>"></td>
                <td><input name="oa<%=objMax[5]%>" value="<%=objMax[5]%>"></td>
                <td><input name="ozon<%=objMax[6]%>" value="<%=objMax[6]%>"></td>
                <td><input name="serovodorod<%=objMax[7]%>" value="<%=objMax[7]%>"></td>
                <td><input name="fenol<%=objMax[8]%>" value="<%=objMax[8]%>"></td>
                <td><input name="fv<%=objMax[9]%>" value="<%=objMax[9]%>"></td>
                <td><input name="hlor<%=objMax[10]%>" value="<%=objMax[10]%>"></td>
                <td><input name="hv<%=objMax[11]%>" value="<%=objMax[11]%>"></td>
                <td><input name="ammiak<%=objMax[12]%>" value="<%=objMax[12]%>"></td>
                <td><input name="skIs<%=objMax[13]%>" value="<%=objMax[13]%>"></td>
                <td><input name="formaldigid<%=objMax[14]%>" value="<%=objMax[14]%>"></td>
                <td><input name="nsm<%=objMax[15]%>" value="<%=objMax[15]%>"></td>
                <td><input name="hromSh<%=objMax[16]%>" value="<%=objMax[16]%>"></td>
                <td><input name="sumU<%=objMax[17]%>" value="<%=objMax[17]%>"></td>  
            </tr>     
            <tr>
                <td></td>
                <td>Ср</td>
                <td><input name="bsh<%=objAvg[0]%>" value="<%=objAvg[0]%>"></td>
                <td><input name="ds<%=objAvg[1]%>" value="<%=objAvg[1]%>"></td>
                <td><input name="sr<%=objAvg[2]%>" value="<%=objAvg[2]%>"></td>
                <td><input name="ou<%=objAvg[3]%>" value="<%=objAvg[3]%>"></td>
                <td><input name="do_<%=objAvg[4]%>" value="<%=objAvg[4]%>"></td>
                <td><input name="oa<%=objAvg[5]%>" value="<%=objAvg[5]%>"></td>
                <td><input name="ozon<%=objAvg[6]%>" value="<%=objAvg[6]%>"></td>
                <td><input name="serovodorod<%=objAvg[7]%>" value="<%=objAvg[7]%>"></td>
                <td><input name="fenol<%=objAvg[8]%>" value="<%=objAvg[8]%>"></td>
                <td><input name="fv<%=objAvg[9]%>" value="<%=objAvg[9]%>"></td>
                <td><input name="hlor<%=objAvg[10]%>" value="<%=objAvg[10]%>"></td>
                <td><input name="hv<%=objAvg[11]%>" value="<%=objAvg[11]%>"></td>
                <td><input name="ammiak<%=objAvg[12]%>" value="<%=objAvg[12]%>"></td>
                <td><input name="skIs<%=objAvg[13]%>" value="<%=objAvg[13]%>"></td>
                <td><input name="formaldigid<%=objAvg[14]%>" value="<%=objAvg[14]%>"></td>
                <td><input name="nsm<%=objAvg[15]%>" value="<%=objAvg[15]%>"></td>
                <td><input name="hromSh<%=objAvg[16]%>" value="<%=objAvg[16]%>"></td>
                <td><input name="sumU<%=objAvg[17]%>" value="<%=objAvg[17]%>"></td>  
            </tr> 
            <% } %>
        </table>
            </form>
    </body>
</html>
