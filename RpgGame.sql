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

/*테이블 생성*/
/*몬스터*/
Create table 몬스터 (
몬스터ID char(10) not null,
이름	char(20),
레벨 int Check(레벨<201),
경험치 int,
체력 int,
공격력 int,
방어력 int,
속성 char(10),
Primary Key(몬스터ID)
);

/*데이터 입력*/
Insert Into 몬스터 Values('M-001','돼징',7,12,30,5,7,'노말');
Insert Into 몬스터 Values('M-002','하망',30,45,45,10,15,'물');
Insert Into 몬스터 Values('M-003','눅대',50,90,584,74,31,'불꽃');
Insert Into 몬스터 Values('M-004','퐈프리카',60,125,1700,105,56,'강철');
Insert Into 몬스터 Values('M-005','멧돼징',82,145,1950,120,62,'노말');
Insert Into 몬스터 Values('M-006','라프리카',93,170,2100,135,67,'에스퍼');
Insert Into 몬스터 Values('M-007','메가메기',120,450,2789,755,70,'전기');
Insert Into 몬스터 Values('M-008','울트라상어',140,540,3489,850,80,'물');
Insert Into 몬스터 Values('M-009','울픙',160,750,4486,960,90,'독');
Insert Into 몬스터 Values('M-010','불원숭이',180,840,4987,1050,99,'불');

/*실행결과*/
Select *
From 몬스터;


/*테이블 생성*/
/*아이템*/
Create table 아이템(
아이템ID char(10) not null,
아이템이름 char(20),
공격력 int,
방어력 int,
잠재능력 char(4),
Primary key(아이템ID)
);

/*데이터 입력*/
Insert Into 아이템 Values('I-001','천갑옷',5,10,'유');
Insert Into 아이템 Values('I-002','가죽장화',5,20,'유');
Insert Into 아이템 Values('I-003','천망토',8,30,'무');
Insert Into 아이템 Values('I-004','노가다장갑',15,20,'무');
Insert Into 아이템 Values('I-005','면바지',5,30,'유');
Insert Into 아이템 Values('I-006','불릿',100,0,'무');
Insert Into 아이템 Values('I-007','건틀릿',95,30,'유');
Insert Into 아이템 Values('I-008','대거',75,30,'유');
Insert Into 아이템 Values('I-009','래피드',65,20,'유');
Insert Into 아이템 Values('I-010','성경',85,50,'유');

/*실행결과*/
Select *
From 아이템;


/*테이블 생성*/
/*Map*/
Create table Map(
MapID char(10) not null,
Map이름 char(10),
날씨 char(8),
지형 char(8),
Primary key (MapID)
);

/*데이터입력*/
Insert Into Map Values('P-001','아리안트','더움','사막지대');
Insert Into Map Values('P-002','엘로스','추움','빙하지대');
Insert Into Map Values('P-003','헤네','온화','평야지대');
Insert Into Map Values('P-004','여로','추움','설야지대');
Insert Into Map Values('P-005','바닷가','태풍','심해');
Insert Into Map Values('P-006','불지옥','뜨거움','용암대지');
Insert Into Map Values('P-007','여로','거움','암석지대');
Insert Into Map Values('P-008','브리튼','온화','성벽');
Insert Into Map Values('P-009','코크타운','시원','콜라마을');
Insert Into Map Values('P-010','시공간',null,null);

/*실행결과*/
Select *
From Map;

/*테이블 생성*/
/*위치*/
Create table 위치(
맵번호 char(10) not null,
몬스터번호 char(10) not null,
Npc번호 char(10) not null,
Primary Key(맵번호,몬스터번호,Npc번호),
Foreign key(맵번호) references Map(MapID),
Foreign key(몬스터번호) references 몬스터(몬스터ID),
Foreign key(Npc번호) references npc(npcID)
);

/*데이터 입력*/
Insert Into 위치 Values('P-001','M-010','N-006');
Insert Into 위치 Values('P-002','M-009','N-004');
Insert Into 위치 Values('P-003','M-001','N-003');
Insert Into 위치 Values('P-004','M-004','N-002');
Insert Into 위치 Values('P-005','M-008','N-001');
Insert Into 위치 Values('P-006','M-003','N-008');
Insert Into 위치 Values('P-007','M-005','N-009');
Insert Into 위치 Values('P-008','M-002','N-005');
Insert Into 위치 Values('P-009','M-007','N-007');
Insert Into 위치 Values('P-010','M-006','N-010');

/*실행결과*/
Select *
From 위치;

