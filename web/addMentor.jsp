<%-- 
    Document   : addMentor
    Created on : Oct 27, 2021, 8:53:45 AM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.memtorEvent.MentorEventDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Mentor Page</title>
    </head>
    <body>
        <% List<UserDTO> mentorList = (List<UserDTO>) request.getAttribute("LIST_MENTOR");
            List<MentorEventDTO> mentorsThisEventList = (List<MentorEventDTO>) request.getAttribute("LIST_MENTOR_THIS_EVENT");
        %>
        <%
            String eventID = request.getParameter("eventID");            
            String eventName = request.getParameter("eventName");
//            if (eventName.equals("")) {
//                    eventID = (String) request.getAttribute("eventName");
//            }
        %>                            

        <h1>Mentors in event <%=eventName%></h1>
        <%  if (mentorsThisEventList != null) {     %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Mentor Name</th>
                </tr>
            </thead>
            <%
                int count = 0;
                for (MentorEventDTO mentorThisEvent : mentorsThisEventList) {
                    count++;
            %>
            <tbody>
                <tr>
                    <td><%=count%></td>
                    <td><%=mentorThisEvent.getMemtorName()%></td>
                </tr>

            </tbody>
            <%      }
            }
        %>
        </table>
        


        <h1>Adding Mentor for event <%=eventName%></h1>

        <form action="MainController">
            <select name="mentorID">
                <%
                    if (mentorList != null) {
                        for (UserDTO mentor : mentorList) {
                %>

                <option value="<%=mentor.getId()%>"> <%=mentor.getName()%> </option>

                <%}
                    }
                %>
            </select>
            <input type="hidden" name="eventID" value="<%= eventID%>"/>
            <input type="hidden" name="eventName" value="<%= eventName%>"/>
            <input type="submit" name="action" value="ConfirmAddMentor"/>
        </form>
            
        <h1>Removing Mentor for event <%=eventName%></h1>

        <form action="MainController">
            <select name="mentorID">
                <%
                    if (mentorList != null) {
                        for (MentorEventDTO mentorThisEvent : mentorsThisEventList) {
                %>

                <option value="<%=mentorThisEvent.getMentorID()%>"> <%=mentorThisEvent.getMemtorName()%> </option>

                <%}
                    }
                %>
            </select>
            <input type="hidden" name="eventID" value="<%= eventID%>"/>
            <input type="hidden" name="eventName" value="<%= eventName%>"/>
            <input type="submit" name="action" value="ConfirmRemoveMentor"/>
        </form>
    </body>
</html>
