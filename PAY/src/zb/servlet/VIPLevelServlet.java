package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zb.po.VIPLevel;
import zb.service.VIPLevelService;

public class VIPLevelServlet extends HttpServlet {
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
		VIPLevelService service = new VIPLevelService();
		List<VIPLevel> vipLevels = service.getAllLevel();
		session.setAttribute("vipLevels", vipLevels);
		response.sendRedirect("YuebaoServlet");
		out.flush();
		out.close();
	}

}
