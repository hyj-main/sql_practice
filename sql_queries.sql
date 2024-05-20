SQL 활용
20240514
 

Camping 장 실제 data 분석
공공데이터포털에서 받은 csv 파일을 DB에 등록하고 여러가지 정보 조회
7가지 문제 있음. 그에 대한 풀이가 나와있음
이걸 어떻게 활용할지.

PCR data + medical data
특정 product 에서의 양성률이 높은 지점 순위
시간에 따른 지역별 양성률 추이
성별 연령별 Ct값 
Ct값 ~ 기저질환, 연령, 성별, 지역, 

SELECT age sex ct
FROM table
WHERE branch LIKE “%seoul%” AND WHERE results == “POS”


/* 해수욕장에 위치한 캠핑장의 사업장명, 인허가일자 조회 */
SELECT 사업장명, 인허가일자 
FROM camping_info 
WHERE 사업장명 like ‘%해수욕장%’

/* 제주도 해수욕장에 위치한 캠핑장의 소재지전체주소와 사업장명 조회*/
SELECT 소재지전체주소, 사업장명
FROM camping_info
WHERE 소재지전체주소 like '%제주%' AND 사업장명 like '%해수욕장%'

/* 제주도 해수욕장에 위치한 캠핑장 중 인허가일자가 가장 최근인 곳의 인허가일자 조회*/
SELECT MAX() /*가장 최근은 날짜가 가장 뒤에 있다는 것을 의미*/
FROM camping_info
WHERE 소재지전체주소 like ‘%제주%’ AND 사업장명 like ‘%해수욕장%’

/*INNER JOIN*/
/*Join two tables (TB_EMP: employer information, TB_DEPT: department information)*/
SELECT
EM.EMP_NO
, EM.EMP_NM
, EM.ADDR
, DP.DEPT_CD
, DP.DEPT_NM
FROM
TB_EMP EM, TB_DEPT DP
WHERE
A.DEPT_CD = B.DEPT_CD
AND
A.ADDR LIKE 수원
ORDER
BY A.EMP_NO
;

