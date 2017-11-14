package cn.uc.dao;

import cn.uc.model.Cities;
import cn.uc.util.Result;

public interface CitiesMapper {
    
	Result selectAllCities();
	
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cities
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int insert(Cities record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cities
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int insertSelective(Cities record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cities
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    Cities selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cities
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int updateByPrimaryKeySelective(Cities record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cities
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int updateByPrimaryKey(Cities record);
}