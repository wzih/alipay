package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.application.Application;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import zb.po.Bill;
import zb.service.BillService;

public class BillServlet extends HttpServlet {
	BillService service = new BillService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String opr = request.getParameter("opr");
		int userid = Integer.valueOf(session.getAttribute("userid").toString());
		if (opr==null) {
			Map<String, Object> info = getInfo(request);
			info.put("userid", userid);
			List<Bill> bills = service.getAllInfo(info);
			
			session.setAttribute("bills", bills);
			response.sendRedirect("BankServlet");
		}else if ("search".equals(opr)) {
			Map<String, Object> info = getInfo(request);
			info.put("userid", userid);
			List<Bill> bills = service.getAllInfo(info);
			JsonObject jsonObject = new JsonObject();
			for (Bill bill2 : bills) {
				jsonObject.addProperty("id", bill2.getId());
				jsonObject.addProperty("typeName",bill2.getType().getName());
				jsonObject.addProperty("stateName",bill2.getState().getName());
				jsonObject.addProperty("money", bill2.getMoney());
				jsonObject.addProperty("description",bill2.getDescription());
				jsonObject.addProperty("createDate", bill2.getCreateDate().toString());
			}
			System.out.println("["+jsonObject+"]");
			out.print("["+jsonObject+"]");
			
		}else if ("del".equals(opr)) {
			Map<String, Object> info = getInfo(request);
			int count = service.delBill(info);
			if (count == 1) {
				out.print("true");
			}else {
				out.print("false");
			}
		}else if("add".equals(opr)){
			Map<String, Object> info = getInfo(request);
			info.put("userid", userid);
			int count = service.addBill(info);
			if (count == 1) {
				out.print("true");
			}else {
				out.print("false");
			}
		}
		out.flush();
		out.close();
	}
	public Map<String, Object> getInfo(HttpServletRequest request){
		
		int typeid = request.getParameter("typeid")==null?0:Integer.valueOf(request.getParameter("typeid").toString());
		int stateid = request.getParameter("stateid")==null?0:Integer.valueOf(request.getParameter("stateid").toString());
		int money = request.getParameter("money")==null?0:Integer.valueOf(request.getParameter("money"));
		
		String description = request.getParameter("description")==null?"":request.getParameter("description");
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		String tel = request.getParameter("tel")==null?"":request.getParameter("tel");
		int otheruserid = request.getParameter("friendsId")==null?0:Integer.valueOf(request.getParameter("friendsId"));
		
		String type = request.getParameter("type")==null?"":request.getParameter("type");
		if (type=="ת��") {
			typeid = 4;
		}
		
		
		Calendar now = Calendar.getInstance(); 
		Date date1 = now.getTime();
		now.add(Calendar.MONTH, -1);
		Date date2 = now.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String createDate1 = request.getParameter("date1")==null?sdf.format(date2):request.getParameter("date1");
		String createDate2 = sdf.format(date1);
		
		int billid = request.getParameter("billid")==null?0:Integer.valueOf(request.getParameter("billid").toString());
		
		
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("createDate1", createDate1);
		info.put("createDate2", createDate2);
		info.put("typeid", typeid);
		info.put("stateid", stateid);
		info.put("money", money);
		info.put("description", description);
		info.put("billid", billid);
		
		info.put("name", name);
		info.put("tel", tel);
		info.put("otheruserid", otheruserid);
		return info;
	}
	
	
	
}
