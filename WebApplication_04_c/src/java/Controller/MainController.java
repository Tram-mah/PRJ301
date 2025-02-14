/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    public boolean isValidLogin(String username, String password){
        return username.equals("admin")&&password.equals("12345678");
        
    }
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Username= request.getParameter("txtUsername");
        String Password = request.getParameter("txtPassword");
        
        if(Username.trim().length() == 0 || Password.trim().length() == 0 ){
            out.println("Please enter your Infomation!");
            return;
        }
        if(Password.trim().length()<8){
            out.println("Your password is weak");
            return;
        }
        
        //giao diện Login
        if( isValidLogin(Username,Password)){
            //forward search.html
            RequestDispatcher rd = request.getRequestDispatcher("search.html");
            rd.forward(request, response);                    
        }else{
            
            
            
            // forward / redirect invalid.html
            
            
            // forward search.html
            // RequestDispatcher rd = request.getRequestDispatcher("invalid.html");
            // rd.forward(request, response); 
            
            // redirect search.html
            //redirect chuyển hướng cái trang
            
            
            
            response.sendRedirect("invalid.html");
            
            
            
            
            //compare RequestDispatcher /  response.sendRedirect? khac biet? khi nao nen dung?
            //RequestDispatcher: Chuyển tiếp yêu cầu trong cùng một ứng dụng mà 
            //không thay đổi URL trên trình duyệt. Dữ liệu request được duy trì. 
            //Dùng khi chuyển tiếp giữa các servlet/JSP trong ứng dụng.
            
            //response.sendRedirect(): Chuyển hướng yêu cầu đến một URL mới, 
            //thay đổi URL trên thanh địa chỉ và yêu cầu mới được gửi đi. 
            // Dữ liệu request không được giữ lại. 
            //  Dùng khi chuyển hướng đến trang khác hoặc ứng dụng khác.
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
