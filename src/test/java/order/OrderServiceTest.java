package order;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import product.domain.Product;

class OrderServiceTest {
	
	OrderService orderService;
	
	@BeforeEach
	void setUp() throws Exception {
		orderService = new OrderService();
	}

	@Test
	void test() throws Exception{
		Order order = new Order(0, null, null, 0, null, "yejun", new ArrayList<OrderItem>());
		order.getOrderItemList().add(
				new OrderItem(0,1,0,87,new Product(87, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트", 160000, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트.png", "기타 상세 정보 등...", "나이키", 5,10,240)));
		order.getOrderItemList().add(
				new OrderItem(0,1,0,87,new Product(87, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트", 160000, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트.png", "기타 상세 정보 등...", "나이키", 5,10,240)));
		order.getOrderItemList().add(
				new OrderItem(0,1,0,87,new Product(87, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트", 160000, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트.png", "기타 상세 정보 등...", "나이키", 5,10,240)));
		orderService.addOrder(order);
		System.out.println(order.getOrderItemList());
	}

}
