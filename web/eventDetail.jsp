<%-- 
    Document   : eventDetail
    Created on : Sep 27, 2021, 2:48:16 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.users.UserDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Details Page</title>
        <link href="css/eventDetailStyle.css" rel="stylesheet" />
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

            EventDTO event = new EventDTO(request.getParameter("id"), request.getParameter("name"), request.getParameter("creatorID"),
                    request.getParameter("categoryID"), request.getParameter("location"), request.getParameter("eventDetail"),
                    Integer.parseInt(request.getParameter("seat")), Timestamp.valueOf(request.getParameter("creatTime")), Timestamp.valueOf(request.getParameter("startTime")),
                    Timestamp.valueOf(request.getParameter("endTime")), request.getParameter("image"), request.getParameter("video"),
                    request.getParameter("status"));
            if (event != null) {
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
                <div class="event-detail">
                    <div class="event-align">
                        <h1 class="event-name"><%=event.getEventName()%></h1>
        <!--                <h1> Post by: <%=event.getCreatorID()%> at <%=event.getCreateTime()%></h1>-->
                        <div>
                            <img src ="<%=event.getImage()%>"> 
                        </div>
                        <iframe width="560" height="315" src="<%=event.getVideo()%>" 
                                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                        </iframe>
                        <div class="event-detail-follow">
                            <form action="MainController">
                                <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                                <button type="submit" name="action" value="FollowOrUnfollow">Follow</button>
                            </form>
                        </div>
                        <br>
                        <h3> Location:<span> <%=event.getLocationID()%></span></h3>
                        <br>
                        <h3> From: <span><%=event.getStartTime()%></span></h3>
                        <br>
                        <h3> To: <span><%=event.getEndTime()%></span></h3>
                        <br>
                        <h3> Description: <span><%=event.getEventDetail()%></span></h3>
                        <br>
        <!--                <h1> <%=event.getStatus()%></h1>-->
                        <h3> Seat available: <span><%=event.getSeat()%></span></h3>
                        <br>
                        <% }
                        %>

                        <!--<form action="MainController">
                            <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                            <input type="submit" name="action" value="ShowFollowup"/>
                        </form>-->
                    </div>
                </div>
            </main>        

        </div>   

    </body>
</html>
