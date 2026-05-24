drop table emp;

CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    hiredate DATE,
    mgr INT,
    sal DECIMAL(10,2),
    comm DECIMAL(10,2),
    deptno INT
);

INSERT INTO emp VALUES (7369,'SMITH','CLERK',
TO_DATE('17-DEC-1980','DD-MON-YYYY'),7902,800,NULL,20);

INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',
TO_DATE('20-FEB-1981','DD-MON-YYYY'),7698,1600,300,30);

INSERT INTO emp VALUES (7521,'WARD','SALESMAN',
TO_DATE('22-FEB-1981','DD-MON-YYYY'),7698,1250,500,30);

INSERT INTO emp VALUES (7566,'JONES','MANAGER',
TO_DATE('02-APR-1981','DD-MON-YYYY'),7839,2975,NULL,20);

INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',
TO_DATE('28-SEP-1981','DD-MON-YYYY'),7698,1250,1400,30);

INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',
TO_DATE('01-MAY-1981','DD-MON-YYYY'),7839,2850,NULL,30);

INSERT INTO emp VALUES (7782,'CLARK','MANAGER',
TO_DATE('09-JUN-1981','DD-MON-YYYY'),7839,2450,NULL,10);

INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',
TO_DATE('19-APR-1987','DD-MON-YYYY'),7566,3000,NULL,20);

INSERT INTO emp VALUES (7839,'KING','PRESIDENT',
TO_DATE('17-NOV-1981','DD-MON-YYYY'),NULL,5000,NULL,10);

INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',
TO_DATE('08-SEP-1981','DD-MON-YYYY'),7698,1500,0,30);

INSERT INTO emp VALUES (7876,'ADAMS','CLERK',
TO_DATE('23-MAY-1987','DD-MON-YYYY'),7788,1100,NULL,20);

INSERT INTO emp VALUES (7900,'JAMES','CLERK',
TO_DATE('03-DEC-1981','DD-MON-YYYY'),7698,950,NULL,30);

INSERT INTO emp VALUES (7902,'FORD','ANALYST',
TO_DATE('03-DEC-1981','DD-MON-YYYY'),7566,3000,NULL,20);

INSERT INTO emp VALUES (7934,'MILLER','CLERK',
TO_DATE('23-JAN-1982','DD-MON-YYYY'),7782,1300,NULL,10);

select * from emp;

SELECT empno, ename, TO_CHAR(hiredate,'DD-MON-YYYY')
FROM emp;

--5. Show Empno and Ename and Job for Department 20
SELECT empno, ename, deptno from emp
where deptno='20';

--6, 11. Show average salary 
select deptno, avg(sal) from emp
where deptno='20';

--7, 10. Show max salary 
select max(sal) from emp where deptno IN ('10','30');

SELECT deptno, MAX(sal) AS max_salary
FROM emp
WHERE deptno IN (10,30)
GROUP BY deptno;

--8. Show min salary 
select min(sal) from emp
where deptno='20';

--12. Show all employees whose salary is between 1500 to 4000
SELECT * FROM emp
WHERE sal BETWEEN 1500 AND 4000;

--13. Order data based on employee name (ename)
SELECT * FROM emp
ORDER BY ename;

--14. Order data based on department no  (deptno)
SELECT * FROM emp
ORDER BY deptno;

--15. Order data based on job title and salary 
SELECT * FROM emp
ORDER BY job, sal;

--16. Show all employees with Analyst  Job title
SELECT * FROM emp
WHERE job='Analyst';

--17. Show all employees who are making more than 3000 salary 
SELECT * FROM emp
WHERE sal > 3000;

--18. Show employees whose empno is either 7900 or 7934
SELECT * FROM emp
WHERE empno in (7900,7934);

--19. Show employees whose salary is less than 2000
SELECT * FROM emp
WHERE sal < 2000;

--20. Show who is making min salary   (hint :: use child query)
SELECT * FROM emp
WHERE sal = (select min(sal) from emp);

--21. Show who is making more than average salary  (hint: child query)
SELECT * FROM emp
WHERE sal > (select avg(sal) from emp);

--22. Show how many employees have either President or Analyst title 
SELECT Count(*) from EMP
where job in ('PRESIDENT','ANALYST');

--23. Find how many records we have in emp table 
SELECT Count(*) from EMP;

--24.Find how many CLERK we have in emp table 
SELECT Count(*) from EMP
where job='CLERK';

--25. Find how many members in deptartment 30 
SELECT Count(*) from EMP
where deptno='30';

--26. Find how many members are in department 20 or 10 
SELECT Count(*) from EMP
where deptno in ('20','10');

--27. Find SCOTT's salary 
select sal from EMP
where ename = 'SCOTT';

--28. Show employees whose name ends with D  (hint: like)
select * from emp
where ename like '%D';

--29. Show employees whose name starts with M
select * from emp
where ename like 'M%';

--30. Find who is making the highest salary  (hint: child query)
select ename from emp
where sal in (select max(sal) from emp);

select ename as EmployeeName, sal as Salary from emp
where sal = (select max(sal) from emp);

 --31. Update employee name (ename) in lower case
update emp
set ename = lower(ename); 

select * from emp;

update doc
set first = upper(first);

--32. Update employee job in lower case
update emp
set job = lower(job); 

--33. Update employee salary with 50
update emp
set sal = '50'
where ename = 'king';

--34. update employee salary with 100 and comm with 20  
update emp
set sal = '100', comm = '20'
where ename = 'blake';

--35. Delete all employees who are working in department 30 
delete from emp
where deptno = '30';

--36. Delete all employees whose title is ANALYST
delete from emp
where job = 'analyst';

--37. Delete employees whose name is Jones 
delete from emp
where ename = 'jones';
