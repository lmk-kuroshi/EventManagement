/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.register;

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
public class RegisterDAO {
    public RegisterDTO checkRegister(String eventID, String userID) throws SQLException, ClassNotFoundException{
        RegisterDTO register = new RegisterDTO();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtil.getConnection();
            if(con!=null){
                String sql = "SELECT registerID, registerStatus FROM tblRegister WHERE eventID=? AND userID=?";
                stm=con.prepareStatement(sql);
                stm.setString(1, eventID);
                stm.setString(2, userID);
                rs=stm.executeQuery();
                while (rs.next()) {                    
                    String registerID = rs.getString("registerID");
                    String registerStatus = rs.getString("registerStatus");
                    register = new RegisterDTO(registerID, eventID, userID, registerStatus);
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
        return register;
    }
    
    public boolean addRegister (RegisterDTO register) throws ClassNotFoundException, SQLException{
        boolean check=false;
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtil.getConnection();
            if(con !=null){
                String sql = "INSERT INTO tblRegister(registerID, eventID, userID, registerStatus) VALUES (?,?,?,?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, register.getRegisterID());
                stm.setString(2, register.getEventID());
                stm.setString(3, register.getStudentID());
                stm.setString(4, register.getRegisterStatus());
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
    
    
    public List<RegisterDTO> getListRegister (String userID) throws SQLException{
        List<RegisterDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                String sql = "SELECT registerID, tblRegister.eventID, registerStatus, eventName"
                        + " FROM tblEvent, tblRegister"
                        + " WHERE tblEvent.eventID = tblRegister.eventID"
                        + " AND userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                
                rs = stm.executeQuery();
                while (rs.next()) {
                    String registerID = rs.getString("registerID");
                    String eventID = rs.getString("eventID");
                    String registerStatus = rs.getString("registerStatus");
                    String eventName = rs.getString("eventName");
                    list.add(new RegisterDTO(registerID, eventID, eventID, registerStatus, eventName));
                
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
