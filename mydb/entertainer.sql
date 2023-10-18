-- 연예인 테이블
CREATE TABLE entertainers(
    name      VARCHAR2(30),
    birthday  VARCHAR2(20),
    job       VARCHAR2(30)
);

INSERT INTO entertainers 
VALUES ('양동근', '19790601', '배우,가수');
INSERT INTO entertainers 
VALUES ('박은빈', '19920904', '배우');
INSERT INTO entertainers 
VALUES ('장기하', '19820220', '가수,작가');
COMMIT;

-- 제1정규화 대상
-- 속성값이 원자값이어야 한다.
-- 직업이 가수인 연예인은? 검색의 어려움이 있음
SELECT * FROM entertainers
WHERE job = '%가수%';

-- 연예인 테이블, 직업 테이블로 분해
