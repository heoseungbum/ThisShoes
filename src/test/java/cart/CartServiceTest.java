package cart;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import product.domain.Product;
import product.service.ProductService;

class CartServiceTest {

	CartService cartService;

	@BeforeEach
	void setUp() throws Exception {
		cartService = new CartService();
	}

	@Test
	void test() throws Exception {
		ProductService productService = new ProductService();
		CartService cartService = new CartService();
		Product product = productService.selectProductByNo(87);
		System.out.println(product);

		Cart cart = new Cart(0, 1, "jaewoo", product);
		System.out.println(cart);
		int rowCount = cartService.addCart(cart);
		assertTrue(rowCount >= 0, "실패");

	}

}
