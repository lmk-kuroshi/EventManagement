<%-- 
    Document   : editFollowup
    Created on : Oct 10, 2021, 2:49:26 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.role.RoleDAO"%>
<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.event.EventError"%>
<%@page import="com.group5.event.FollowupDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Follow Up Page</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
        <link href="css/createEventStyle.css" rel="stylesheet" >
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            String eventID = request.getParameter("eventID");
            String eventName = request.getParameter("eventName");
        %>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>   
        <%
            RoleDAO ro = new RoleDAO();
            String roleName = ro.getRoleName(loginUser.getRoleID());
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
                        <a href="CreateEventController">
                            <i class='las la-calendar-plus' ></i>
                            <span class="links_name">Create Event</span>
                        </a>
                        <span class="tooltip">Create Event</span>
                    </li>
                    <li>
                        <a href="ShowListEditEventController">
                            <i class='bx bx-show'></i>
                            <span class="links_name">Show List Edit Event</span>
                        </a>
                        <span class="tooltip">Show List Edit Event</span>
                    </li>
                    <li>
                        <a href="changeRoleLeader.jsp">
                            <i class="las la-scroll"></i>
                            <span class="links_name">Change Role</span>
                        </a>  
                        <span class="tooltip">Change Role</span>
                    </li>
                    <li>
                        <a href="accountLeader.jsp">
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
                        <button class="las la-search" type="submit" value="Search" name="action"></button>
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
                <%

                    List<FollowupDTO> list = (List<FollowupDTO>) request.getAttribute("FOLLOWUP_LIST");
                    if (list != null) {
                        if (!list.isEmpty()) {
                            int i = 1;
                            for (FollowupDTO followup : list) {

                %>
                <%                    EventError eventError = (EventError) request.getAttribute("EVENT_ERROR");
                    if (eventError == null) {
                        eventError = new EventError();
                    }
                %>

                <%
                    EventDTO event = (EventDTO) request.getAttribute("EVENT_EDIT");
                %>
                <div class="create-event-card">
                    <div class="create-event-align">
                        <h1>Edit Followup Detail</h1><br>
                        <!--<h1 class="event-name"><%=eventName%></h1><br><br>-->
                        <form action="MainController"> 
                            <div class="create-event-info-button">
                                <div class="create-event-info1">

                                    <span>Image(please enter the image's link): </span>
                                    <input class="long-input" type="text" name="followupImage" value="<%=followup.getFollowupImage()%>" /><br><br>

                                </div>
                                <div class="create-event-info2">
                                    <span>Video(please enter a YouTube embed video link):</span>
                                    <input class="long-input" type="text" name="followupVideo" value="<%=followup.getFollowupVideo()%>"/>
                                    <input type="hidden" name="eventID" value="<%=followup.getEventID()%>"/>
                                    <input type="hidden" name="followupID" value="<%=followup.getFollowupID()%>"/>
                                    <input type="hidden" name="notification" value=" new updated"/>
                                    <br>
                                    <br>
                                </div>
                                <div class="button-align">
                                    <button type="submit" name="action" value="ConfirmEditFollowup">Confirm Edit Followup</button>
                                </div>
                            </div>

                            <span>Followup Detail: </span><br><br>
                            <textarea id="editor<%=i%>" name="followupDetail"><%=followup.getFollowupDetail()%></textarea><br>
                        </form>

                    </div>
                </div>
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


        <script>
            ClassicEditor
                    .create(document.querySelector('#editor<%=i++%>'), {

                        toolbar: ['Heading', '|', 'bold', 'italic', 'link', '|', 'numberedList', 'bulletedList', 'outdent', 'indent', '|', 'undo', 'redo']
                    })
                    .catch(error => {
                        console.log(error);
                    });
        </script>
        <%
                    }
                }
            }
        %>
    </body>
</html>
