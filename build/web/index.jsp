<%-- 
    Document   : index
    Created on : Sep 20, 2021, 2:04:14 PM
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
        <title>Student Page</title>
        <link href="css/hompageStyle.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

        <!--        <script src="dropDownScipt.js" defer></script>-->
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

        <div class="sidebar close">
            <div class="logo-details">
                <img class="logo" src="css/img/logo.png"> 
                <!--                <i class='bx bxl-c-plus-plus'></i>-->
                <span class="logo_name">Event</span>
            </div>
            <div class="sidebar-line"></div>
            <ul class="nav-links">
                <div class="sidebar-align">
                    <li>

                        <a href="SearchController">
                            <!--                        <i class='bx bx-grid-alt' ></i>-->
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
                            <!--                            <i class='bx bxs-chevron-down arrow' ></i>-->
                        </div>
                        <ul class="sub-menu">
                            
                            <li><a class="link_name" href="#">Category</a></li>
                            <%
                                if (categoryList != null) {
                                    for (CategoryDTO category : categoryList) {
                            %>
                            <li><a href="SearchController?categoryName=<%=category.getCategoryName()%>"><%=category.getCategoryName()%></a></li>
                            <!--     //                        <li><a href="#">JavaScript</a></li>
                                                        <li><a href="#">PHP & MySQL</a></li>-->
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
                <%
                    String message = (String) request.getAttribute("SEARCH_EVENT_MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>

                <!--<%= message%><br>-->
                <div class="back-separate">
                    <h1>Ongoing Event</h1>
                </div>
                <div class="event-card">
                    <%
                        List<EventDTO> onlist = (List<EventDTO>) request.getAttribute("LIST_EVENT_ONGOING");
                        if (onlist != null) {
                            if (!onlist.isEmpty()) {
                                for (EventDTO event : onlist) {

                    %> 
                    <div class="event-card-single" >
                        <img src="<%=event.getImage()%>" alt="Image Event"/>
                        <div>
                            <a href="eventDetail.jsp?id=<%=event.getEventID()%>&name=<%=event.getEventName()%>&creatorID=<%=event.getCreatorID()%>&categoryID=<%=event.getCategoryID()%>
                               &location=<%=event.getLocationID()%>&eventDetail=<%=event.getEventDetail()%>&seat=<%=event.getSeat()%>&startTime=<%=event.getStartTime()%>
                               &endTime=<%=event.getEndTime()%>&creatTime=<%=event.getCreateTime()%>&image=<%=event.getImage()%>&video=<%=event.getVideo()%>
                               &status=<%=event.getStatus()%>"> <span class="event-name"><%=event.getEventName()%></span></a>
                            <span>Start: <%=event.getStartTime()%></span>
                            <span>Ends: <%=event.getEndTime()%></span>
                            <span>Category: <%=event.getCategoryID()%></span>
                        </div>
                    </div>

                    <%
                                }
                            }
                        }
                    %>
                </div>
                <div class="back-separate">
                    <h1>Upcoming Event</h1>
                </div>
                <div class="event-card">
                    <%
                        List<EventDTO> uplist = (List<EventDTO>) request.getAttribute("LIST_EVENT_UPCOMING");
                        if (uplist != null) {
                            if (!uplist.isEmpty()) {
                                for (EventDTO event : uplist) {

                    %> 
                    <div class="event-card-single" >
                        <img src="<%=event.getImage()%>" alt="Image Event"/>
                        <div>
                            <a href="eventDetail.jsp?id=<%=event.getEventID()%>&name=<%=event.getEventName()%>&creatorID=<%=event.getCreatorID()%>&categoryID=<%=event.getCategoryID()%>
                               &location=<%=event.getLocationID()%>&eventDetail=<%=event.getEventDetail()%>&seat=<%=event.getSeat()%>&startTime=<%=event.getStartTime()%>
                               &endTime=<%=event.getEndTime()%>&creatTime=<%=event.getCreateTime()%>&image=<%=event.getImage()%>&video=<%=event.getVideo()%>
                               &status=<%=event.getStatus()%>"> <span class="event-name"><%=event.getEventName()%></span></a>
                            <span>Start: <%=event.getStartTime()%></span>
                            <span>Ends: <%=event.getEndTime()%></span>
                            <span>Category: <%=event.getCategoryID()%></span>
                        </div>
                    </div>

                    <%
                                }
                            }
                        }
                    %>
                </div>
                <div class="back-separate">
                    <h1>Completed Event</h1>
                </div>
                <div class="event-card">
                    <%
                        List<EventDTO> comlist = (List<EventDTO>) request.getAttribute("LIST_EVENT_COMPLETE");
                        if (comlist != null) {
                            if (!comlist.isEmpty()) {
                                for (EventDTO event : comlist) {

                    %> 
                    <div class="event-card-single" >
                        <img src="<%=event.getImage()%>" alt="Image Event"/>
                        <div>
                            <a href="eventDetail.jsp?id=<%=event.getEventID()%>&name=<%=event.getEventName()%>&creatorID=<%=event.getCreatorID()%>&categoryID=<%=event.getCategoryID()%>
                               &location=<%=event.getLocationID()%>&eventDetail=<%=event.getEventDetail()%>&seat=<%=event.getSeat()%>&startTime=<%=event.getStartTime()%>
                               &endTime=<%=event.getEndTime()%>&creatTime=<%=event.getCreateTime()%>&image=<%=event.getImage()%>&video=<%=event.getVideo()%>
                               &status=<%=event.getStatus()%>"> <span class="event-name"><%=event.getEventName()%></span></a>
                            <span>Start: <%=event.getStartTime()%></span>
                            <span>Ends: <%=event.getEndTime()%></span>
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
