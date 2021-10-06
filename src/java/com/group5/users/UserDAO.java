/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.users;

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
public class UserDAO {
     public UserDTO checkLoginSpecial(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT userName, userEmail, statusID, roleID FROM tblUser WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userName =rs.getString("userName");
                    String userEmail =rs.getString("userEmail");
                    String roleID =rs.getString("roleID");
                    String status = rs.getString("statusID");
                    user = new UserDTO(userID, userEmail, status, userName, roleID) ;
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
        return user;
    }
     
    public boolean insertUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtil.getConnection();
            if (con != null) {
                String sql = "INSERT INTO tblUser(userID, userEmail, statusID, userName, roleID) VALUES(?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getId());
                stm.setString(2, user.getName());
                stm.setString(3, user.getEmail());
                stm.setString(4, user.getStatus());
                stm.setString(5, user.getRoleID());
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
    
    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect = DBUtil.getConnection();
            if (connect != null) {
                String sql = "SELECT userID, userEmail, userName, statusID, roleID "
                        + " FROM tblUser "
                        + " WHERE userName like ? ";
                stm = connect.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String userName = rs.getString("userName");
                    String userEmail = rs.getString("userEmail");
                    String statusID = rs.getString("statusID");
                    String roleID = rs.getString("roleID");
                    list.add(new UserDTO(userID, userEmail, statusID, userName, roleID));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return list;
    }

    //change status
    public boolean deleteUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtil.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblUser "
                        + " SET statusID=?"
                        + " WHERE userID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, user.getStatus());
                stm.setString(2, user.getId());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtil.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblUser "
                        + " SET userName=?, userEmail=?, roleID=?"
                        + " WHERE userID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getRoleID());
                stm.setString(4, user.getId());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }

    public boolean restoreUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection connect = null;
        PreparedStatement stm = null;
        try {
            connect = DBUtil.getConnection();
            if (connect != null) {
                String sql = "UPDATE tblUser "
                        + " SET statusID=?"
                        + " WHERE userID=?";
                stm = connect.prepareStatement(sql);
                stm.setString(1, user.getStatus());
                stm.setString(2, user.getId());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (connect != null) {
                connect.close();
            }
        }
        return check;
    }
}
