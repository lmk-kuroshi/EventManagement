<%-- 
    Document   : notification
    Created on : Oct 13, 2021, 6:16:47 PM
    Author     : Minh Khoa
--%>

<%@page import="java.util.List"%>
<%@page import="com.group5.follow.FollowDTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/notificationStyle.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <h2><img class="logo" src="css/img/logo.png"> <span>Software</span></h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <!--                        <a href="" class="active"><span class="las la-igloo"></span> <span>Dashboard</span></a>-->
                        <a href="SearchController" class="active"><span class="la la-chart-line"></span> <span>Trending</span></a>
                    </li>
                    <li>
                        <a href=""><span class="lab la-buromobelexperte"></span> <span>Category</span></a>
                    </li><!--
 /*                <li>
                        <a href=""><span class="las la-clipboard-list"></span><span>Projects</span></a>
                    </li> --*/
                    -->                 <li>
                        <a href=""><span class="las la-bell"></span> <span>Notify</span></a>
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
                        <!--                        <div class="logout">
                                                    <form action="MainController">
                                                        <a> 
                                                            <span class="las la-door-open"></span> <span><input type="submit" name="action" value="Logout"/> </span>
                                                        </a>
                                                    </form>
                                                </div>-->
                        <a href="LogoutController"><span class="las la-door-open"></span> <span>Logout</span></a>
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
                        <h4><%=loginUser.getName()%></h4>
                        <small>Student</small>
                    </div>
                </div>
            </header>
            <main>
                <div class="follow-card">
                    <div class="follow-align">
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%=loginUser.getId()%>"/>
                            <input type="submit" name="action" value="ShowFollowEvent"/>
                        </form>

                        <%
                            List<FollowDTO> followList = (List<FollowDTO>) request.getAttribute("FOLLOW_LIST");
                            if (followList != null) {
                                if (!followList.isEmpty()) {
                        %>    
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Event Name</th>   
                                    <th>Unfollow</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (FollowDTO follow : followList) {
                                %>
                                <tr>
                                    <td><%=follow.getEventName()%></td>
                                    <td>
                                        <form action="MainController">
                                            <input type="hidden" name="eventID" value="<%=follow.getEventID()%>"/>
                                            <input type="submit" name="action" value="FollowOrUnfollow"/>
                                        </form>
                                    </td>
                                </tr>
                                <%

                                            }

                                        }

                                    }

                                %>
                            </tbody>

                        </table>
                    </div>
                </div>
            </main>        
        </div>


    </body>
</html>
