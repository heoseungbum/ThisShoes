package order;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import order.mapper.OrderMapper;
import user.User;
import user.UserMapper;

public class OrderDaoImpl implements OrderDao {

	private SqlSessionFactory sqlSessionFactory;

	public OrderDaoImpl() throws Exception {
		String resource = "mybatis-config.xml"; // mybatis 설정 파일 경로
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	@Override
	public int deleteU_id(String u_id) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : deleteU_id() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.deleteU_id(u_id);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int delete(Order order) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : deleteOrderNo() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.delete(order);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int insertOrder(Order order) throws Exception {
	    int insertedRowCount = 0;
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
	    insertedRowCount = orderMapper.insertOrder(order);
	    List<OrderItem> orderItemList = order.getOrderItemList();
	    for(OrderItem orderItem : orderItemList) {
	    	orderMapper.insertOrderItem(orderItem);
	    }
	    
	    return insertedRowCount;
	}

	/*
	 * @Override public int insertOrderItem(OrderItem oderItem) throws Exception {
	 * System.out.println("#### UserDaoImplMyBatis : insertOrderItem() 호출  ");
	 * SqlSession sqlSession = sqlSessionFactory.openSession(true); OrderMapper
	 * orderMapper = sqlSession.getMapper(OrderMapper.class); int rowCount =
	 * orderMapper.insertOrderItem(oderItem); sqlSession.close(); return rowCount; }
	 */

	@Override
	public List<Order> selectByUserId(String u_id) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : selectByUserId() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.selectByUserId(u_id);
		sqlSession.close();
		return orderList;
	}

	@Override
	public List<Order> selectOrderWithOrderItemsByOrderNo(int o_no) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : selectOrderWithOrderItemsByOrderNo() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.selectOrderWithOrderItemsByOrderNo(o_no);
		sqlSession.close();
		return orderList;
	}

	@Override
	public List<Order> selectOrderWithOrderItemsByUserId(String u_id) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : selectOrderWithOrderItemsByUserId() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.selectOrderWithOrderItemsByUserId(u_id);
		sqlSession.close();
		return orderList;
	}

	@Override
	public int insertOrderItem(OrderItem orderItem) throws Exception {
		System.out.println("#### UserDaoImplMyBatis : insertOrderItem() 호출  ");
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.insertOrderItem(orderItem);
		sqlSession.close();
		return rowCount;
	}

	/*
	 * public List<OrderItem> getOrderItemsByOrder(Order order) { // 주문 번호를 기준으로
	 * OrderItem을 조회하는 로직을 구현해야 합니다. // 데이터베이스 조회 방식에 따라서 다양한 방법이 있을 수 있습니다. // 실제
	 * 데이터베이스와 연동하여 로직을 작성하시기 바랍니다. SqlSession sqlSession =
	 * sqlSessionFactory.openSession(true); OrderMapper orderMapper =
	 * sqlSession.getMapper(OrderMapper.class); // 예시로 임시 데이터를 생성하여 반환하는 코드
	 * List<OrderItem> orderItemList = orderMapper.getOrderItemsByOrder(order); //
	 * ... 데이터베이스 조회 로직 ... sqlSession.close(); return orderItemList; }
	 */
}