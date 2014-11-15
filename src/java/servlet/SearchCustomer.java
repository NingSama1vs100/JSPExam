/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;

/**
 *
 * @author ning jittima
 */
public class SearchCustomer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        if(s.getAttribute("user")==null){
            s.setAttribute("nextpage", "/SearchCustomer.jsp");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        
        String error = null;
        String search = request.getParameter("search");
        
        if(search == null || search.length() == 0){
            getServletContext().getRequestDispatcher("/SearchCustomer.jsp").forward(request, response);
        }else{
            if(Customer.isInteger(search)){
                Customer c = Customer.findById(Integer.parseInt(search));
                if(c == null){
                    error = "Customer ID " + search + " Not Found!";
                    request.setAttribute("error", error);
                    getServletContext().getRequestDispatcher("/SearchCustomer.jsp").forward(request, response);
                }else{
                    request.setAttribute("customer", c);
                    getServletContext().getRequestDispatcher("/ShowCustomer.jsp").forward(request, response);
                }
            }else{
                List<Customer> list = Customer.findByName(search);
                if(list.isEmpty()){
                    error = "Customer Name " + search + " Not Found!";
                    request.setAttribute("error", error);
                    getServletContext().getRequestDispatcher("/SearchCustomer.jsp").forward(request, response);
                }else{
                    request.setAttribute("customer", list);
                    getServletContext().getRequestDispatcher("/ListCustomer.jsp").forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
