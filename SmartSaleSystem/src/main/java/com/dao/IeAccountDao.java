package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.IeAccount;
public interface   IeAccountDao {
    int deleteById(Integer id);
    int insert(IeAccount record);
    IeAccount selectById(Integer id);
    int updateById(IeAccount record);
	List<IeAccount> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<IeAccount>  searlist(@Param("Where")String  Where);
}
