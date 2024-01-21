/**********************orders insert************************/

insert into orders(o_no,o_desc,o_date,o_price,o_address,u_id) VALUES (orders_o_no_SEQ.nextval, '아디다스 이지 폼 러너 카본 외 1종', sysdate, 150000, '경기도 어딘가', 'jaehong');
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 25); 
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 26);
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 27);

insert into orders(o_no,o_desc,o_date,o_price,o_address,u_id) VALUES (orders_o_no_SEQ.nextval, '아디다스 가젤 인도어 블리스 ', sysdate-1, 180000, '경기도 어딘가', 'jaehong');
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 2, orders_o_no_SEQ.currval, 26); 

insert into orders(o_no,o_desc,o_date,o_price,o_address,u_id) VALUES (orders_o_no_SEQ.nextval, '아식스 x 키스 젤 카야노 14 크림 스카라브', sysdate, 180000, '경상도 어딘가', 'seojun');
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 33);

insert into orders(o_no,o_desc,o_date,o_price,o_address,u_id) VALUES (orders_o_no_SEQ.nextval, '나이키 덩크 로우 프리미엄 미드나잇 네이비 앤 화이트 외 2종', sysdate, 150000, '충청도 어딘가', 'jiwoo');
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 41); 
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 42);
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 1, orders_o_no_SEQ.currval, 43);

insert into orders(o_no,o_desc,o_date,o_price,o_address,u_id) VALUES (orders_o_no_SEQ.nextval, '나이키 덩크 로우 레트로 SE 인더스트리얼 블루 ', sysdate-1, 180000, '강원도 어딘가', 'yujun');
insert into order_item(oi_no, oi_qty, o_no, p_no) VALUES(order_item_oi_no_SEQ.nextval, 10, orders_o_no_SEQ.currval, 48);

select * from orders;

commit;