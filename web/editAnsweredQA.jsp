<%-- 
    Document   : editAnsweredQA
    Created on : Oct 4, 2021, 10:27:48 PM
    Author     : Nghia
--%>

<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.role.RoleDAO"%>
<%@page import="com.group5.event.QandADTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Answered Q&A Page</title>
        <link href="css/AnswerQuestionStyle.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            UserDTO mentor = (UserDTO) session.getAttribute("LOGIN_USER");
            String editAnsweredQA = request.getParameter("editAnsweredQA");
            if (editAnsweredQA == null) {
                editAnsweredQA = "";
            }
        %>
        <%
            RoleDAO ro = new RoleDAO();
            String roleName = ro.getRoleName(mentor.getRoleID());
        %>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>  

        <%
            List<CategoryDTO> categoryList = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
            CategoryDAO catedao = new CategoryDAO();
            categoryList = catedao.getListCategory();
            request.setAttribute("LIST_CATEGORY", categoryList);
        %>

        <div class="sidebar close">
            <div class="logo-details">
                <img class="logo" src="css/img/logo.png"> 
                <span class="logo_name">Event</span>
            </div>
            <div class="sidebar-line"></div>
            <ul class="nav-links">
                <div class="sidebar-align">
                    <li>

                        <a href="SearchController">
                            <i class='bx bx-trending-up'></i>
                            <span class="links_name">Trending</span>
                        </a>

                        <span class="tooltip">Trending</span>
                    </li>
                    <li>
                        <div class="iocn-link">
                            <a href="#" class="open-submenu">
                                <i class='bx bx-collection' ></i>
                                <span class="links_name">Category</span>  
                                <i class='bx bxs-chevron-down arrow' ></i>
                            </a>
                        </div>
                        <ul class="sub-menu">

                            <li><a class="link_name" href="#">Category</a></li>
                                <%
                                    if (categoryList != null) {
                                        for (CategoryDTO category : categoryList) {
                                %>
                            <li><a href="SearchController?categoryName=<%=category.getCategoryName()%>"><%=category.getCategoryName()%></a></li>
                                <%
                                        }
                                    }
                                %>
                        </ul>
                    </li>
                    <li>
                        <a href="ShowFollowEventController">
                            <i class='las la-bell' ></i>
                            <span class="links_name">Notify</span>
                        </a>
                        <span class="tooltip">Notify</span>
                    </li>
                    <li>
                        <div class="iocn-link">
                            <a href="#" class="open-submenu">
                                <i class='las la-question' ></i>
                                <span class="links_name">Q&A</span>  
                                <i class='bx bxs-chevron-down arrow' style="margin-left: 92px;"></i>
                            </a>
                        </div>
                        <ul class="sub-menu">
                            <li><a class="link_name" href="#">Category</a></li>
                            <li><a href="QandAMentorController">Unanswered questions</a></li>
                            <li><a href="EditQAController">Answered questions</a></li>
                            <li><a href="ListQAStudentController">Check questions</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="SearchEventMentorAttendController?eventMentorAttended=<%=loginUser.getId()%>">
                            <input type="hidden" name="eventMentorAttended" value="<%=loginUser.getId()%>"/>
                            <i class='bx bx-calendar-check'></i>
                            <span class="links_name">Attended event</span>
                        </a>
                        <span class="tooltip">Attended event</span>
                    </li>
                    <li>
                        <a href="changeRoleMentor.jsp">
                            <i class="las la-scroll"></i>
                            <span class="links_name">Change Role</span>
                        </a>  
                        <span class="tooltip">Change Role</span>
                    </li>
                    <li>
                        <a href="accountMentor.jsp">
                            <i class='las la-user-circle' ></i>
                            <span class="links_name">Accounts</span>
                        </a>
                        <span class="tooltip">Accounts</span>
                    </li>
                    <li>
                        <form action="MainController">
                            <a href="LogoutController">
                                <i class='las la-door-open' ></i>
                                <span class="links_name">Logout</span>
                            </a>
                        </form>
                        <span class="tooltip">Logout</span>
                    </li>
                </div>
            </ul>
        </div>

        <div class="main-content">
            <header>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="search-wrapper">
                    <form action="MainController">
                        <input type="hidden" name="qaMentor"/>
                        <button class="las la-search" type="submit" value="Q&A" name="action"></button>
                        <input type="text" name="search" value="<%= search%>" placeholder="Search here"/>
                    </form>
                </div>
                <div class="user-wrapper">
                    <img src="css/img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                        <h4><%=loginUser.getName()%></h4>
                        <small><%= roleName%></small>
                    </div>
                </div>
            </header>

            <main>
                <div class="follow-card">
                    <div class="follow-align">
                        <%
                            QandADTO QAM = new QandADTO(request.getParameter("questionID"), request.getParameter("mentorID"), request.getParameter("studentID"),
                                    request.getParameter("eventID"), request.getParameter("eventName"), request.getParameter("questionDetail"), request.getParameter("reply"));
                            if (QAM != null) {
                        %>

                        <form action="MainController">
                            <input type="hidden" name="questionID" value="<%=QAM.getQuestionID()%>"/>
                            <input type="hidden" name="mentorID" value="<%=QAM.getMentorID()%>"/>
                            <input type="hidden" name="studentID" value="<%=QAM.getStudentID()%>"/>
                            <input type="hidden" name="eventID" value="<%=QAM.getEventID()%>"/>
                            <input type="hidden" name="questionDetail" value="<%=QAM.getQuestionDetail()%>"/>
                            <h1>Question of Event:<span class="event-name"> <%=QAM.getEventName()%></span></h1>
                            <h3>Question of student: <span><%=QAM.getQuestionDetail()%></span></h3><br>
                            <h3>Your Answered: <span><%=QAM.getReply()%></span></h3><br>

                            <input type="text" name="editAnsweredQA" value="<%=editAnsweredQA%>"/>
                            <button style="width: 160px" type="submit" name="action" value="Edit Answered">Edit answer</button>

                        </form> 
                        <%
                            }
                        %>

                    </div>
                </div>




                <%            String message = (String) request.getAttribute("SEARCH_EVENT_MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%> <br>       
            </main>
            <footer>
                <div class="footer-align">
                    <div class="footer-copyright">
                        <h3><img class="logo" src="css/img/logo.png"/><span>Event</span></h3>
                        <small class="copyright">Copyright © 2021 by GROUP 5</small>
                    </div>
                    <div class="follow-contact">
                        <h3>Contact</h3>
                        <small><span class="las la-envelope"></span><span> eventnotifygroup5@gmail.com</span></small>
                        <br>
                        <small><span class="las la-phone"></span><span> 0914 291 596</span></small>
                    </div>
                    <div class="follow-address">
                        <h3>Address</h3>
                        <small><span class="las la-map-marker-alt"></span><span> Lô E2a-7, Đường D1, Khu Công Nghệ Cao, Long Thạnh</span>
                            <br><span> Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh</span></small>
                    </div>
                </div>
            </footer>
        </div>
        <script src="js/DashboardBtn.js"></script>
    </body>
</html>
