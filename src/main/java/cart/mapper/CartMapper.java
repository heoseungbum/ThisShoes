package cart.mapper;

import java.util.List;

import cart.Cart;

public interface CartMapper {
	
	public int insert(Cart cart);
	
	public int update_qty(Cart cart);
	
	public int update_size(Cart cart);

	public int delete(Cart cart);
	
	public List<Cart> cartProductAll(String u_id);
	
	public Integer count_product_by_userId(Cart cart);
	
	public int count_productWithSize_by_userId(Cart cart);
	
	public int update_byProductNo(Cart cart);
	
	public Cart findCartbyNo(Cart cart);
	
}
