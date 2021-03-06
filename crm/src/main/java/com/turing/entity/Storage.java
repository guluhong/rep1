package com.turing.entity;

import java.io.Serializable;

public class Storage implements Serializable {
    private Integer stkId;

    private Integer stkProdId;

    private String stkWarehouse;

    private String stkWare;

    private Integer stkCount;

    private String stk;

    private static final long serialVersionUID = 1L;

    public Integer getStkId() {
        return stkId;
    }

    public void setStkId(Integer stkId) {
        this.stkId = stkId;
    }

    public Integer getStkProdId() {
        return stkProdId;
    }

    public void setStkProdId(Integer stkProdId) {
        this.stkProdId = stkProdId;
    }

    public String getStkWarehouse() {
        return stkWarehouse;
    }

    public void setStkWarehouse(String stkWarehouse) {
        this.stkWarehouse = stkWarehouse == null ? null : stkWarehouse.trim();
    }

    public String getStkWare() {
        return stkWare;
    }

    public void setStkWare(String stkWare) {
        this.stkWare = stkWare == null ? null : stkWare.trim();
    }

    public Integer getStkCount() {
        return stkCount;
    }

    public void setStkCount(Integer stkCount) {
        this.stkCount = stkCount;
    }

    public String getStk() {
        return stk;
    }

    public void setStk(String stk) {
        this.stk = stk == null ? null : stk.trim();
    }
}