/*테이블 생성*/
/*이동*/
Create table 이동(
맵번호 char(10) not null,
Npc번호 char(10) not null,
유저번호 char(10),
수레 char(10),
동물 char(10),
텔레포트 char(20),
Primary Key(맵번호,Npc번호),
Foreign key(유저번호) references 유저(유저ID),
Foreign key(맵번호) references Map(MapID),
Foreign key(Npc번호) references npc(npcID)
);

/*데이터입력*/
Insert Into 이동 Values('P-001','N-006','U-1001','마차','낙타',null);
Insert Into 이동 Values('P-002','N-004','U-1001','썰매','사냥개',null);
Insert Into 이동 Values('P-003','N-003','U-1002','마차','말','텔레포트');
Insert Into 이동 Values('P-004','N-002','U-1003','썰매','사냥개',null);
Insert Into 이동 Values('P-005','N-001','U-1005','배','고래',null);
Insert Into 이동 Values('P-006','N-008','U-1006','용암선박',null,null);
Insert Into 이동 Values('P-007','N-009','U-1009','수송선','그란돈','텔레포트');
Insert Into 이동 Values('P-008','N-005','U-1010','마차','말','텔레포트');
Insert Into 이동 Values('P-009','N-007','U-1003','자전거','곰',null);
Insert Into 이동 Values('P-010','N-010','U-1004',null,null,'텔레포트');

/*실행결과*/
Select *
From 이동;

/*테이블 생성*/
/*퀘스트*/
Create table 퀘스트(
유저번호 char(10) not null,
Npc번호 char(10) not null,
아이템 char(20),
경험치 int,
Primary Key(유저번호,Npc번호),
Foreign key(Npc번호) references npc(npcID),
Foreign key(유저번호) references 유저(유저ID)
);

/*데이터 입력*/
Insert Into 퀘스트 Values('U-1001','N-001','낚시대',500);
Insert Into 퀘스트 Values('U-1001','N-002','아이젠',30);
Insert Into 퀘스트 Values('U-1003','N-003','용사의반지',55);
Insert Into 퀘스트 Values('U-1003','N-004','빨간귀고리',100);
Insert Into 퀘스트 Values('U-1004','N-005','소환수알',500);
Insert Into 퀘스트 Values('U-1005','N-006','모험가의 로브',350);
Insert Into 퀘스트 Values('U-1005','N-007','모험가의 모자',400);
Insert Into 퀘스트 Values('U-1006','N-008','기사의맹세',700);
Insert Into 퀘스트 Values('U-1006','N-009','돌풍',1000);
Insert Into 퀘스트 Values('U-1007','N-010','솔라리',1200);

/*실행결과*/
Select *
From 퀘스트;

/*테이블 생성*/
/*교류*/
Create table 교류(
유저번호 char(10) not null,
AI친구번호 char(10) not null,
정보 char(20),
Primary key(유저번호,AI친구번호),
Foreign key(유저번호) references 유저(유저ID),
Foreign key(AI친구번호) references AI친구(AI친구ID)
);

/*데이터입력*/
Insert Into 교류 Values('U-1001','F-2001','몬스터정보');
Insert Into 교류 Values('U-1001','F-2002','스토리정보');
Insert Into 교류 Values('U-1002','F-2003','방어구정보');
Insert Into 교류 Values('U-1002','F-2004','무기정보');
Insert Into 교류 Values('U-1002','F-2005','스토리정보');
Insert Into 교류 Values('U-1003','F-2001','보스정보');
Insert Into 교류 Values('U-1003','F-2002','아이템정보');
Insert Into 교류 Values('U-1004','F-2006','퀘스트정보');
Insert Into 교류 Values('U-1006','F-2007','장신구정보');
Insert Into 교류 Values('U-1007','F-2005','퀘스트정보');

/*실행결과*/
Select *
From 교류;

/*테이블 생성*/
/*모험*/
Create table 모험(
유저번호 char(10) not null,
AI친구번호 char(10) not null,
퀘스트 char(20),
레이드 char(20),
스토리 char(10),
Primary key(유저번호,AI친구번호),
Foreign key(유저번호) references 유저(유저ID),
Foreign key(AI친구번호) references AI친구(AI친구ID)
);


/*데이터입력*/
Insert Into 모험 Values('U-1001','F-2002',null,null,'1장');
Insert Into 모험 Values('U-1001','F-2003',null,'울트라상어','2장');
Insert Into 모험 Values('U-1002','F-2002','동전찾기',null,null);
Insert Into 모험 Values('U-1003','F-2004',null,'메가메기',null);
Insert Into 모험 Values('U-1003','F-2005','심해탐방',null,'4장');
Insert Into 모험 Values('U-1004','F-2006','과제돕기','퐈프리카','5장');
Insert Into 모험 Values('U-1005','F-2007',null,'메가메기','3장');
Insert Into 모험 Values('U-1006','F-2007','털모으기','울픙','4장');
Insert Into 모험 Values('U-1007','F-2003','불모으기','불원숭이','5장');
Insert Into 모험 Values('U-1007','F-2004','강력한이빨수집','울트라상어','7장');

/*실행결과*/
Select *
From 모험;

/*테이블 생성*/
/*장착*/
Create table 장착(
캐릭터번호 char(10) not null,
아이템번호 char(10) not null,
아이템효과 char(20),
Primary key(캐릭터번호,아이템번호),
Foreign key(캐릭터번호) references 캐릭터(캐릭터ID),
Foreign key(아이템번호) references 아이템(아이템ID)
);

/*데이터입력*/
Insert Into 장착 Values('C-004','I-008','비즐라세트');
Insert Into 장착 Values('C-004','I-005','비즐라세트');
Insert Into 장착 Values('C-002','I-002','상급세트');
Insert Into 장착 Values('C-002','I-004',null);
Insert Into 장착 Values('C-003','I-010','법사세트');
Insert Into 장착 Values('C-003','I-004',null);
Insert Into 장착 Values('C-004','I-009','기사단세트');
Insert Into 장착 Values('C-005','I-005','초보세트');
Insert Into 장착 Values('C-007','I-006','해적왕세트');
Insert Into 장착 Values('C-007','I-001','중급세트');
Insert Into 장착 Values('C-008','I-009','기사단세트');

/*실행결과*/
Select *
From 장착;

/*테이블 생성*/
/*습득*/
Create table 습득(
 스킬번호 char(10) not null,
 캐릭터번호 char(10) not null ,
 효과 char(20),
 Foreign key(스킬번호) references 스킬(스킬ID),
 Foreign key(캐릭터번호) references 캐릭터(캐릭터ID)
);

/*데이터 입력*/
Insert Into 습득 Values('S-101','C-001','기본공격강화')
Insert Into 습득 Values('S-102','C-001','방어력증가')
Insert Into 습득 Values('S-201','C-003',null)
Insert Into 습득 Values('S-301','C-002','이동속도증가')
Insert Into 습득 Values('S-401','C-004','공격력강화')
Insert Into 습득 Values('S-501','C-005',null)
Insert Into 습득 Values('S-601','C-006','체력회복')
Insert Into 습득 Values('S-701','C-006','증상회복')
Insert Into 습득 Values('S-801','C-007','총알강화')
Insert Into 습득 Values('S-901','C-008','변신')
Insert Into 습득 Values('S-902','C-008','공격속도증가')

/*실행결과*/
Select *
From 습득;

/*테이블 생성*/
/*전쟁*/
Create table 전쟁(
유저번호 char(10) not null,
몬스터번호 char(10) not null,
소환수번호 char(10) not null,
보상골드 int,
주문서 char(20),
Primary Key(유저번호,몬스터번호,소환수번호),
Foreign key(유저번호) references 유저(유저ID),
Foreign key(몬스터번호) references 몬스터(몬스터ID),
Foreign key(소환수번호) references 소환수(소환수ID)
);

/*데이터입력*/
Insert Into 전쟁 Values('U-1001','M-010','A-004',1000000,'스탯강화주문서');
Insert Into 전쟁 Values('U-1002','M-001','A-002',null,'신발강화주문서');
Insert Into 전쟁 Values('U-1003','M-002','A-001',100,'공격력강화주문서');
Insert Into 전쟁 Values('U-1004','M-003','A-005',1000,null);
Insert Into 전쟁 Values('U-1004','M-004','A-003',10000,'장신구강화주문서');
Insert Into 전쟁 Values('U-1005','M-005','A-006',120000,'방어력강화주문서');
Insert Into 전쟁 Values('U-1006','M-006','A-008',170000,'더위강화주문서');
Insert Into 전쟁 Values('U-1006','M-008','A-010',190000,'수압강화주문서');
Insert Into 전쟁 Values('U-1007','M-007','A-009',15000,'스킬강화주문서');
Insert Into 전쟁 Values('U-1007','M-009','A-007',110000,'추위강화주문서');

/*실행결과*/
Select*
From 전쟁;
