create table dept15(
deptno number(38) primary key,
dname varchar2(50)
);

insert into dept15 values(10,'관리부');
insert into dept15 values(20,'개발부');
insert into dept15 values(30,'기업부');

select * from dept15 order by deptno asc;
commit;

create table emp15(
empno number(38) primary key,
ename varchar2(50),
job varchar2(50),
sal number(38),
comm int,
deptno number(38)
);

insert into emp15 values(21,'홍길동','관리사원',1500,0,10);
insert into emp15 values(22,'이순신','자바개발자',3000,300,20);
insert into emp15 values(23,'강감찬','C언어개발자',2800,200,20);
insert into emp15 values(24,'세종대왕','기획사원',2000,200,30);
insert into emp15 values(25,'신사임당','기획팀장',4000,400,30);
commit;

select * from emp15 order by empno;

select dname as "부서명" from dept15
where deptno = (select deptno from emp15 where ename='홍길동');

select avg(sal) as "급여평균" from emp15;

select ename, sal from emp15 where sal > (select avg (sal) from emp15);

