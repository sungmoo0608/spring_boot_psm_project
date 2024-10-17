package edu.ict.ex.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*CATE_NO   NOT NULL NUMBER        
CATE_NAME          VARCHAR2(255) 
이름       널?       유형            
-------- -------- ------------- 
BNUM     NOT NULL NUMBER        
BTITLE            VARCHAR2(255) 
BCONTENT          CLOB          
BHIT              VARCHAR2(50)  
BSTEP             NUMBER        
BINDENT           NUMBER        
BGROUP            NUMBER        
BDATE             VARCHAR2(20)  
UID      NOT NULL VARCHAR2(50)  
CATE_NO  NOT NULL NUMBER      
*/

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PetBoardsCategoriesJoinVO  {
	
	private PetBoardsVO petboards;
	private PetBoardCategoriesVO categories;
	

}


















