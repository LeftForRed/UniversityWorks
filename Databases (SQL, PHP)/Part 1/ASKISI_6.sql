-- 1o ERWTIMA
SELECT ENAME FROM EMP WHERE JOB IN
(SELECT JOB FROM EMP 
WHERE DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING'));
-- 2o ERWTIMA
SELECT ENAME, SAL+IFNULL(COMM,0) "TOTAL EARNINGS" FROM EMP X
WHERE SAL+IFNULL(COMM,0) = (
SELECT MAX(SAL+IFNULL(COMM,0)) FROM EMP WHERE X.DEPTNO = DEPTNO);
-- 3o ERWTIMA
SELECT ENAME, SAL FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING')
AND SAL <
(SELECT MAX(SAL) FROM EMP 
WHERE DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH'));

/*

APOTELESMATA

1o ERWTIMA
+---------+
| ENAME   |
+---------+
| CODD    |
| ELMASRI |
| DATE    |
+---------+

2o ERWTIMA
+---------+----------------+
| ENAME   | TOTAL EARNINGS |
+---------+----------------+
| CODD    |        3000.00 |
| NAVATHE |        2000.00 |
+---------+----------------+

3o ERWTIMA
+---------+---------+
| ENAME   | SAL     |
+---------+---------+
| ELMASRI | 1200.00 |
| DATE    | 1800.00 |
+---------+---------+

*/