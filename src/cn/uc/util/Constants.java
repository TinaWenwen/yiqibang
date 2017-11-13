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
	public static final String SELECT_BYID = ".selectById";
	public static final String DELETE = ".delete";
	public static final String UPDATE = ".update";
	public static final String INSERT = ".insert";
	
	//---------------------------------------------------------------------------------------
	
	 //Admin管理员的操作语句路径
	 public static final String ADMINMAPPER_SELECTALL = ROOT + ADMIN_MAPPER + SELECTALL;
	 public static final String ADMINMAPPER_INSERT = ROOT + ADMIN_MAPPER + INSERT;
	 
	 //user的操作语句路径
	 public static final String USERMAPPER_SELECTALL = ROOT + MEMBER_MAPPER + SELECTALL;
	 
	 //news的操作语句路径
	 public static final String NEWSMAPPER_SELECTALL = ROOT + NEWS_MAPPER + SELECTALL;
	 
	 //comment的操作语句路径
	 public static final String COMMMAPPER_SELECTALL = ROOT + COMMENT_MAPPER + SELECTALL;
	 
	 //newtype的操作语句路径
	 public static final String TYPEMAPPER_SELECTALL = ROOT + NEWSTYPE_MAPPER + SELECTALL;
	 
	 //pic的操作路径
	 public static final String PICMAPPER_SELECTALL = ROOT + PIC_MAPPER + SELECTALL;
	 
	 //areas的操作路径
	 public static final String AREASMAPPER_SELECTALL = ROOT + AREAS_MAPPER + SELECTALL;
	 
	 //cities的操作路径
	 public static final String CITIESMAPPER_SELECTALL = ROOT + CITIES_MAPPER + SELECTALL;
	 
	 //Provinces的操作路径
	 public static final String PROVINCESMAPPER_SELECTALL = ROOT + PROVINCES_MAPPER + SELECTALL;
}


















