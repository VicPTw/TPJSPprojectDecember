package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pass.Check;

/**
 *
 * @author diluter
 */
@WebServlet(name = "Validation", urlPatterns = {"/Validation"})
public class Validation extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

        Check check = new Check();
        RequestDispatcher rd = null;
        String password = check.getPassword();
        String logout = request.getParameter("logout");
        String login = request.getParameter("login");
        HttpSession session = request.getSession();
        String pwd = request.getParameter("pwd");

        if ("login".equals(login)) {
            if (check.getPassword().isEmpty()) {
                request.setAttribute("pwdError", "密碼不得為空");
                rd = request.getRequestDispatcher("login/login.jsp");
            }
            if (password.equals(request.getParameter("pwd"))) {

                session.setAttribute("pwd", pwd);
                rd = request.getRequestDispatcher("CMS/CMSindex.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("pwdError", "密碼錯誤" + "\n" + "您目前輸入的是:" + request.getParameter("pwd"));
                rd = request.getRequestDispatcher("login/login.jsp");
                rd.forward(request, response);
            }
        } else if ("logout".equals(logout)) {

            pwd = (String) session.getAttribute("pwd");
            session.invalidate();
            rd = request.getRequestDispatcher("login/login.jsp");
        }
        rd.forward(request, response);

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
