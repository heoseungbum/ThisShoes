package order;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import product.domain.Product;


public class OrderItem{
/*
이름     널?       유형         
------ -------- ---------- 
OI_NO  NOT NULL NUMBER(10) 
OI_QTY          NUMBER(10) 
O_NO            NUMBER(10) 
P_NO            NUMBER(10) 
*/
private int oi_no;
private int oi_qty;
/********FK********/
private int o_no;
private int p_no;
/*******FK*******/
private Product product;

	public OrderItem() {
		// TODO Auto-generated constructor stub
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
	}
	
	public OrderItem(int oi_no, int oi_qty, int o_no, int p_no, Product product) {
		super();
		this.oi_no = oi_no;
		this.oi_qty = oi_qty;
		this.o_no = o_no;
		this.p_no = p_no;
		this.product = product;
	}
	
	public int getOi_no() {
		return oi_no;
	}
	
	public void setOi_no(int oi_no) {
		this.oi_no = oi_no;
	}
	
	public int getOi_qty() {
		return oi_qty;
	}
	
	public void setOi_qty(int oi_qty) {
		this.oi_qty = oi_qty;
	}
	
	public int getO_no() {
		return o_no;
	}
	
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	
	public int getP_no() {
		return p_no;
	}
	
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Override
	public String toString() {
		return "OrderItem [oi_no=" + oi_no + ", oi_qty=" + oi_qty + ", o_no=" + o_no + ", p_no=" + p_no + ", product="
				+ product + "]";
	}

	
	
}