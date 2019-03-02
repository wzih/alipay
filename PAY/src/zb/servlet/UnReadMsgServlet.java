package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import zb.po.UnReadMsg;
import zb.po.User;
import zb.service.UnReadMsgService;

public class UnReadMsgServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession();
		UnReadMsgService msgService =new UnReadMsgService();
		String opr =request.getParameter("opr");
		if("getAllmsg".equals(opr)){//获取所有的未读信息
//			User user = (User) session.getAttribute("user");
//			int userid = user.getId().intValue();
			
			
			List<UnReadMsg> msgs= msgService.getAllmsg(1007);
			out.print(new Gson ().toJson(msgs));			
		}else if(opr==null){
			
		}else if("delmsg".equals(opr)){
			int id =Integer.parseInt(request.getParameter("msgid"));
			 int count = msgService.delmsg(id);
			 if(count ==1){
				 System.out.println("删除未读信息成功！");
			 }else{
				 System.out.println("删除未读信息失败！");
			 }
		}
		out.flush();
		out.close();
	}

}
