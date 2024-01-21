/**********************orders select************************/
--1. 멤버 한사람의(jaehong) 주문전체목록
select o_no,o_desc,o_date,o_price,o_address,u_id from orders where u_id = 'jaehong';

--2. 주문한개(멤버 한사람의) 
select * from orders where o_no = 1;

--3. 주문한개의 주문상세 여러개(주문상세)
select * from order_item where o_no = 1;

--4. 주문한개의 주문상세,제품정보 여러개(주문상세,제품)
select * from orders o join order_item oi on o.o_no = oi.o_no  join  product p on oi.p_no = p.p_no 
where o.u_id = 'jaehong' and o.o_no = 1;

/**********************orders delete************************/
--1. 주문한개삭제(주문1개삭제,주문상세삭제)
delete from orders where o_no = 6;
delete from order_item where o_no = 4;

--2. 멤버 한사람의(leeshuttle22) 주문내역 전체삭제
delete from orders where u_id = 'yujun';