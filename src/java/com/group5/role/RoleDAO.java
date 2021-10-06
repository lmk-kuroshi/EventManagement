/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.role;

import com.group5.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class RoleDAO {
    public String getRoleName(String roleID) throws SQLException{
        String roleName = "";
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtil.getConnection();
            if(connect != null){
                String sql = "SELECT roleName "
                        + " FROM tblRole"
                        + " WHERE roleID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, roleID);
                rs = stm.executeQuery();
                while(rs.next()){
                    roleName = rs.getString("roleName");
                }
            }
        } catch (Exception e) {
        } finally{
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return roleName;
    }

    public String getRoleID(String roleName) throws SQLException{
        String roleID = "";
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtil.getConnection();
            if(connect != null){
                String sql = "SELECT roleID "
                        + " FROM tblRole "
                        + " WHERE roleName=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, roleName);
                rs = stm.executeQuery();
                while(rs.next()){
                    roleID = rs.getString("roleID");
                }
            }
        } catch (Exception e) {
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(connect != null) connect.close();
        }
        return roleID;
    }
}
