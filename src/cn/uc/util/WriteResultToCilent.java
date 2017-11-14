package cn.uc.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class WriteResultToCilent {
	
	public static void writeMethod(Object obj,HttpServletResponse response){
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String jsonObj = JSONObject.fromObject(obj).toString();
		out.println(jsonObj);
		out.flush();
		out.close();
	}
}
