package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadPoolExecutor.DiscardOldestPolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import zb.po.Huabai;
import zb.service.HuabaiService;

public class HuabaiServlet extends HttpServlet {
	HuabaiService service = new HuabaiService();
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
		int userid = Integer.valueOf(session.getAttribute("userid").toString());
		String opr = request.getParameter("opr");
		if (opr==null) {
			response.sendRedirect("card.jsp");
			
		}else if ("update".equals(opr)) {
			int availableamount = Integer.valueOf(request.getParameter("availableamount"));
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("userid", userid);
			info.put("availableamount", availableamount);
			int count = service.updateInfo(info);
			if (count==1) {
				out.print("true");
			} else {
				out.print("false");
			}
		}else if ("add".equals(opr)) {
			int count = service.addInfo(userid);
			if (count==1) {
				out.print("true");
			} else {
				out.print("false");
			}
		}else if ("search".equals(opr)) {
			Huabai huabai = service.getOneInfo(userid);
			out.print(new Gson().toJson(huabai));
		}
		out.flush();
		out.close();
	}

}
