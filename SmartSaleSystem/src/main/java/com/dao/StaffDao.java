package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.Staff;
public interface   StaffDao {
    int deleteById(Integer id);
    int insert(Staff record);
    Staff selectById(Integer id);
    int updateById(Staff record);
	List<Staff> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<Staff>  searlist(@Param("Where")String  Where);

Staff pwd(@Param("username")String username, @Param("pwd")String pwd);
Staff	userlogin (@Param("username")String username, @Param("pwd")String pwd);
}
