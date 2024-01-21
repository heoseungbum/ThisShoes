package cart;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import cart.mapper.CartMapper;

public class CartDaoImpl implements CartDao {

	private SqlSessionFactory sqlSessionFactory;

	public CartDaoImpl() throws Exception {
		String resource = "mybatis-config.xml"; // mybatis 설정 파일 경로
	    InputStream inputStream = Resources.getResourceAsStream(resource);
	    sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	@Override
	public int insert(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.insert(cart);
		sqlSession.close();
		return rowCount;
	}
	
	@Override
	public int update_qty(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.update_qty(cart);
		sqlSession.close();
		return rowCount; 
	}
	
	@Override
	public int update_size(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.update_size(cart);
		sqlSession.close();
		return rowCount; 
	}
	
	@Override
	public int delete(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.delete(cart); 
		sqlSession.close();
		return deleteRowCount;
	}
	
	
	public List<Cart> cartProductAll(String u_id) {
		List<Cart> cartList = new ArrayList<Cart>();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		cartList = cartMapper.cartProductAll(u_id);
		sqlSession.close();
		return cartList;
	}
	
	@Override
	public Integer count_product_by_userId(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		Integer rowCount = cartMapper.count_product_by_userId(cart);
		sqlSession.close();
		return rowCount;
	}
	
	@Override
	public int count_productWithSize_by_userId(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.count_productWithSize_by_userId(cart);
		sqlSession.close();
		return rowCount;
	}
	
	@Override
	public int update_byProductNo(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.update_byProductNo(cart);
		sqlSession.close();
		return rowCount;
	}
	

	@Override
	public Cart findCartbyNo(Cart cart) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		cartMapper.findCartbyNo(cart);
		sqlSession.close();
		return cart;
	}

	
	
}
