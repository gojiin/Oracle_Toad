--������ ��ȸ�ϱ� : Ư�� ���� �����ϱ� ���� ����
SELECT * FROM KOPO_PRODUCT_VOLUME
    WHERE 1=1 --�̰� ������ TRUE 
    AND PRODUCTGROUP = 'ST0001'
    AND VOLUME > 3000;

SELECT PRODUCTGROUP --Ư�� �÷��� Ȯ���ϰ� ������
    FROM KOPO_PRODUCT_VOLUME;
    
--���� ���̺� �����ͷ� ���ο� ���̺� �����ϱ�
CREATE TABLE 
    KOPO_PRODUCT_VOLUME_JI AS
SELECT * FROM KOPO_PRODUCT_VOLUME;

--���̺� �ΰ��� �����ϱ� : UNUON ���
SELECT * FROM KOPO_PRODUCT_VOLUME_JI
UNION ALL --�ߺ��� �����͸� �����Ͽ� ���յ�(<-->UNION)
SELECT * FROM KOPO_PRODUCT_VOLUME;

--���� ������ �ִ� ��� �ڷ���� ȭ������ �����ִ� Ű����: TABS
SELECT * FROM
TABS;

--������ ��ȸ�ϱ� : �÷��� ���ؼ��� ������ �鿩����
SELECT REGIONID
    , PRODUCTGROUP
    , YEARWEEK
    , VOLUME
FROM KOPO_PRODUCT_VOLUME;

--������ ��ȸ�ϱ� : ��Ī�� �־ ��ȸ�ϱ�
SELECT B.*
    FROM KOPO_PRODUCT_VOLUME B;
    
--������ ��ȸ�ϱ� : EXPRESSION �̿�
SELECT A.*
    , '201701_��ġ���α׷�' AS PLANID --AS �÷���
FROM
KOPO_PRODUCT_VOLUME A; --PLANID�� �÷������� �ϴ� ���ο� ���̺� ������

SELECT C.*
    , 'LED_TV'||'_'||C.PRODUCTGROUP
    FROM
    KOPO_PRODUCT_VOLUME C;
    
--�ߺ��� �� �����ϱ� : DISTINCT(�⺻Ű ������ ���� ����)
SELECT
    DISTINCT PRODUCTGROUP AS PRODUCT
FROM KOPO_PRODUCT_VOLUME;
    
    


