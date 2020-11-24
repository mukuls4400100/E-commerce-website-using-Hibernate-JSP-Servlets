
package com.mycompany.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class product {
   @Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   private int pId;
   
   private String pName;
   
   @Column(length=3000)
   private String pDesc;
   private String pPhoto;
   private int pPrice;
   private int pDiscount;
   private int pQuantity;
   
   @ManyToOne
   private category categori;
    public product() {
    }

    public product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, category categori) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.categori=categori;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public category getCategori() {
        return categori;
    }

    public void setCategori(category categori) {
        this.categori = categori;
    }
    
    @Override
    public String toString() {
        return "product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
    
    public int getPriceAfterDiscount(){
        int d=(int)((this.getpDiscount()/100.0)*this.getpPrice());
        return this.getpPrice()-d;
    }
   
}
