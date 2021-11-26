/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.event;

import com.group5.follow.FollowerDTO;
import com.group5.users.UserDAO;
import com.group5.users.UserDTO;
import com.group5.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Minh Khoa
 */
public class EventDAO {
    public List<EventDTO> getListEvent(String search, String categoryName) throws SQLException {
        List<EventDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT eventID, eventName, userName, categoryName, locationName, eventDetail, seat, creatTime, startTime, endTime, image, video, status FROM tblEvent, tblUser, tblCategory, tblLocation " 
                        +    " WHERE tblEvent.categoryID = tblCategory.categoryID " 
                        +    " AND tblEvent.creatorID = tblUser.userID " 
                        +    " AND tblEvent.locationID = tblLocation.locationID and " 
                        +    " eventName like ? AND categoryName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "%" + categoryName + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");
                    String creatorID = rs.getString("userName"); //act as creatorName
                    String categoryID = rs.getString("categoryName"); //act as categoryName
                    String locationID = rs.getString("locationName"); //act as locationName
                    String eventDetail = rs.getString("eventDetail");
                    int seat = rs.getInt("seat");
                    Timestamp creaetTime = rs.getTimestamp("creatTime");
                    Timestamp startTime = rs.getTimestamp("startTime");
                    Timestamp endTime = rs.getTimestamp("endTime");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    String status = rs.getString("status");
                    
                    
                    list.add(new EventDTO(eventID, eventName, creatorID, categoryID, locationID, eventDetail, seat, creaetTime, startTime, endTime, image, video, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean addEvent(EventDTO event) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String sql = "INSERT INTO tblEvent(eventID, eventName, creatorID, categoryID, locationID, eventDetail, seat, creatTime, startTime, endTime, image, video, status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, event.getEventID());
                stm.setString(2, event.getEventName());
                stm.setString(3, event.getCreatorID());
                stm.setString(4, event.getCategoryID());
                stm.setString(5, event.getLocationID());
                stm.setString(6, event.getEventDetail());
                stm.setInt(7, event.getSeat());
                stm.setTimestamp(8, event.getCreateTime());
                stm.setTimestamp(9, event.getStartTime());
                stm.setTimestamp(10, event.getEndTime());
                stm.setString(11, event.getImage());
                stm.setString(12, event.getVideo());
                stm.setString(13, event.getStatus());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
    
    public List<EventDTO> getListEventToEdit(String userID) throws SQLException {
        List<EventDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT eventID, eventName, userName, categoryName, locationName, eventDetail, seat, creatTime, startTime, endTime, image, video, status FROM tblEvent, tblUser, tblCategory, tblLocation " 
                        +    " WHERE tblEvent.categoryID = tblCategory.categoryID " 
                        +    " AND tblEvent.creatorID = tblUser.userID " 
                        +    " AND tblEvent.locationID = tblLocation.locationID and " 
                        +    " creatorID like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + userID + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");
                    String creatorID = rs.getString("userName"); //act as creatorName
                    String categoryID = rs.getString("categoryName"); //act as categoryName
                    String locationID = rs.getString("locationName"); //act as locationName
                    String eventDetail = rs.getString("eventDetail");
                    int seat = rs.getInt("seat");
                    Timestamp creaetTime = rs.getTimestamp("creatTime");
                    Timestamp startTime = rs.getTimestamp("startTime");
                    Timestamp endTime = rs.getTimestamp("endTime");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    String status = rs.getString("status");
                    
                    
                    list.add(new EventDTO(eventID, eventName, creatorID, categoryID, locationID, eventDetail, seat, creaetTime, startTime, endTime, image, video, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public EventDTO getEventByID(String eventID) throws SQLException {
         EventDTO event = new EventDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT eventName, userName, categoryName, locationName, eventDetail, seat, creatTime, startTime, endTime, image, video, status FROM tblEvent, tblUser, tblCategory, tblLocation " 
                        +    " WHERE tblEvent.categoryID = tblCategory.categoryID " 
                        +    " AND tblEvent.creatorID = tblUser.userID " 
                        +    " AND tblEvent.locationID = tblLocation.locationID and " 
                        +    " eventID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID );
                rs = stm.executeQuery();
                if (rs.next()) {
                    String eventName = rs.getString("eventName");
                    String creatorID = rs.getString("userName"); //act as creatorName
                    String categoryID = rs.getString("categoryName"); //act as categoryName
                    String locationID = rs.getString("locationName"); //act as locationName
                    String eventDetail = rs.getString("eventDetail");
                    int seat = rs.getInt("seat");
                    Timestamp creaetTime = rs.getTimestamp("creatTime");
                    Timestamp startTime = rs.getTimestamp("startTime");
                    Timestamp endTime = rs.getTimestamp("endTime");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    String status = rs.getString("status");
                    
                    
                    event = new EventDTO(eventID, eventName, creatorID, categoryID, locationID, eventDetail, seat, creaetTime, startTime, endTime, image, video, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return event;
    }
    
    public boolean updateEvent(EventDTO event) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblEvent SET eventName=?, categoryID=?,locationID=?,eventDetail=?,seat=?,startTime=?,endTime=?,image=?,video=? WHERE eventID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, event.getEventName());
                stm.setString(2, event.getCategoryID());
                stm.setString(3, event.getLocationID());
                stm.setString(4, event.getEventDetail());
                stm.setInt(5, event.getSeat());
                stm.setTimestamp(6, event.getStartTime());
                stm.setTimestamp(7, event.getEndTime());
                stm.setString(8, event.getImage());
                stm.setString(9, event.getVideo());
                stm.setString(10, event.getEventID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean cancelEvent(String eventID) throws SQLException{
        boolean check =false;
        Connection conn=null;
        PreparedStatement stm = null;
        try{
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblEvent SET status='Canceled' WHERE eventID=?";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, eventID);
                check = stm.executeUpdate() > 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean startEvent(String eventID) throws SQLException{
        boolean check =false;
        Connection conn=null;
        PreparedStatement stm = null;
        try{
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblEvent SET status='Ongoing' WHERE eventID=?";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, eventID);
                check = stm.executeUpdate() > 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean completeEvent(String eventID) throws SQLException{
        boolean check =false;
        Connection conn=null;
        PreparedStatement stm = null;
        try{
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblEvent SET status='Complete' WHERE eventID=?";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, eventID);
                check = stm.executeUpdate() > 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public List<EventDTO> getListEventMentorAttended(String mentorId ) throws SQLException {
        List<EventDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT tblEvent.eventID, eventName, userName, categoryName, locationName, eventDetail, seat, creatTime, startTime, endTime, image, video, status FROM tblEvent, tblUser, tblCategory, tblLocation,  tblMentorEvent " 
                        +    " WHERE tblEvent.categoryID = tblCategory.categoryID " 
                        +    " AND tblEvent.creatorID = tblUser.userID " 
                        +    " AND tblEvent.eventID = tblMentorEvent.eventID "
                        +    " AND tblEvent.locationID = tblLocation.locationID " 
                        +    " AND tblMentorEvent.mentorID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, mentorId);
                ;
                rs = stm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");
                    String creatorID = rs.getString("userName"); //act as creatorName
                    String categoryID = rs.getString("categoryName"); //act as categoryName
                    String locationID = rs.getString("locationName"); //act as locationName
                    String eventDetail = rs.getString("eventDetail");
                    int seat = rs.getInt("seat");
                    Timestamp creaetTime = rs.getTimestamp("creatTime");
                    Timestamp startTime = rs.getTimestamp("startTime");
                    Timestamp endTime = rs.getTimestamp("endTime");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    String status = rs.getString("status");
                    
                    
                    list.add(new EventDTO(eventID, eventName, creatorID, categoryID, locationID, eventDetail, seat, creaetTime, startTime, endTime, image, video, status));
                
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
       
    public boolean sendMailChangeRole(String nameRegister, String gmail, String reason) throws SQLException, ClassNotFoundException, MessagingException {
       Properties properties = new Properties();
        System.out.println("Prepare!");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String myAccountEmail = "eventnotifygroup5@gmail.com";
        String password = "eventgroup5";
        
        Session session = Session.getInstance(properties, new Authenticator() {
        
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myAccountEmail, password);
            }
                    
        });
        String htmlCode ="Dear Admin,<br>I am " + nameRegister + "<br> I write this mail to present the contend:<br>" + reason + "." + "<br>Thank you,<br>" + nameRegister;
        Message message = prepareMessage(session, myAccountEmail, "nguyentnkse150353@fpt.edu.vn", htmlCode);//knguyen9047@gmail.com
        Transport.send(message);
        System.out.println("Message sent seccessfully!");
        return true;
    }
    
    
    private static Message prepareMessage(Session session, String myAccountEmail, String recepient, String htmlCode){
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Request to Admin");
            
            message.setContent(htmlCode ,"text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  null;
    }
    
    public boolean sendMailNotification(String notification, String eventID) throws SQLException, ClassNotFoundException, MessagingException {
       Properties properties = new Properties();
        System.out.println("Prepare!");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String myAccountEmail = "eventnotifygroup5@gmail.com";
        String password = "eventgroup5";
        
        Session session = Session.getInstance(properties, new Authenticator() {
        
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myAccountEmail, password);
            }
                    
        });
        List<FollowerDTO> listFollower = new ArrayList<>();
        listFollower = getListWhoFollowedEvent(eventID);
        String email;
        for (FollowerDTO list : listFollower) {
        String htmlCode ="Dear " + list.getFollowerName() + ",<br> Your event you followed( " + list.getEventName() + ") has been "+ notification + ".<br>Please see the details so you don't miss the event information<br>Thank you,<br>Panda. ";
        email = list.getEmail();
        Message message = prepareMessageNotification(session, myAccountEmail, email, htmlCode);//knguyen9047@gmail.com
        Transport.send(message);
        }
        System.out.println("Message sent seccessfully!");
        return true;
    }
    
    private static Message prepareMessageNotification(Session session, String myAccountEmail, String recepient, String htmlCode){
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Notification about event you followed");
            
            message.setContent(htmlCode ,"text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  null;
    }
    public List<FollowerDTO> getListWhoFollowedEvent(String eventID) throws SQLException {
        List<FollowerDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "select  tblFollow.eventID, studentID, followStatus, userID, userEmail, userName , eventName From tblFollow, tblUser, tblEvent " 
                        +    " WHERE studentID = userID AND tblEvent.eventID = tblFollow.eventID AND tblFollow.followStatus = 'followed' AND tblFollow.eventID like ?  " ;
                        
               stm = conn.prepareStatement(sql);
               stm.setString(1, "%" + eventID + "%");
               rs = stm.executeQuery();
                while (rs.next()) {
                    String eventName = rs.getString("eventName");
                    String userName = rs.getString("userName");
                    String userEmail = rs.getString("userEmail");
                    
                               
                    list.add(new FollowerDTO(eventName, userName, userEmail));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean updateSeat (String eventID) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "UPDATE tblEvent SET seat = seat - 1 WHERE eventID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, eventID);
                check = stm.executeUpdate() > 0;
            }
        }catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
    public boolean sendMailJoinEvent(String leaderID, String eventName, String mentorName, String mentorGmail) throws SQLException, ClassNotFoundException, MessagingException {
       Properties properties = new Properties();
        System.out.println("Prepare!");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String myAccountEmail = "eventnotifygroup5@gmail.com";
        String password = "eventgroup5";
        
        Session session = Session.getInstance(properties, new Authenticator() {
        
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(myAccountEmail, password);
            }
                    
        });
        UserDTO leader = new UserDTO();
        UserDAO dao = new UserDAO();
        leader = dao.getLeader(leaderID);
        String htmlCode ="Dear " + leader.getName() + ",<br> You have a request from " + mentorName +" (" + mentorGmail + ") to become a mentor of your Event(" + eventName + ").<br>Thank you,<br>Event Management Team.";
        Message message = prepareMessageJoinEvent(session, myAccountEmail, leader.getEmail(), htmlCode);
        Transport.send(message);
        System.out.println("Message sent seccessfully!");
        return true;
    }
    
    private static Message prepareMessageJoinEvent(Session session, String myAccountEmail, String recepient, String htmlCode){
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Notification about your Event");
            
            message.setContent(htmlCode ,"text/html");
            return message;
        } catch (Exception ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  null;
    }
}
