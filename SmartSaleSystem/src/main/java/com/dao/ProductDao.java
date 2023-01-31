package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.Product;
public interface   ProductDao {
    int deleteById(Integer id);
    int insert(Product record);
    Product selectById(Integer id);
    int updateById(Product record);
	List<Product> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<Product>  searlist(@Param("Where")String  Where);
int addkucun(@Param("itemID")String itemID, @Param("qty")int qty);
}
