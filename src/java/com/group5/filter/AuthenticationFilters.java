/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.filter;

import com.group5.users.UserDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class AuthenticationFilters implements Filter {

    private static final boolean debug = true;
    private final List<String> STUDENT;
    private final List<String> LEADER;
    private final List<String> MENTOR;
    private final List<String> ADMIN;
    private static final String STU = "STU";
    private static final String AD = "AD";
    private static final String LD = "LD";
    private static final String MT = "MT";
    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public AuthenticationFilters() {
        STUDENT = new ArrayList<>();
        STUDENT.add("GetListQuestForStudent.jsp");
        STUDENT.add("accountStudent.jsp");
        STUDENT.add("askQuestion.jsp");
        STUDENT.add("changeRole.jsp");
        STUDENT.add("error.jsp");
        STUDENT.add("eventDetail.jsp");
        STUDENT.add("followupDetail.jsp");
        STUDENT.add("index.jsp");
        STUDENT.add("notification.jsp");
        STUDENT.add("MainController");
        STUDENT.add("LoginController");
        STUDENT.add("LoginGoogleHandler");
        STUDENT.add("AskQuestionController");
        STUDENT.add("ChangeRoleController");
        STUDENT.add("ConfirmAskQuestionController");
        STUDENT.add("ConfirmUnbanRequestController");
        STUDENT.add("FollowOrUnfollowController");
        STUDENT.add("ListQAStudentController");
        STUDENT.add("LogoutController");
        STUDENT.add("RegisterController");
        STUDENT.add("ShowFollowEventController");
        STUDENT.add("ShowFollowupController");
        STUDENT.add("ShowFollowEventController");
        STUDENT.add("ShowRegisterEventController");

        LEADER = new ArrayList<>();
        LEADER.add("GetListQuestForLeader.jsp");
        LEADER.add("accountLeader.jsp");
        LEADER.add("addFollowup.jsp");
        LEADER.add("addMentor.jsp");
        LEADER.add("askQuestionLeader.jsp");
        LEADER.add("changeRoleLeader.jsp");
        LEADER.add("createEvent.jsp");
        LEADER.add("editEvent.jsp");
        LEADER.add("editFollowup.jsp");
        LEADER.add("error.jsp");
        LEADER.add("eventDetailLeader.jsp");
        LEADER.add("followupDetailLeader.jsp");
        LEADER.add("leader.jsp");
        LEADER.add("notificationLeader.jsp");
        LEADER.add("showListEditEvent.jsp");
        LEADER.add("MainController");
        LEADER.add("LoginController");
        LEADER.add("LoginGoogleHandler");
        LEADER.add("AskQuestionController");
        LEADER.add("ChangeRoleController");
        LEADER.add("ConfirmAskQuestionController");
        LEADER.add("ConfirmUnbanRequestController");
        LEADER.add("FollowOrUnfollowController");
        LEADER.add("ListQAStudentController");
        LEADER.add("LogoutController");
        LEADER.add("RegisterController");
        LEADER.add("ShowFollowEventController");
        LEADER.add("ShowFollowupController");
        LEADER.add("ShowFollowEventController");
        LEADER.add("ShowRegisterEventController");
        LEADER.add("AddFollowupController");
        LEADER.add("AddMentorController");
        LEADER.add("CancelEventController");
        LEADER.add("CompleteEventController");
        LEADER.add("ConfirmAddMentorController");
        LEADER.add("ConfirmCreateController");
        LEADER.add("ConfirmEditEventController");
        LEADER.add("ConfirmEditFollowupController");
        LEADER.add("ConfirmRemoveMentorController");
        LEADER.add("CreateEventController");
        LEADER.add("EditEventController");
        LEADER.add("EditFollowupController");
        LEADER.add("RemoveMentorController");
        LEADER.add("StartEventController");
        LEADER.add("ShowListEditEventController");

        MENTOR = new ArrayList<>();
        MENTOR.add("AnsweredQuestion.jsp");
        MENTOR.add("GetListQuestForMentor.jsp");
        MENTOR.add("accountMentor.jsp");
        MENTOR.add("MentorAttendedEvent.jsp");
        MENTOR.add("answerQuestion.jsp");
        MENTOR.add("askQuestionMentor.jsp");
        MENTOR.add("changeRoleMentor.jsp");
        MENTOR.add("editAnsweredQA.jsp");
        MENTOR.add("error.jsp");
        MENTOR.add("eventDetailMentor.jsp");
        MENTOR.add("followupDetailMentor.jsp");
        MENTOR.add("listQA.jsp");
        MENTOR.add("mentor.jsp");
        MENTOR.add("notificationMentor.jsp");
        MENTOR.add("MainController");
        MENTOR.add("LoginController");
        MENTOR.add("LoginGoogleHandler");
        MENTOR.add("AskQuestionController");
        MENTOR.add("ChangeRoleController");
        MENTOR.add("ConfirmAskQuestionController");
        MENTOR.add("ConfirmUnbanRequestController");
        MENTOR.add("FollowOrUnfollowController");
        MENTOR.add("ListQAStudentController");
        MENTOR.add("LogoutController");
        MENTOR.add("RegisterController");
        MENTOR.add("ShowFollowEventController");
        MENTOR.add("ShowFollowupController");
        MENTOR.add("ShowFollowEventController");
        MENTOR.add("ShowRegisterEventController");
        MENTOR.add("AnswerQAController");
        MENTOR.add("EditAnswerController");
        MENTOR.add("EditQAController");
        MENTOR.add("JoinAnEventController");
        MENTOR.add("QandAMentorController");
        MENTOR.add("SearchEventMentorAttendController");


        ADMIN = new ArrayList<>();
        ADMIN.add("accountAdmin.jsp");
        ADMIN.add("admin.jsp");
        ADMIN.add("error.jsp");
        ADMIN.add("MainContrADMINoller");
        ADMIN.add("LoginController");
        ADMIN.add("LoginGoogleHandler");
        ADMIN.add("SearchUserController");
        ADMIN.add("login.jsp");      
        ADMIN.add("DeleteUserController");
        ADMIN.add("RestoreUserController");
        ADMIN.add("UpdateUserController");
       
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenticationFilters:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenticationFilters:DoAfterProcessing");
        }

    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

//        chain.doFilter(request, response);
        try {

            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;

            String uri = req.getRequestURI();
            if (uri.contains(".jpg") || uri.contains(".png") || uri.contains(".css") || uri.contains(".js") || uri.contains(".svg")) {
                chain.doFilter(request, response);
            } else {
//                if (uri.contains("LoginGoogleHandler")) {
//                    chain.doFilter(request, response);
//                }
                if (uri.contains("login.jsp") || uri.contains("MainController")
                        || uri.contains("LoginController") || uri.contains("LoginGoogleHandler")
                        || uri.contains("error.jsp") || uri.contains("unban.jsp") || uri.contains("SearchController")) {
                    chain.doFilter(request, response);
                    return;
                }
                int index = uri.lastIndexOf("/");
                String resource = uri.substring(index + 1);
                HttpSession session = req.getSession();
                if (session == null || session.getAttribute("LOGIN_USER") == null) {
                    res.sendRedirect("login.jsp");
                } else {
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    String roleID = loginUser.getRoleID();
                    if (AD.equals(roleID) && ADMIN.contains(resource)) {
                        chain.doFilter(request, response);
                    } else if (STU.equals(roleID) && STUDENT.contains(resource)) {
                        chain.doFilter(request, response);

                    } else if (MT.equals(roleID) && MENTOR.contains(resource)) {
                        chain.doFilter(request, response);
                    } else if (LD.equals(roleID) && LEADER.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect("login.jsp");
                    }
                }
            }
        } catch (Exception e) {
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthenticationFilters:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenticationFilters()");
        }
        StringBuffer sb = new StringBuffer("AuthenticationFilters(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
