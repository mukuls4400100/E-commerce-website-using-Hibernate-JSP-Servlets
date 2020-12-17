
package com.mycompany.mycart.helper;


import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory(){
        try{
            if(factory==null)
            factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return factory;
    }
    public static Map<String,Long> getCount(SessionFactory factory){
       Session s= factory.openSession();
       String q1="Select count(*) from User";
       String q2="Select count(*) from product";
       
       Query q3=s.createQuery(q1);
       Query q4=s.createQuery(q2);
       
       Long userCount=(Long)q3.list().get(0);
       Long productCount=(Long)q4.list().get(0);
       
       Map<String,Long> map=new HashMap<String,Long>();
       map.put("userCount",userCount);
       map.put("productCount",productCount);
       
       s.close();
       return map;
    }
}
