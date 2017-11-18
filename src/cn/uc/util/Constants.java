package cn.uc.util;
/**
 * 
 * @author Tina
 *字符串的参数拼接工具类
 */
public class Constants {
	
	//响应码
	public static final int RETCODE_SUCCESS = 0;
	public static final int RETCODE_FAILED = 2000;
	//每页显示的10个
	public static final int PAGE_SIZE = 5;
	
	//映射文件.xml的包根路径
	public static final String ROOT = "cn.uc.mapper";
	
	//mapper映射文件的名称
	public static final String ADMIN_MAPPER = ".TAdminMapper";
	public static final String AREAS_MAPPER = ".AreasMapper";
	public static final String CITIES_MAPPER = ".CitiesMapper";
	public static final String COMMENT_MAPPER = ".TCommentMapper";
	public static final String MEMBER_MAPPER = ".TUserMapper";
	public static final String NEWS_MAPPER = ".TNewsMapper";
	public static final String NEWSTYPE_MAPPER = ".TTypeMapper";
	public static final String PIC_MAPPER = ".TPicMapper";
	public static final String PROVINCES_MAPPER = ".ProvincesMapper";
	
	//定义操作的sql语句的id名称
	public static final String SELECTALL = ".selectAll";
	public static final String SELECT_BY_LIKE = ".selectByLike";
	public static final String DELETE = ".deleteByPrimaryKey";
	public static final String UPDATE = ".updateByPrimaryKeySelective";
	public static final String INSERT = ".insertSelective";
	public static final String SELECT_COUNTS = ".selectAllCounts";
	public static final String SELECT_NAMEBYID = ".selectNameById";
	public static final String SELECT_BYID = ".selectByPrimaryKey";
	
	//---------------------------------------------------------------------------------------
	
	 //Admin管理员的操作语句路径
	 public static final String ADMINMAPPER_SELECT_BYID = ROOT + ADMIN_MAPPER + SELECT_BYID;
	 public static final String ADMINMAPPER_SELECTBYLIKE = ROOT + ADMIN_MAPPER + SELECT_BY_LIKE;
	 public static final String ADMINMAPPER_INSERT = ROOT + ADMIN_MAPPER + INSERT;
	 public static final String ADMINMAPPER_SELECT_COUNT = ROOT + ADMIN_MAPPER + SELECT_COUNTS;
	 public static final String ADMINMAPPER_DELETE = ROOT + ADMIN_MAPPER + DELETE;
	 //user的操作语句路径
	 public static final String USERMAPPER_SELECTBYLIKE = ROOT + MEMBER_MAPPER + SELECT_BY_LIKE;
	 public static final String USERMAPPER_SELECT_COUNT = ROOT + MEMBER_MAPPER + SELECT_COUNTS;
	 public static final String USERMAPPER_SELECT_BYID = ROOT + MEMBER_MAPPER + SELECT_BYID;
	 public static final String USERMAPPER_SELECTNAME_BYID = ROOT + MEMBER_MAPPER +".selectUserNameById";
	 public static final String USERMAPPER_INSERT = ROOT + MEMBER_MAPPER + INSERT;
	 public static final String USERMAPPER_SELECTID_BYNAME = ROOT + MEMBER_MAPPER +".selectIdByName";
	 public static final String USERMAPPER_DELETE = ROOT + MEMBER_MAPPER + DELETE;
	 public static final String USERMAPPER_UPDATE = ROOT + MEMBER_MAPPER + UPDATE;
	 //news的操作语句路径
	 public static final String NEWSMAPPER_SELECTALL = ROOT + NEWS_MAPPER + SELECTALL;
	 public static final String NEWSMAPPER_SELECTBYLIKE = ROOT + NEWS_MAPPER + SELECT_BY_LIKE;
	 public static final String NEWSMAPPER_SELECT_COUNT = ROOT + NEWS_MAPPER + SELECT_COUNTS;
	 public static final String NEWSMAPPER_INSERT = ROOT + NEWS_MAPPER + INSERT;
	 public static final String NEWSMAPPER_DELETE = ROOT + NEWS_MAPPER + DELETE;
	 //comment的操作语句路径
	 public static final String COMMMAPPER_SELECTBYLIKE = ROOT + COMMENT_MAPPER + SELECT_BY_LIKE;
	 public static final String COMMMAPPER_SELECT_COUNT = ROOT + COMMENT_MAPPER + SELECT_COUNTS;
	 public static final String COMMMAPPER_DELETE = ROOT + COMMENT_MAPPER + DELETE;
	 public static final String COMMMAPPER_SELECTBYID = ROOT + COMMENT_MAPPER + SELECT_BYID;
	 public static final String COMMMAPPER_UPDATE = ROOT + COMMENT_MAPPER + UPDATE;
	 //newtype的操作语句路径
	 public static final String TYPEMAPPER_SELECTALL = ROOT + NEWSTYPE_MAPPER + SELECTALL;
	 public static final String TYPEMAPPER_SELECTBYLIKE = ROOT + NEWSTYPE_MAPPER + SELECT_BY_LIKE;
	 public static final String TYPEMAPPER_SELECT_COUNT =  ROOT + NEWSTYPE_MAPPER + SELECT_COUNTS;
	 public static final String TYPEMAPPER_INSERT = ROOT + NEWSTYPE_MAPPER + INSERT;
	 public static final String TYPEMAPPER_DELETE = ROOT + NEWSTYPE_MAPPER + DELETE;
	 //pic的操作路径
	 public static final String PICMAPPER_SELECTALL = ROOT + PIC_MAPPER + SELECTALL;
	 
	 //areas的操作路径
	 public static final String AREA_GETBY_AREAID = ROOT + AREAS_MAPPER + SELECT_NAMEBYID;
	 public static final String AREA_SELECTALL = ROOT + AREAS_MAPPER + SELECTALL;
	 //cities的操作路径
	 public static final String CITY_GETBY_CITYID = ROOT + CITIES_MAPPER + SELECT_NAMEBYID;
	 public static final String CITY_SELECTALL = ROOT + CITIES_MAPPER + SELECTALL;
	 //Provinces的操作路径
	 public static final String PROVINCE_GETBY_PROVINCEID = ROOT + PROVINCES_MAPPER + SELECT_NAMEBYID;
	 public static final String PROVINCE_SELECTALL = ROOT + PROVINCES_MAPPER + SELECTALL;
}
















