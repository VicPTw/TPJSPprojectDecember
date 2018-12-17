/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.MainPage;
import bean.Partner;
import bean.SubService;
import dao.DaoManager;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 *
 * @author user
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
@MultipartConfig
public class MainController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = getServletContext().getInitParameter("imgpath");
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = null;
        final String aboutTitle = request.getParameter("aboutTitle");
        final String operation = request.getParameter("operation");
        if (!"about".equals(aboutTitle)) {
            final Part filePart = request.getPart("file");
            final String fileName = getFileName(filePart);
            OutputStream os = null;
            InputStream is = null;
            final PrintWriter out = response.getWriter();
            if (!fileName.equals("")) {
                try {
                    String path = a + fileName;
                    File file = new File(path);
                    System.out.println("存檔資訊(file):" + file);
                    os = new FileOutputStream(file);
                    is = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = is.read(bytes)) != -1) {
                        os.write(bytes, 0, read);
                    }

                    switch (operation) {
                        case "UpdateMainPage":
                            request.setAttribute("UpdateMainPageOK", "主頁面修改成功。");
                            break;
                        case "SavePartner":
                            request.setAttribute("SavePartnerOK", "新增合作夥伴成功。");
                            break;
                        case "UpdatePartner":
                            request.setAttribute("UpdatePartnerOK", "合作夥伴修改成功。");
                            break;
                        case "SaveServices":
                            request.setAttribute("SaveSubServiceOK", "新增服務成功。");
                            break;
                        case "UpdateServices":
                            request.setAttribute("UpdateServicesOK", "修改服務成功。");
                            break;
                    }

                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    rd.forward(request, response);

                } catch (FileNotFoundException e) {
//                	
//                	request.setAttribute("ERROR", "上傳出現問題" + "<br>" + fileName
//                			+ "<br>ERROR" + e.getMessage());
                    out.println("上傳出現問題" + "<br>" + fileName);
                    out.println("<br>ERROR" + e.getMessage());
                    log("檔案出現問題:" + e);

                } finally {
                    if (os != null) {
                        os.close();
                    }
                    if (is != null) {
                        is.close();
                    }
                    if (out != null) {
                        out.close();
                    }

                }
            }

            switch (operation) {

                case "UpdateMainPage":
                    final String title = request.getParameter("title");
                    MainPage Title = DaoManager.getInstance().getMainPageDaoImp().getRecordById(title);
                    final String content = request.getParameter("mcontent");
                    if (!content.equals("")) {
                        Title.setMainContent(content);
                    }
                    if (!fileName.equals("")) {
                        Title.setMainImg("img/" + fileName);
                    }

                    DaoManager.getInstance().getMainPageDaoImp().update(Title);
                    request.setAttribute("UpdateMainPageOK", "主頁面修改成功。");
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    rd.forward(request, response);
                    break;

                case "SavePartner":

                    Partner p = new Partner();
                    final String pTitle = request.getParameter("Partnertitle");
                    final String pcontent = request.getParameter("Partnercontent");
                    final String pLink = request.getParameter("Partnerlink");
                    if (!pTitle.equals("")) {
                        p.setpTitle(pTitle);
                    }
                    if (!pcontent.equals("")) {
                        p.setpContent(pcontent);
                    }
                    if (!fileName.equals("")) {
                        p.setpImg("img/" + fileName);
                    }
                    if (!pLink.equals("")) {
                        p.setpLink(pLink);
                    }

                    DaoManager.getInstance().getPartnerDaoImp().save(p);
                    request.setAttribute("SavePartnerOK", "新增合作夥伴成功。");
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    rd.forward(request, response);

                    break;

                case "UpdatePartner":
                    final String Pedittitle = request.getParameter("Pname");
                    Partner PTitle = DaoManager.getInstance().getPartnerDaoImp().getRecordById(Pedittitle);

                    final String Partneredittitle = request.getParameter("Partneredittitle");
                    final String Partnerditcontent = request.getParameter("Partnerditcontent");
                    final String Partnereditlink = request.getParameter("Partnereditlink");
                    if (!Partneredittitle.equals("")) {
                        PTitle.setpTitle(Partneredittitle);
                    }
                    if (!Partnerditcontent.equals("")) {
                        PTitle.setpContent(Partnerditcontent);
                    }

                    if (!fileName.equals("")) {
                        PTitle.setpImg("img/" + fileName);
                    }
                    if (!Partnereditlink.equals("")) {
                        PTitle.setpLink(Partnereditlink);
                    }

                    DaoManager.getInstance().getPartnerDaoImp().update(PTitle);
                    request.setAttribute("UpdatePartnerOK", "合作夥伴修改成功。");
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    rd.forward(request, response);
                    break;

                case "SaveServices":

                    SubService subService = new SubService();
                    final String subid = request.getParameter("sid");
                    final String svTitle = request.getParameter("Servicetitle");
                    final String svcontent = request.getParameter("Servicecontent");
                    if (!subid.equals("")) {
                        subService.setsId(subid);
                    }
                    if (!svTitle.equals("")) {
                        subService.setSbTitle(svTitle);
                    }
                    if (!svcontent.equals("")) {
                        subService.setSbContent(svcontent);
                    }
                    if (!fileName.equals("")) {
                        subService.setSbImg("../img/" + fileName);
                    }
                    DaoManager.getInstance().getSubServiceDaoImp().save(subService);
                    request.setAttribute("SaveSubServiceOK", "新增服務成功。");
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    rd.forward(request, response);

                    break;

                case "UpdateServices":

                    final String sbTitlec = request.getParameter("sbTitlec");
                    SubService sb = DaoManager.getInstance().getSubServiceDaoImp().getRecordById(sbTitlec);
                    if (sbTitlec != null) {

                        final String Servicesedittitle = request.getParameter("Servicesedittitle");
                        final String Serviceseditcontent = request.getParameter("Serviceseditcontent");

                        if (!Servicesedittitle.equals("")) {
                            sb.setSbTitle(Servicesedittitle);
                        }
                        if (!Serviceseditcontent.equals("")) {
                            sb.setSbContent(Serviceseditcontent);
                        }
                        if (!fileName.equals("")) {
                            sb.setSbImg("../img/" + fileName);
                        }

                        DaoManager.getInstance().getSubServiceDaoImp().update(sb);
                        request.setAttribute("UpdateServicesOK", "修改服務成功。");
                        rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                        rd.forward(request, response);
                        break;
                    }

            }

        } else {
            //about    

            MainPage Title = DaoManager.getInstance().getMainPageDaoImp().getRecordById(aboutTitle);
            final String content = request.getParameter("mcontent");
            if (!content.equals("")) {
                Title.setMainContent(content);
            }
            DaoManager.getInstance().getMainPageDaoImp().update(Title);
            request.setAttribute("UpdateMainPageOK", "主頁面修改成功");
            rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
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
