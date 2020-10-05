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


--김창섭이 근무하는 부서이름은? (조인질의)

Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo And EmpName ='김창섭';

--김창섭이 근무하는 부서이름은? (중첩질의)

Select DeptName
From Department
Where DeptNo    =	(
					Select Dno
					From Employee	
					Where EmpName='김창섭'
					);
					
-- 영업 부서에 근무하는 직원들의 이름과 직책은?(중첩질의)

Select EmpName, Title
From Employee
Where Dno		=	(
					Select DeptNo
					From Department	
					Where DeptName = '영업'
					);
					
-- 영업 또는 기획 부서에 근무하는 직원들의 이름과 직책은?(중첩질의)

Select EmpName, Title
From Employee
Where Dno    in		(
					Select DeptNo
					From Department	
					Where DeptName = '영업' OR DeptName = '기획'
					);					
					
-- 9층에 근무하는 직원들의 이름과 급여(Employee) 근무부서이름(Department)은?(중첩질의불가능)
-- 최종적으로 보고싶은 것들이 서로다른 테이블에 있을 경우는 중첩질의로 불가능합니다


--9층에 근무하는 직원들의 이름과 급여? (중첩질의)

Select EmpName, Salary
From Employee
Where Dno		=	(
					Select DeptNo
					From Department
					Where Floor = 9
					);

--과장인 직원들의 근무부서이름은? (중첩질의)		

Select DeptName
From Department
Where DeptNo in		(
					Select Dno
					From Employee
					Where Title = '과장'
					);
				    
--매니저가 없는 직원의 근무부서이름은?(중첩질의)

Select DeptName
From Department
Where DeptNo	=  (
					Select Dno
					From Employee
					Where Manager is null 
				    );

--기획 부서에 근무하는 직원들의 이름과 급여는?(중첩질의)

Select EmpName, Salary
From Employee
Where Dno		=  (
					Select DeptNo
					From Department
					Where DeptName = '기획'
				    );
		

--기획 부서에 근무하는 직원들의 이름과 직책은?(조인질의)

Select EmpName, Title
From Employee, Department
Where Employee.Dno = Department.DeptNo And DeptName = '기획';

--영업 또는 기획 부서에 근무하는 직원들의 이름과 직책은?(조인질의)

Select EmpName, Title
From Employee, Department
Where Employee.Dno = Department.DeptNo And DeptName In ('영업' ,'기획');


--박영권과 같은 부서에 근무하는 직원들의 이름은?

Select EmpName
From Employee
Where Dno		=	(
					Select Dno
					From Employee
					Where EmpName ='박영권'
					);
					
--박영권과 같은 직책인 직원들의 이름과 직책은?					

Select EmpName, Title
From Employee
Where Title		=	(
					Select Title
					From Employee
					Where EmpName = '박영권'
					);
					
--직원들의 평균 급여는?

Select AVG(Salary) As '직원들의 평균 급여'
From Employee;	

--직원의 평균 급여보다 많은 급여를 받는 직원들의 이름, 직책, 월급은?

Select EmpName, Title, Salary
From Employee
Where Salary	>	(
					Select AVG(Salary) As '직원들의 평균 급여'
					From Employee	
					);
				
--이수민 직원의 직책과 근무 부서이름은?(조인질의)

Select Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo And EmpName = '이수민';

-- 이수민 직원과 같은 부서에 근무하는 직원의 이름과 부서번호는?(중첩질의)

Select EmpName, Dno
From Employee
Where Dno		=	(
					Select Dno
					From   Employee
					Where  EmpName= '이수민'
					);
