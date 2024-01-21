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

/*
이름        널?       유형            
		--------- -------- ------------- 
		O_NO      NOT NULL NUMBER(10)    
		O_DESC             VARCHAR2(100) 
		O_DATE             DATE          
		O_PRICE            NUMBER(10)    
		O_ADDRESS          VARCHAR2(100) 
		U_ID               VARCHAR2(100) 
		*/
public class Order {
	private int o_no;
	private String o_desc;
	private Date o_date;
	private int o_price;
	private String o_address;
	/************* FK ****************/
	private String u_id;
	/*********** List<OrderItem> ****/
	private List<OrderItem> orderItemList;

	public Order() {
	}

	public Order(int o_no, String o_desc, Date o_date, int o_price, String o_address, String u_id,
			List<OrderItem> orderItemList) {
		super();
		this.o_no = o_no;
		this.o_desc = o_desc;
		this.o_date = o_date;
		this.o_price = o_price;
		this.o_address = o_address;
		this.u_id = u_id;
		if(orderItemList == null) {
			orderItemList = new ArrayList<OrderItem>();
		}else {
			this.orderItemList = orderItemList;
		}
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}


	public String getO_desc() {
		return o_desc;
	}

	public void setO_desc(String o_desc) {
		this.o_desc = o_desc;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public String getO_address() {
		return o_address;
	}

	public void setO_address(String o_address) {
		this.o_address = o_address;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_desc=" + o_desc + ", o_date=" + o_date + ", o_price=" + o_price
				+ ", o_address=" + o_address + ", u_id=" + u_id + ", orderItemList=" + orderItemList + "]";
	}

}