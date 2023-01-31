package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.Sale;
public interface   SaleDao {
    int deleteById(Integer id);
    int insert(Sale record);
    Sale selectById(Integer id);
    int updateById(Sale record);
	List<Sale> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<Sale>  searlist(@Param("Where")String  Where);
}
