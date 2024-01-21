--pk delete
delete userinfo where u_id='seoyeon';

--pk update
update  userinfo 
set U_ID = 'yejun', U_PASS='yejun96',U_NAME ='강예준',U_EMAIL='yejun2@naver.com', U_AGE = 27, U_PHONE = 1001234567, U_ADDRESS = '제주도 어딘가'
where U_ID='yejun';

--select pk
select * from userinfo where u_id='jaehong';

--select all
select * from userinfo;

--select count by userid
select count(*) cnt from userinfo where u_id='jaewoo'; 
    /*userinfo 테이블에서 u_id 값이 'jaewoo'인 행의 수를 반환하는 것입니다.*/
select count(*) cnt from userinfo where u_id='jungbeom'; 
       /*userinfo 테이블에서 u_id 값이 'jungbeom'인 행의 수를 반환하는 것입니다.*/


/*
 ALTER TABLE userinfo
ADD PRIMARY KEY (u_id);

u_id를 pk로 지정 했나요...?
*
**/