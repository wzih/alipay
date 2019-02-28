package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zb.po.Yuebao;
import zb.service.YuebaoService;

public class YuebaoServlet extends HttpServlet {
	YuebaoService service = new YuebaoService();
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
			Yuebao yuebao = service.getOneInfo(userid);
			session.setAttribute("yuebaoInfo", yuebao);
			response.sendRedirect("User.jsp");
		}else if ("add".equals(opr)) {
			int count = service.addInfo(userid);
			if (count==1) {
				out.print("true");
			}else{
				out.print("false");
			}
		}else if ("search".equals(opr)) {
			Yuebao yuebao = service.getOneInfo(userid);
			out.print(yuebao);
		}
		out.flush();
		out.close();
	}

}
