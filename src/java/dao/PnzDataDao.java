/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.util.ArrayList;
import java.util.Date;
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
   public void addOrUpdatePnzData(Pnz pnz, Date pnzDateTime, double bsh, double ds, double sr, double ou, double do_, double oa, double ozon, double serovodorod, double fenol, double fv, double hlor, double hv, double ammiak, double skIs, double formaldigid, double nsm, double hromSh, double sumU){
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      
      try {
         tx = session.beginTransaction();
         PnzData pnzData = new PnzData( pnz, pnzDateTime, bsh, ds, sr, ou, do_, oa, ozon, serovodorod, fenol, fv, hlor, hv, ammiak, skIs, formaldigid, nsm, hromSh, sumU);
         session.update(pnz);
         session.save(pnzData); 
         tx.commit();
      } catch (HibernateException e) {
         if (tx!=null) tx.rollback();
         e.printStackTrace(); 
      } finally {
         session.close(); 
      }
   }
   
    public List<PnzData> listPnzDatas(int pnzId ){
      List<PnzData> pnzData = new ArrayList<PnzData>();
      Session session = sessionFactory.openSession();
      Transaction tx = null;
      
      try {
         System.out.println("fsdafsdafsadfdsfdfklajfdkslafjdsaklfj");
         tx = session.beginTransaction();
         Query query = session.createQuery("FROM PnzData WHERE pnzID = :pnzId ");
         query.setParameter("pnzId", pnzId);
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
   
}