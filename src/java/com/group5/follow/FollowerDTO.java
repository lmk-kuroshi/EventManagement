/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.follow;

/**
 *
 * @author ASUS
 */
public class FollowerDTO {
    private String eventName;
    private String followerName;
    private String email;

    public FollowerDTO() {
    }

    public FollowerDTO(String eventName, String followerName, String email) {
        this.eventName = eventName;
        this.followerName = followerName;
        this.email = email;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getFollowerName() {
        return followerName;
    }

    public void setFollowerName(String followerName) {
        this.followerName = followerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
