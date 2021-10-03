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
public class FollowupDAO {
    public boolean addFollowup (FollowupDTO followup) throws SQLException{
        boolean check = false;
        Connection con =null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if (con != null) {
                String sql = "INSERT INTO tblFollowupEvent(followupID, eventID, followupDetail, followupImage, followupVideo) VALUES(?,?,?,?,?)";
                stm=con.prepareStatement(sql);
                stm.setString(1, followup.getFollowupID());
                stm.setString(2, followup.getEventID());
                stm.setString(3, followup.getFollowupDetail());
                stm.setString(4, followup.getFollowupImage());
                stm.setString(5, followup.getFollowupVideo());
                check=stm.executeUpdate()>0;
            }
        } catch (Exception e){
            
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
    
    public List<FollowupDTO> getListFollowup(String eventID) throws SQLException{
        List<FollowupDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT followupID, followupDetail, followupImage, followupVideo FROM tblFollowupEvent " 
                        +    " WHERE eventID = ? " ;
                stm = conn.prepareStatement(sql);
                stm.setString(1, eventID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String followupID = rs.getString("followupID");
                    String followupDetail = rs.getString("followupDetail");
                    String followupImage = rs.getString("followupImage");
                    String followupVideo = rs.getString("followupVideo");
                    
                    list.add(new FollowupDTO(followupID, eventID, followupDetail, followupImage, followupVideo));
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
