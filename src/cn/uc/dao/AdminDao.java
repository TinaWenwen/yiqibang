package cn.uc.dao;

import cn.uc.model.TAdmin;
import cn.uc.util.Result;

public interface AdminDao {

	Result selectAllAdmin();
	
	Result insertAdmin(TAdmin admin);
}
