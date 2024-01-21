package user;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {
    int insert(User user);
    
    int update(User user);
    
    int delete(String userId);
    
    User findUser(String userId);
    
    List<User> findUserList();
    
    int countByUserId(String userId);
	
 // 추가: 사용자 이름과 비밀번호를 기준으로 u_id 조회하는 메서드
    String findUserIdByNamePhone(User user);
    
 // 추가: 사용자 이름과 비밀번호를 기준으로 u_pass 조회하는 메서드
    String findUserPassByNamePhone(User user);
}