
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

/**
 *
 * @author kim
 */
@WebServlet(name = "Servicesedit", urlPatterns = {"/Servicesedit"})
public class Servicesedit extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = null;
        String sTitlec = request.getParameter("sTitlec");
        Service s = DaoManager.getInstance().getServiceDaoImp().getRecordById(sTitlec);
        String sbTitlec = request.getParameter("sbTitlec");
        SubService sb = DaoManager.getInstance().getSubServiceDaoImp().getRecordById(sbTitlec);

        if (sTitlec != null) {
            List<SubService> sbList = DaoManager.getInstance().getSubServiceDaoImp().getAllRecordsByRef(sTitlec);
            request.setAttribute("sbList", sbList);
            rd = request.getRequestDispatcher("/background/edit/editServices.jsp");
        } else if (sbTitlec != null) {
               
               
            //   DaoManager.getInstance().getSubServiceDaoImp().update(sb); 
                
                
                
                String Servicesedittitle= request.getParameter("Servicesedittitle");
                String Serviceseditcontent= request.getParameter("Serviceseditcontent");
                String Serviceseditimg= request.getParameter("Serviceseditimg");
             
                        
                sb.setSbTitle(Servicesedittitle);
                sb.setSbContent(Serviceseditcontent);
                sb.setSbImg(Serviceseditimg);
                
                
                
                DaoManager.getInstance().getSubServiceDaoImp().update(sb); 
                request.setAttribute("ServicesediOK", Servicesedittitle+ "修改成功");
                rd =request.getRequestDispatcher("background/backgroundindex.jsp");
                rd.forward(request, response);
            
                    
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
