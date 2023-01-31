package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.Sale_tmp;
public interface   Sale_tmpDao {
    int deleteById(Integer id);
    int insert(Sale_tmp record);
    Sale_tmp selectById(Integer id);
    int updateById(Sale_tmp record);
	List<Sale_tmp> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<Sale_tmp>  searlist(@Param("Where")String  Where);
}
