/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Service;
import bean.SubService;
import dao.DaoManager;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pass.Check;

/**
 *
 * @author user
 */
@WebServlet(name = "removeServiceController", urlPatterns = {"/removeServiceController"})
public class removeServiceController extends HttpServlet {

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
        RequestDispatcher rd = null;
        //check password
        Check check = new Check();
        String password = check.getPassword();
        String sTitlec = request.getParameter("sTitlec");
        String sbTitlec = request.getParameter("sbTitlec");
        Service s = DaoManager.getInstance().getServiceDaoImp().getRecordById(sTitlec);
        SubService sb = DaoManager.getInstance().getSubServiceDaoImp().getRecordById(sbTitlec);

        if (sTitlec != null) {
            List<SubService> sbList = DaoManager.getInstance().getSubServiceDaoImp().getAllRecordsByRef(sTitlec);
            request.setAttribute("sbList", sbList);
            rd = request.getRequestDispatcher("/background/remove/removeServices.jsp");
        } else if (password.equals(request.getParameter("pwd")) && sbTitlec != null) {
            DaoManager.getInstance().getSubServiceDaoImp().delete(sb);
            request.setAttribute("removes", "已經刪除成功");
            rd = request.getRequestDispatcher("/background/remove/removeServices.jsp");
        } else {
            request.setAttribute("removes", "刪除失敗，請確認密碼是否正確");
            rd = request.getRequestDispatcher("/background/remove/removeServices.jsp");
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
