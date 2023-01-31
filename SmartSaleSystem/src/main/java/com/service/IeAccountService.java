package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Date;
import java.util.Objects;
  import com.dao.IeAccountDao;
  import com.entity.IeAccount;
@Service
public class   IeAccountService {
 	@Autowired
	private IeAccountDao ieAccountDao;

	public IeAccount get(int id) {
		return ieAccountDao.selectById(id);
	}

	public List<IeAccount> getList(int page, int size) {
		return ieAccountDao.getList(size*(page-1), size);
	}

	public int getTotal(){
 		return ieAccountDao.getTotal();
	}

	public boolean add(IeAccount ieAccount) {
		return ieAccountDao.insert(ieAccount) > 0;
	}

	public boolean update(IeAccount ieAccount) {
		return ieAccountDao.updateById(ieAccount) > 0;
	}

	public boolean delete(int id) {
		return ieAccountDao.deleteById(id) > 0;
	}

	public List<IeAccount> searlist(String  where) {
		return ieAccountDao.searlist(where);
	}
}
