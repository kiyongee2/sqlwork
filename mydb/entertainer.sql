-- ������ ���̺�
CREATE TABLE entertainers(
    name      VARCHAR2(30),
    birthday  VARCHAR2(20),
    job       VARCHAR2(30)
);

INSERT INTO entertainers 
VALUES ('�絿��', '19790601', '���,����');
INSERT INTO entertainers 
VALUES ('������', '19920904', '���');
INSERT INTO entertainers 
VALUES ('�����', '19820220', '����,�۰�');
COMMIT;

-- ��1����ȭ ���
-- �Ӽ����� ���ڰ��̾�� �Ѵ�.
-- ������ ������ ��������? �˻��� ������� ����
SELECT * FROM entertainers
WHERE job = '%����%';

-- ������ ���̺�, ���� ���̺�� ����
