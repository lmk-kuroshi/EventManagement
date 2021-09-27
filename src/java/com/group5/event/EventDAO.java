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
                String sql = "SELECT eventID, eventName, creatorID, categoryID, locationID, eventDetail, seat, creatTime, startTime, endTime, image, video, status FROM tblEvent WHERE eventName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String eventID = rs.getString("eventID");
                    String eventName = rs.getString("eventName");
                    String creatorID = rs.getString("creatorID");
                    String categoryID = rs.getString("categoryID");
                    String locationID = rs.getString("locationID");
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
}
