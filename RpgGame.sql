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

/*테이블 생성*/
/*스킬*/
Create table 스킬(
 스킬ID char(10) not null,
 이름 char(10),
 Primary Key(스킬ID)
);

/*직업에 따라 앞에 숫자가 다릅니다.*/
/*데이터 입력*/
Insert Into 스킬 Values('S-101','슬래쉬');
Insert Into 스킬 Values('S-102','로아이아스');
Insert Into 스킬 Values('S-201','매직볼트');
Insert Into 스킬 Values('S-301','플래쉬');
Insert Into 스킬 Values('S-401','카르마');
Insert Into 스킬 Values('S-501','지진');
Insert Into 스킬 Values('S-601','힐');
Insert Into 스킬 Values('S-701','디스펠');
Insert Into 스킬 Values('S-801','건불릿');
Insert Into 스킬 Values('S-901','카이저');
Insert Into 스킬 Values('S-902','인핸스');

/*실행결과*/
Select *
From 스킬;

/*테이블작성*/
/*npc*/
Create table npc(
 NPCID char(10) not null,
 이름 char(20),
 Primary key(NPCID)
);

/*데이터 입력*/
Insert Into npc Values('N-001','에릭');
Insert Into npc Values('N-002','별빛');
Insert Into npc Values('N-003','아카');
Insert Into npc Values('N-004','달빛');
Insert Into npc Values('N-005','레오나');
Insert Into npc Values('N-006','카산드라');
Insert Into npc Values('N-007','리산드라');
Insert Into npc Values('N-008','메기슨');
Insert Into npc Values('N-009','밍밍부인');
Insert Into npc Values('N-010','메덕');

/*실행결과*/
Select *
From npc;

/*테이블 생성*/
/*소환수*/
Create table 소환수(
소환수ID char(10) not null,
이름 char(20),
종류 char(10),
스킬 char(20),
뽑은유저 char(10),
뽑은AI친구 char(10),
Primary Key(소환수ID),
Foreign key(뽑은유저) references 유저(유저ID),
Foreign key(뽑은AI친구) references AI친구(AI친구ID)
);

/*데이터 입력*/
Insert Into 소환수 Values('A-001','두더리','두더지','땅파기','U-1002','F-2003');
Insert Into 소환수 Values('A-002','참새','참새','초음파','U-1001','F-2004');
Insert Into 소환수 Values('A-003','도래곤','드래곤','불꽃발사','U-1004','F-2001');
Insert Into 소환수 Values('A-004','싱어','상어','깨물기','U-1005','F-2005');
Insert Into 소환수 Values('A-005','윈숭이','원숭이','껍질던지기','U-1003','F-2002');
Insert Into 소환수 Values('A-006','냥코','고양이','할퀴기','U-1001',null);
Insert Into 소환수 Values('A-007','배불뚝','바다코끼리','배치기','U-1006','F-2006');
Insert Into 소환수 Values('A-008','해다리','해달','조개표창','U-1007',null);
Insert Into 소환수 Values('A-009','고슴치','고슴도치','뿔찌르기','U-1007','F-2007');
Insert Into 소환수 Values('A-010','팬다','판다','죽순휘두르기',null,'F-2005');

/*실행결과*/
Select *
From 소환수;
