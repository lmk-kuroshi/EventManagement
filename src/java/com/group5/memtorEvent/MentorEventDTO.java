/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.memtorEvent;

/**
 *
 * @author Minh Khoa
 */
public class MentorEventDTO {
    private String mentorEventID;
    private String eventID;
    private String mentorID;
    private String memtorName;
    private String mentorEventStatus;
    

    public MentorEventDTO() {
    }

    public MentorEventDTO(String mentorEventID, String eventID, String mentorID, String mentorEventStatus) {
        this.mentorEventID = mentorEventID;
        this.eventID = eventID;
        this.mentorID = mentorID;
        this.mentorEventStatus = mentorEventStatus;
    }

    public MentorEventDTO(String mentorEventID, String eventID, String mentorID, String memtorName, String mentorEventStatus) {
        this.mentorEventID = mentorEventID;
        this.eventID = eventID;
        this.mentorID = mentorID;
        this.memtorName = memtorName;
        this.mentorEventStatus = mentorEventStatus;
    }

    
    public String getMentorEventID() {
        return mentorEventID;
    }

    public void setMentorEventID(String mentorEventID) {
        this.mentorEventID = mentorEventID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public String getMentorID() {
        return mentorID;
    }

    public void setMentorID(String mentorID) {
        this.mentorID = mentorID;
    }

    public String getMentorEventStatus() {
        return mentorEventStatus;
    }

    public void setMentorEventStatus(String mentorEventStatus) {
        this.mentorEventStatus = mentorEventStatus;
    }

    public String getMemtorName() {
        return memtorName;
    }

    public void setMemtorName(String memtorName) {
        this.memtorName = memtorName;
    }
    
    
}
