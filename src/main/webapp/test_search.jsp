<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="product.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="product.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>
    
    <% 
        String keyword = request.getParameter("keyword"); // "keyword" 파라미터로부터 검색어 가져오기
        ProductService productService = new ProductService();
        List<Product> productList = productService.searchProductsByName(keyword);
        
        Set<String> uniqueProductNames = new HashSet<>();
        int productsPerRow = 4;
        int productCount = 0;

        for (Product product : productList) {
            String productName = product.getP_name();

            // 이미 해당 상품 이름이 있는 경우에는 출력하지 않음
            if (!uniqueProductNames.contains(productName)) {
                uniqueProductNames.add(productName);
                
                // 상품 이름 출력
                out.println("Product Name: " + productName + "<br>");
                
                productCount++;
                if (productCount % productsPerRow == 0) {
                    out.println("<br>"); // 한 행에 productsPerRow 개의 상품을 출력하고 줄바꿈
                }
            }
        }
        
        // 검색 결과가 없는 경우 처리
        if (productList.isEmpty()) {
            out.println("No products found for: " + keyword);
        }
    %>
</body>
</html>
