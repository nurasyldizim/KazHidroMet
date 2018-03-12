/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import model.Pnz;

import java.util.List; 
import model.PnzData;
 
import org.hibernate.HibernateException; 
import org.hibernate.Query;
import org.hibernate.Session; 
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class PnzDataDao {
  SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
  Session session;

   /* Method to CREATE an employee in the database */
   public void addPnzData(Pnz pnz, Date pnzDateTime, double bsh, double ds, double sr, double ou, double do_, double oa, double ozon, double serovodorod, double fenol, double fv, double hlor, double hv, double ammiak, double skIs, double formaldigid, double nsm, double hromSh, double sumU){
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         PnzData pnzData = new PnzData( pnz, pnzDateTime, bsh, ds, sr, ou, do_, oa, ozon, serovodorod, fenol, fv, hlor, hv, ammiak, skIs, formaldigid, nsm, hromSh, sumU);
         session.save(pnzData); 
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
   }
   
   public void updatePnzData(int pnzDataId, Pnz pnz, Date pnzDateTime, double bsh, double ds, double sr, double ou, double do_, double oa, double ozon, double serovodorod, double fenol, double fv, double hlor, double hv, double ammiak, double skIs, double formaldigid, double nsm, double hromSh, double sumU){
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         PnzData pnzData = new PnzData(pnzDataId, pnz, pnzDateTime, bsh, ds, sr, ou, do_, oa, ozon, serovodorod, fenol, fv, hlor, hv, ammiak, skIs, formaldigid, nsm, hromSh, sumU);
         session.update(pnzData); 
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
   }
   
    public List<PnzData> listPnzDatas(int pnzId, int month ){
      List<PnzData> pnzData = new ArrayList<PnzData>();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      Date date = new Date();
      int year = Year.now().getValue();
      int monthCurrent = date.getMonth()+1;
      if(month > monthCurrent){
          year = year-1;
      }
      try {
         tx = session.beginTransaction();
         Query query = session.createQuery("FROM PnzData WHERE pnzID = :pnzId AND MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query.setParameter("pnzId", pnzId);
         query.setParameter("month", month);
         query.setParameter("year", year);
         pnzData = query.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return pnzData;
   }
   
    public void deletePnzData(Integer PnzDataID){
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         PnzData pnzData = (PnzData)session.get(PnzData.class, PnzDataID); 
         session.delete(pnzData); 
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
   }
      public List minPnzDatas(int pnzId, int month ){
      List pnzData = new ArrayList();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      Date date = new Date();
      int year = Year.now().getValue();
      int monthCurrent = date.getMonth()+ 1;
      if(month > monthCurrent){
          year = year-1;
      }
      try {
         tx = session.beginTransaction();
         Query query = session.createQuery("SELECT min(pnzdata.bsh), min(pnzdata.ds), min(pnzdata.sr), min(pnzdata.ou), min(pnzdata.do_), min(pnzdata.oa), min(pnzdata.ozon), min(pnzdata.serovodorod), min(pnzdata.fenol), min(pnzdata.fv), min(pnzdata.hlor), min(pnzdata.hv), min(pnzdata.ammiak), min(pnzdata.skIs), min(pnzdata.formaldigid), min(pnzdata.nsm), min(pnzdata.hromSh), min(pnzdata.sumU) FROM PnzData pnzdata WHERE pnzID = :pnzId AND MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query.setParameter("pnzId", pnzId);
         query.setParameter("month", month);
         query.setParameter("year", year);
         pnzData = query.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return pnzData;
   }
      public List maxPnzDatas(int pnzId, int month ){
      List pnzData = new ArrayList();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      Date date = new Date();
      int year = Year.now().getValue();
      int monthCurrent = date.getMonth()+1;
      if(month > monthCurrent){
          year = year-1;
      }
      try {
         tx = session.beginTransaction();
         Query query = session.createQuery("SELECT max(pnzdata.bsh), max(pnzdata.ds), max(pnzdata.sr), max(pnzdata.ou), max(pnzdata.do_), max(pnzdata.oa), max(pnzdata.ozon), max(pnzdata.serovodorod), max(pnzdata.fenol), max(pnzdata.fv), max(pnzdata.hlor), max(pnzdata.hv), max(pnzdata.ammiak), max(pnzdata.skIs), max(pnzdata.formaldigid), max(pnzdata.nsm), max(pnzdata.hromSh), max(pnzdata.sumU) FROM PnzData pnzdata WHERE pnzID = :pnzId AND MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query.setParameter("pnzId", pnzId);
         query.setParameter("month", month);
         query.setParameter("year", year);
         pnzData = query.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return pnzData;
   }
      
      public List avgPnzDatas(int pnzId, int month ){
      List pnzData = new ArrayList();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      Date date = new Date();
      int year = Year.now().getValue();
      int monthCurrent = date.getMonth()+1;
      if(month > monthCurrent){
          year = year-1;
      }
      try {
         tx = session.beginTransaction();
         Query query = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE pnzID = :pnzId AND MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query.setParameter("pnzId", pnzId);
         query.setParameter("month", month);
         query.setParameter("year", year);
         pnzData = query.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return pnzData;
   }
      
   public List<PnzData> listPnzDatasByMonth(int pnzId, int month, int year ){
      List<PnzData> pnzData = new ArrayList<PnzData>();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
         Query query = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE pnzID = :pnzId AND MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query.setParameter("pnzId", pnzId);
         query.setParameter("month", month);
         query.setParameter("year", year);
         pnzData = query.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return pnzData;
   }
   
    public List<PnzData> listAllPnzDatasByMonth(int month, int year ){
      List<PnzData> pnzData = new ArrayList<PnzData>();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      try {
         tx = session.beginTransaction();
         Query query = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query.setParameter("month", month);
         query.setParameter("year", year);
         pnzData = query.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return pnzData;
   }
      
    public ArrayList<PnzData>[] qAvgPnzDatas( int month ){
      ArrayList<PnzData>[] avgData = (ArrayList<PnzData>[])new ArrayList[4];
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      Date date = new Date();
      int currentYear = Year.now().getValue();
      int lastYear = Year.now().getValue()-1;
      int monthCurrent = date.getMonth()+1;
      if(month > monthCurrent){
          currentYear = currentYear-1;
          lastYear = lastYear-1;
      }
      try {
         tx = session.beginTransaction();
         Query query1 = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         if(month==1){
            query1.setParameter("month", 12);
            query1.setParameter("year", lastYear-1);
         }else{
            query1.setParameter("month", month-1);
            query1.setParameter("year", lastYear);
         }
         avgData[0] = (ArrayList<PnzData>) query1.list();
         tx.commit();
         
         tx = session.beginTransaction();
         Query query2 = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         query2.setParameter("month", month);
         query2.setParameter("year", lastYear);
         avgData[1] = (ArrayList<PnzData>) query2.list();
         tx.commit();
         
         tx = session.beginTransaction();
         Query query3 = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         if(month == 12){
            query3.setParameter("month", 1);
            query3.setParameter("year", currentYear);
         }else{
            query3.setParameter("month", month+1);
            query3.setParameter("year", lastYear);
         }
         avgData[2] = (ArrayList<PnzData>) query3.list();
         tx.commit();
         
         tx = session.beginTransaction();
         Query query4 = session.createQuery("SELECT avg(pnzdata.bsh), avg(pnzdata.ds), avg(pnzdata.sr), avg(pnzdata.ou), avg(pnzdata.do_), avg(pnzdata.oa), avg(pnzdata.ozon), avg(pnzdata.serovodorod), avg(pnzdata.fenol), avg(pnzdata.fv), avg(pnzdata.hlor), avg(pnzdata.hv), avg(pnzdata.ammiak), avg(pnzdata.skIs), avg(pnzdata.formaldigid), avg(pnzdata.nsm), avg(pnzdata.hromSh), avg(pnzdata.sumU) FROM PnzData pnzdata WHERE MONTH(pnzDateTime)= :month AND YEAR(pnzDateTime)= :year");
         if(month == 1){
            query4.setParameter("month", 12);
            query4.setParameter("year", lastYear);
         }else{
            query4.setParameter("month", month-1);
            query4.setParameter("year", currentYear);
         }
         avgData[3] = (ArrayList<PnzData>) query4.list();
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
      return avgData;
   }
}