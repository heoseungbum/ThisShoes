package cart;

import java.util.List;

public class CartService {

	private CartDaoImpl cartDao;

	public CartService() throws Exception {
		cartDao = new CartDaoImpl();
	}

	// 카트에 담긴 상품 수량 변경
	public int update_qty(Cart cart) throws Exception {
		return cartDao.update_qty(cart);
	}

	// 카트에 담긴 상품 사이즈 변경
	public int update_size(Cart cart) throws Exception {
		return cartDao.update_size(cart);
	}

	// 카트에 담긴 상품 전체보기
	public List<Cart> cartProductAll(String u_id) throws Exception {
		return cartDao.cartProductAll(u_id);
	}

	// 카트에 담긴 상품 삭제
	public int delete(Cart cart) throws Exception {
		return cartDao.delete(cart);
	}

	// 카트에 상품 추가
	public int addCart(Cart cart) throws Exception {
		String userid = cart.getU_id();
		int p_no = cart.getProduct().getP_no();
		int qty = cart.getCart_qty();
		int count = cartDao.count_product_by_userId(cart);
		int rowCount = 0;
		if (count > 0) {
			rowCount = cartDao.update_byProductNo(cart);
		} else {
			rowCount = cartDao.insert(cart);
		}
		return rowCount;
	}

	// 카트를 번호 아이디로 찾기
	public Cart findCartByIdWithNo(Cart cart) {
		Cart findCart = cartDao.findCartbyNo(cart);
		return findCart;
	}
}
