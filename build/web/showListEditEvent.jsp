<%-- 
    Document   : editEvent
    Created on : Sep 30, 2021, 6:54:34 AM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.event.EventDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Event List Page</title>
    </head>
    <body>
        <h1>Edit Event List</h1>
        <h1>Ongoing</h1>
        <%
            List<EventDTO> ongoingList = (List<EventDTO>) request.getAttribute("LIST_EVENT_EDIT_ONGOING");
            if (ongoingList != null) {
                if (!ongoingList.isEmpty()) {
        %>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Edit</th>
                    <th>Cancel</th>
                    <th>Add Followup</th>
                    <th>Edit Followup</th>
                    <th>Complete Event</th>
                </tr>
            </thead>
            <tbody>
        <%
                    for (EventDTO event : ongoingList) {                              
        %>
        
            
                <tr>
                    <td><%=event.getEventName()%></td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="EditEvent"/>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="CancelEvent"/>
                        </form>
                    </td>
                    <td>
                        <a href="addFollowup.jsp?eventID=<%=event.getEventID()%>&eventName=<%=event.getEventName()%>">Add Followup</a>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="EditFollowup"/>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="CompleteEvent"/>
                        </form>
                    </td>
                </tr>
                <%      }
                    }             
                }            
        %>
            </tbody>
        </table>
        <%
            List<EventDTO> upcomingList = (List<EventDTO>) request.getAttribute("LIST_EVENT_EDIT_UPCOMING");
            if (upcomingList != null) {
                if (!upcomingList.isEmpty()) {
        %>
        <h1>Upcoming</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Edit</th>
                    <th>Cancel</th>
                    <th>Add Followup</th>
                    <th>Edit Followup</th>
                    <th>Start Event</th>
                    <th>Add Mentor</th>
                    <th>Remove Mentor</th>
                </tr>
            </thead>
            <tbody>
        <%
                    for (EventDTO event : upcomingList) {                              
        %>
        
            
                <tr>
                    <td><%=event.getEventName()%></td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="EditEvent"/>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="CancelEvent"/>
                        </form>
                    </td>
                    <td>
                        <a href="addFollowup.jsp?eventID=<%=event.getEventID()%>&eventName=<%=event.getEventName()%>">Add Followup</a>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="EditFollowup"/>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="StartEvent"/>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>   
                            <input type="hidden" name="eventName" value="<%= event.getEventName()%>"/>
                            <input type="submit" name="action" value="AddMentor"/>
                        </form>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="RemoveMentor"/>
                        </form>
                    </td>
                </tr>
                <%      }
                    }             
                }
        %>
            </tbody>
        </table>
            
        <h1>Complete</h1>
        <%
            List<EventDTO> completeList = (List<EventDTO>) request.getAttribute("LIST_EVENT_EDIT_COMPLETE");
            if (completeList != null) {
                if (!completeList.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Add Followup</th>
                    <th>Edit Followup</th>
                </tr>
            </thead>
            <tbody>
        <%
                    for (EventDTO event : completeList) { 
        %>
        
            
                <tr>
                    <td><%=event.getEventName()%></td>           
                    <td>
                        <a href="addFollowup.jsp?eventID=<%=event.getEventID()%>&eventName=<%=event.getEventName()%>">Add Followup</a>
                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%= event.getEventID()%>"/>                            
                            <input type="submit" name="action" value="EditFollowup"/>
                        </form>
                    </td>
                </tr>
                <%      }
                    }             
                }
        %>
            </tbody>
        </table>
            
        <h1>Canceled</h1>
        <%
            List<EventDTO> cancelList = (List<EventDTO>) request.getAttribute("LIST_EVENT_EDIT_CANCELED");
            if (cancelList != null) {
                if (!cancelList.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Event Name</th>
                    
                </tr>
            </thead>
            <tbody>
        <%
                    for (EventDTO event : cancelList) { 
        %>
        
            
                <tr>
                    <td><%=event.getEventName()%></td>                   
                </tr>
                <%      }
                    }             
                }
        %>
            </tbody>
        </table>    
    </body>
</html>
