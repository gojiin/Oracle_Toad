-- REF, OVEN, WN������ ��ǰ�� ����, ������ ������������ ����
SELECT * FROM CASE_ORDER
WHERE 1=1
ORDER BY CASE PRODUCTGROUP
        WHEN 'REF' THEN 1
        WHEN 'OVEN' THEN 2
        WHEN 'WM' THEN 3
        ELSE 4
       END, YEAR ASC; --WHEN, THEN���ǹ��������� �� END


--WEEK���� �������� ����
SELECT
    WEEK,
    LPAD(WEEK, 2, '0') AS RE_WEEK, --2�ڸ����� ���⶧���� LAPD�� 2�ڸ����� ������
    QTY
    FROM SORT_EXAMPLE
    ORDER BY RE_WEEK DESC;
    
-- CUSTOMERCODE�� 12�ڸ��� ��ȸ, �� 12�ڸ��� �ȵɰ�� '*'�� ä��� �÷��� AS �̿��Ͽ� ����
SELECT
    CUSTOMERCODE,
    LPAD(CUSTOMERCODE, 10, '0') AS STEP1, --LAPD(�÷���, �ڸ���, '���Ϲ���')
    SUBSTR( --�÷� �� ����: SUBSTR('���ڿ�' OR �÷���, �����ε���, �����ε���)
        LPAD(CUSTOMERCODE, 10, '0'),
        -4) AS STEP2, --�ڿ������� 4�ڸ��� -4�� ǥ�� ����
    REPLACE(LPAD(CUSTOMERCODE, 10, '0'), SUBSTR(
        LPAD(CUSTOMERCODE, 10, '0'),
        -4), '****') AS STEP3
FROM KOPO_CUSTOMERDATA;
    


