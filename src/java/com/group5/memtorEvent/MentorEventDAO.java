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
//    public List<MentorEventDTO> getListMentorInThisEvent(String eventID){
//        List<MentorEventDTO> list = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn=DBUtil.getConnection();
//            if(conn!=null){
//                String sql = "SELECT userID userName "
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
    
    public MentorEventDTO checkMentorEvent(String eventID, String mentorID) throws SQLException{
        MentorEventDTO mentorEvent = new MentorEventDTO();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtil.getConnection();
            if(con!=null){
                String sql = "SELECT mentorEventID, mentorEventStatus FROM tblFollow WHERE eventID=? AND mentorID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, eventID);
                stm.setString(2, mentorID);
                rs=stm.executeQuery();
                while (rs.next()) {                    
                    String followID = rs.getString("followID");
                    String followStatus = rs.getString("followStatus");
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
    
    
}
