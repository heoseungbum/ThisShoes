package user;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull; // assertNotNull를 import
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import user.User;
import user.UserDao;
import user.UserDaoImplMyBatis;

class UserDaoImplMyBatisTest {
	
	private UserDaoImplMyBatis userDao;

	@BeforeEach
	void setUp() throws Exception {
		userDao = new UserDaoImplMyBatis(); // UserDaoImplMyBatis 객체 생성하여 userDao에 할당
	}

/* 
	@Test
    void testUpdate() {
		
        User userToUpdate = new User("a" ,  "a", "ab", "jaeyong@naver.com5",2046, 010123, "경기도 어딘가43");
        try {
            int updatedRowCount = userDao.update(userToUpdate);
            assertEquals(1, updatedRowCount, "Update should affect one row");
            User updatedUser = userDao.findUser("a");
            assertEquals("ab", updatedUser.getU_name(), "Name should be updated");
        } catch (Exception e) {
            fail("Exception thrown: " + e.getMessage());
        }
        
    }

	
	@Test
	void testFindUser() {
		
	    String userIdToFind = "jaehong"; // 찾을 사용자 아이디
	    try {
	        User foundUser = userDao.findUser(userIdToFind);
	        assertNotNull(foundUser, "Found user should not be null"); // 검색 결과가 null이 아닌지 확인
	        assertEquals(userIdToFind, foundUser.getU_id(), "User IDs should match"); // 사용자 아이디가 일치하는지 확인
	    } catch (Exception e) {
	        fail("Exception thrown: " + e.getMessage());
	    }
	    
	}


	@Test
	void testFindUserList() {
		
	    try {
	        // UserDaoImplMyBatis의 findUserList 메서드 호출
	        List<User> userList = userDao.findUserList();
	        
	        // 검색된 사용자 리스트가 null이 아니고 비어있지 않은지 확인
	        assertNotNull(userList, "User list should not be null");
	        assertEquals(false, userList.isEmpty(), "User list should not be empty");
	    } catch (Exception e) {
	        fail("Exception thrown: " + e.getMessage());
	    }
	    
	}
	

	@Test
	void testInsert() {
		
	    User newUser = new User("new_user5", "password5", "New name5", "newuser@example.com5", 255, 0101234555, "New User Address5");
	    try {
	        // UserDaoImplMyBatis의 insert 메서드 호출
	        int rowCount = userDao.insert(newUser);
	        
	        // 삽입 작업의 결과를 확인
	        assertEquals(1, rowCount, "Insert should affect one row");
	        
	        // 삽입된 사용자 정보를 확인
	        User insertedUser = userDao.findUser("new_user5");
	        assertNotNull(insertedUser, "Inserted user should not be null");
	        assertEquals("New name5", insertedUser.getU_name(), "Inserted user name should match");
	    } catch (Exception e) {
	        fail("Exception thrown: " + e.getMessage());
	    }
	    
	}
	
	

	@Test
	void testDelete() {
		
	    String userIdToDelete = "new_user5";
	    try {
	        // UserDaoImplMyBatis의 delete 메서드 호출
	        int rowCount = userDao.delete(userIdToDelete);
	        
	        // 삭제 작업의 결과를 확인
	        assertEquals(1, rowCount, "Delete should affect one row");
	        
	        // 삭제된 사용자 정보를 확인
	        User deletedUser = userDao.findUser(userIdToDelete);
	        assertEquals(null, deletedUser, "Deleted user should be null");
	    } catch (Exception e) {
	        fail("Exception thrown: " + e.getMessage());
	    }
	    
	}
	

	@Test
	void testCountByUserId() {
		
	    String existingUserId = "yujun";
	    String nonExistingUserId = "nonexistinguser";
	    try {
	        // 기존 사용자 아이디에 대한 카운트 확인
	        int existingUserCount = userDao.countByUserId(existingUserId);
	        assertEquals(1, existingUserCount, "Existing user count should be 1");
	        
	        // 존재하지 않는 사용자 아이디에 대한 카운트 확인
	        int nonExistingUserCount = userDao.countByUserId(nonExistingUserId);
	        assertEquals(0, nonExistingUserCount, "Non-existing user count should be 0");
	    } catch (Exception e) {
	        fail("Exception thrown: " + e.getMessage());
	    }
    
	}
	
	
	@Test
	void findUserIdByNamePhone() throws Exception{//아이디를 이름과 전번으로 찾기
		String u_id = userDao.findUserIdByNamePhone(new User(null, null, "jjd", null,0 , 33, null));
		System.out.println(u_id);
		
	}
	*/
	@Test
	void findUserPassByNamePhone() throws Exception{//아이디를 이름과 전번으로 찾기
		String u_pass = userDao.findUserPassByNamePhone(new User("a", null, null, null,0 , 33, null));
		System.out.println(u_pass);
		
	}
  /*  */
}
