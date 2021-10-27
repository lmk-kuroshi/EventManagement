<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="java.util.List"%>
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
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
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
                        <a href="changeRole.jsp">
                            <i class="las la-scroll"></i>
                            <span class="links_name">Change Role</span>
                        </a>  
                        <span class="tooltip">Change Role</span>
                    </li>
                    <li>
                        <a href="accountStudent.jsp">
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
                        <div class="event-detail-img">
                            <img src ="<%=event.getImage()%>" alt="Event Image"> 
                        </div>
                        <div class="event-detail-video">
                            <iframe src="<%=event.getVideo()%>" onerror="alert('URL invalid !!');" 
                                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
                            </iframe>
                        </div>
                        <div class="event-detail-button">
                            <div class="event-detail-follow">
                                <form action="MainController">
                                    <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                                    <button class="btnFollow" type="submit" name="action" value="FollowOrUnfollow">Follow</button>
                                </form>
                            </div>
                            <div class="event-detail-register">
                                <form action="MainController">
                                    <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                                    <button type="submit" name="action" value="Register">Register</button>
                                </form>
                            </div>
                            <div class="event-detail-followup">
                                <form action="MainController">
                                    <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                                    <button type="submit" name="action" value="ShowFollowup">Show Follow Up</button>
                                </form>
                            </div>
                        </div>
                        <div class="event-detail-info">
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
                        </div>
                        <% }
                        %>
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
        <script defer="" src="js/DashboardBtn.js"></script>
    </body>
</html>
