package cn.uc.util;
/**
 * 
 * @author Tina
 *统一返回值对象工具类
 */
public class Result {

	//统一响应给客户端的响应对象
	//响应码
	private int retCode;
	//响应结果-true/false
	private boolean retMsg;
	//响应数据
	private Object retData;
	
	
	public int getRetCode() {
		return retCode;
	}
	public void setRetCode(int retCode) {
		this.retCode = retCode;
	}
	public boolean isRetMsg() {
		return retMsg;
	}
	public void setRetMsg(boolean retMsg) {
		this.retMsg = retMsg;
	}
	public Object getRetData() {
		return retData;
	}
	public void setRetData(Object retData) {
		this.retData = retData;
	}
	
	
}
