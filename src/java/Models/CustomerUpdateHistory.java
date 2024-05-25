/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class CustomerUpdateHistory {
    private int logId;
    private Date updateDate;
    private String emailNew;
    private String nameNew;
    private String genderNew;
    private String phoneNew;
    private String addressNew;
    private String updaterName;

    public CustomerUpdateHistory(int logId, Date updateDate, String emailNew, String nameNew, String genderNew, String phoneNew, String addressNew, String updaterName) {
        this.logId = logId;
        this.updateDate = updateDate;
        this.emailNew = emailNew;
        this.nameNew = nameNew;
        this.genderNew = genderNew;
        this.phoneNew = phoneNew;
        this.addressNew = addressNew;
        this.updaterName = updaterName;
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getEmailNew() {
        return emailNew;
    }

    public void setEmailNew(String emailNew) {
        this.emailNew = emailNew;
    }

    public String getNameNew() {
        return nameNew;
    }

    public void setNameNew(String nameNew) {
        this.nameNew = nameNew;
    }

    public String getGenderNew() {
        return genderNew;
    }

    public void setGenderNew(String genderNew) {
        this.genderNew = genderNew;
    }

    public String getPhoneNew() {
        return phoneNew;
    }

    public void setPhoneNew(String phoneNew) {
        this.phoneNew = phoneNew;
    }

    public String getAddressNew() {
        return addressNew;
    }

    public void setAddressNew(String addressNew) {
        this.addressNew = addressNew;
    }

    public String getUpdaterName() {
        return updaterName;
    }

    public void setUpdaterName(String updaterName) {
        this.updaterName = updaterName;
    }
}