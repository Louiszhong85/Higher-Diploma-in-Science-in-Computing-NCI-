package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.InStock;
public interface   InStockDao {
    int deleteById(Integer id);
    int insert(InStock record);
    InStock selectById(Integer id);
    int updateById(InStock record);
	List<InStock> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<InStock>  searlist(@Param("Where")String  Where);
}
