package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
  import com.dao.ProductDao;
  import com.entity.Product;
@Service
public class   ProductService {
 	@Autowired
	private ProductDao productDao;

	public Product get(int id) {
		return productDao.selectById(id);
	}

	public List<Product> getList(int page, int size) {
		return productDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return productDao.getTotal();
	}

	public boolean add(Product product) {
		return productDao.insert(product) > 0;
	}

	public boolean update(Product product) {
		return productDao.updateById(product) > 0;
	}

	public boolean delete(int id) {
		return productDao.deleteById(id) > 0;
	}

	public List<Product> searlist(String  where) {
		return productDao.searlist(where);
	}
	public boolean addkucun(String itemID, int qty) {
		return productDao.addkucun(itemID,qty) > 0;
	}
}
