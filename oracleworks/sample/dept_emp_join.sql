-- 부서
CREATE TABLE DEPARTMENT(
    DEPTCODE NUMBER,       -- 부서코드
    DEPTNAME VARCHAR2(10)  -- 부서이름
);
-- 사원
CREATE TABLE EMPLOYEE(
    EMPNO NUMBER,         -- 사원번호
    EMPNAME VARCHAR2(10), -- 사원이름
    DEPTNO NUMBER        -- 부서번호
    --FOREIGN KEY(DEPTCODE) REFERENCES DEPARATMENT(DEPTCODE)
);

INSERT INTO DEPARTMENT VALUES (10, '관리부');
INSERT INTO DEPARTMENT VALUES (20, '전산실');
INSERT INTO DEPARTMENT VALUES (30, '개발팀');

INSERT INTO EMPLOYEE VALUES (101, '한라산', 10);
INSERT INTO EMPLOYEE VALUES (102, '백두산', 20);
INSERT INTO EMPLOYEE VALUES (103, '한강', 10);
INSERT INTO EMPLOYEE VALUES (104, '두만강', 20);

-- 오라클 방식
SELECT A.EMPNO, A.EMPNAME, A.DEPTNO, B.DEPTNAME 
FROM EMPLOYEE A, DEPARTMENT B
WHERE A.DEPTNO = B.DEPTCODE;

-- 내부조인(JOIN) - ANSI
SELECT A.EMPNO, A.EMPNAME, A.DEPTNO, B.DEPTNAME 
FROM EMPLOYEE A JOIN DEPARTMENT B
  ON A.DEPTNO = B.DEPTCODE;
  
-- 외부조인 (LEFT JOIN, RIGHT JOIN)
-- 모든 부서 출력되고(사원이 출력, 없으면 NULL)
SELECT A.EMPNO, A.EMPNAME, B.DEPTCODE, B.DEPTNAME 
FROM EMPLOYEE A RIGHT JOIN DEPARTMENT B
  ON A.DEPTNO = B.DEPTCODE;

