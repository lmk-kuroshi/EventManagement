/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.event;

import com.group5.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minh Khoa
 */
public class EventDAO {
    public List<EventDTO> getListEvent(String search) throws SQLException {
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
                        +    " eventName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
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
}
