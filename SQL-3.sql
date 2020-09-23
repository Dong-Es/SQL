create database 회사DB;

use 회사DB;

create table Department(
	DeptNo int not null,
	DeptName char(10),
	Floor int,
	Primary key(DeptNo)
);

Insert Into Department Values(1,'영업',8);
Insert Into Department Values(2,'기획',10);
Insert Into Department Values(3,'개발',9);
Insert Into Department Values(4,'총무',7);

Select *
From Department;

create table Employee(
 EmpNo int not null,
 EmpName char(10),
 Title char(10),
 Manager int,
 Salary int,
 Dno int,
 Primary key(EmpNo),
 Foreign key(Dno) references Department(DeptNo),
 Foreign key(Manager) references Employee(EmpNO)
);

Select *
From Employee;

Insert Into Employee Values(4377,'이성래','사장',null,5000000,2);
Insert Into Employee Values(1003,'조민희','과장',4377,3000000,2);
Insert Into Employee Values(2106,'김창섭','대리',1003,2500000,2);
Insert Into Employee Values(3426,'박영권','과장',4377,3000000,1);
Insert Into Employee Values(3011,'이수민','부장',4377,4000000,3);
Insert Into Employee Values(3427,'최종철','사원',3011,1500000,3);
Insert Into Employee Values(1365,'김상원','사원',3426,1500000,1);

--이성래 직원의 직책과 소속부서번호는?

Select Title,Dno 
From Employee
Where EmpName='이성래';

--이씨 성을 가진 사원의 이름, 직책, 소속부서번호는?

Select EmpName, Title, Dno
From Employee
Where EmpName like '이%';

--과장이면서 1번부서가 아닌 사원의 이름과 직책, 소속부서번호는?

Select EmpName, Title, Dno
From Employee
Where Title='과장' and Dno <> 1;

--급여가 300만원 이상이고 450만원 이하인 사원의 이름, 직책, 급여는?

Select  EmpName, Title, Salary
From Employee
Where Salary >= 3000000 and Salary <= 4500000;

--매니저가 없는 사원의 이름과 직책은?

Select EmpName, Title
From Employee
Where Manager is null;

--2번 부서에 근무하는 사원의 이름, 급여, 직책을 급여의 내림차순으로 검색하시오.

Select EmpName, Salary, Title
From Employee
Where Dno=2
Order By Salary Desc;

--사원이름 중 가나다순으로 가장 앞인 이름과 마지막인 이름을 검색하시오.

Select MIN(EmpName) As '가장 앞인 이름', Max(EmpName) As '가장 마지막인 이름'
From Employee;


--직책별 사원의 수가 2명이상인 직책과 그 직책의 사원수를 검색하시오.

Select Title, COUNT(*) As '직원의 수'
From Employee
Group by TITLE
Having COUNT(Title)>=2;

--김창섭이 근무하는 부서번호는?

Select Dno
From Employee
Where EmpName='김창섭';

--김창섭이 근무하는 부서이름은(조인조건)

Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo And EmpName ='김창섭';

-- 1번 부서에 근무하는 직원들의 이름은?

Select EmpName
From Employee
Where Dno=1;

--영업 부서에 근무하는 직원들의 이름과 직책은? (조인조건)

Select EmpName, Title
From Department, Employee
Where Department.DeptNo = Employee.Dno And DeptName='영업';

--모든 직원의 이름과 근무 부서명을 검색하시오.

Select EmpName, DeptName
From Employee, Department
Where Employee.Dno=Department.DeptNo;

--과장인 직원들의 이름과 직책 근무부서이름은? 

Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo And Title ='과장';

--9층에 근무하는 직원들의 이름과급여, 근무부서이름은? 

Select EmpName, Salary, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo And Floor=9;
