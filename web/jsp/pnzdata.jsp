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
        <script src="../js/mainscript.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String pnzName = request.getParameter("pnzName");
            String pnzId = request.getParameter("pnzId");
        %>
        <select id="pnzList" onchange="refreshFunction()">
        <%
            PnzDataDao pnzDataDao = new PnzDataDao();
            //List<PnzData> pnzDatalist =  pnzDataDao.listPnzDatas(1);
                    
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
                
                <td style="display: none"><input type="hidden" id="pnzName" name="pnzName" value=<%=pnzName%>/></td>
                <td style="display: none"><input type="hidden" id="pnzId" name="pnzId" value="<%=pnzId%>"/></td>
                <td><input type="datetime-local" min="2015-01-01 00:00" max="2030-01-01 00:00" step="3600"  name="pnzDateTime" required/></td>
                <td><input type="number" name="bsh"/></td>
                <td><input type="number" name="ds"/></td>
                <td><input type="number" name="sr"/></td>
                <td><input type="number" name="ou"/></td>
                <td><input type="number" name="do_"/></td>
                <td><input type="number" name="oa"/></td>
                <td><input type="number" name="ozon"/></td>
                <td><input type="number" name="serovodorod"/></td>
                <td><input type="number" name="fenol"/></td>
                <td><input type="number" name="fv"/></td>
                <td><input type="number" name="hlor"/></td>
                <td><input type="number" name="hv"/></td>
                <td><input type="number" name="ammiak"/></td>
                <td><input type="number" name="skIs"/></td>
                <td><input type="number" name="formaldigid"/></td>
                <td><input type="number" name="nsm"/></td>
                <td><input type="number" name="hromSh"/></td>
                <td><input type="number" name="sumU"/></td>
                <td><input type="submit" name="ACTION" value="Save"/></td>
            </tr>
            </table>
        </form>
        
                <form name=frm method="POST">
        <table width="220" border="1">
            <tr><th>Дата</th><th>Срок</th><th>Взвешенные частицы(пыль)</th><th>Диоксид серы</th><th>Сульфаты растворимые</th><th>Оксид углерода</th><th>Диоксид азота</th><th>Оксид азота</th><th>Озон</th><th>Сероводород</th><th>Фенол</th><th>Фтористый водород</th><th>Хлор</th><th>Хлористый водород</th><th>Аммиак</th><th>Серная кислота и сульфаты</th><th>Формальдегид</th><th>Неорганические соединения мышьяк</th><th>Хром шестивалентный</th><th>Суммарные углеводороды</th></tr>   
            <%
            List<PnzData> pnzDatalist =  pnzDataDao.listPnzDatas(Integer.parseInt(pnzId));  
            for(PnzData pd : pnzDatalist){
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                Date dateWithoutTime = sdf.parse(sdf.format(pd.getPnzDateTime()));
                SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
                String time = localDateFormat.format(pd.getPnzDateTime());       
            %>
            <h3><%=sdf.format(dateWithoutTime)%></h3>
            <tr>
                
                <td style="display: none"><input type="hidden" id="pnzName" name="pnzName" value=<%=pnzName%>/></td>
                <td style="display: none"><input type="hidden" id="pnzId" name="pnzId" value="<%=pnzId%>"/></td>
                <td style="display:none"><input type="hidden" name="pnzDataId" value="<%=pd.getPnzDataId()%>"/></td>
                <td><input name="dateWithoutTime<%=pd.getPnzDataId()%>" type="datetime" value="<%=sdf.format(dateWithoutTime)%>"/></td>
                <td><input name="time<%=pd.getPnzDataId()%>" type="time" value="<%=time%>"/></td>
                <td><input name="bsh<%=pd.getPnzDataId()%>" value="<%=pd.getBsh()%>"/></td>
                <td><input name="ds<%=pd.getPnzDataId()%>" value="<%=pd.getDs()%>"/></td>
                <td><input name="sr<%=pd.getPnzDataId()%>" value="<%=pd.getSr()%>"/></td>
                <td><input name="ou<%=pd.getPnzDataId()%>" value="<%=pd.getOu()%>"/></td>
                <td><input name="do_<%=pd.getPnzDataId()%>" value="<%=pd.getDo_()%>"/></td>
                <td><input name="oa<%=pd.getPnzDataId()%>" value="<%=pd.getOa()%>"/></td>
                <td><input name="ozon<%=pd.getPnzDataId()%>" value="<%=pd.getOzon()%>"/></td>
                <td><input name="serovodorod<%=pd.getPnzDataId()%>" value="<%=pd.getSerovodorod()%>"/></td>
                <td><input name="fenol<%=pd.getPnzDataId()%>" value="<%=pd.getFenol()%>"/></td>
                <td><input name="fv<%=pd.getPnzDataId()%>" value="<%=pd.getFv()%>"/></td>
                <td><input name="hlor<%=pd.getPnzDataId()%>" value="<%=pd.getHlor()%>"/></td>
                <td><input name="hv<%=pd.getPnzDataId()%>" value="<%=pd.getHv()%>"/></td>
                <td><input name="ammiak<%=pd.getPnzDataId()%>" value="<%=pd.getAmmiak()%>"/></td>
                <td><input name="skIs<%=pd.getPnzDataId()%>" value="<%=pd.getSkIs()%>"/></td>
                <td><input name="formaldigid<%=pd.getPnzDataId()%>" value="<%=pd.getFormaldigid()%>"/></td>
                <td><input name="nsm<%=pd.getPnzDataId()%>" value="<%=pd.getNsm()%>"/></td>
                <td><input name="hromSh<%=pd.getPnzDataId()%>" value="<%=pd.getHromSh()%>"/></td>
                <td><input name="sumU<%=pd.getPnzDataId()%>" value="<%=pd.getSumU()%>"/></td>  
                <td><input type="submit" name="ACTION" value="Edit" onclick="getEditConfirmation(<%=pd.getPnzDataId()%>)"/></td>
                <td><input type="submit" name="ACTION" value="Delete" onclick="getDeleteConfirmation(<%=pd.getPnzDataId()%>)"/></td>
            </tr>
            <% }%>
        </table>
            </form>
    </body>
</html>
