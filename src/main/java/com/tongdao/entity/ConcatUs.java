/**
 * Project:cxh_first_practice
 * File:MotherCompanny.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author homolo-89
 * @date 2018年5月3日
 */
public class ConcatUs implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Long id;//主键id
	private String companyName;//公司名称
	private String pid;//pid
	private String phoneNumber;//联系电话
	private String fax;//传真
	private String officialAccounts;//微信公众号
	private String email;//邮箱
	private Date establishedTime;//公司成立时间
	private String  allDayServcePhone;//7×24小时服务电话
	private String  address;//联系地址
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getOfficialAccounts() {
		return officialAccounts;
	}
	public void setOfficialAccounts(String officialAccounts) {
		this.officialAccounts = officialAccounts;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getEstablishedTime() {
		return establishedTime;
	}
	public void setEstablishedTime(String establishedTimeStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			this.establishedTime = new Date(sdf.parse(establishedTimeStr).getTime());
		} catch (Exception e) {
		}
		
	}
	public String getAllDayServcePhone() {
		return allDayServcePhone;
	}
	public void setAllDayServcePhone(String allDayServcePhone) {
		this.allDayServcePhone = allDayServcePhone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "ConcatUs [id=" + id + ", companyName=" + companyName + ", pid=" + pid + ", phoneNumber=" + phoneNumber + ", fax=" + fax + ", officialAccounts=" + officialAccounts + ", email=" + email + ", establishedTime=" + establishedTime
				+ ", allDayServcePhone=" + allDayServcePhone + ", address=" + address + "]";
	}
	
	
}
