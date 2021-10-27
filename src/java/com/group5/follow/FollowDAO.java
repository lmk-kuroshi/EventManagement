/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.follow;

import com.group5.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minh Khoa
 */
public class FollowDAO {
    public FollowDTO checkFollow(String eventID, String studentID) throws SQLException, ClassNotFoundException{
        FollowDTO follow = new FollowDTO();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtil.getConnection();
            if(con!=null){
                String sql = "SELECT followID, followStatus FROM tblFollow WHERE eventID=? AND studentID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, eventID);
                stm.setString(2, studentID);
                rs=stm.executeQuery();
                while (rs.next()) {                    
                    String followID = rs.getString("followID");
                    String followStatus = rs.getString("followStatus");
                    follow = new FollowDTO(followID, eventID, studentID, followStatus);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return follow;
    }
    
    public boolean addFollow (FollowDTO follow) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "INSERT INTO tblFollow(followID, eventID, studentID, followStatus) VALUES (?,?,?,?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, follow.getFollowID());
                stm.setString(2, follow.getEventID());
                stm.setString(3, follow.getStudentID());
                stm.setString(4, follow.getFollowStatus());
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
    
    public boolean updateFollow (String followID, String followStatus) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "UPDATE tblFollow SET followStatus=? WHERE followID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, followStatus);
                stm.setString(2, followID);
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
    
    public List<FollowDTO> getListFollow (String userID) throws SQLException{
        List<FollowDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT followID, tblFollow.eventID, followStatus, eventName, image, startTime, endTime"
                        + " FROM tblEvent, tblFollow"
                        + " WHERE tblEvent.eventID = tblFollow.eventID"
                        + " AND studentID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                
                rs = stm.executeQuery();
                while (rs.next()) {
                    String followID = rs.getString("followID");
                    String eventID = rs.getString("eventID");
                    String followStatus = rs.getString("followStatus");
                    String eventName = rs.getString("eventName");
                    String image = rs.getString("image");
                    String startTime = rs.getString("startTime");
                    String endTime = rs.getString("endTime");
                    list.add(new FollowDTO(followID, eventID, eventID, followStatus, eventName,image, startTime, endTime));
                
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
    
}
