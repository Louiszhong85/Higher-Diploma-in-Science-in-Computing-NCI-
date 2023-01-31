package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
import com.dao.ProductTypeDao;
import com.entity.ProductType;
@Service
public class   ProductTypeService {
 	@Autowired
	private ProductTypeDao productTypeDao;
 	

	public ProductType get(int id) {
		return productTypeDao.selectById(id);
	}

	public List<ProductType> getList(int page, int size) {
		return productTypeDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return productTypeDao.getTotal();
	}

	public boolean add(ProductType productType) {
		return productTypeDao.insert(productType) > 0;
	}

	public boolean update(ProductType productType) {
		return productTypeDao.updateById(productType) > 0;
	}

	public boolean delete(int id) {
		return productTypeDao.deleteById(id) > 0;
	}

	public List<ProductType> searlist(String  where) {
		return productTypeDao.searlist(where);
	}
}
