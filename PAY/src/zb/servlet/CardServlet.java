package zb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zb.po.Card;
import zb.po.User;
import zb.service.CardService;

public class CardServlet extends HttpServlet {
	CardService service = new CardService();
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
		int userid = 0;
		if ("Phone".equals(this.getServletContext().getAttribute("loginType"))) {
			userid = Integer.valueOf(this.getServletContext().getAttribute("userid").toString());
			
		} else {

			userid = Integer.valueOf(session.getAttribute("userid").toString());
		}
		String opr= request.getParameter("opr");
		String id=null;
		if (opr==null) {
			Map<String, Object>info=getInfo(request);
			int count = service.getCount(userid);
			info.put("userid", userid);
			List<Card> cards=service.getAllCardById(userid);
			List<Card> newcards = new ArrayList<Card>();
			for (Card card : cards) {
				String cid = card.getBankcardid().substring(16, 20);
				newcards.add(new Card(card.getId(), card.getUser(), cid, card.getBank()));
			}
			session.setAttribute("cards", newcards);
			session.setAttribute("cardsCount", count);
			response.sendRedirect("HuabaiServlet");
		}else if ("add".equals(opr)) {
			Map<String, Object> info =getInfo(request);
			info.put("userid", userid);
			int addCount = service.addCard(info);
			if (addCount==1) {
				out.print("true");
			}else {
				out.print("false");
			}
		}else if ("del".equals(opr)){
			Map<String, Object>info = getInfo(request);
			int delCount = service.delCard(info);
			if (delCount==1) {
				List<Card> cards=service.getAllCardById(userid);
				List<Card> newcards = new ArrayList<Card>();
				for (Card card : cards) {
					String cid = card.getBankcardid().substring(16, 20);
					newcards.add(new Card(card.getId(), card.getUser(), cid, card.getBank()));
				}
				session.setAttribute("cards", newcards);
				out.print("true");
			}else {
				out.print("false");
			}
		}
		
		
		out.flush();
		out.close();
	}
	public Map<String, Object> getInfo(HttpServletRequest request){
		String cardNum = request.getParameter("cardNum")==null?"":request.getParameter("cardNum");
		int bankid = request.getParameter("bankid")==null?0:Integer.valueOf(request.getParameter("bankid"));
		int id = request.getParameter("id")==null?0:Integer.valueOf(request.getParameter("id"));
		Map<String, Object>info = new HashMap<String, Object>();
		info.put("cardNum", cardNum);
		info.put("bankid", bankid);
		info.put("id", id);
		return info;
	}
}
