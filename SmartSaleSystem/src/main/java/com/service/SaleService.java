package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
  import com.dao.SaleDao;
  import com.entity.Sale;
@Service
public class   SaleService {
 	@Autowired
	private SaleDao saleDao;

	public Sale get(int id) {
		return saleDao.selectById(id);
	}

	public List<Sale> getList(int page, int size) {
		return saleDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return saleDao.getTotal();
	}

	public boolean add(Sale sale) {
		return saleDao.insert(sale) > 0;
	}

	public boolean update(Sale sale) {
		return saleDao.updateById(sale) > 0;
	}

	public boolean delete(int id) {
		return saleDao.deleteById(id) > 0;
	}

	public List<Sale> searlist(String  where) {
		return saleDao.searlist(where);
	}
}
