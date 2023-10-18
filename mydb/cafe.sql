-- 테이블 생성, 자료 삽입
CREATE TABLE drink(
    drink_code   VARCHAR2(3) PRIMARY KEY,  -- 음료 코드
    drink_name  VARCHAR2(30) NOT NULL  -- 음료 이름
);

CREATE TABLE cafe_order(
    order_no     VARCHAR2(10) PRIMARY KEY,  -- 주문 번호
    drink_code   VARCHAR2(3) NOT NULL,      -- 음료 코드
    order_cnt    NUMBER NOT NULL,       -- 주문 수량
    FOREIGN KEY(drink_code) REFERENCES drink(drink_code) --외래키
);

-- drink 자료 삽입
INSERT INTO drink VALUES ('A01', '아메리카노');
INSERT INTO drink VALUES ('B01', '카페라떼');
INSERT INTO drink VALUES ('C01', '자몽');

-- cafe_order 자료 삽입
INSERT INTO cafe_order VALUES ('2023100101', 'A01', 3);
INSERT INTO cafe_order VALUES ('2023100102', 'B01', 1);
INSERT INTO cafe_order VALUES ('2023100103', 'A01', 2);

SELECT * FROM drink;
SELECT * FROM cafe_order;

-- 동등조인
SELECT b.order_no,
       b.drink_code,
       a.drink_name,
       b.order_cnt
FROM drink a, cafe_order b
WHERE a.drink_code = b.drink_code;

-- 내부조인
SELECT b.order_no,
       b.drink_code,
       a.drink_name,
       b.order_cnt
FROM drink a JOIN cafe_order b
  ON a.drink_code = b.drink_code;
 
-- JOIN ~ USING 
SELECT b.order_no,
       drink_code,
       a.drink_name,
       b.order_cnt
FROM drink a JOIN cafe_order b
  USING (drink_code);
  
DROP TABLE drink;
DROP TABLE cafe_order;

-- 주문이 없는 음료를 포함하여 모든 주문 정보를 출력하시오
-- 외부조인(LEFT, RIGHT)
SELECT a.drink_name,
       a.drink_code,
       b.order_no,
       b.order_cnt
FROM drink a LEFT JOIN cafe_order b
  ON a.drink_code = b.drink_code;
