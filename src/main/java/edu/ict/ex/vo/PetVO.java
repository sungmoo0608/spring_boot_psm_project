package edu.ict.ex.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//
//desertionNo NUMBER NOT NULL,  -- 기본 키로 설정할 수 있음
//filename VARCHAR2(255 BYTE),
//happenDt DATE,
//happenPlace VARCHAR2(255 BYTE),
//kindCd VARCHAR2(50 BYTE),
//colorCd VARCHAR2(100 BYTE),
//age VARCHAR2(50 BYTE),
//weight VARCHAR2(20 BYTE),
//noticeNo VARCHAR2(50 BYTE),
//noticeSdt DATE,
//noticeEdt DATE,


//popfile VARCHAR2(255 BYTE),
//processState VARCHAR2(50 BYTE),
//sexCd VARCHAR2(10 BYTE),
//neuterYn CHAR(1 BYTE),
//specialMark VARCHAR2(255 BYTE),
//careNm VARCHAR2(100 BYTE),
//careTel VARCHAR2(50 BYTE),



//careAddr VARCHAR2(255 BYTE),
//orgNm VARCHAR2(100 BYTE),
//chargeNm VARCHAR2(100 BYTE),
//officetel VARCHAR2(50 BYTE),
//CONSTRAINT pk_desertionNo PRIMARY KEY (desertionNo)  

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PetVO  {

	private int desertionNo;
	private String filename;
	private Date happenDt;
	private String happenPlace;
	private String kindCd;
	private String colorCd;
	private String age;
	private String weight;
	private String noticeNo;
	private Date noticeSdt;
	private Date noticeEdt;
	private String popfile;
	private String processState;
	private String sexCd;
	private String neuterYn;
	private String specialMark;
	private String careNm;
	private String careTel;
	private String careAddr;
	private String orgNm;
	private String chargeNm;
	private String officetel;
	
	
	

}


















