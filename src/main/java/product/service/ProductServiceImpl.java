package product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import product.domain.Product;
import product.mapper.ProductMapper;

public class ProductServiceImpl {
    private final SqlSessionFactory sqlSessionFactory;

    public ProductServiceImpl() throws Exception {
        this.sqlSessionFactory = new SqlSessionFactoryBuilder()
                .build(Resources.getResourceAsStream("mybatis-config.xml"));
    }


	// 전체상품 높은 가격순으로 정렬(내림차순)
	public List<Product> findAllByPriceHigh() throws Exception {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			return productMapper.findAllByPriceHigh();
		}

	}

	// 브랜드 별 높은 가격 순 정렬
	public List<Product> findBrandPriceHigh(String p_brand) throws Exception {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			return productMapper.findBrandPriceHigh(p_brand);
		}
	}

	// 전체상품 낮은 가격 순부터 정렬()
	public List<Product> findAllByPriceLow() throws Exception {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			return productMapper.findAllByPriceLow();
		}
	}

	// 브랜드별 낮은 가격 순으로 정렬(오름차순)
	public List<Product> findBrandPriceLow(String p_brand) throws Exception {
	    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
	        return productMapper.findBrandPriceLow(p_brand);
	    }
	}


	// 전체상품 조회순 높은 순으로 정렬(인기순)
	public List<Product> findAllByClickCountHigh() throws Exception {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			return productMapper.findAllByClickCountHigh();
		}
	}

	// 브랜드별 조회순 높은 순으로 정렬(인기순)
	public List<Product> findBrandClickCountHigh() throws Exception {
		try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			return productMapper.findBrandClickCountHigh();
		}
	}

	public List<Product> searchProductsByName(@Param("keyword") String keyword) {
		// 새로운 SqlSession을 열어서 데이터베이스 연결을 생성합니다.
		// true 매개변수를 통해 자동 커밋 설정을 하여 데이터베이스의 변경사항이 바로 반영되도록 합니다.
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		try {
			// Mapper 인터페이스를 가져와서 해당 메서드를 호출할 준비를 합니다.
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

			// 제품 이름으로 제품을 검색하는 메서드를 호출하고 검색 결과를 반환합니다.
			return productMapper.searchProductByName(keyword);
		} finally {
			// 메서드 내에서 열었던 SqlSession을 닫아 데이터베이스 연결 리소스를 정리합니다.
			sqlSession.close();
		}
	}

	public List<Product> productSelectAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		//sqlSession.close();
		return productMapper.productSelectAll();
	}

	public Product selectProductByNo(int p_no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		//sqlSession.close();
		return productMapper.selectProductByNo(p_no);
	}

	public List<Product> selectProductByBrand(String p_brand) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectProductByBrand(p_brand);
		sqlSession.close();
		return productList;
	}
	public List<Product> soldOutProducts(int p_size) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		//sqlSession.close();
		return productMapper.soldOutProducts(p_size);
	}


	public List<Product> getTwoProductsPerBrand() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		return productMapper.getTwoProductsPerBrand();
		}finally {
			sqlSession.close();
		}
	}
	
	
	
}
	

