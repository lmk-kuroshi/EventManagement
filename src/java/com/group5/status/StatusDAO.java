/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.status;

import com.group5.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class StatusDAO {
    public String getStatusName(String statusID) throws SQLException{
        String statusName = "";
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtil.getConnection();
            if(connect != null){
                String sql = "SELECT statusName "
                        + " FROM tblStatus "
                        + " WHERE statusID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, statusID);
                rs = stm.executeQuery();
                while(rs.next()){
                    statusName = rs.getString("statusName");
                }
            }
        } catch (Exception e) {
        } finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return statusName;
    }

    public String getStatusID(String statusName) throws SQLException{
        String statusID = "";
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtil.getConnection();
            if(connect != null){
                String sql = "SELECT statusID "
                        + " FROM tblStatus "
                        + " WHERE statusName=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, statusName);
                rs = stm.executeQuery();
                while(rs.next()){
                    statusID = rs.getString("statusID");
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return statusID;
    }
}
