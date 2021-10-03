/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.event;

import java.sql.Timestamp;

/**
 *
 * @author Minh Khoa
 */
public class EventError {
    private String eventIDError;
    private String eventNameError;
    private String creatorIDError;
    private String categoryIDError;
    private String locationIDError;
    private String eventDetailError;
    private String seatError;
    private String createTimeError;
    private String startTimeError;
    private String endTimeError;
    private String imageError;
    private String videoError;
    private String statusError;

    public EventError() {
        this.eventIDError = "";
        this.eventNameError = "";
        this.creatorIDError = "";
        this.categoryIDError = "";
        this.locationIDError = "";
        this.eventDetailError = "";
        this.seatError = "";
        this.createTimeError = "";
        this.startTimeError = "";
        this.endTimeError = "";
        this.imageError = "";
        this.videoError = "";
        this.statusError = "";
    }

    public EventError(String eventIDError, String eventNameError, String creatorIDError, String categoryIDError, String locationIDError, String eventDetailError, String seatError, String createTimeError, String startTimeError, String endTimeError, String imageError, String videoError, String statusError) {
        this.eventIDError = eventIDError;
        this.eventNameError = eventNameError;
        this.creatorIDError = creatorIDError;
        this.categoryIDError = categoryIDError;
        this.locationIDError = locationIDError;
        this.eventDetailError = eventDetailError;
        this.seatError = seatError;
        this.createTimeError = createTimeError;
        this.startTimeError = startTimeError;
        this.endTimeError = endTimeError;
        this.imageError = imageError;
        this.videoError = videoError;
        this.statusError = statusError;
    }

    public String getEventIDError() {
        return eventIDError;
    }

    public void setEventIDError(String eventIDError) {
        this.eventIDError = eventIDError;
    }

    public String getEventNameError() {
        return eventNameError;
    }

    public void setEventNameError(String eventNameError) {
        this.eventNameError = eventNameError;
    }

    public String getCreatorIDError() {
        return creatorIDError;
    }

    public void setCreatorIDError(String creatorIDError) {
        this.creatorIDError = creatorIDError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public String getLocationIDError() {
        return locationIDError;
    }

    public void setLocationIDError(String locationIDError) {
        this.locationIDError = locationIDError;
    }

    public String getEventDetailError() {
        return eventDetailError;
    }

    public void setEventDetailError(String eventDetailError) {
        this.eventDetailError = eventDetailError;
    }

    public String getSeatError() {
        return seatError;
    }

    public void setSeatError(String seatError) {
        this.seatError = seatError;
    }

    public String getCreateTimeError() {
        return createTimeError;
    }

    public void setCreateTimeError(String createTimeError) {
        this.createTimeError = createTimeError;
    }

    public String getStartTimeError() {
        return startTimeError;
    }

    public void setStartTimeError(String startTimeError) {
        this.startTimeError = startTimeError;
    }

    public String getEndTimeError() {
        return endTimeError;
    }

    public void setEndTimeError(String endTimeError) {
        this.endTimeError = endTimeError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getVideoError() {
        return videoError;
    }

    public void setVideoError(String videoError) {
        this.videoError = videoError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }
    
    
}
