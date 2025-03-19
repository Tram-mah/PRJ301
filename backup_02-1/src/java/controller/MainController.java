
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamsDAO;
import dao.UserDAO;
import dto.ExamsDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public ExamsDAO edao = new ExamsDAO();
    public UserDAO udao = new UserDAO();

    private static final String LOGIN_PAGE = "login.jsp";
    
    public static UserDTO getUser(String strUsername) {
        UserDAO udao = new UserDAO();
        UserDTO udto = udao.readByID(strUsername);
        return udto;
    }
    
    public static boolean isValidLogin(String strUsername, String strPassword) {
        UserDTO user = getUser(strUsername);
        System.out.println(user);
        return user != null && user.getPassword().equals(strPassword);
    }
    
    public static UserDTO getUser(HttpSession session){
        Object obj = session.getAttribute("user");
        return (obj != null)?(UserDTO)obj:null;
    }
    
    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUsername = request.getParameter("txtUsername");
        String strPassword = request.getParameter("txtPassword");
        if (AuthUtils.isValidLogin(strUsername, strPassword)) {
            url = "search.jsp";
            UserDTO user = AuthUtils.getUser(strUsername);
            request.getSession().setAttribute("user", user);
            // search
            url = "search.jsp";
            processSearch(request, response);
        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
            url = "login.jsp";
        }
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate(); // Hủy session
            url = "login.jsp";
        }
        return url;
    }

    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            url = "search.jsp";
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<ExamsDTO> exam = edao.searchByTitle2(searchTerm);
            request.setAttribute("exam", exam);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }

//    private String processDelete(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String url = LOGIN_PAGE;
//        HttpSession session = request.getSession();
//        if (AuthUtils.isAdmin(session)) {
//            String id = request.getParameter("id");
//            edao.update(id);
//
//            // search
//            url = "search.jsp";
//            processSearch(request, response);
//
//        }
//        return url;
//    }

    private String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                int exam_id = Integer.parseInt(request.getParameter("txtExamID"));
                String exam_title = request.getParameter("txtExamTitle");
                String Subject = request.getParameter("txtSubject");
                int category_id = Integer.parseInt(request.getParameter("txtCategoryID"));
                int total_marks = Integer.parseInt(request.getParameter("txtTotalMarks"));
                if (exam_id == 0) {
                    checkError = true;
                    request.setAttribute("txtExamID_error", "Exam ID cannot be empty.");
                }
                ExamsDTO exam = new ExamsDTO(exam_id, exam_title, Subject, category_id, total_marks);
                if (!checkError) {
                    edao.create(exam);
                    // search
                    url = "search.jsp";
                    processSearch(request, response);
                } else {
                    request.setAttribute("exam", exam);
                    url = "examForm.jsp";
                }
            } catch (Exception e) {
            }
        }
        return url;
    }

    private String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                int exam_id = Integer.parseInt(request.getParameter("txtExamID"));
                String exam_title = request.getParameter("txtExamTitle");
                String Subject = request.getParameter("txtSubject");
                int category_id = Integer.parseInt(request.getParameter("txtCategoryID"));
                int total_marks = Integer.parseInt(request.getParameter("txtTotalMarks"));
                if (exam_id == 0) {
                    checkError = true;
                    request.setAttribute("txtBookID_error", "Book ID cannot be empty.");
                }
                ExamsDTO exam = new  ExamsDTO(exam_id, exam_title, Subject, category_id, total_marks);
                if (!checkError) {
                    edao.update(exam);
                    // search
                    url = "search.jsp";
                    processSearch(request, response);
                } else {
                    request.setAttribute("exam", exam);
                    url = "examForm.jsp";
                }
            } catch (Exception e) {
            }
        }
        return url;
    }

    private String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            String id = request.getParameter("id");
            ExamsDTO exam = edao.readByID(id);
            if (exam != null) {
                request.setAttribute("exam", exam);
                request.setAttribute("action", "update");
                url = "examForm.jsp";
            } else {
                // search
                url = processSearch(request, response);
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } 
//                else if (action.equals("delete")) {
//                    url = processDelete(request, response);
//                    
//                } 
                else if (action.equals("add")) {
                    url = processAdd(request, response);
                } else if (action.equals("edit")) {
                    url = processEdit(request, response);
                } else if (action.equals("update")) {
                    url = processUpdate(request, response);
                }
            }
        } catch (Exception e) {
            log("Error in MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
