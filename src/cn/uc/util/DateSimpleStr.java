package cn.uc.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateSimpleStr {

	public static String getStringDate(Date dateTime){
		String result = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(dateTime != null){
			result = sdf.format(dateTime);
		}
		return result;
	}
}
