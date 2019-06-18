--데이터 조회하기 : 특정 행을 추출하기 위한 연산
SELECT * FROM KOPO_PRODUCT_VOLUME
    WHERE 1=1 --이건 언제나 TRUE 
    AND PRODUCTGROUP = 'ST0001'
    AND VOLUME > 3000;

SELECT PRODUCTGROUP --특정 컬럼만 확인하고 싶을때
    FROM KOPO_PRODUCT_VOLUME;
    
--기존 테이블 데이터로 새로운 테이블 생성하기
CREATE TABLE 
    KOPO_PRODUCT_VOLUME_JI AS
SELECT * FROM KOPO_PRODUCT_VOLUME;

--테이블 두개를 병합하기 : UNUON 사용
SELECT * FROM KOPO_PRODUCT_VOLUME_JI
UNION ALL --중복된 데이터를 포함하여 병합됨(<-->UNION)
SELECT * FROM KOPO_PRODUCT_VOLUME;

--내가 가지고 있는 모든 자료들을 화면으로 보여주는 키워드: TABS
SELECT * FROM
TABS;

--데이터 조회하기 : 컬럼에 대해서는 무조건 들여쓰기
SELECT REGIONID
    , PRODUCTGROUP
    , YEARWEEK
    , VOLUME
FROM KOPO_PRODUCT_VOLUME;

--데이터 조회하기 : 별칭을 주어서 조회하기
SELECT B.*
    FROM KOPO_PRODUCT_VOLUME B;
    
--데이터 조회하기 : EXPRESSION 이용
SELECT A.*
    , '201701_배치프로그램' AS PLANID --AS 컬럼명
FROM
KOPO_PRODUCT_VOLUME A; --PLANID를 컬럼명으로 하는 새로운 테이블 생성됨

SELECT C.*
    , 'LED_TV'||'_'||C.PRODUCTGROUP
    FROM
    KOPO_PRODUCT_VOLUME C;
    
--중복된 값 제거하기 : DISTINCT(기본키 검증시 많이 사용됨)
SELECT
    DISTINCT PRODUCTGROUP AS PRODUCT
FROM KOPO_PRODUCT_VOLUME;
    
    


