package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
  import com.entity.Admin;
public interface   AdminDao {
    int deleteById(Integer id);
    int insert(Admin record);
    Admin selectById(Integer id);
    int updateById(Admin record);
	List<Admin> getList(@Param("begin")int begin, @Param("size")int size);
	int getTotal();
List<Admin>  searlist(@Param("Where")String  Where);

Admin pwd(@Param("username")String username, @Param("pwd")String pwd);
Admin	userlogin (@Param("username")String username, @Param("pwd")String pwd);
}
