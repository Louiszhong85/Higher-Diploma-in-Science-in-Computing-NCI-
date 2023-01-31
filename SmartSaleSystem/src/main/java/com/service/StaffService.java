package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
  import com.dao.StaffDao;
  import com.entity.Staff;
@Service
public class   StaffService {
 	@Autowired
	private StaffDao staffDao;

	public Staff get(int id) {
		return staffDao.selectById(id);
	}

	public List<Staff> getList(int page, int size) {
		return staffDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return staffDao.getTotal();
	}

	public boolean add(Staff staff) {
		return staffDao.insert(staff) > 0;
	}

	public boolean update(Staff staff) {
		return staffDao.updateById(staff) > 0;
	}

	public boolean delete(int id) {
		return staffDao.deleteById(id) > 0;
	}

	public List<Staff> searlist(String  where) {
		return staffDao.searlist(where);
	}

	public Staff  pwd( String username,String pwd) {
		return staffDao.pwd(username,pwd);
	}

	public  Staff userlogin( String username,String pwd) {
		return staffDao.userlogin(username,pwd);
	}
}
