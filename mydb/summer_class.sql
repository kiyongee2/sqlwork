-- ���� �б� ���̺�
CREATE TABLE summer_class(
    sid      NUMBER,        -- �й�
    subject  VARCHAR2(20),  -- ��������
    price    NUMBER         -- ������
);

INSERT INTO summer_class VALUES (100, 'C', 30000);
INSERT INTO summer_class VALUES (101, 'Java', 45000);
INSERT INTO summer_class VALUES (200, 'Python', 40000);
INSERT INTO summer_class VALUES (201, 'Java', 45000);

-- �����б⸦ �����ϴ� �л��� �й��� �����ϴ� ������?
SELECT sid, subject
FROM summer_class;

-- 'Python' ������ �������?
SELECT price
FROM summer_class
--WHERE subject LIKE 'Python';
WHERE subject = 'Python';

-- �����б⸦ ��� �л����� ������ �Ѿ���?
SELECT COUNT(sid) �л���,
       SUM(price) �������Ѿ�
FROM summer_class;

-- 200�� �л��� ���� ���(����)
DELETE FROM summer_class 
WHERE sid = 200;

-- ���� �̻�
-- 'Python' ������ �������?
SELECT price
FROM summer_class
WHERE subject = 'Python';

-- ���� �̻�
-- C++ ���� ���� :  ��û�� �л��� ����
INSERT INTO summer_class VALUES (NULL, 'C++', 35000);