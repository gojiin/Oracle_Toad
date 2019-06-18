--1. 숫자 함수
---ROUND : 주어진 숫자 반올림 후 출력
---CEIL : 주어진 숫자와 가장 근접한 큰 정수 출력
---FLOOR : 주어진 숫자와 가장 근접한 작은 정수 출력
---MOD : 주어진 숫자를 나누기 한 후 나머지값 출력
---POWER : 주어진 숫자1의 숫자2승을 출력함

SELECT
    ROUND(12.345, 2),
    CEIL(12.345),
    FLOOR(12.345),
    FLOOR(12.345),
    MOD(12,10),
    POWER(3,2)
    FROM DUAL;
    
--NUMBER_EXAMPLE 테이블에서 FIRST/SECOND NUMBER를 활용하여 결과 출력
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
    
--ACCURACY = 1-ABS(예측값-실제값) / 예측값 공식 
--활용하여 정확도 산출(소수점 2째자리 반올림)
--1-ABS(예측값-실제값)/예측값 공식이란? 
--예측값이 0인경우 모수에서 제외
--예측값이 실제값 반 이하인경우 정확도 0
SELECT * FROM RMSE_MAE_EXAMPLE2;

SELECT
    YEARWEEK,
    ACTUAL,
    FCST,
    ROUND((1-(FCST-ACTUAL))/FCST,2) AS ACCURACY
    FROM RMSE_MAE_EXAMPLE2; --다시 풀어보자.
    
--2. 날짜 함수
---SYSDATA : 시스템 현재 날짜/시간
---NEXT_DAY : 다음으로 돌아오는 요일의 날짜 출력(NEXT_DAY(SYSDATE,1)
---LAST_DAY : 속한 달의 마지막 날짜

SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE,2),
    LAST_DAY(SYSDATE)
FROM DUAL;

--3. 형 변환
--오름차순, 내림차순 정렬할 때 문자열DMF TO_NUMBER를 이용하여 정렬하면
--LPAD와 같은 기능을 할 수 있음


--4. 주요 함수
---CASE : 조건에 맞는경우 WHEN절 값으로 치환
---DECODE : SWITCH CASE문과 같음
---NVL : NULL값을 만나면 다른값으로 치환, 사용예 :NVL(PRODUCT, NULL)
---NBL2 : NULL이 아닐 경우 A NULL일 경우 B로 치환, 사용예: NVL2(PRODUCT,VOLUME, 20)

---CASE 사용하기
--CASE 대상 WHEN 조건1 THEN 출력 1
--          WHEN 조건2 THEN 출력 2
--          ELSE 출력 3
--END "컬럼명";

SELECT
    YEARWEEK,
    CASE WHEN QTY<1000 THEN 1000
    WHEN QTY>1000 AND QTY<10000 THEN 10000
    ELSE 30000 END AS NEW_QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW;

SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW;

---DECODE 사용하기(SWITCH)
--DECODE (컬럼명
--        , CASE#1, VALUE#1
--        , CASE32, VALUE#2
--        , OTHERS)
        
SELECT A.*
       , DECODE(A.GENDER, 'Male', 1, 'Female', 2, 0) AS SORT_ORDER
       FROM KOPO_CUSTOMERDATA A
WHERE 1=1
ORDER BY SORT_ORDER;

    