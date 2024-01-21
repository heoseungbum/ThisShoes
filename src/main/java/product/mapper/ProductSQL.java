package product.mapper;

public class ProductSQL {
	// 전체 상품 출력
	public final static String PRODUCT_SELECT_ALL = "select * from product";

	// 제품 번호에 따른 출력
	public final static String PRODUCT_SELECT_BY_NO = "select * from product where p_no=?";

	// 제품 브랜드 별로 출력
	public final static String PRODUCT_SELECT_BY_BRAND = "select * from product where p_brand=? and p_size=?";

	// 전체제품 가격 높은순 출력(내림차순)
	public final static String PRODUCT_SELECT_BY_PRICE_DESC = "SELECT * FROM PRODUCT ORDER BY p_price DESC";
	// 브랜드별 가격 높은순 정렬
	public final static String PRODUCT_SELECT_BY_BRAND_PRICE_DESC = "SELECT * FROM PRODUCT WHERE p_brand=? ORDER BY p_price DESC";

	// 전체제품 가격 낮은순 출력(오름차순)
	public final static String PRODUCT_SELECT_BY_PRICE_ASC = "SELECT * FROM PRODUCT ORDER BY p_price asc";

	// 브랜드별 가격 낮은순 정렬
	public final static String PRODUCT_SELECT_BY_BRAND_PRICE_ASC = "SELECT * FROM PRODUCT WHERE p_brand = ? ORDER BY p_price ASC";

	// 전체제품 조회수 높은순으로 출력(내림차순)
	public final static String PRODUCT_SELECT_BY_CLICK_COUNT = "SELECT * FROM PRODUCT ORDER BY p_click_count DESC";
	// 브랜드별 조회수 높은순으로 출력(내림차순)
	public final static String PRODUCT_SELECT_BY_BRAND_CLICK_COUNT = "SELECT * FROM PRODUCT ORDER BY p_click_count DESC";

	// 상품 일부명으로 검색 기능
	public static final String Product_SELECT_BY_SEARCH_NAME = "select p_name from product where p_name like '%'||?||'%'";

	
	//상품 일부명으로 검색 기능 
	public static final String PRODUCT_SELECT_BY_SEARCH_NAME = "select p_name from product where p_name like '%'||?||'%'";
	
	//상품별 수량 체크
	public static final String PRODUCT_SELECT_BY_COUNT_AMOUNT="SELECT p_amount FROM product WHERE P_NAME=?;";
	
	//UPDATE(조회수 증가)
	public static final String PRODUCT_CLICKCOUNT= "update product set  p_click_count=p_click_count+1 where p_no = ?"; 


	//INSERT문 
	public static final String PRODUCT_INSERT= "insert into product(p_no,p_name,p_price,p_image,p_detail,p_brand,p_click_count) values(product_p_no_SEQ.nextval,?, ?, ?,?,?,?)";   
	
   //DELETE문
	public static final String PRODUCT_DELETE = "delete from product where p_no = ?"; 
	
	//품절된 상품 확인하는 법
	public static final String PRODUCT_SOLDOUT = "SELECT p.* FROM product p left outer JOIN order_item o ON p.p_no = o.p_no WHERE p.p_amount=0 and p.p_size=?";
			
	//메인 페이지에 상품 6개 띄우는 쿼리
	public static final String PRODUCT_SIXPR="SELECT * FROM (SELECT p.* ROW_NUMBER() OVER (PARTITION BY p_brand ORDER BY p_no) "
			+ "AS ROM product p) WHERE rn <= 2 AND ROWNUM <= 6;";

	

	
}
