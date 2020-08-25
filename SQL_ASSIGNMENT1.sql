create DATABASE DB;
USE DB;
CREATE TABLE DeptTable(DeptNo integer,Dname text,Loc text);
INSERT INTO DeptTable VALUES(10,'Accounts','Bangloore');
INSERT INTO DeptTable VALUES(20,'IT','Delhi');
INSERT INTO DeptTable VALUES(30,'Production','Chennai');
INSERT INTO DeptTable VALUES(40,'Sales','Hyd');
INSERT INTO DeptTable VALUES(50,'Admin','London');
SELECT * FROM DeptTable;
CREATE TABLE EmpTable(EmpNo integer,Ename varchar(100),sal integer,Hire_Date date,Commission integer,DeptNo integer,Mgr integer);
INSERT INTO EmpTable VALUES(1001,'Sachin',19000,'1980-1-01',2100,20,1003);
INSERT INTO EmpTable VALUES(1002,'Kapil',15000,'1970-1-01',2300,10,1003);
INSERT INTO EmpTable VALUES(1003,'Stefen',12000,'1990-1-01',500,20,1007);
INSERT INTO EmpTable VALUES(1004,'Williams',9000,'2001-1-01',NULL,30,1007);
INSERT INTO EmpTable VALUES(1005,'John',5000,'2001-1-01',NULL,30,1006);
INSERT INTO EmpTable VALUES(1006,'Dravid',19000,'2005-1-01',2400,10,1007);
INSERT INTO EmpTable VALUES(1007,'Martin',21000,'2000-1-01',1040,NULL,NULL);
SELECT * FROM EmpTable;

SELECT * FROM EmpTable where DeptNo=10 or DeptNo=30;
/*more than 1 employ*/


SELECT DeptTable.DeptNo,EmpTable.DeptNo,DeptTable.Loc,DeptTable.Dname
FROM DeptTable
INNER JOIN EmpTable ON 
DeptTable.DeptNo=EmpTable.DeptNo
GROUP BY DeptTable.DeptNo
HAVING COUNT(EmpTable.DeptNo)>1;

/*Employe details whose name starts with's' 3 */
/*experience>2 years 4 */

/*Replace a as # 5 */
SELECT REPLACE(Ename,'a','#') FROM EmpTable;
/* 6*/
SELECT e.Ename, m.Ename AS manager_name
FROM EmpTable e
JOIN EmpTable m ON e.Mgr=m.EmpNo;
/*7*/
SELECT Dname,SUM(sal)AS total_sal FROM EmpTable
JOIN DeptTable
ON DeptTable.DeptNo=EmpTable.DeptNo
GROUP BY EmpTable.DeptNo;
/*8*/
SELECT * FROM DeptTable INNER JOIN EmpTable ON DeptTable.DeptNo=EmpTable.DeptNo;
/* update salary  9*/
UPDATE EmpTable SET sal=sal+(sal*10/100)
WHERE sal > 1;
/*10*/
DELETE FROM DeptTable WHERE Loc='Chennai';
/*SELECT Loc FROM DeptTable; 11 */

SELECT Ename,SUM(sal+Commission) FROM EmpTable
GROUP BY EmpTable.Ename;

/*12*/
ALTER TABLE EmpTable MODIFY COLUMN Ename varchar(250);
/*13*/
SELECT current_timestamp();
/*14*/
CREATE TABLE STUDENT(Name varchar(150),rollno integer,dept text,year integer,joindate date);
/*15*/
SELECT count(sal) FROM EmpTable WHERE sal>10000;
/*16*/
SELECT MIN(sal),MAX(sal),AVG(sal) FROM EmpTable;
/*17*/
SELECT COUNT(*),DeptTable.Loc FROM EmpTable
JOIN DeptTable ON DeptTable.DeptNo=EmpTable.DeptNo
GROUP BY EmpTable.DeptNo;
/*18*/
SELECT Ename FROM EmpTable ORDER BY Ename DESC;
/*CREATE NEW TABLE 19 */
CREATE TABLE EMP_BKP SELECT * FROM EmpTable;
SELECT * FROM EMP_BKP;
/*20*/
SELECT concat(substring(Ename,1,3),sal) 
FROM EmpTable;


