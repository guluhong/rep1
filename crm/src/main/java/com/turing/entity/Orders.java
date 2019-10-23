package com.turing.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Orders implements Serializable {
    private Integer odrId;

    private String odrCustomer;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date odrDate;

    private String odrAddr;

    private String odrStatus;
    
    private OrdersLine ordersLine;
    
    private Product product;

    private static final long serialVersionUID = 1L;

    public OrdersLine getOrdersLine() {
		return ordersLine;
	}

	public void setOrdersLine(OrdersLine ordersLine) {
		this.ordersLine = ordersLine;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getOdrId() {
        return odrId;
    }

    public void setOdrId(Integer odrId) {
        this.odrId = odrId;
    }

    public String getOdrCustomer() {
        return odrCustomer;
    }

    public void setOdrCustomer(String odrCustomer) {
        this.odrCustomer = odrCustomer == null ? null : odrCustomer.trim();
    }

    public Date getOdrDate() {
        return odrDate;
    }

    public void setOdrDate(Date odrDate) {
        this.odrDate = odrDate;
    }

    public String getOdrAddr() {
        return odrAddr;
    }

    public void setOdrAddr(String odrAddr) {
        this.odrAddr = odrAddr == null ? null : odrAddr.trim();
    }

    public String getOdrStatus() {
        return odrStatus;
    }

    public void setOdrStatus(String odrStatus) {
        this.odrStatus = odrStatus == null ? null : odrStatus.trim();
    }
}