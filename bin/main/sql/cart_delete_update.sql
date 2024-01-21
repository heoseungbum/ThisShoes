-- 회원이(u_id) 삭제할 품목(cart_no) 선택 삭제
delete from cart where u_id = '' and cart_no = ;

-- 회원 주문(cart_no) 삭제
delete from cart where cart_no = ;

update cart set cart_qty=2 where u_id = 'new_user1' and cart_no=1;