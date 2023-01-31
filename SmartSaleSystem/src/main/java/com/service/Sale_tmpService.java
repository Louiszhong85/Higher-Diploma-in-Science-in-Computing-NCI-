package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
  import com.dao.Sale_tmpDao;
  import com.entity.Sale_tmp;
@Service
public class   Sale_tmpService {
 	@Autowired
	private Sale_tmpDao sale_tmpDao;

	public Sale_tmp get(int id) {
		return sale_tmpDao.selectById(id);
	}

	public List<Sale_tmp> getList(int page, int size) {
		return sale_tmpDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return sale_tmpDao.getTotal();
	}

	public boolean add(Sale_tmp sale_tmp) {
		return sale_tmpDao.insert(sale_tmp) > 0;
	}

	public boolean update(Sale_tmp sale_tmp) {
		return sale_tmpDao.updateById(sale_tmp) > 0;
	}

	public boolean delete(int id) {
		return sale_tmpDao.deleteById(id) > 0;
	}

	public List<Sale_tmp> searlist(String  where) {
		return sale_tmpDao.searlist(where);
	}
}
