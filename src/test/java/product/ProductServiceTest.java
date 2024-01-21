package product;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import product.domain.Product;
import product.service.ProductServiceImpl;

public class ProductServiceTest {
    private ProductServiceImpl productService;

    @BeforeEach
    public void setUp() throws Exception {
        // SqlSessionFactory를 생성하고 이를 인자로 넘겨 ProductServiceImpl 인스턴스를 생성
        productService = new ProductServiceImpl();
    }
    @Disabled
    @Test
    void testselectProductByNo() throws Exception{
    	System.out.println(productService.selectProductByNo(87));
    	
    }
    
	/*@Test
	public void testFindAllByPriceHigh() throws Exception {
		List<Product> products = productService.findAllByPriceHigh();

		// 테스트 데이터베이스에서 반환된 데이터의 일부를 검증
		assertEquals(120, products.size()); // 예상 결과 크기와 일치하는지 확인
		assertEquals("나이키 에어맥스 97 틸 틴트", products.get(0).getP_name()); // 예상 제품명과 일치하는지 확인
		// ... 다른 필드도 필요한 만큼 검증

		// 추가적인 테스트 케이스 작성
	}*/

	/*@Test
	public void testFindAllByPriceLow() throws Exception {
		List<Product> products = productService.findAllByPriceLow();

		// 테스트 데이터베이스에서 반환된 데이터의 일부를 검증
		assertEquals(120, products.size()); // 예상 결과 크기와 일치하는지 확인
		assertEquals("아식스 젤 소노마 15-50 스모크 그레이 크림", products.get(0).getP_name()); // 예상 제품명과 일치하는지 확인

	}*/
    @Disabled
	@Test
	public void testSearchProductsByName() throws Exception {
		// Given
		String keyword = "아"; // 검색할 제품 이름 키워드 설정

		// When
		List<Product> products = productService.searchProductsByName(keyword);

		// Then
		// 예상 결과 크기와 일치하는지 확인
		assertEquals(80, products.size());

		// 추가적인 검증 로직을 작성하면 됩니다.
	}
	//브랜드별 가격 높은순 정렬
	/*@Test
    public void testFindBrandPriceHigh() throws Exception {
        List<Product> products = productService.findBrandPriceHigh("아디다스");

        assertNotNull(products);
        assertFalse(products.isEmpty());

        // 가격 높은 순으로 정렬되어 있는지 확인
        double previousPrice = Double.MAX_VALUE;
        for (Product product : products) {
            assertTrue(product.getP_price() <= previousPrice);
            previousPrice = product.getP_price();
        }

        // 브랜드가 일치하는지 확인
        for (Product product : products) {
            assertEquals("아디다스", product.getP_brand());
        }
	}*/

	/*@Test
	public void testSearchProductsByBrand() throws Exception {
		List<Product> Products = productService.selectProductByBrand("아디다스");

		assertNotNull(Products);
		// 아디다스 브랜드의 상품 개수와 일치하는지 확인
		assertEquals(40, Products.size()); // 여기에 예상되는 상품 개수를 입력하세요

		// 상품의 브랜드가 실제로 "아디다스"인지 확인
		for (Product product : Products) {
			assertEquals("아디다스", product.getP_brand());
		}

	}*/
/*	@Test
	public void testFindBrandPriceLow() throws Exception {
	    List<Product> products = productService.findBrandPriceLow("아디다스");

	    assertNotNull(products);
	    assertFalse(products.isEmpty());

	    // 가격 낮은 순으로 정렬되어 있는지 확인
	    double previousPrice = 0.0;
	    for (Product product : products) {
	        assertTrue(product.getP_price() >= previousPrice);
	        previousPrice = product.getP_price();
	    }

	    // 브랜드가 일치하는지 확인
	    for (Product product : products) {
	        assertEquals("아디다스", product.getP_brand());
	    }
	}*/
	/*@Test
	public void testFindBrandClickCountHigh() throws Exception {
	    String brand = "아디다스"; // 원하는 브랜드 이름으로 변경

	    List<Product> products = productService.findBrandClickCountHigh();

	    assertNotNull(products); // 결과가 null이 아닌지 확인
	    assertFalse(products.isEmpty()); // 결과 리스트가 비어있지 않은지 확인

	    // products 리스트 내의 제품들의 조회수를 확인하여 순서가 내림차순인지 확인
	    int previousClickCount = Integer.MAX_VALUE;
	    for (Product product : products) {
	        assertTrue(product.getP_click_count() <= previousClickCount);
	        previousClickCount = product.getP_click_count();
	    }
	}*/
	
	/*  @Test
	    public void testSoldOutProducts() throws Exception {
	        int p_size = 230; // 테스트에 사용할 데이터 사이즈
	        List<Product> soldOutProducts = productService.soldOutProducts(p_size);

	        
	        assertNotNull(soldOutProducts);
	    }*/
	@Test
	public void testselectProductByBrand() throws Exception{
		System.out.println(productService.getTwoProductsPerBrand());
	}
}

