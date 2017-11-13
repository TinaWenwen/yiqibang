package cn.uc.dao;

import cn.uc.model.Areas;
import cn.uc.util.Result;

public interface AreasMapper {
   
	
	
	Result selectAllAreas();
	
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table areas
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int insert(Areas record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table areas
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int insertSelective(Areas record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table areas
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    Areas selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table areas
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int updateByPrimaryKeySelective(Areas record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table areas
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int updateByPrimaryKey(Areas record);
}