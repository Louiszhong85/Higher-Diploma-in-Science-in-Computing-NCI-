package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.ProductType;
public interface   ProductTypeDao {
    int deleteById(Integer id);
    int insert(ProductType record);
    ProductType selectById(Integer id);
    int updateById(ProductType record);
	List<ProductType> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<ProductType>  searlist(@Param("Where")String  Where);
}
