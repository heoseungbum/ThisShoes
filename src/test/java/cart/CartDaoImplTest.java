package cart;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import product.domain.Product;

class CartDaoImplTest {
	private CartDaoImpl cartDaoImpl;

	@BeforeEach
	void setUp() throws Exception {
		cartDaoImpl = new CartDaoImpl();
		return;
	}

	/*
	 * @Disabled
	 * 
	 * @Test void testInsert() { Product product; product = new Product(87,
	 * "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트", 160000,
	 * "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트.png", "기타 상세 정보 등...", "나이키",
	 * 5,10,240); Cart cart = new Cart(2, 2, "jaehong",product); int insertRowCount
	 * = cartDaoImpl.insert(cart); assertTrue(insertRowCount == 1, "쓰기실패"); return;
	 * }
	 * 
	 * @Disabled
	 * 
	 * @Test void testupdate_qty() { Cart cart = new Cart(2, 2,"new_user",25); int
	 * updateRowCount = cartDaoImpl.update_qty(cart); assertTrue(updateRowCount==1,
	 * "수량조절실패"); return; }
	 * 
	 * @Disabled
	 * 
	 * @Test void testupdate_size() { Cart cart = new Cart(1, 1, "jaehong", null,
	 * 260); int updateRowCount = cartDaoImpl.update_size(cart);
	 * assertTrue(updateRowCount == 1, "사이즈조절실패"); return; }
	 * 
	 * @Disabled
	 * 
	 * @Test void testDelete() { String cartUIdDelete = "new_user"; int
	 * cartNoToDelete = 3; // int deleteRowCount = cartDaoImpl.delete(new
	 * Cart(cartNoToDelete,2, // cartUIdDelete, 30)); // assertTrue(deleteRowCount
	 * >= 0, "삭제 실패"); }
	 * 
	 * 
	 * @Disabled
	 * 
	 * @Test void testCount_product_by_userId() throws Exception { Cart cart = new
	 * Cart(1, 1, "jaehong", new Product(1, "아디다스 이지 폼 러너 카본", 150000,
	 * "아디다스 이지 폼 러너 카본.png", "기타 상세 정보 등...", "아디다스", 5), 260); cartDaoImpl = new
	 * CartDaoImpl(); int rowCount = cartDaoImpl.count_product_by_userId(cart);
	 * assertTrue(rowCount > 0, "찾기실패"); return; }
	 * 
	 * 
	 * @Disabled
	 * 
	 * @Test void testCount_product_by_userId() throws Exception { Cart cart = new
	 * Cart(1, 1, "jaehong", new Product(1, "아디다스 이지 폼 러너 카본", 150000,
	 * "아디다스 이지 폼 러너 카본.png", "기타 상세 정보 등...", "아디다스", 5), 260); cartDaoImpl = new
	 * CartDaoImpl(); int rowCount = cartDaoImpl.count_product_by_userId(cart);
	 * assertTrue(rowCount > 0, "찾기실패"); return; }
	 * 
	 */
	@Test
	void testcount_productWithSize_by_userId() {
		Cart cart = new Cart();
		cart.setU_id("jaewoo");
		cart.setProduct(new Product(94, "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트", 160000,
				  "나이키 에어포스 1 07 LV8 40주년 조인 포스 세일 말라카이트.png", "기타 상세 정보 등...", "나이키",0,0,260));
		int result = cartDaoImpl.count_product_by_userId(cart);
		System.out.println("결과:" + result);
		assertTrue(result >= 0, "실패");
	}

	/*
	 * @Disabled
	 * 
	 * @Test void testupdate_byProductNo() throws Exception {
	 * 
	 * Cart cart = new Cart(1, 1, "jaehong", null, 260);
	 * 
	 * Integer updateRowCount = cartDaoImpl.update_byProductNo(cart);
	 * assertTrue(updateRowCount >= 0, "실패");
	 * 
	 * return; }
	 * 
	 * @Disabled
	 * 
	 * @Test void testcartProductAll() throws Exception { List<Cart> cart =
	 * cartDaoImpl.cartProductAll("jaehong"); System.out.println(cart);
	 * assertNotNull(cart); }
	 * 
	 * @Disabled
	 * 
	 * @Test void testfindCartbyNo() throws Exception { Cart cart = new Cart(3, 0,
	 * "jaehong", null); System.out.println(cartDaoImpl.findCartbyNo(cart)); }
	 */

}
