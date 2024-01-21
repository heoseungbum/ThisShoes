package cart;

import lombok.Getter;
import lombok.Setter;
import product.domain.Product;

@Setter
@Getter
public class Cart {
	
	private int cart_no;
	private int cart_qty;
	private String u_id;
	private Product product;
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cart_no, int cart_qty, String u_id, Product product) {
		super();
		this.cart_no = cart_no;
		this.cart_qty = cart_qty;
		this.u_id = u_id;
		this.product = product;
	}

	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", cart_qty=" + cart_qty + ", u_id=" + u_id + ", product=" + product + "]";
	}
	
}
