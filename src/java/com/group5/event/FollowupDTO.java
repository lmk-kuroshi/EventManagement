/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.event;

/**
 *
 * @author Minh Khoa
 */
public class FollowupDTO {
    private String followupID;
    private String eventID;
    private String followupDetail;
    private String followupImage;
    private String followupVideo;

    public FollowupDTO() {
    }

    public FollowupDTO(String followupID, String eventID, String followupDetail, String followupImage, String followupVideo) {
        this.followupID = followupID;
        this.eventID = eventID;
        this.followupDetail = followupDetail;
        this.followupImage = followupImage;
        this.followupVideo = followupVideo;
    }

    public String getFollowupID() {
        return followupID;
    }

    public void setFollowupID(String followupID) {
        this.followupID = followupID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public String getFollowupDetail() {
        return followupDetail;
    }

    public void setFollowupDetail(String followupDetail) {
        this.followupDetail = followupDetail;
    }

    public String getFollowupImage() {
        return followupImage;
    }

    public void setFollowupImage(String followupImage) {
        this.followupImage = followupImage;
    }

    public String getFollowupVideo() {
        return followupVideo;
    }

    public void setFollowupVideo(String followupVideo) {
        this.followupVideo = followupVideo;
    }
    
    
}
