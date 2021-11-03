<%-- 
    Document   : mentor
    Created on : Oct 1, 2021, 3:02:15 PM
    Author     : Nghia
--%>

<%@page import="com.group5.memtorEvent.MentorEventDTO"%>
<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="com.group5.event.QandADTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ask Question Page</title>
<!--        <link href="css/hompageStyle.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />-->
    </head>
    <body>
        <%
            UserDTO mentor = (UserDTO) session.getAttribute("LOGIN_USER");
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


        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <h2><img class="logo" src="css/img/logo.png"> <span>Software</span></h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <!--<a href="" class="active"><span class="las la-igloo"></span> <span>Dashboard</span></a>-->
                        <a href="index.jsp" class="active"><span class="las la-chart-line"></span> <span>Trending</span></a>
                    </li>
                    <li>
                        <a href=""><span class="lab la-buromobelexperte"></span> <span>Category</span></a>
                        <!--<span class="las la-users"></span> <span>Category</span>-->
                        <!--                        <div class="dropdown" data-dropdown>
                                                    <button class="link" data-dropdown-button>Category</button>
                                                    <div class="dropdown-menu information-grid">
                                                        <div>
                                                            <div class="dropdown-heading">Free Tutorials</div>
                                                            <div class="dropdown-links">
                                                                <a href="#" class="link">All</a>
                                                                <a href="#" class="link">Latest</a>
                                                                <a href="#" class="link">Popular</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </li>
                    <!--
 /*                <li>
                        <a href=""><span class="las la-clipboard-list"></span><span>Projects</span></a>
                    </li> --*/
                    -->                 <li>
                        <a href="ShowFollowEventController"><span class="las la-bell"></span> <span>Notify</span></a>
                    </li>
                    <li>
                        <a href="changeRole.jsp"><span class="las la-scroll"></span><span>Change Role</span></a>  
                    </li>
                    
                    <!--
                    <li>
                        <a href=""><span class="las la-receipt"></span> <span>Inventory</span></a>
                    </li>-->
                    <li>
                        <a href=""><span class="las la-user-circle"></span> <span>Accounts</span></a>
                    </li>
                    <!--                    <li>
                                            <a href=""><span class="las la-clipboard-list"></span> <span>Tasks</span></a>
                                        </li>-->
                    <li>
                        <div class="logout">
                            <form action="MainController">
                                <a> 
                                    <span class="las la-door-open"></span> <span><input type="submit" name="action" value="Logout"/> </span>
                                </a>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>

                    <span>Dashboard</span>
                </h2>
                <div class="search-wrapper">
                    <!--                <span class="las la-search"></span>
                                    <input type="search" placeholder="Search here" />-->
                    <form action="MainController">
                        <button class="las la-search" type="submit" value="Search" name="action"></button>
                        <input type="text" name="search" value="<%= search%>" placeholder="Search here"/>

                    </form>
                </div>
                <div class="user-wrapper">
                    <img src="css/img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                        <h4><%=mentor.getName()%></h4>
                        <small>Student</small>
                    </div>
                </div>
            </header>

            <main>
        <%
            List<MentorEventDTO> mentorsThisEventList = (List<MentorEventDTO>) request.getAttribute("MENTOR_THIS_EVENT");
            String eventID = (String) request.getAttribute("eventID");
            String eventName = (String) request.getAttribute("eventName");
        %>
        <h1>Ask Question for Event: <%=eventName%> </h1>
        <form action="MainController">
            <input type ="text" name="questionDetail" required=""/>
            <select name="mentorID">               
                <%
                    if (mentorsThisEventList != null) {
                        for (MentorEventDTO mentorThisEvent : mentorsThisEventList) {
                %>

                <option value="<%=mentorThisEvent.getMentorID()%>"> <%=mentorThisEvent.getMemtorName()%> </option>

                <%}
                    }
                %>
            </select>
            <input type="hidden" name="eventID" value="<%= eventID%>" />
            <input type="hidden" name="eventName" value="<%= eventName%>"/>
            <input type="submit" name="action" value="ConfirmAskQuestion"/>
        </form>
                
            </main>
            <footer>
                <h2><img class="logo" src="css/img/footerLogo.svg"/></h2>
                <p class="copyright">© 2021 GROUP 5</p>
            </footer>
        </div>

    </body>
</html>
