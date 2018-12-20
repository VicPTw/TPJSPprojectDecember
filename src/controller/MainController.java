/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.MainPage;
import bean.Partner;
import bean.Service;
import bean.SubService;
import dao.DaoManager;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.util.List;
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

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
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
        final String DoubleSelect = request.getParameter("DoubleSelect");
        final String sTitlec = request.getParameter("sTitlec");
        final String Updateselect = request.getParameter("Updateselect");

        //DoubleSelect
        if ("Services".equals(DoubleSelect)) {
            Service s = DaoManager.getInstance().getServiceDaoImp().getRecordById(sTitlec);
            if (sTitlec != null) {
                List<SubService> sbList = DaoManager.getInstance().getSubServiceDaoImp().getAllRecordsByRef(sTitlec);
                request.setAttribute("Updateselect", Updateselect);
                request.setAttribute("sbList", sbList);
                rd = request.getRequestDispatcher("/CMS/Update/UpdateServices.jsp");
            }   
        } else if (!"about".equals(aboutTitle)) {
            final Part filePart = request.getPart("file");
            final String fileName = getFileName(filePart);
            OutputStream os = null;
            InputStream is = null;
            if (!"".equals(fileName)) {
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

                } catch (FileNotFoundException e) {
                      log("檔案出現問題:" + e);
                } finally {
                    if (os != null) {
                        os.close();
                    }
                    if (is != null) {
                        is.close();
                    }

                }
            }

            switch (operation) {

                case "UpdateMainPage":
                    final String title = request.getParameter("title");
                    MainPage Title = DaoManager.getInstance().getMainPageDaoImp().getRecordById(title);
                    final String content = request.getParameter("mcontent");
                    if ("".equals(content) && "".equals(fileName)) {
                        request.setAttribute("None", "並無進行任何修改。");
                    } else {
                        if (!"".equals(content)) {
                            Title.setMainContent(content);
                        }
                        if (!"".equals(fileName)) {
                            Title.setMainImg("img/" + fileName);
                        }
                        request.setAttribute("UpdateMainPageOK", "主頁面修改成功。");
                    }
                    DaoManager.getInstance().getMainPageDaoImp().update(Title);
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    
                    break;

                case "SavePartner":

                    Partner p = new Partner();
                    final String pTitle = request.getParameter("Partnertitle");
                    final String pcontent = request.getParameter("Partnercontent");
                    final String pLink = request.getParameter("Partnerlink");
                    if (!"".equals(pTitle)) {
                        p.setpTitle(pTitle);
                    }
                    if (!"".equals(pcontent)) {
                        p.setpContent(pcontent);
                    }
                    if (!"".equals(fileName)) {
                        p.setpImg("img/" + fileName);
                    }
                    if (!"".equals(pLink)) {
                        p.setpLink(pLink);
                    }

                    DaoManager.getInstance().getPartnerDaoImp().save(p);
                    request.setAttribute("SavePartnerOK", "新增合作夥伴成功。");
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    break;
                    
                case "UpdatePartner":
                    final String Pedittitle = request.getParameter("Pname");
                    Partner PTitle = DaoManager.getInstance().getPartnerDaoImp().getRecordById(Pedittitle);

                    final String Partneredittitle = request.getParameter("Partneredittitle");
                    final String Partnerditcontent = request.getParameter("Partnerditcontent");
                    final String Partnereditlink = request.getParameter("Partnereditlink");
                    if ("".equals(Partneredittitle) && "".equals(Partnerditcontent) && "".equals(fileName) && "".equals(Partnereditlink)) {
                        request.setAttribute("None", "並無進行任何修改。");
                    } else {
                        if (!"".equals(Partneredittitle)) {
                            PTitle.setpTitle(Partneredittitle);
                        }
                        if (!"".equals(Partnerditcontent)) {
                            PTitle.setpContent(Partnerditcontent);
                        }

                        if (!"".equals(fileName)) {
                            PTitle.setpImg("img/" + fileName);
                        }
                        if (!"".equals(Partnereditlink)) {
                            PTitle.setpLink(Partnereditlink);
                        }
                        request.setAttribute("UpdatePartnerOK", "合作夥伴修改成功。");
                    }

                    DaoManager.getInstance().getPartnerDaoImp().update(PTitle);
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    break;

                case "SaveServices":

                    SubService subService = new SubService();
                    final String subid = request.getParameter("sid");
                    final String svTitle = request.getParameter("Servicetitle");
                    final String svcontent = request.getParameter("Servicecontent");
                    if (!"".equals(subid)) {
                        subService.setsId(subid);
                    }
                    if (!"".equals(svTitle)) {
                        subService.setSbTitle(svTitle);
                    }
                    if (!"".equals(svcontent)) {
                        subService.setSbContent(svcontent);
                    }
                    if (!"".equals(fileName)) {
                        subService.setSbImg("../img/" + fileName);
                    }
                    DaoManager.getInstance().getSubServiceDaoImp().save(subService);
                    request.setAttribute("SaveSubServiceOK", "新增服務成功。");
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");

                    break;

                case "UpdateServices":
                    final String sbTitlec = request.getParameter("sbTitlec");
                    SubService sb = DaoManager.getInstance().getSubServiceDaoImp().getRecordById(sbTitlec);
                    final String Servicesedittitle = request.getParameter("Servicesedittitle");
                    final String Serviceseditcontent = request.getParameter("Serviceseditcontent");
                    if ("".equals(Servicesedittitle) && "".equals(Serviceseditcontent) && "".equals(Serviceseditcontent) && "".equals(fileName)) {
                        request.setAttribute("None", "並無進行任何修改。");
                    } else {

                        if (!"".equals(Servicesedittitle)) {
                            sb.setSbTitle(Servicesedittitle);
                        }
                        if (!"".equals(Serviceseditcontent)) {
                            sb.setSbContent(Serviceseditcontent);
                        }
                        if (!"".equals(fileName)) {
                            sb.setSbImg("../img/" + fileName);
                        }

                        request.setAttribute("UpdateServicesOK", "修改服務成功。");
                    }
                    DaoManager.getInstance().getSubServiceDaoImp().update(sb);
                    rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");
                    break;
                    
                    default:
                        request.setAttribute("ERROR", "發生無法預期的錯誤");
                        rd = request.getRequestDispatcher("CMS/CMSindex.jsp");

                    
                   
            }

        } else {
            //about    

            MainPage Title = DaoManager.getInstance().getMainPageDaoImp().getRecordById(aboutTitle);
            final String content = request.getParameter("mcontent");
            if (!"".equals(content)) {
                Title.setMainContent(content);
                request.setAttribute("UpdateMainPageOK", "主頁面修改成功");
            } else {
                request.setAttribute("None", "並未進行修改。");
            }
            DaoManager.getInstance().getMainPageDaoImp().update(Title);
            rd = request.getRequestDispatcher("CMS/Successful/Successful.jsp");

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
