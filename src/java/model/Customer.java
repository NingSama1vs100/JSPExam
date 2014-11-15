/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ning jittima
 */
public class Customer {

    private int customerid;
    private String discountcode;
    private String zip;
    private String name;
    private String addressline1;
    private String addressline2;
    private String city;
    private String state;
    private String phone;
    private String fax;
    private String email;
    private int creditlimit;
    private boolean isNew = true;
    private static int NEXT_ID;

    public boolean isIsNew() {
        return isNew;
    }

    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }

    static{
        NEXT_ID = getNewId();
    }
    
    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public String getDiscountcode() {
        return discountcode;
    }

    public void setDiscountcode(String discountcode) {
        this.discountcode = discountcode;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddressline1() {
        return addressline1;
    }

    public void setAddressline1(String addressline1) {
        this.addressline1 = addressline1;
    }

    public String getAddressline2() {
        return addressline2;
    }

    public void setAddressline2(String addressline2) {
        this.addressline2 = addressline2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCreditlimit() {
        return creditlimit;
    }

    public void setCreditlimit(int creditlimit) {
        this.creditlimit = creditlimit;
    }

    private static int getNewId(){
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT customer_id FROM customer ORDER BY customer_id DESC FETCH FIRST 1 ROWS ONLY";
        try {
            ResultSet rs = con.createStatement().executeQuery(sql);
            if(rs.next()){
                return rs.getInt(1)+1;
            }else{
                return -1;
            }
        } catch (SQLException ex) {
            System.err.println(ex);
            return -1;
        }
    }
    
    public static void getCustomer(ResultSet rs, Customer c) throws SQLException {
        c.setAddressline1(rs.getString("addressline1"));
        c.setAddressline2(rs.getString("addressline2"));
        c.setCity(rs.getString("city"));
        c.setCreditlimit(rs.getInt("credit_limit"));
        c.setCustomerid(rs.getInt("customer_id"));
        c.setDiscountcode(rs.getString("discount_code"));
        c.setEmail(rs.getString("email"));
        c.setFax(rs.getString("fax"));
        c.setName(rs.getString("name"));
        c.setPhone(rs.getString("phone"));
        c.setState(rs.getString("state"));
        c.setZip(rs.getString("zip"));
    }

    public static Customer findById(int id) {
        Customer c = null;
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM customer WHERE customer_id = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                getCustomer(rs, c);
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return c;
    }

    public static List<Customer> findByName(String name) {
        List<Customer> l = new ArrayList<>();
        Customer c = null;
        Connection con = ConnectionBuilder.getConnection();
        String sql = "SELECT * FROM customer WHERE name LIKE ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                c = new Customer();
                getCustomer(rs, c);
                l.add(c);
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return l;
    }

    public boolean newCustomer() {
        String insert = "INSERT INTO customer (discount_code, zip, name, addressline1, addressline2, "
                + "city, state, phone, fax, email, credit_limit, customer_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        String update = "UPDATE customer SET discount_code = ?, zip = ?, name = ?, addressline1 = ?, "
                + "addressline2 = ?, city = ?, state = ?, phone = ?, fax = ?, email = ?, credit_limit = ? WHERE customer_id = ?";
        Connection con = ConnectionBuilder.getConnection();
        PreparedStatement stm = null;
        try {
            if (this.isNew) {
                stm = con.prepareStatement(insert);
                this.customerid = NEXT_ID++;

            } else {
                stm = con.prepareStatement(update);
            }
            stm.setString(1, this.discountcode);
            stm.setString(2, this.zip);
            stm.setString(3, this.name);
            stm.setString(4, this.addressline1);
            stm.setString(5, this.addressline2);
            stm.setString(6, this.city);
            stm.setString(7, this.state);
            stm.setString(8, this.phone);
            stm.setString(9, this.fax);
            stm.setString(10, this.email);
            stm.setInt(11, this.creditlimit);
            stm.setInt(12, this.customerid);
            int done = stm.executeUpdate();
            return done > 0;
        } catch (SQLException ex) {
            System.err.println(ex);
            return false;
        }

    }
    
    public static boolean isInteger(String num){
        try{
            Integer.parseInt(num);
            return true;
        }catch (NumberFormatException ex){
            return false;
        }
    }
    
    public static Customer parseCustomer(HttpServletRequest request){
        String name=request.getParameter("name");
        if(name == null || name.length() == 0){
            return null;
        }else{
            Customer c = new Customer();
            if(isInteger(request.getParameter("customerid"))){
                int id = Integer.parseInt(request.getParameter("customerid"));
                c.setIsNew(false);
            }
            c.setName(name);
            c.setAddressline1(request.getParameter("addressline1"));
            c.setAddressline2(request.getParameter("addressline2"));
            c.setCity(request.getParameter("city"));
            c.setCreditlimit(Integer.parseInt(request.getParameter("creditlimit")));
            c.setDiscountcode(request.getParameter("discountcode"));
            c.setEmail(request.getParameter("email"));
            c.setFax(request.getParameter("fax"));
            c.setPhone(request.getParameter("phone"));
            c.setState(request.getParameter("state"));
            c.setZip(request.getParameter("zip"));
            return c;
        }
    }
}
