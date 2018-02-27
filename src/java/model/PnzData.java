package model;
// Generated 21.02.2018 13:40:03 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * PnzData generated by hbm2java
 */
public class PnzData  implements java.io.Serializable {


     private Integer pnzDataId;
     private Pnz pnz;
     private Date pnzDateTime;
     private double bsh;
     private double ds;
     private double sr;
     private double ou;
     private double do_;
     private double oa;
     private double ozon;
     private double serovodorod;
     private double fenol;
     private double fv;
     private double hlor;
     private double hv;
     private double ammiak;
     private double skIs;
     private double formaldigid;
     private double nsm;
     private double hromSh;
     private double sumU;

    public PnzData() {
    }

    public PnzData(int pnzDataId, Pnz pnz, Date pnzDateTime, double bsh, double ds, double sr, double ou, double do_, double oa, double ozon, double serovodorod, double fenol, double fv, double hlor, double hv, double ammiak, double skIs, double formaldigid, double nsm, double hromSh, double sumU) {
       this.pnzDataId = pnzDataId;
       this.pnz = pnz;
       this.pnzDateTime = pnzDateTime;
       this.bsh = bsh;
       this.ds = ds;
       this.sr = sr;
       this.ou = ou;
       this.do_ = do_;
       this.oa = oa;
       this.ozon = ozon;
       this.serovodorod = serovodorod;
       this.fenol = fenol;
       this.fv = fv;
       this.hlor = hlor;
       this.hv = hv;
       this.ammiak = ammiak;
       this.skIs = skIs;
       this.formaldigid = formaldigid;
       this.nsm = nsm;
       this.hromSh = hromSh;
       this.sumU = sumU;
    }
   
    public PnzData(Pnz pnz, Date pnzDateTime, double bsh, double ds, double sr, double ou, double do_, double oa, double ozon, double serovodorod, double fenol, double fv, double hlor, double hv, double ammiak, double skIs, double formaldigid, double nsm, double hromSh, double sumU) {
       this.pnz = pnz;
       this.pnzDateTime = pnzDateTime;
       this.bsh = bsh;
       this.ds = ds;
       this.sr = sr;
       this.ou = ou;
       this.do_ = do_;
       this.oa = oa;
       this.ozon = ozon;
       this.serovodorod = serovodorod;
       this.fenol = fenol;
       this.fv = fv;
       this.hlor = hlor;
       this.hv = hv;
       this.ammiak = ammiak;
       this.skIs = skIs;
       this.formaldigid = formaldigid;
       this.nsm = nsm;
       this.hromSh = hromSh;
       this.sumU = sumU;
    }
    
    public Integer getPnzDataId() {
        return this.pnzDataId;
    }
    
    public void setPnzDataId(Integer pnzDataId) {
        this.pnzDataId = pnzDataId;
    }
    public Pnz getPnz() {
        return this.pnz;
    }
    
    public void setPnz(Pnz pnz) {
        this.pnz = pnz;
    }
    public Date getPnzDateTime() {
        return this.pnzDateTime;
    }
    
    public void setPnzDateTime(Date pnzDateTime) {
        this.pnzDateTime = pnzDateTime;
    }
    public double getBsh() {
        return this.bsh;
    }
    
    public void setBsh(double bsh) {
        this.bsh = bsh;
    }
    public double getDs() {
        return this.ds;
    }
    
    public void setDs(double ds) {
        this.ds = ds;
    }
    public double getSr() {
        return this.sr;
    }
    
    public void setSr(double sr) {
        this.sr = sr;
    }
    public double getOu() {
        return this.ou;
    }
    
    public void setOu(double ou) {
        this.ou = ou;
    }
    public double getDo_() {
        return this.do_;
    }
    
    public void setDo_(double do_) {
        this.do_ = do_;
    }
    public double getOa() {
        return this.oa;
    }
    
    public void setOa(double oa) {
        this.oa = oa;
    }
    public double getOzon() {
        return this.ozon;
    }
    
    public void setOzon(double ozon) {
        this.ozon = ozon;
    }
    public double getSerovodorod() {
        return this.serovodorod;
    }
    
    public void setSerovodorod(double serovodorod) {
        this.serovodorod = serovodorod;
    }
    public double getFenol() {
        return this.fenol;
    }
    
    public void setFenol(double fenol) {
        this.fenol = fenol;
    }
    public double getFv() {
        return this.fv;
    }
    
    public void setFv(double fv) {
        this.fv = fv;
    }
    public double getHlor() {
        return this.hlor;
    }
    
    public void setHlor(double hlor) {
        this.hlor = hlor;
    }
    public double getHv() {
        return this.hv;
    }
    
    public void setHv(double hv) {
        this.hv = hv;
    }
    public double getAmmiak() {
        return this.ammiak;
    }
    
    public void setAmmiak(double ammiak) {
        this.ammiak = ammiak;
    }
    public double getSkIs() {
        return this.skIs;
    }
    
    public void setSkIs(double skIs) {
        this.skIs = skIs;
    }
    public double getFormaldigid() {
        return this.formaldigid;
    }
    
    public void setFormaldigid(double formaldigid) {
        this.formaldigid = formaldigid;
    }
    public double getNsm() {
        return this.nsm;
    }
    
    public void setNsm(double nsm) {
        this.nsm = nsm;
    }
    public double getHromSh() {
        return this.hromSh;
    }
    
    public void setHromSh(double hromSh) {
        this.hromSh = hromSh;
    }
    public double getSumU() {
        return this.sumU;
    }
    
    public void setSumU(double sumU) {
        this.sumU = sumU;
    }




}


