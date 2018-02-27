package controller;
 
import dao.PnzDataDao;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Pnz;
 
 
public class PnzDataController extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("ACTION");
            if(action.equals("Save")){
            request.setCharacterEncoding("UTF-8");
            String pnzName = request.getParameter("pnzName");
            int pnzId = Integer.parseInt(request.getParameter("pnzId"));
            Pnz pnz = new Pnz(pnzId,pnzName);
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm"); 
            Date pnzDateTime = (Date)formatter.parse(request.getParameter("pnzDateTime"));
            double bsh = Double.valueOf(request.getParameter("bsh"));
            double ds = Double.valueOf(request.getParameter("ds"));
            double sr = Double.valueOf(request.getParameter("sr"));
            double ou = Double.valueOf(request.getParameter("ou"));
            double do_ = Double.valueOf(request.getParameter("do_"));
            double oa = Double.valueOf(request.getParameter("oa"));
            double ozon = Double.valueOf(request.getParameter("ozon"));
            double serovodorod = Double.valueOf(request.getParameter("serovodorod"));
            double fenol = Double.valueOf(request.getParameter("fenol"));
            double fv = Double.valueOf(request.getParameter("fv"));
            double hlor = Double.valueOf(request.getParameter("hlor"));
            double hv = Double.valueOf(request.getParameter("hv"));
            double ammiak = Double.valueOf(request.getParameter("ammiak"));
            double skIs = Double.valueOf(request.getParameter("skIs"));
            double formaldigid = Double.valueOf(request.getParameter("formaldigid"));
            double nsm = Double.valueOf(request.getParameter("nsm"));
            double hromSh = Double.valueOf(request.getParameter("hromSh"));
            double sumU = Double.valueOf(request.getParameter("sumU"));
            
            try {
                PnzDataDao pnzDataDao = new PnzDataDao();
                pnzDataDao.addPnzData(pnz, pnzDateTime, bsh, ds, sr, ou, do_, oa, ozon, serovodorod, fenol, fv, hlor, hv, ammiak, skIs, formaldigid, nsm, hromSh, sumU);
                response.sendRedirect("jsp/pnzdata.jsp?pnzId="+pnzId+"&pnzName="+pnzName);
            } catch (Exception e) {
                
                e.printStackTrace();
            }
            }else if(action.equals("Delete")){
                String pnzName = request.getParameter("pnzName");
                int pnzId = Integer.parseInt(request.getParameter("pnzId"));
                String pnzDataId = request.getParameter("pnzDataId");
                try {
                PnzDataDao pnzDataDao = new PnzDataDao();
                pnzDataDao.deletePnzData(Integer.parseInt(pnzDataId));
                response.sendRedirect("jsp/pnzdata.jsp?pnzId="+pnzId+"&pnzName="+pnzName);
            } catch (Exception e) {
                
                e.printStackTrace();
            }
            }else if(action.equals("Edit")){
                String pnzName = request.getParameter("pnzName");
                int pnzId = Integer.parseInt(request.getParameter("pnzId"));
                String pnzDataId = request.getParameter("pnzDataId");
                Pnz pnz = new Pnz(pnzId,pnzName);
                SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");  
                Date pnzDateTime = (Date)formatter.parse(request.getParameter("pnzDateTime"));
                System.out.println(request.getParameter("bsh"));
                double bsh = Double.parseDouble(request.getParameter("bsh"));
                double ds = Double.valueOf(request.getParameter("ds"));
                double sr = Double.valueOf(request.getParameter("sr"));
                double ou = Double.valueOf(request.getParameter("ou"));
                double do_ = Double.valueOf(request.getParameter("do_"));
                double oa = Double.valueOf(request.getParameter("oa"));
                double ozon = Double.valueOf(request.getParameter("ozon"));
                double serovodorod = Double.valueOf(request.getParameter("serovodorod"));
                double fenol = Double.valueOf(request.getParameter("fenol"));
                double fv = Double.valueOf(request.getParameter("fv"));
                double hlor = Double.valueOf(request.getParameter("hlor"));
                double hv = Double.valueOf(request.getParameter("hv"));
                double ammiak = Double.valueOf(request.getParameter("ammiak"));
                double skIs = Double.valueOf(request.getParameter("skIs"));
                double formaldigid = Double.valueOf(request.getParameter("formaldigid"));
                double nsm = Double.valueOf(request.getParameter("nsm"));
                double hromSh = Double.valueOf(request.getParameter("hromSh"));
                double sumU = Double.valueOf(request.getParameter("sumU"));

            try {
                System.out.println("ORRRRKRKRKRRKRKRK");
                PnzDataDao pnzDataDao = new PnzDataDao();
                System.out.println("ORRRRKRKRKRRKRKRK2");
                pnzDataDao.updatePnzData(Integer.parseInt(pnzDataId), pnz, pnzDateTime, bsh, ds, sr, ou, do_, oa, ozon, serovodorod, fenol, fv, hlor, hv, ammiak, skIs, formaldigid, nsm, hromSh, sumU);
                System.out.println("ORRRRKRKRKRRKRKRK23");
                response.sendRedirect("jsp/pnzdata.jsp?pnzId="+pnzId+"&pnzName="+pnzName);
            } catch (Exception e) {
                
                e.printStackTrace();
            }
            }
            
        } catch (ParseException ex) {
 
            Logger.getLogger(PnzDataController.class.getName()).log(Level.SEVERE, null, ex);
        }
 
    }
}