package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
  import com.dao.InStockDao;
  import com.entity.InStock;
@Service
public class   InStockService {
 	@Autowired
	private InStockDao inStockDao;

	public InStock get(int id) {
		return inStockDao.selectById(id);
	}

	public List<InStock> getList(int page, int size) {
		return inStockDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return inStockDao.getTotal();
	}

	public boolean add(InStock inStock) {
		return inStockDao.insert(inStock) > 0;
	}

	public boolean update(InStock inStock) {
		return inStockDao.updateById(inStock) > 0;
	}

	public boolean delete(int id) {
		return inStockDao.deleteById(id) > 0;
	}

	public List<InStock> searlist(String  where) {
		return inStockDao.searlist(where);
	}
}
