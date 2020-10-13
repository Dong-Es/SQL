Create database 쇼핑몰;

use 쇼핑몰;

Create Table 고객(
 고객번호 char(10) not null,
 고객명 char(10),
 주소 char(20)
 primary key(고객번호)
);

Insert Into 고객 Values('C100','이희경','서울서초구');
Insert Into 고객 Values('C200','배기영',null);
Insert Into 고객 Values('C300','성주원','서울 종로구');

Select*
From 고객;

Create Table 제품(
 제품번호 char(10) not null,
 제품명 char(10),
 단가 int,
 primary key(제품번호)
);

Insert Into 제품 Values('p_001','마우스',20000);
Insert Into 제품 Values('p_002','키보드',30000);
Insert Into 제품 Values('p_003','모니터',300000);

Select*
From 제품;

Create Table 주문(
고객ID char(10) not null,
제품ID char(10) not null,
주문수량 int,
primary key(고객ID,제품ID),
Foreign key(고객ID) references 고객(고객번호),
Foreign key(제품ID) references 제품(제품번호),
)

Insert Into 주문 Values('C100','p_001',10);
Insert Into 주문 Values('C100','p_002',6);
Insert Into 주문 Values('C300','p_003',1);
Insert Into 주문 Values('C200','p_001',20);

Select*
From 주문;

--1)이희경 고객이 주문한 제품ID와 주문수량을 검색하시오.(조인/충첩)

--조인
Select 제품ID, 주문수량
From 주문, 고객
Where 주문.고객ID = 고객.고객번호 and 고객명='이희경';

--중첩
Select 제품ID, 주문수량
From 주문
Where	고객ID		=	(
					Select 고객번호
					From 고객
					Where 고객명 ='이희경'
					);



--2)등록된 고객은 모두 몇명인지 구하시오.

Select COUNT(*) AS '등록된 고객의 수'
From 고객;

--3)쇼핑몰의 총 주문 수량을 구하시오.

Select SUM(주문수량) As '총 주문 수량'
From 주문;

--4-1)제품번호별 총 주문수량을 구하시오.

Select 제품ID as 제품명, SUM(주문수량) As'총 주문수량'
From 주문
Group by 제품ID;


--4-2)제품명별 총 주문수량을 구하시오.

Select 제품명, SUM(주문수량) As'총 주문수량'
From 제품, 주문
Where 제품.제품번호 = 주문.제품ID
Group by 제품.제품명;


--5)제품의 평균 단가를 구하시오.

Select AVG(단가) As '제품의 평균 단가'
From  제품;

--6)주문수량이 5~10인 제품명을 구하고 주문수량의 내림차순으로 검색하시오.

Select 제품명, 주문수량
From 제품, 주문
Where 제품.제품번호 = 주문.제품ID and 주문.주문수량 between 5 and 10
Order by 주문수량 Desc;


--7)서울에 거주하는 고객의 이름을 오름차순으로 검색하시오.

Select 고객명
From  고객
Where 주소 like ('서울%')
Order by 주소 Asc;

--8)키보드 또는 모니터를 주문한 고객ID는?

Select 고객ID
From 주문
Where 제품ID	   in (
					Select 제품번호
					From 제품
					Where 제품명 in('키보드','모니터')
				  );

--9) 주소가 입력되지 않은 고객의 이름은?

Select 고객명
From 고객
Where 주소 is null;
