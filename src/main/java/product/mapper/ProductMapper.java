package product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import product.domain.Product;

public interface ProductMapper {

	/*
	 * productSelectAll : 상품전체검색
	 */
	List<Product> productSelectAll() throws Exception;
	/*
	 * <select id="productSelectAll" resultMap="productResultMap"> select * from
	 * product </select>
	 */

	// selectProductByNo: 상품 번호로 상품 검색
	Product selectProductByNo(int p_no);
	/*
	 * <select id="selectProductByNo" parameterType="int"
	 * resultType="product.domain.Product"> select * from product where p_no
	 * =#{p_no} </select>
	 */

	// selectProductByBrand: 상품 브랜드로 상품 검색
	List<Product> selectProductByBrand(String p_brand);
	/*
	 * <select id="selectProductByBrand" parameterType="java.lang.String"
	 * resultType="product.domain.Product"> select * from product where
	 * p_brand=#{p_brand} </select>
	 */

	// ProductBySelect: 일부 단어 입력으로 제품 검색
	List<Product> searchProductByName(@Param("keyword") String keyword);

	/*
	 * <select id="searchProductByName" resultType="product.domain.Product"> SELECT
	 * p_name From Product WHERE p_name LIKE '%' || #{keyword} || '%' </select>
	 */
	// 전체상품 높은 가격순으로 정렬
	List<Product> findAllByPriceHigh();

	// 브랜드 별 상품 가격 높은순으로 정렬
	List<Product> findBrandPriceHigh(@Param("p_brand") String p_brand);

	// 전체상품 낮은 가격순으로 정렬
	List<Product> findAllByPriceLow();

	// 브랜드 별 상품 가격 낮은순으로 정렬
	List<Product> findBrandPriceLow(@Param("p_brand") String p_brand);

	// 품절된 상품 확인하기
	List<Product> soldOutProducts(@Param("p_size") int p_size);

	// 전체상품 조회수 높은 순으로 출력(인기순)
	List<Product> findAllByClickCountHigh();

	// 브랜드별 조회수 높은 순으로 출력(인기순)
	List<Product> findBrandClickCountHigh();
	
	//메인 페이지에 상품 6개 띄우기 
	List<Product> getTwoProductsPerBrand();
}
