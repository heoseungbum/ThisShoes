package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.datasource.DataSourceFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public interface OrderDao {

	int deleteU_id(String u_id) throws Exception;

	int delete(Order order) throws Exception;

	int insertOrder(Order order) throws Exception;

	int insertOrderItem(OrderItem orderItem) throws Exception;

	List<Order> selectByUserId(String u_id) throws Exception;

	List<Order> selectOrderWithOrderItemsByOrderNo(int o_no) throws Exception;

	List<Order> selectOrderWithOrderItemsByUserId(String u_id) throws Exception;

}