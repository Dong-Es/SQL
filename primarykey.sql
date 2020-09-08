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


-- 대리인 직원의 이름과 소속부서번호는?
Select EmpNAME, DNO
From Employee
Where TITLE ='대리';

/* 대리가 아닌 직원들의 이름과 소속부서번호는?*/
Select EmpNAME, DNO
From Employee
Where TITLE <> '대리';

/* 김창섭 직원의 모든 정보를 검색하시오*/
Select *
From Employee
Where EmpNAME =  '김창섭';

/* 영업 부서의 위치(Floor)는?*/
Select FLOOR
From Department
Where DeptNAME = '영업';


/* 급여가 2500000 이상인 직원의 이름과 급여를 검색하시오*/
Select EmpNAME, SALARY
From Employee
Where SALARY>= 2500000;

/* 과장 또는 대리인 직원의 이름과 급여, 직책은? */
Select EmpNAME, SALARY, TITLE
From Employee
Where TITLE='과장'or TITLE = '대리';


/* 2번 부서가 아닌 직원의 이름과 직책, 소속부서번호는? */
Select EmpNAME, TITLE, DNO
From Employee
Where DNO <>2;

/* 급여가 2000000이상 2500000이하인 직원의 이름과 급여를 검색하시오 */
Select EmpNAME, SALARY
From Employee
Where SALARY >= 2000000 AND SALARY <= 2500000;

/* 김씨 성을 가진 직원의 이름과 소속부서번호는? */
Select EmpNAME, DNO
From Employee
Where EmpNAME Like '김%';

/* 1 또는 3번 부서에 속하는 직원의 이름과 소속부서번호는? */
Select EmpNAME, DNO
From Employee
Where DNO IN(1,3);

/* 모든 직원에 대하여 급여의 오름차순으로 이름과 급여를 검색하시오 */
Select EmpNAME, SALARY
From Employee 
Order By SALARY Asc;

/* 1번 부서에 근무하는 직원에 대하여 급여의 내림차순으로 이름과 급여를 검색하시오 */
Select EmpNAME, SALARY
From Employee 
Where DNO = 1
Order BY SALARY Desc;
