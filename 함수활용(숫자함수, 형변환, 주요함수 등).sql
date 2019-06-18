--1. ���� �Լ�
---ROUND : �־��� ���� �ݿø� �� ���
---CEIL : �־��� ���ڿ� ���� ������ ū ���� ���
---FLOOR : �־��� ���ڿ� ���� ������ ���� ���� ���
---MOD : �־��� ���ڸ� ������ �� �� �������� ���
---POWER : �־��� ����1�� ����2���� �����

SELECT
    ROUND(12.345, 2),
    CEIL(12.345),
    FLOOR(12.345),
    FLOOR(12.345),
    MOD(12,10),
    POWER(3,2)
    FROM DUAL;
    
--NUMBER_EXAMPLE ���̺��� FIRST/SECOND NUMBER�� Ȱ���Ͽ� ��� ���
SELECT * FROM NUMBER_EXAMPLE;

SELECT
    FIRST_NUMBER,
    FIRST_NUMBER/SECOND_NUMBER AS AVG,
    ROUND(FIRST_NUMBER/SECOND_NUMBER, 0) AS ROUND_EX,
    CEIL(FIRST_NUMBER/SECOND_NUMBER) AS CEIL_EX,
    FLOOR(FIRST_NUMBER/SECOND_NUMBER) AS FLOOR_EX,
    MOD(FIRST_NUMBER, SECOND_NUMBER) AS MOD_EX,
    POWER(FIRST_NUMBER, SECOND_NUMBER) AS POW_EX
    FROM NUMBER_EXAMPLE;
    
--ACCURACY = 1-ABS(������-������) / ������ ���� 
--Ȱ���Ͽ� ��Ȯ�� ����(�Ҽ��� 2°�ڸ� �ݿø�)
--1-ABS(������-������)/������ �����̶�? 
--�������� 0�ΰ�� ������� ����
--�������� ������ �� �����ΰ�� ��Ȯ�� 0
SELECT * FROM RMSE_MAE_EXAMPLE2;

SELECT
    YEARWEEK,
    ACTUAL,
    FCST,
    ROUND((1-(FCST-ACTUAL))/FCST,2) AS ACCURACY
    FROM RMSE_MAE_EXAMPLE2; --�ٽ� Ǯ���.
    
--2. ��¥ �Լ�
---SYSDATA : �ý��� ���� ��¥/�ð�
---NEXT_DAY : �������� ���ƿ��� ������ ��¥ ���(NEXT_DAY(SYSDATE,1)
---LAST_DAY : ���� ���� ������ ��¥

SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE,2),
    LAST_DAY(SYSDATE)
FROM DUAL;

--3. �� ��ȯ
--��������, �������� ������ �� ���ڿ�DMF TO_NUMBER�� �̿��Ͽ� �����ϸ�
--LPAD�� ���� ����� �� �� ����


--4. �ֿ� �Լ�
---CASE : ���ǿ� �´°�� WHEN�� ������ ġȯ
---DECODE : SWITCH CASE���� ����
---NVL : NULL���� ������ �ٸ������� ġȯ, ��뿹 :NVL(PRODUCT, NULL)
---NBL2 : NULL�� �ƴ� ��� A NULL�� ��� B�� ġȯ, ��뿹: NVL2(PRODUCT,VOLUME, 20)

---CASE ����ϱ�
--CASE ��� WHEN ����1 THEN ��� 1
--          WHEN ����2 THEN ��� 2
--          ELSE ��� 3
--END "�÷���";

SELECT
    YEARWEEK,
    CASE WHEN QTY<1000 THEN 1000
    WHEN QTY>1000 AND QTY<10000 THEN 10000
    ELSE 30000 END AS NEW_QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW;

SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW;

---DECODE ����ϱ�(SWITCH)
--DECODE (�÷���
--        , CASE#1, VALUE#1
--        , CASE32, VALUE#2
--        , OTHERS)
        
SELECT A.*
       , DECODE(A.GENDER, 'Male', 1, 'Female', 2, 0) AS SORT_ORDER
       FROM KOPO_CUSTOMERDATA A
WHERE 1=1
ORDER BY SORT_ORDER;

    