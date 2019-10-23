package com.turing.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SalPlan implements Serializable {
    private Integer plaId;

    private Integer plaChcId;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date plaDate;

    private String plaTode;

    private String plaResule;

    private static final long serialVersionUID = 1L;

    public Integer getPlaId() {
        return plaId;
    }

    public void setPlaId(Integer plaId) {
        this.plaId = plaId;
    }

    public Integer getPlaChcId() {
        return plaChcId;
    }

    public void setPlaChcId(Integer plaChcId) {
        this.plaChcId = plaChcId;
    }

    public Date getPlaDate() {
        return plaDate;
    }

    public void setPlaDate(Date plaDate) {
        this.plaDate = plaDate;
    }

    public String getPlaTode() {
        return plaTode;
    }

    public void setPlaTode(String plaTode) {
        this.plaTode = plaTode == null ? null : plaTode.trim();
    }

    public String getPlaResule() {
        return plaResule;
    }

    public void setPlaResule(String plaResule) {
        this.plaResule = plaResule == null ? null : plaResule.trim();
    }
}