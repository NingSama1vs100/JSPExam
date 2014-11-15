/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author ning jittima
 */
public class ConnectionBuilder {
    public static Connection getConnection(){
        Connection c = null;
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource)ctx.lookup("jdbc/sample");
            c = ds.getConnection();
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
        return c;
    }
}
