// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.crmco.crm.domain;

import com.crmco.crm.domain.Customer;

privileged aspect Customer_Roo_JavaBean {
    
    public int Customer.getId() {
        return this.id;
    }
    
    public void Customer.setId(int id) {
        this.id = id;
    }
    
    public String Customer.getFname() {
        return this.fname;
    }
    
    public void Customer.setFname(String fname) {
        this.fname = fname;
    }
    
    public String Customer.getLname() {
        return this.lname;
    }
    
    public void Customer.setLname(String lname) {
        this.lname = lname;
    }
    
}
