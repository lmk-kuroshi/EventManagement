/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import com.group5.event.QandADAO;
import com.group5.event.QandADTO;
import com.group5.users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ListQAStudentController", urlPatterns = {"/ListQAStudentController"})
public class ListQAStudentController extends HttpServlet {

    private final static String ERROR = "GetListQuestForStudent.jsp";
//    private final static String SUCCESS = "GetListQuestForStudent.jsp";
    private final static String STUDENT = "GetListQuestForStudent.jsp";
    private final static String LEADER = "GetListQuestForLeader.jsp";
    private final static String MENTOR = "GetListQuestForMentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            QandADAO dao = new QandADAO();
            List<QandADTO> list = dao.getListAnsweredForStudent();
            if (!list.isEmpty()) {
                List<QandADTO> listMentorQA = new ArrayList<QandADTO>();
                for (QandADTO QAM : list) {

                    if ((QAM.getStudentID()).equals(loginUser.getId())) {
                        listMentorQA.add(QAM);
                    }
                }
                request.setAttribute("LIST_QA_STUDENT", listMentorQA);
                if (loginUser.getRoleID().equals("STU")) {
                    url = STUDENT;
                } else if (loginUser.getRoleID().equals("LD")) {
                    url = LEADER;
                } else if (loginUser.getRoleID().equals("MT")) {
                    url = MENTOR;
                }
            }
        } catch (Exception e) {
            log("Error at ListQAStudentController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
