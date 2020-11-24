/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycart.userdao;

import com.mycompany.mycart.entities.product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author asus
 */
public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(product p) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(p);
            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }
    
    public List<product> getAllProducts(){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from product");
        List<product> list=q.list();
        return list;
    }
    public List<product> getAllProductsById(int cid){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from product as p where p.categori.categoryId=:id ");
        q.setParameter("id",cid);
        List<product> list=q.list();
        return list;
    }
}
