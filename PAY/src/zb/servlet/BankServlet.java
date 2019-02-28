package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zb.po.Bank;
import zb.service.BankService;

public class BankServlet extends HttpServlet {
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
		BankService service = new BankService();
		String opr = request.getParameter("opr");
		int userid = Integer.valueOf(session.getAttribute("userid").toString());
		if (opr==null) {
			List<Bank> banks = service.getAllBank();
			session.setAttribute("banks", banks);
			response.sendRedirect("CardServlet");
		}
		
		out.flush();
		out.close();
	}

}
