package user;

import java.util.List;

public class test {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		UserService userService = new UserService();
		userService.findUserId("a", 10);
		/*
		 * //System.out.println(userService.findUserId("a", 010)); UserDaoImplMyBatis
		 * userDaoImplMyBatis = new UserDaoImplMyBatis();
		 * System.out.println(userDaoImplMyBatis.findUserIdByNamePhone("a", 4176));
		 */
	
		
/*업데이트 확인*/		
		//User user = new User("a", "a", "jj", "jj", 33, 33, "jj");
		//int rowCount = userService.update(user);
		//System.out.println(rowCount);
		
//회원가입확인
		
		User user = new User("b", "b", "bb", "bb", 11, 11, "bb");
		int rowCount = userService.create(user);
		System.out.println(rowCount);
		
		
//회원로그인
		int rowCount2 = userService.login("bb", "a");
		//rowCount2가 0이면 아이디 존재 안하고 2면 로그인성공이고 1이면 비번 불일치
		System.out.println(rowCount2);
	
	
//회원탈퇴
		int rowCount3 = userService.delete("b");
		System.out.println(rowCount3);

//회원 상세보기
		User user2 = userService.findUser("a");
		System.out.println(user2);
//회원 전체보기
		
		List list = userService.findAll();
		System.out.println(list);
//아이디로 사용자 존재하는지 확인	
		int rowCount4 = userService.countByUserId("yejun");
		System.out.println(rowCount4);
//이름과 번호로 아이디 찾기
		String name = userService.findUserId("jjd", 33);
		System.out.println(name);
		
//이름과 번호로 비번 찾기
		String pass = userService.findUserPass("a", 33);
		System.out.println(pass);
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
