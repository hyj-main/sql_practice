SELECT
	a.symbol, /* symbol �� a table, b table ���� �Ȱ��� ������ �׳� symbol �̶�� ���� ������. ������̺��� symbol ���� ����������ٰ�. */
	a.company_name,
	a.ipo_year,
	a.sector,
	a.industry,

	b.date,
	b.[open], /*open ��� ���� ������ [ ] �ȿ� �־�� ��*/
	b.[high],
	b.[low],
	b.[close],
	b.adj_close,
	b.volume
   /*b.symbol �� �ǿܷ� �ȵ��� ��. �̹� a table �� symbol �� �־.. python�� �ȱ׷���.*/ 
FROM nasdaq_company AS a /*table �̸� �����ϰ� alt F1 ������ �� �ؿ� �Ӽ� ��Ÿ���� column ��� data type �� �� ����*/
	INNER JOIN stock AS b ON a.symbol = b.symbol
WHERE a.symbol = N'MSFT' /*N �� ���� ������? symbol== MST microsoft �� �ุ JOIN.*/
	AND b.date >= '2021-10-01'
	AND b.date < '2021-11-01'


SELECT
	a.symbol, /* symbol �� a table, b table ���� �Ȱ��� ������ �׳� symbol �̶�� ���� ������. ������̺��� symbol ���� ����������ٰ�. */
	a.company_name,
	a.ipo_year,
	a.sector,
	a.industry,
	a.last_crawel_date,
	b.date,
	b.[open], /*open ��� ���� ������ [ ] �ȿ� �־�� ��*/
	b.[high],
	b.[low],
	b.[close],
	b.adj_close,
	b.volume
   /*b.symbol �� �ǿܷ� �ȵ��� ��. �̹� a table �� symbol �� �־.. python�� �ȱ׷���.*/ 
FROM nasdaq_company AS a /*table �̸� �����ϰ� alt F1 ������ �� �ؿ� �Ӽ� ��Ÿ���� column ��� data type �� �� ����*/
	INNER JOIN stock AS b ON a.last_crawel_date = b.date /* �̷��� table �� �ִ� �������� �޶� join ������. ���� last_crawl_date �� b.date �� ��ġ�ϴ°� ������ ��� �ƿ� �ȳ��� */
WHERE a.symbol = N'MSFT' /*N �� ���� ������? symbol== MST microsoft �� �ุ JOIN.*/

/*Table 3�� �ѹ��� join*/
SELECT
	a.industry,
	c.symbol,
	c.company_name,
	c.ipo_year,
	c.sector
FROM industry_group AS a
	INNER JOIN industry_group_symbol AS b on a.num = b.num
	INNER JOIN nasdaq_company AS c on b.symbol = c.symbol
WHERE a.industry = N'�ڵ���'
ORDER BY c.symbol

/*OUTER JOIN*/

SELECT
	a.symbol as a_symbol,
	b.symbol as b_symbol

FROM nasdaq_company AS a
	LEFT OUTER JOIN industry_group_symbol AS b on a.symbol = b.symbol


	