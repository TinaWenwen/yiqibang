package cn.uc.dao;

import cn.uc.model.Admin;
import cn.uc.util.Result;

public interface AdminDao {

	Result selectAllAdmin();
	
	Result insertAdmin(Admin admin);
}
