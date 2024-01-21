package order;

import java.util.ArrayList;
import java.util.List;

import cart.CartDao;
import product.domain.Product;

public class OrderService {
	// 맴버필드(OrderDao Interface)
	private OrderDaoImpl orderDao;

	public OrderService() throws Exception {
		orderDao = new OrderDaoImpl();
	}

	// 아이디로 주문목록 조회
	public List<Order> orderListById(String u_id) throws Exception{
		return orderDao.selectByUserId(u_id);
	}
	
	// 주문번호로 주문목록 조회
	public List<Order> orderListByOrderNo(int o_no) throws Exception{
		return orderDao.selectOrderWithOrderItemsByOrderNo(o_no);
	}
	
	// 사용자 아이디에 해당하는 주문 목록 및 주문 항목 조회
    public List<Order> orderWithorderItemsByUserId(String u_id) throws Exception {
        return orderDao.selectOrderWithOrderItemsByUserId(u_id);
    }
	
	// 주문목록에 담긴 내역삭제
	public int delete(Order order) throws Exception{
		return orderDao.delete(order);
	}
	
	// 주문 삭제 (사용자 아이디에 해당하는 주문 전체 삭제)
	public int deleteOrderByUserId(String u_id) throws Exception{
		return orderDao.deleteU_id(u_id);
	}
	
	// 주문 추가
    public int addOrder(Order order) throws Exception {
		List<OrderItem> orderItems = order.getOrderItemList();
		order.setO_desc(orderItems.get(0).getProduct().getP_name());
		if (orderItems.size() > 1) {
			order.setO_desc(order.getO_desc() + "외 " + (orderItems.size() - 1) + "종");
		}
		int Count = orderDao.insertOrder(order);
		for (OrderItem orderItem : orderItems) {
			orderItem.setO_no(order.getO_no());
			orderDao.insertOrderItem(orderItem);
		}
		 
        return Count; 
    }
	
	// 주문 항목 추가
	public int addOrderItem(OrderItem orderItem) throws Exception{
		return orderDao.insertOrderItem(orderItem);
	}
	
	/*
	 * public List<OrderItem> getOrderItemsByOrder(Order order) throws Exception{
	 * return orderDao.getOrderItemsByOrder(order); }
	 */
	

}
