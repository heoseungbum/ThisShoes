package order;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import product.domain.Product;

class OrderDaoImplTest {
	private OrderDaoImpl orderDaoImpl;

	@BeforeEach
	void setUp() throws Exception {
		orderDaoImpl = new OrderDaoImpl();
	}

	@Disabled
	@Test
	void testdeleteU_id() throws Exception {
		int rowCount = orderDaoImpl.deleteU_id("jiwoo");
		assertTrue(rowCount >= 1, "실패");
	}

	@Disabled
	@Test
	void testdeleteOrderNo() throws Exception {
		int rowCount = orderDaoImpl.delete(null);
		assertTrue(rowCount >= 1, "실패");
	}
	@Disabled
	@Test
	void testInsertOrder() throws Exception {
		Order order = new Order(0, null, null, 0, null, "a", new ArrayList<OrderItem>());
		order.getOrderItemList().add(
				new OrderItem(0,1,0,87,new Product(87, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트", 160000, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트.png", "기타 상세 정보 등...", "나이키", 5,10,240)));
		int rowCount = orderDaoImpl.insertOrder(order);
		assertTrue(rowCount >= 1, "실패");
	}

	/*
	 * @Disabled
	 * 
	 * @Test void testinsertOrderItem() throws Exception { int rowCount =
	 * orderDaoImpl.insertOrderItem(new OrderItem(0, 0, 30, 87, null));
	 * assertTrue(rowCount >= 1, "실패"); }
	 */

	
	@Test
	void testselectByUserId() throws Exception {
		List<Order> orderList = orderDaoImpl.selectByUserId("j");
		System.out.println(orderList);
	}

	@Disabled
	@Test
	void testselectOrderWithOrderItemsByUserId() throws Exception {
		//System.out.println(orderDaoImpl.selectOrderWithOrderItemsByUserId("j"));
		System.out.println(orderDaoImpl.selectOrderWithOrderItemsByUserId("j").get(0));
	}
}