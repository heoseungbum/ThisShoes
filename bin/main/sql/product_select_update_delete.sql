--product 전체 제품 목록 출력
select * from product;
--브랜드별로 출력(아식스)
select * from product where p_brand = '아식스';
--브랜드별로 출력(나이키)
select * from product where p_brand = '나이키';
--브랜드별로 출력(아디다스)
select * from product where p_brand = '아디다스';

--p_no제품이 1번 출력
select * from product where p_no = 1;
--가격 순으로 내림차순
SELECT * FROM PRODUCT ORDER BY p_price DESC;
--가격 순으로 오름차순
SELECT * FROM PRODUCT ORDER BY p_price asc;

--브랜드별 가격별로 내림차순(나이키)
SELECT * FROM PRODUCT WHERE p_brand='나이키' ORDER BY p_price DESC;
--브랜드별 가격별로 오름차순(나이키)
SELECT * FROM PRODUCT WHERE p_brand='나이키' ORDER BY p_price ASC;

--브랜드별 가격별로 내림차순(아디다스)
SELECT * FROM PRODUCT WHERE p_brand='아디다스' ORDER BY p_price DESC;
--브랜드별 가격별로 오름차순(아디다스)
SELECT * FROM PRODUCT WHERE p_brand='아디다스' ORDER BY p_price ASC;

--브랜드별 가격별로 내림차순(아식스)
SELECT * FROM PRODUCT WHERE p_brand='아식스' ORDER BY p_price DESC;
--브랜드별 가격별로 오름차순(아식스)
SELECT * FROM PRODUCT WHERE p_brand='아식스' ORDER BY p_price ASC;


--조회순으로 내림차순
SELECT * FROM PRODUCT ORDER BY p_click_count DESC;
--조회순으로 오름차순
SELECT * FROM PRODUCT ORDER BY p_click_count ASC;


--브랜드별 조회순으로 내림차순(아디다스)
SELECT * FROM PRODUCT WHERE P_BRAND='아디다스' ORDER BY p_click_count DESC;
--브랜드별 조회순으로 오름차순(아디다스)
SELECT * FROM PRODUCT WHERE P_BRAND='아디다스' ORDER BY p_click_count ASC;

--브랜드별 조회순으로 내림차순(나이키)
SELECT * FROM PRODUCT WHERE P_BRAND='나이키' ORDER BY p_click_count DESC;
--브랜드별 조회순으로 오름차순(나이키)
SELECT * FROM PRODUCT WHERE P_BRAND='나이키' ORDER BY p_click_count ASC;

--브랜드별 조회순으로 내림차순(아식스)
SELECT * FROM PRODUCT WHERE P_BRAND='아식스' ORDER BY p_click_count DESC;
--브랜드별 조회순으로 오름차순(아식스)
SELECT * FROM PRODUCT WHERE P_BRAND='아식스' ORDER BY p_click_count ASC;


--상품 일부 이름으로 상품 검색 기능 
select p_name from product where p_name like '%'||'아'||'%'; 


--조회수 증가
update product set p_click_count=p_click_count+1 where p_no = 1;
		
--상품 번호가 1번인거 지우기~			
delete from product where p_no = 1;
