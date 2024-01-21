package user;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
/*
public class UserServiceImplMyBatis implements UserService{

	private SqlSessionFactory sqlSessionFactory;
	
	private UserDao userDao;
	
	public UserServiceImplMyBatis() throws Exception  {
		UserDao userDao   = new UserDaoImplMyBatis();
		
	}

	@Override
	public int create(User user) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : insert() 호출  ");
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
		int rowCount=userMapper.insert(user);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public User login(String userId, String password) throws Exception {
	    System.out.println("#### UserDaoImplMyBatis : login() 호출");
	    
	    // SqlSession 생성
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
	    
	    // 주어진 userId에 해당하는 사용자 정보 가져오기
	    User loginUser = userMapper.findUser(userId);
	    
	    // 사용자 정보가 없거나 비밀번호가 일치하지 않으면 null 반환
	    if (loginUser == null || !loginUser.getU_pass().equals(password)) {
	        return null;
	    }
	    
	    // 로그인 성공 시 사용자 정보 반환
	    return loginUser;
	}
	
	@Override 
	public User findUser(String userId)throws Exception {
		
	}
	
	
	
}
*/