SELECT * FROM KOPO_PRODUCT_VOLUME;

--������ �̿��Ͽ� ������ ��ȸ�ϱ� VER.1
SELECT --SELECT * FROM���� ���ϴ� ���� : ���߿� ���ο� �÷��� �߰����� �� ������ �߻��� �� �ֱ� ����
    REGIONID, 
    PRODUCTGROUP, 
    YEARWEEK, 
    VOLUME
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0002'
AND (YEARWEEK = '201515'
OR YEARWEEK = '201516');

--������ �̿��Ͽ� ������ ��ȸ�ϱ� VER.2
SELECT
    REGIONID, 
    PRODUCTGROUP, 
    YEARWEEK, 
    VOLUME
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0002'
AND YEARWEEK >= '201515'
AND YEARWEEK <= '201516';

--��� ������ ����ϱ�--
--ORACLE�� ���ڵ� ���ڵ� ���ϱ� ������ ��--
--ROUND���� : �Ҽ��� ����
SELECT
    REGIONID,
    PRODUCTGROUP,
    YEARWEEK,
    VOLUME,
    ROUND(VOLUME * 1.1, 0) AS WEIGHTED_VOLUME --VOLUME�� 1.1�� ���� �� �Ҽ��� ù°�ڸ����� �ݿø��Ͽ� WEIGHTED_VOLUME�÷������� ��ȸ(���� �����Ϳ� �����Ǵ°� �ƴ�)
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0001'
AND YEARWEEK >= '201501';

SELECT * FROM KOPO_PROMOTION;

-- PMAP�� 10% ���ε� ���� ROUNDó���Ͽ� PMAP10 ���� --
SELECT
    REGIONID,
    ITEM,
    TARGETWEEK,
    PLANWEEK,
    MAP_PRICE,
    IR,
    PMAP,
    PRODUCT,
    ROUND(PMAP-(PMAP * 0.1), 0) AS PMAP10
FROM KOPO_PROMOTION;

-- PMAP/MAP_PRICE ���� ���Ͽ� PERCENT �÷� ���� VER.1--
SELECT
    REGIONID,
    ITEM,
    TARGETWEEK,
    PLANWEEK,
    MAP_PRICE,
    IR,
    PMAP,
    PRODUCT,
    NVL(PMAP/NULLIF(MAP_PRICE, 0),0) AS PERCENT
FROM KOPO_PROMOTION;

-- PMAP/MAP_PRICE ���� ���Ͽ� PERCENT �÷� ���� VER.2 --
SELECT A.*,
    CASE WHEN A.MAP_PRICE = 0
            THEN 0 --MAP_PRICE�� 0�̸� ������ �����ž�
         WHEN A.MAP_PRICE IS NULL
            THEN 0 --MAP_PRICER�� NULL�̸� ������ �����ž�
         ELSE A.PMAP/A.MAP_PRICE END AS PRO_PERCENT
FROM KOPO_PROMOTION A; --��Ī �ٿ��ֱ