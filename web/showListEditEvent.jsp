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
        <table border="1">
            <thead>
                <tr>
                    <th>Event Name</th>
                    <th>Edit</th>
                    <th>Cancel</th>
                    <th>Add Followup</th>
                    <th>Edit Followup</th>
                </tr>
            </thead>
            <tbody>
        <%
            List<EventDTO> list = (List<EventDTO>) request.getAttribute("LIST_EVENT_EDIT");
            if (list != null) {
                if (!list.isEmpty()) {
                    for (EventDTO event : list) {
                
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
                </tr>
                <%      
                    }             
                }
            }
        %>
            </tbody>
        </table>

        
    </body>
</html>
