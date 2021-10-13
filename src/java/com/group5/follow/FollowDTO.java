/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.follow;

/**
 *
 * @author Minh Khoa
 */
public class FollowDTO {
    private String followID;
    private String eventID;
    private String studentID;
    private String followStatus;
    private String eventName;

    public FollowDTO() {
    }

    public FollowDTO(String followID, String eventID, String studentID, String followStatus) {
        this.followID = followID;
        this.eventID = eventID;
        this.studentID = studentID;
        this.followStatus = followStatus;
    }

    public FollowDTO(String followID, String eventID, String studentID, String followStatus, String eventName) {
        this.followID = followID;
        this.eventID = eventID;
        this.studentID = studentID;
        this.followStatus = followStatus;
        this.eventName = eventName;
    }

    
    public String getFollowID() {
        return followID;
    }

    public void setFollowID(String followID) {
        this.followID = followID;
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

    public String getFollowStatus() {
        return followStatus;
    }

    public void setFollowStatus(String followStatus) {
        this.followStatus = followStatus;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }
    
    
}
