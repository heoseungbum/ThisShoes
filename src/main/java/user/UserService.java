package user;

import java.util.List;

public class UserService {
	// 멤버필드(UserDao 인터페이스)
	private UserDaoImplMyBatis userDao;
	// public int create(User user)throws Exception;
	//	public User login(String userId,String password) throws Exception;

	// 기본생성자
	public UserService() throws Exception {
		userDao = new UserDaoImplMyBatis();
	}

	// 회원가입
	public int create(User user) throws Exception {
		if (userDao.countByUserId(user.getU_id()) == 1) {
			// -1:아이디중복
			return -1;
		} else {
			// 1:회원가입성공
			userDao.insert(user);
			return 1;
		}
	}

	// 회원로그인
	public int login(String userId, String password) throws Exception {
		int result = 0;
		// 1.아이디존재여부
		User user = userDao.findUser(userId);
		if (user == null) {
			// 0:아이디존재안함
			result = 0;
		} else {
			if (user.getU_pass().equals(password)) {
				// 2:로그인성공(세션)
				result = 2;
			} else {
				// 1:패쓰워드 불일치
				result = 1;
			}
		}
		return result;
	}

	// 회원 수정
	public int update(User user) throws Exception {
		return userDao.update(user);
	}

	// 회원 탈퇴
	public int delete(String u_id) throws Exception {
		return userDao.delete(u_id);
	}

	// 회원상세보기
	public User findUser(String userId) throws Exception {
		return userDao.findUser(userId);
	}

	// 모든사용자 정보를 데이타베이스에서 찾아서 List<User> 콜렉션에 저장하여 반환
	public List<User> findAll() throws Exception {
		return userDao.findUserList();
	}

	// 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를 판별
	public int countByUserId(String u_id) throws Exception {
		return userDao.countByUserId(u_id);
	}
	//인자로 전달되는 이름과 전화번호로 아이디 찾기
	public String findUserId(String u_name, int u_phone) throws Exception {
		String u_id = userDao.findUserIdByNamePhone(new User(null, null, u_name, null,0 , u_phone, null));
		return u_id;
	}
	
	//인자로 전달되는 이름과 전화번호로 비번 찾기
	public String findUserPass(String u_id, int u_phone) throws Exception {
		String u__id = userDao.findUserPassByNamePhone(new User(u_id, null,null, null,0 , u_phone, null));
		return u__id;
	}
}
