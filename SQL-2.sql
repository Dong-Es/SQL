Create Database Company;

use Company;

Create table Department(
  DeptNO int not null,
  DeptNAME char(10),
  Floor int,
  primary key(DeptNO)
);

  Select *
  From Department;

Insert Into Department Values(1, '영업', 8);
Insert Into Department Values(2, '기획', 10);
Insert Into Department Values(3, '개발', 9);

Create table Employee(
 EmpNO int not null,
 EmpNAME char(10),
 TITLE char(10),
 DNO int,
 SALARY int,
 primary key(EmpNO),
 Foreign key(DNO) references Department(DeptNO)
);

Insert Into Employee Values(2106,'김창섭','대리',2,2000000);
Insert Into Employee Values(3426,'박영권','과장',3,2500000);
Insert Into Employee Values(3011,'이수민','부장',1,3000000);
Insert Into Employee Values(1003,'조민희','대리',1,2000000);
Insert Into Employee Values(3427,'최종철','사원',3,1500000);

Select *
From Employee;

--아래부터 3주차입니다.

Select *
From Department;

Select *
From Employee;

Insert Into Department Values(4,'총무',7);

Insert Into Employee Values(5000,'김창수','사원',4,2600000);
Insert Into Employee Values(5003,'이정아','대리',3,2900000);
Insert Into Employee Values(5005,'배희선','과장',1,3100000);
Insert Into Employee Values(5007,'박아현','부장',2,3600000);
Insert Into Employee Values(5009,'','사원',2,2600000);

--급여가 250만원이상 350만원 이하인 직원의 이름, 직책, 급여를 검색하시오.

Select EmpNAME, TITLE, SALARY
From Employee
Where SALARY Between 2500000 And 3500000;

--직원들의 이름과 현재 월, 그리고 10%인상된 월급을 검색하시오.

Select EmpNAME, SALARY,SALARY*1.1 As NewSalary
From Employee ;

--null 값이 들어간 사원 추가하기

Insert Into Employee Values(6000,'박수정','사원',null,2400000);

--부서번호가 정해지지 않아 null 값인 직원의 모든 정보를 검색하시오.

Select *
From Employee
Where DNO is null;

--부서번호가 NULL값이 아닌 직원의 모든 정보를 검색하시오.

Select *
From Employee
Where DNO is not null;

--모든 직원 급여의 평균은?

Select AVG(SALARY) As '평균 급여'
From Employee;

--최대 급여와 최소급여는?

Select MAX(SALARY) As '최대 급여', MIN(Salary) AS '최소 급여'
From Employee;

--전체 직원은 모두 몇 명인가?

Select COUNT(*) As '전체 직원의수'
From Employee;

Select COUNT(EmpNO) As '전체 직원의수'
From Employee;

--주의: null은 count 하지않음

Select COUNT(DNO) As 'NuLL의 뺀 전체 직원의수'
From Employee;

--회사의 직책은 몇개인가?

Select Distinct TITLE As '회사의 직책'
From Employee;

--투블 (행) 삭제

Delete 
From Employee
Where Dno Is Null;

Select *
From Employee;

--애튜리뷰트(열) 값 수정

Update Employee
Set	SALARY = 3000000
Where EmpNAME='조민희';

Update Employee
Set	SALARY = SALARY*0.9
Where EmpNAME='조민희';

--부서별 평균 급여를 검색하시오

Select DNO, AVG(SALARY) As '부서별 평균 급여'
From Employee
Group by DNO;

--부서(번호)별 평균급여가 250만원 이상인 부서(번호)와 그 평균 급여는?
 
 Select Dno, AVG(SALARY) As '부서별 평균 급여'
 From Employee
 Group by DNO
 Having AVG(SALARY) >= 2500000;

--대리인 직원은 모두 몇명인가요?

 Select COUNT(*) AS '대리인 직원의 수'
 From Employee
 Where TITLE = '대리';
 
 --과장또는 대리인 직원은 모두 몇명인가요?

 Select COUNT(*) AS '과장또는 대리인 직원의 수'
 From Employee
 Where TITLE In ('과장','대리');

--직책별 직원수를 검색하시오.

Select TITLE, COUNT(*) As '직책 별 직원의 수'
From Employee
Group by TITLE;

--부서별 최대급여와 최소 급여를 구하시오.

Select DNO, MAX(SALARY) As '최대 급여', MIN(SALARY) As '최소 급여'
From Employee
Group by DNO;

--직책별 평균 급여를 구하시오.

Select TITLE, AVG(SALARY) As '평균 급여'
From Employee
Group by TITLE;

--직책별 평균 급여가 300만원 이상인 직책과 그 평균급여를 구하시오.

Select TITLE, AVG(SALARY) As '직책별 평균급여'
From Employee
Group by TITLE
Having AVG(SALARY)>= 3000000;  
