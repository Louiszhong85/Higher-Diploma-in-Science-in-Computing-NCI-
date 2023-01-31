package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.dao.AdminDao;
  import com.entity.Admin;
@Service
public class   AdminService {
 	@Autowired
	private AdminDao adminDao;

	public Admin get(int id) {
		return adminDao.selectById(id);
	}

	public List<Admin> getList(int page, int size) {
		return adminDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return adminDao.getTotal();
	}

	public boolean add(Admin admin) {
		return adminDao.insert(admin) > 0;
	}

	public boolean update(Admin admin) {
		return adminDao.updateById(admin) > 0;
	}

	public boolean delete(int id) {
		return adminDao.deleteById(id) > 0;
	}

	public List<Admin> searlist(String  where) {
		return adminDao.searlist(where);
	}

	public Admin  pwd( String username,String pwd) {
		return adminDao.pwd(username,pwd);
	}

	public  Admin userlogin( String username,String pwd) {
		return adminDao.userlogin(username,pwd);
	}
}
