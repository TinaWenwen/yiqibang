package cn.uc.dao;

import cn.uc.model.TType;

public interface TTypeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_type
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_type
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int insert(TType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_type
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int insertSelective(TType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_type
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    TType selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_type
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int updateByPrimaryKeySelective(TType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_type
     *
     * @mbggenerated Sun Nov 12 17:27:42 CST 2017
     */
    int updateByPrimaryKey(TType record);
}