package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zb.po.VIP;
import zb.service.VIPService;

public class VIPServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		VIPService service = new VIPService();
		HttpSession session = request.getSession();
		int userid = 0;
		if ("Phone".equals(this.getServletContext().getAttribute("loginType"))) {
			userid = Integer.valueOf(this.getServletContext().getAttribute("userid").toString());
			
		} else {

			userid = Integer.valueOf(session.getAttribute("userid").toString());
		}
		String opr = request.getParameter("opr");
		if (opr==null) {
			
			VIP vip = service.getOneInfo(userid);
			session.setAttribute("VIP", vip);
			response.sendRedirect("TaobaoServlet");
		}else if ("add".equals(opr)) {
			int newuserid = Integer.valueOf(session.getAttribute("newId").toString());
			int count = service.add(newuserid);
			
		} 
			
		
		out.flush();
		out.close();
	}

}
