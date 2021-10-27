/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.memtorEvent;

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
public class MentorEventDAO {
    public List<MentorEventDTO> getListMentorInThisEvent(String eventID){
        List<MentorEventDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn=DBUtil.getConnection();
            if(conn!=null){
                String sql = "SELECT mentorEventID, mentorID, userName FROM tblMentorEvent, tblUser"
                        + " WHERE mentorID = userID "
                        + " AND eventID = ? "
                        + " AND mentorEventStatus = 'ACT' ";
                stm=conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs=stm.executeQuery();
                while (rs.next()) {                    
                    String mentorEventID = rs.getString("mentorEventID");
                    String mentorID = rs.getString("mentorID");
                    String mentorName = rs.getString("userName");
                    list.add( new MentorEventDTO(mentorEventID, eventID, mentorID, mentorName, mentorEventID));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public MentorEventDTO checkMentorEvent(String eventID, String mentorID) throws SQLException{
        MentorEventDTO mentorEvent = new MentorEventDTO();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtil.getConnection();
            if(con!=null){
                String sql = "SELECT mentorEventID, mentorEventStatus FROM tblMentorEvent WHERE eventID=? AND mentorID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, eventID);
                stm.setString(2, mentorID);
                rs=stm.executeQuery();
                while (rs.next()) {                    
                    String followID = rs.getString("mentorEventID");
                    String followStatus = rs.getString("mentorEventStatus");
                    mentorEvent = new MentorEventDTO(followID, eventID, mentorID, followStatus);
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
        return mentorEvent;
    }
    
    public boolean addMentorEvent (MentorEventDTO mentorEvent) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "INSERT INTO tblMentorEvent(mentorEventID, eventID, mentorID, mentorEventStatus) VALUES (?,?,?,?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, mentorEvent.getMentorEventID());
                stm.setString(2, mentorEvent.getEventID());
                stm.setString(3, mentorEvent.getMentorID());
                stm.setString(4, mentorEvent.getMentorEventStatus());
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
    
    public boolean updateMentorEvent (String mentorEventID, String mentorEventStatus) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "UPDATE tblMentorEvent SET mentorEventStatus=? WHERE mentorEventID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, mentorEventStatus);
                stm.setString(2, mentorEventID);
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
    
    public boolean removeMentorEvent (String mentorEventID) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "UPDATE tblMentorEvent SET mentorEventStatus=? WHERE mentorEventID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "DACT");
                stm.setString(2, mentorEventID);
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
    
}
