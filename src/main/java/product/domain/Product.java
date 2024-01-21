package product.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class Product {
	@NonNull
	private int p_no;
	private String p_name;
	private int p_price;
	private String p_image;
	private String p_detail;
	private String p_brand;
	private int p_click_count;
	private int p_amount;
	private int p_size;
	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", p_price=" + p_price + ", p_image=" + p_image
				+ ", p_detail=" + p_detail + ", p_brand=" + p_brand + ", p_click_count=" + p_click_count + ", p_amount="
				+ p_amount + ", p_size=" + p_size + "]\n";
	}
	

	
}
