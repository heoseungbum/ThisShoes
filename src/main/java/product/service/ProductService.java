
package product.service;

import java.util.List;

import product.domain.Product;
import product.mapper.ProductMapper;

public class ProductService {
	
	private ProductServiceImpl productServiceImpl;
	
	public ProductService() throws Exception {
		productServiceImpl=new ProductServiceImpl();
	}
	// 전체상품 높은 가격순으로 정렬(내림차순)
	public List<Product> findAllByPriceHigh() throws Exception {
		return productServiceImpl.findAllByPriceHigh();
	}
	// 브랜드별 가격 높은순 정렬
	public List<Product> findBrandPriceHigh(String p_brand) throws Exception {
		return productServiceImpl.findBrandPriceHigh(p_brand);
	}


	// 전체상품 낮은 가격순으로 정렬(오름차순)
	public List<Product> findAllByPriceLow() throws Exception {
		return productServiceImpl.findAllByPriceLow();
	}
	
	// 브랜드별 낮은 가격순으로 정렬(오름차순)
	public List<Product> findBrandPriceLow(String p_brand) throws Exception {
		return productServiceImpl.findAllByPriceLow();
	}
	
	// 전체상품 조회순 높은 순으로 정렬(인기순)
	public List<Product> findAllByClickCountHigh() throws Exception {
		return productServiceImpl.findAllByClickCountHigh();
	}
	// 브랜드별 조회순 높은 순으로 정렬(인기순)
	public List<Product> findBrandClickCountHigh() throws Exception {
		return productServiceImpl.findBrandClickCountHigh();
	}

	// 검색 기능 구현
	public List<Product> searchProductsByName(String keyword) throws Exception {
		return productServiceImpl.searchProductsByName(keyword);
	}

	// 전체 목록 뽑아오기
	public List<Product> productSelectAll() throws Exception {
		return productServiceImpl.productSelectAll();
	}

	// 상품 번호로 상품 뽑아오기
	public Product selectProductByNo(int p_no) throws Exception {
		return productServiceImpl.selectProductByNo(p_no);
	}

	// 브랜드로 상품 뽑아오기
	public List<Product> selectProductByBrand(String p_brand) throws Exception {
		return productServiceImpl.selectProductByBrand(p_brand);
	}

	
	//품절된 상품 가져오기
	public List<Product> soldOutProducts(int p_size) throws Exception {
		return productServiceImpl.soldOutProducts(p_size);
	}
    
	// 상품 번호로 상품 뽑아오기
		public List<Product> getTwoProductsPerBrand() throws Exception {
			return productServiceImpl.getTwoProductsPerBrand();
		} 


}