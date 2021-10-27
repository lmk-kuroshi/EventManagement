<%-- 
    Document   : leader
    Created on : Sep 29, 2021, 2:10:57 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.users.UserDTO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leader Page</title>
        <link href="css/hompageStyle.css" rel="stylesheet" />
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
                        <a href="leader.jsp" class="active"><span class="las la-chart-line"></span> <span>Trending</span></a>
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
                        <a href="CreateEventController"><span class="las la-calendar-plus"></span><span>CreateEvent</span></a>  
                    </li>
                    <li>
                        <a href="ShowListEditEventController"><span class="las la-eye"></span><span>ShowListEditEvent</span></a>  
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
                        <h4><%=loginUser.getName()%></h4>
                        <small>Leader</small>
                    </div>
                </div>
            </header>

            <main>
                <%
                    String message = (String) request.getAttribute("SEARCH_EVENT_MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>

                <!--<%= message%><br>-->
                <div class="event-card">
                    <%
                        List<EventDTO> list = (List<EventDTO>) request.getAttribute("LIST_EVENT");
                        if (list != null) {
                            if (!list.isEmpty()) {
                                for (EventDTO event : list) {

                    %> 


                    <div class="event-card-single" >
                        <img src="<%=event.getImage()%>"/>
                        <div>
                            <form action="MainController">
                                <button class="las la-search" type="submit" value="ShowEventDetail" name="action"><%=event.getEventName()%></button>
                                <input type="hidden" name="id" value="<%= event.getEventID()%>"/>
                                <input type="hidden" name="name" value="<%= event.getEventName()%>"/>
                                <input type="hidden" name="categoryID" value="<%= event.getCategoryID()%>"/>
                                <input type="hidden" name="location" value="<%= event.getLocationID()%>"/>
                                <input type="hidden" name="eventDetail" value="<%= event.getEventDetail()%>"/>
                                <input type="hidden" name="seat" value="<%= event.getSeat()%>"/>
                                <input type="hidden" name="startTime" value="<%= event.getStartTime()%>"/>
                                <input type="hidden" name="endTime" value="<%= event.getEndTime()%>"/>
                                <input type="hidden" name="creatTime" value="<%= event.getCreateTime()%>"/>
                                <input type="hidden" name="image" value="<%= event.getImage()%>"/>
                                <input type="hidden" name="video" value="<%= event.getVideo()%>"/>
                                <input type="hidden" name="status" value="<%= event.getStatus()%>"/>
                            </form>
                            <span>Start Time: <%=event.getStartTime()%></span>
                            <span>End Time: <%=event.getEndTime()%></span>
                            <span>Category: <%=event.getCategoryID()%></span>
                        </div>
                    </div>

                <%
                            }
                        }
                    }
                %>
                </div>
            </main>
            <footer>
                <h2><img class="logo" src="css/img/footerLogo.svg"/></h2>
                <p class="copyright">© 2021 GROUP 5</p>
            </footer>
        </div>

    </body>
</html>
