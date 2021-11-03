/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.register;

/**
 *
 * @author Minh Khoa
 */
public class RegisterDTO {
    private String registerID;
    private String eventID;
    private String studentID;
    private String registerStatus;
    private String eventName;

    public RegisterDTO() {
    }

    public RegisterDTO(String registerID, String eventID, String studentID, String registerStatus) {
        this.registerID = registerID;
        this.eventID = eventID;
        this.studentID = studentID;
        this.registerStatus = registerStatus;
    }

    public RegisterDTO(String registerID, String eventID, String studentID, String registerStatus, String eventName) {
        this.registerID = registerID;
        this.eventID = eventID;
        this.studentID = studentID;
        this.registerStatus = registerStatus;
        this.eventName = eventName;
    }

    public String getRegisterID() {
        return registerID;
    }

    public void setRegisterID(String registerID) {
        this.registerID = registerID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getRegisterStatus() {
        return registerStatus;
    }

    public void setRegisterStatus(String registerStatus) {
        this.registerStatus = registerStatus;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }
    
    
}
