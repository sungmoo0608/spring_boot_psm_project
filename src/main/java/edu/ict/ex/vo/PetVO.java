package edu.ict.ex.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름           널?       유형            
//------------ -------- ------------- 
//DESERTIONNO  NOT NULL NUMBER        
//FILENAME              VARCHAR2(255) 
//HAPPENDT              DATE          
//HAPPENPLACE           VARCHAR2(255) 
//KINDCD                VARCHAR2(50)  
//COLORCD               VARCHAR2(100) 
//AGE                   VARCHAR2(50)  
//WEIGHT                VARCHAR2(20)  
//NOTICENO              VARCHAR2(50)  
//NOTICESDT             DATE          
//NOTICEEDT             DATE          
//POPFILE               VARCHAR2(255) 
//PROCESSSTATE          VARCHAR2(50)  
//SEXCD                 VARCHAR2(10)  
//NEUTERYN              CHAR(1)       
//SPECIALMARK           VARCHAR2(255) 
//CARENM                VARCHAR2(100) 
//CARETEL               VARCHAR2(50)  
//CAREADDR              VARCHAR2(255) 
//ORGNM                 VARCHAR2(100) 
//CHARGENM              VARCHAR2(100) 
//OFFICETEL             VARCHAR2(50)  

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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
