SELECT
	a.symbol, /* symbol 은 a table, b table 에도 똑같이 있지만 그냥 symbol 이라고만 쓰면 에러남. 어느테이블의 symbol 인지 지정안해줬다고. */
	a.company_name,
	a.ipo_year,
	a.sector,
	a.industry,

	b.date,
	b.[open], /*open 등과 같은 예약어는 [ ] 안에 넣어야 함*/
	b.[high],
	b.[low],
	b.[close],
	b.adj_close,
	b.volume
   /*b.symbol 은 의외로 안들어가도 됨. 이미 a table 에 symbol 이 있어서.. python은 안그런데.*/ 
FROM nasdaq_company AS a /*table 이름 선택하고 alt F1 누르면 그 밑에 속성 나타나서 column 명과 data type 볼 수 있음*/
	INNER JOIN stock AS b ON a.symbol = b.symbol
WHERE a.symbol = N'MSFT' /*N 은 무슨 뜻이지? symbol== MST microsoft 인 행만 JOIN.*/
	AND b.date >= '2021-10-01'
	AND b.date < '2021-11-01'


SELECT
	a.symbol, /* symbol 은 a table, b table 에도 똑같이 있지만 그냥 symbol 이라고만 쓰면 에러남. 어느테이블의 symbol 인지 지정안해줬다고. */
	a.company_name,
	a.ipo_year,
	a.sector,
	a.industry,
	a.last_crawel_date,
	b.date,
	b.[open], /*open 등과 같은 예약어는 [ ] 안에 넣어야 함*/
	b.[high],
	b.[low],
	b.[close],
	b.adj_close,
	b.volume
   /*b.symbol 은 의외로 안들어가도 됨. 이미 a table 에 symbol 이 있어서.. python은 안그런데.*/ 
FROM nasdaq_company AS a /*table 이름 선택하고 alt F1 누르면 그 밑에 속성 나타나서 column 명과 data type 볼 수 있음*/
	INNER JOIN stock AS b ON a.last_crawel_date = b.date /* 이렇게 table 에 있는 변수명이 달라도 join 가능함. 만약 last_crawl_date 과 b.date 중 일치하는게 없으면 결과 아예 안나옴 */
WHERE a.symbol = N'MSFT' /*N 은 무슨 뜻이지? symbol== MST microsoft 인 행만 JOIN.*/

/*Table 3개 한번에 join*/
SELECT
	a.industry,
	c.symbol,
	c.company_name,
	c.ipo_year,
	c.sector
FROM industry_group AS a
	INNER JOIN industry_group_symbol AS b on a.num = b.num
	INNER JOIN nasdaq_company AS c on b.symbol = c.symbol
WHERE a.industry = N'자동차'
ORDER BY c.symbol

/*OUTER JOIN*/

SELECT
	a.symbol as a_symbol,
	b.symbol as b_symbol

FROM nasdaq_company AS a
	LEFT OUTER JOIN industry_group_symbol AS b on a.symbol = b.symbol


	