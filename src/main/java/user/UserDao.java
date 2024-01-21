package user;

import java.util.List;

public interface UserDao {
	
	/*사용자 테이블에 새로운 사용자 생성*/
	int insert(User user) throws Exception;
	
	/*기존 사용자의 ID(pk)로 기존의 사용자 정보를 수정*/
	int update(User user) throws Exception;
	
	/*기존의 사용자의 ID(pk)로 회원 탈퇴*/
	int delete(String u_id ) throws Exception;

	//  사용자아이디에해당하는 정보를 데이타베이스에서 찾아서 User 도메인클래스에 저장하여 반환	 
	User findUser(String u_id) throws Exception;
	
	//모든사용자 정보를 데이타베이스에서 찾아서 List<User> 콜렉션에 저장하여 반환 
	List<User> findUserList() throws Exception;
	
	//인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를 판별 
	int countByUserId(String u_id) throws Exception;
	
	//아이디찾기(이름과 전번)
	String findUserIdByNamePhone(User user) throws Exception ;
	
	//비번찾기(이름과 전번)
	String findUserPassByNamePhone(User user) throws Exception ;
}