Create Database RpgGame;

Use RpgGame;


/*테이블 생성*/
/*회원*/
Create table 회원(
 회원ID char(10) not null,
 회원이름 Char(10),
 주민번호  int,
 연락처 char(20),
 성별 char(5),
 시 char(10),
 구 char(20),
 동 char(20),
 Primary key(회원ID)
);

/*데이터입력*/
Insert Into 회원 Values('Q-0001','임동균',980906,'01000000036','남','천안시','서북구','두정동');
Insert Into 회원 Values('Q-0002','변진원',981029,'01000000003','남','경기도','남양주시','호평동');
Insert Into 회원 Values('Q-0003','최선규',980711,'01000000065','남','강원도','속초시','금호동');
Insert Into 회원 Values('Q-0004','구병무',990211,'01000000010','남','서울시','동작구','흑석동');
Insert Into 회원 Values('Q-0005','이건희',981129,'01000000064','남','부산시','해운대구','송정동');
Insert Into 회원 Values('Q-0006','김기선',980817,'01000000009','남','경상남도','목포시','원산동');
Insert Into 회원 Values('Q-0007','문제욱',990308,'01000000053','남','경기도','고양시','일산동구');
Insert Into 회원 Values('Q-0008','이민규',980819,'01000000031','남','서울시','마포구','망원동');
Insert Into 회원 Values('Q-0009','조건희',981229,'01000000001','남','전자도','전주시','진북동');
Insert Into 회원 Values('Q-0010','박선우',980606,'01060000000','남','부산시','해운대구','좌1동');

/*실행결과*/
Select *
From 회원;

./*테이블 생성*/
/*AI친구*/
Create table AI친구(
 AI친구ID char(10) not null,
 AI친구닉네임 char(10),
 레벨 int Check (레벨 <201),  /*레벨(200)을 제한해두었습니다.*/
 Primary key(AI친구ID)
);

/*데이터입력*/
Insert Into AI친구 Values('F-2001','방규',100);
Insert Into AI친구 Values('F-2002','아나보니',110);
Insert Into AI친구 Values('F-2003','마식',130);
Insert Into AI친구 Values('F-2004','제형님',140);
Insert Into AI친구 Values('F-2005','멍히',160);
Insert Into AI친구 Values('F-2006','민두',170);
Insert Into AI친구 Values('F-2007','머범',190);

/*실행결과*/
Select *
From AI친구;

/*테이블 생성*/
/*캐릭터*/
Create table 캐릭터(
 캐릭터ID char(10) not null,
 캐릭터이름 char(20),
 직업 char(20),
 능력치 char(10),
 유저번호 char(10),
 AI친구번호 char(10),
 Primary key(캐릭터ID),
 Foreign key(유저번호) references 유저(유저ID),
 Foreign key(AI친구번호) references AI친구(AI친구ID)
);

/*데이터입력*/
Insert Into 캐릭터 Values('C-001','메이슨','전사','힘','U-1004','F-2001');
Insert Into 캐릭터 Values('C-002','에리스','궁수','민첩','U-1002','F-2002');
Insert Into 캐릭터 Values('C-003','아이스','마법사','지혜','U-1003','F-2004');
Insert Into 캐릭터 Values('C-004','비즐라','도적','행운','U-1001','F-2005');
Insert Into 캐릭터 Values('C-005','프랑이','오우거','체력','U-1004',null);
Insert Into 캐릭터 Values('C-006','마리아','성직자','지혜',null,'F-2003');
Insert Into 캐릭터 Values('C-007','카이린','해적','행운','U-1007','F-2006');
Insert Into 캐릭터 Values('C-008','앨리스','기사','힘','U-1006','F-2007');

/*실행결과*/
Select * 
From 캐릭터;
