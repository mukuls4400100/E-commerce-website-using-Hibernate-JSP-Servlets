
package com.mycompany.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "`order`")
public class order {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length=10)
    private int orderId;
    @Column(length=100)
    private String customerName;
    @Column(length=100, unique=true)
    private String customerEmail;
    @Column(length=120)
    private String customerPhone;
    @Column(length=1500)
    private String shippingAddress;
    private String customerproductName;
    private int customerproductPrice;
    private int customerproductQuantity;

    public order() {
    }
    
    
    public order(String customerName, String customerEmail, String customerPhone, String shippingAddress, String customerproductName, int customerproductPrice, int customerproductQuantity) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.shippingAddress = shippingAddress;
        this.customerproductName = customerproductName;
        this.customerproductPrice = customerproductPrice;
        this.customerproductQuantity = customerproductQuantity;
    }
    
    
    public order(int orderId, String customerName, String customerEmail, String customerPhone, String shippingAddress, String customerproductName, int customerproductPrice, int customerproductQuantity) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.shippingAddress = shippingAddress;
        this.customerproductName = customerproductName;
        this.customerproductPrice = customerproductPrice;
        this.customerproductQuantity = customerproductQuantity;
    }
    
    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getCustomerproductName() {
        return customerproductName;
    }

    public void setCustomerproductName(String customerproductName) {
        this.customerproductName = customerproductName;
    }

    public int getCustomerproductPrice() {
        return customerproductPrice;
    }

    public void setCustomerproductPrice(int customerproductPrice) {
        this.customerproductPrice = customerproductPrice;
    }

    public int getCustomerproductQuantity() {
        return customerproductQuantity;
    }

    public void setCustomerproductQuantity(int customerproductQuantity) {
        this.customerproductQuantity = customerproductQuantity;
    }

    @Override
    public String toString() {
        return "order{" + "orderId=" + orderId + ", customerName=" + customerName + ", customerEmail=" + customerEmail + ", customerPhone=" + customerPhone + ", shippingAddress=" + shippingAddress + ", customerproductName=" + customerproductName + ", customerproductPrice=" + customerproductPrice + ", customerproductQuantity=" + customerproductQuantity + '}';
    }

    
    
    
}
