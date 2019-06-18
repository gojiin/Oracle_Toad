-- REF, OVEN, WN순으로 상품군 정렬, 연도별 내림차순으로 정렬
SELECT * FROM CASE_ORDER
WHERE 1=1
ORDER BY CASE PRODUCTGROUP
        WHEN 'REF' THEN 1
        WHEN 'OVEN' THEN 2
        WHEN 'WM' THEN 3
        ELSE 4
       END, YEAR ASC; --WHEN, THEN조건문끝날때는 꼭 END


--WEEK별로 내림차순 정렬
SELECT
    WEEK,
    LPAD(WEEK, 2, '0') AS RE_WEEK, --2자릿수가 들어갔기때문에 LAPD로 2자릿수로 맞춰줌
    QTY
    FROM SORT_EXAMPLE
    ORDER BY RE_WEEK DESC;
    
-- CUSTOMERCODE를 12자리로 조회, 단 12자리가 안될경우 '*'로 채우고 컬럼명 AS 이용하여 변경
SELECT
    CUSTOMERCODE,
    LPAD(CUSTOMERCODE, 10, '0') AS STEP1, --LAPD(컬럼명, 자릿수, '붙일문자')
    SUBSTR( --컬럼 값 추출: SUBSTR('문자열' OR 컬럼명, 시작인덱스, 종료인덱스)
        LPAD(CUSTOMERCODE, 10, '0'),
        -4) AS STEP2, --뒤에서부터 4자리를 -4로 표현 가능
    REPLACE(LPAD(CUSTOMERCODE, 10, '0'), SUBSTR(
        LPAD(CUSTOMERCODE, 10, '0'),
        -4), '****') AS STEP3
FROM KOPO_CUSTOMERDATA;
    


