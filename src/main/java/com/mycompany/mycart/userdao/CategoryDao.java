/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mycart.userdao;

import com.mycompany.mycart.entities.category;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author asus
 */
public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(category cat)
    {
        Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId= (int)session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<category> getCategories(){
        Session session = this.factory.openSession();
        Query query = session.createQuery("from category");
        List<category> list = query.list();
        return list;
    }
    
    public category getCategoryById(int cid){
        category cat=null;
        try{
            Session session = this.factory.openSession();
            cat = session.get(category.class,cid);
            session.close();
        }catch(Exception e){
            
            e.printStackTrace();
        }
        return cat;
    }
}
