package zb.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import zb.po.Friends;
import zb.po.User;
import zb.service.FriendsService;
import zb.service.UserService;
import zb.tool.HttpClientUtil;

public class UserServlet
  extends HttpServlet
{
  public int numberx = 0;
  public int numbery = 0;
  UserService userService = new UserService();
  FriendsService friendsService = new FriendsService();
  
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    doPost(request, response);
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    String opr = request.getParameter("opr");
    
    HttpSession session = request.getSession();
    if ("add".equals(opr))
    {
      Map<String, Object> info = getInfo(request);
      int addCount = this.userService.addUser(info);
      User user = userService.getOneInfo(info.get("tel").toString());
      int id = user.getId();
      session.setAttribute("newId", id);
      if (addCount == 1) {
        out.print(new Gson().toJson(id));
      } else {
        out.print(new Gson().toJson("false"));
      }
    }else if ("Phoneadd".equals(opr))//�ֻ������û�
    {	
    	//����֤�ֻ���֤��
    	int userma =Integer.parseInt(request.getParameter("uma"));//�û��������֤��
    	if(userma==numberx){
    		Map<String, Object> info = getInfo(request);
            int addCount = this.userService.addUser(info);
            User user = userService.getOneInfo(info.get("tel").toString());
            int id = user.getId();
            session.setAttribute("newId", id);
            if (addCount == 1) {
              out.print(true);
            } else {
              out.print("����ʧ�ܣ�");
            }
    	}else{
    		out.print("��֤�����");
    	}
    	
      }
    else if ("update".equals(opr))//����
    {
      Map<String, Object> info = getInfo(request);
      int userid =Integer.valueOf(session.getAttribute("userid").toString()).intValue();
      info.put("userid", Integer.valueOf(userid));
      int updateCount = this.userService.updateUser(info);
      if (updateCount == 1) {
        out.print("true");
      } else {
        out.print("false");
      }
    }
    else if ("login".equals(opr))//��¼
    {
    	
      Map<String, Object> info = getInfo(request);
      String tel = request.getParameter("tel");
      String loginPWD = request.getParameter("loginPWD");
      try
      {
        User user = this.userService.login(tel, loginPWD);
        List<Friends> friends = this.friendsService.getAllFriens(user.getId().intValue());
        session.setAttribute("friends", friends);
        session.setAttribute("user", user);
        session.setAttribute("image", user.getImage());
        session.setAttribute("tel", user.getTel());
        session.setAttribute("username", user.getUsername());
        int userid = user.getId().intValue();
        session.setAttribute("userid", Integer.valueOf(userid));
        info.put("userid", userid);
        int count = userService.updateLastDate(info);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        session.setAttribute("lastLoginDate",sf.format(info.get("lastLoginDate")));
       
        out.print("true");
      }
      catch (Exception e)
      {
        out.print(e.getMessage());
      }
    }
    else if ("logout".equals(opr))
    {
      session.removeAttribute("user");
      session.invalidate();
      response.sendRedirect("index.jsp");
    }
    else if ("Phonelogout".equals(opr))
    {
      session.removeAttribute("user");
      session.invalidate();
      response.sendRedirect("index.jsp");
    }
    else if ("checkTel".equals(opr))
    {
      Map<String, Object> info = getInfo(request);
      User user = this.userService.getInfo(info);
      if (user != null) {
        out.print(new Gson().toJson(user));
      } else {
        out.print(new Gson().toJson("false"));
      }
    }
    else if ("checkidCard".equals(opr))
    {
        Map<String, Object> info = getInfo(request);
        User user = this.userService.getInfo(info);
        if (user != null) {
          out.print(new Gson().toJson(user));
        } else {
          out.print(new Gson().toJson("false"));
        }
     }
    else if ("checkLoginPwd".equals(opr)) {
		String loginPwd = request.getParameter("loginpwd");
		User user = (User) session.getAttribute("user");
		
		if (user.getLoginPWD().toString().equals(loginPwd)) {
			out.print("true");
		}else {
			out.print("false");
		}
	}
    else if ("searchBalance".equals(opr))
    {
      Map<String, Object> info = getInfo(request);
      User user = this.userService.getOneInfo(session.getAttribute("tel").toString());
      System.out.println(user.getAccount().toString());
      out.print(user.getAccount().toString());
    }else if ("huafei".equals(opr)) {
    	Map<String, Object> info = getInfo(request);
    	User user = userService.getOneInfo(info.get("tel").toString());
    	int id =user.getId();
    	info.put("userid", id);
    	info.put("tel", "");
    	int count = userService.updateUser(info);
    	if (count==1) {
    		out.print("true");
		}else {
			out.print("false");
		}
    	
    	
	}
    else if ("sm".equals(opr))
    {
      String uip = request.getParameter("uip");
      String ucity = request.getParameter("ucity");
      if (getServletContext().getAttribute("sm") != null)
      {
        String sm = (String)getServletContext().getAttribute("sm");
        if (sm == "sok") {
          out.print("smok" + uip);
        }
      }
    }
    else if ("IamshaomaPage".equals(opr))
    {
      getServletContext().setAttribute("sm", "sok");
    }
    else if ("ClearIamshaomaPage".equals(opr))
    {
      getServletContext().removeAttribute("sm");
    }
    else if ("loginOK".equals(opr))//loginOK�ֻ�ɨ���¼
    {
    
     String username = request.getParameter("username");
     System.out.println("-------------�ֻ���ɨ���¼ �û����ǣ�"+username);
     String u=null;
     try {
    	  u =(String)this.getServletContext().getAttribute("PhoneisLoginYES");
	} catch (Exception e) {}
		     if(u!=null){//�������ֻ��˵�¼��
		    	 if (username.equals(u)) {//�ж��ǲ����û������username
		    		 System.out.println("�ֻ���ɨ���¼�ɹ�������true");
		    		 out.print(true); //�ֻ��˵�¼
		      		 response.sendRedirect("User.jsp");
		      		
		      	}else {
		      		System.out.println("PhoneisLoginYES=!!!!===username");
		      		out.print(false);//�ֻ���û�е�¼
		      	}
		     }else{
		    	 System.out.println("PhoneisLoginYES=====null");
		    	 out.print(false);//�ֻ���û�е�¼
		     }
     	
    }
    else if ("Phonelogin".equals(opr))//�ֻ�app��¼
    {	
    	
      Map<String, Object> info = getInfo(request);
      String tel = request.getParameter("tel");
      String username = request.getParameter("username");
      String loginPWD = request.getParameter("password");
      System.out.println("�յ����ֻ��ĵ�¼�����û�����" + username);
      try
      {
        User user = this.userService.login(username, loginPWD);
        List<Friends> friends = this.friendsService.getAllFriens(user.getId().intValue());
        this.getServletContext().setAttribute("friends", friends);
        session.setAttribute("friends", friends);
        this.getServletContext().setAttribute("user", user);
        session.setAttribute("user", user);
        int userid = user.getId().intValue();
        this.getServletContext().setAttribute("userid",  Integer.valueOf(userid));
        this.getServletContext().setAttribute("image",  user.getImage());
        this.getServletContext().setAttribute("tel", user.getTel());
        this.getServletContext().setAttribute("username",  user.getUsername());
        session.setAttribute("userid", Integer.valueOf(userid));
        session.setAttribute("image", user.getImage());
        session.setAttribute("tel", user.getTel());
        session.setAttribute("username", user.getUsername());
        info.put("userid", userid);
        int count = userService.updateLastDate(info);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.getServletContext().setAttribute("lastLoginDate",sf.format(info.get("lastLoginDate")));
        this.getServletContext().setAttribute("PhoneisLoginYES",username);
        session.setAttribute("lastLoginDate",sf.format(info.get("lastLoginDate")));
        session.setAttribute("PhoneisLoginYES", username);
        System.out.println("��application����˼���PhoneisLoginYES��ֵ��"+username);
        out.print(new Gson().toJson(user));
        ////
        
       
      }
      catch (Exception e)
      {
        out.print(e.getMessage());
      }
    }
    else if ("PhonechangePWD".equals(opr))
    {
      String UserPhone = request.getParameter("tel");
      
      String Uid = "jianjun18666";
      
      String Key = "d41d8cd98f00b204e980";
      
      String smsMob = UserPhone;
      
      this.numberx = ((int)(1.0D + Math.random() * 1000000.0D));
      
      String smsText = "alipay-������֤��Ϊ��" + this.numberx + "����Чʱ��10���ӡ����Ǳ��˲���������Ա������š�";
      HttpClientUtil client = HttpClientUtil.getInstance();
      
      client.sendMsgUtf8(Uid, Key, smsText, smsMob);
      out.print(true);
    }
    else if ("yanzhengma".equals(opr))
    {
      int ma = Integer.parseInt(request.getParameter("ma"));
      
      System.out.println("�û��������֤����" + ma);
      System.out.println("ϵͳ���͵���֤����" + this.numberx);
      if (this.numberx == ma) {
        out.print(true);
      } else {
        out.print(false);
      }
    }
    else if ("updatePwd".equals(opr))//�ֻ���������updatePwd
    {
      String pwd = request.getParameter("pwd");
      //���ݿ����
      out.print(true);
    }
    else if ("Phonezhuce".equals(opr))//�ֻ�ע��Phonezhuce������֤��
    {
      String tel = request.getParameter("tel");
      String Uid = "jianjun18666";
      
      String Key = "d41d8cd98f00b204e980";
      
      String smsMob = tel;
      
      this.numberx = ((int)(1.0D + Math.random() * 1000000.0D));
      
      String smsText = "alipay-����ע����֤��Ϊ��" + this.numberx + "����Чʱ��10���ӡ����Ǳ��˲���������Ա������š�";
      HttpClientUtil client = HttpClientUtil.getInstance();
      
      client.sendMsgUtf8(Uid, Key, smsText, smsMob);
      out.print(true);
    }
    else if ("zhuceok".equals(opr))//�ֻ�ע��ҳ��
    { 
      String paypwd = request.getParameter("paypwd");
      out.print(true);
    }else if ("changeheadimg".equals(opr)){//���뷵��json��ʽ�����ݣ��޸�ͷ��
	   	String username= "";//�û���
	   	String fileName ="";//�ļ���
	   	String savePath = "";//����·��
	     if(ServletFileUpload.isMultipartContent(request)){//�ж������Ƿ��Ǵ����ļ��ϴ�����������
	    	//�����ϴ��Ľ�������
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			try {
				//�������� ��ȡ�����еı�Ԫ�ؼ���
			List<FileItem> Items = upload.parseRequest(request);
			for (FileItem item : Items) {
				if(item.isFormField()){  //˵������ͨ�ı�Ԫ�أ���
					username=item.getString();
					
				}else{//�ϴ��������ļ����ݣ��ȣ�
					
					//ָ�������ļ���Ŀ¼
				    savePath = session.getServletContext().getRealPath("UserImgs");
					File tempFile = new File(savePath);
					if(!tempFile.exists()){  //�ж����Ŀ¼�Ƿ����
						tempFile.mkdirs();
						System.out.println("��������Ŀ¼:"+tempFile.getName());
					}
					//��֤�ļ���Ψһ
					fileName = UUID.randomUUID().toString()+".jpg";
					File file = new File(tempFile, fileName);
					
					item.write(file);  //���ļ��ϴ�����������
				}
			}
			System.out.println("�û������ǣ�"+username);
			System.out.println("�ļ����ǣ�"+fileName);
			System.out.println("����·���ǣ�"+savePath);
			
			
			Map<String, Object> info = getInfo(request);
			info.put("image", fileName);
			session.setAttribute("image", fileName);
			int userid =Integer.valueOf(session.getAttribute("userid").toString()).intValue();
			info.put("userid", userid);
			int count = userService.updateUser(info);
			
			
			//��������ݿ� Ҫ��ͼƬ�ı���·�����
		} catch (Exception e) {}
     }
	  
     JsonObject jsonObject =new JsonObject();
     jsonObject.addProperty("fileName", fileName);
     out.print(new Gson().toJson(jsonObject));
 }
    
    
    
    ///////////////////////////////////////////////������if-else �ṹ
    out.flush();
    out.close();
  }
  
  public Map<String, Object> getInfo(HttpServletRequest request)
  {
    String username = request.getParameter("username") == null ? "" : request.getParameter("username");
    
    String loginPWD = request.getParameter("loginPWD") == null ? "" : request.getParameter("loginPWD");
    
    String payPWD = request.getParameter("payPWD") == null ? "" : request.getParameter("payPWD");
    
    String image = request.getParameter("image") == null ? "" : request.getParameter("image");
    
    int age = request.getParameter("age") == null ? 20 : Integer.valueOf(request.getParameter("age")).intValue();
    
    String name = request.getParameter("name") == null ? "" : request.getParameter("name");
    
    String idCard = request.getParameter("idCard") == null ? "" : request.getParameter("idCard");

    String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
    
    int money = request.getParameter("money") == null ? 0 : Integer.valueOf(request.getParameter("money")).intValue();
    
    int friendsid = request.getParameter("friendsId") == null ? 0 : Integer.valueOf(request.getParameter("friendsId")).intValue();
    
    Date lastLoginDate = new Date(); 
    
    String inorout = request.getParameter("inorout") == null ? "" : request.getParameter("inorout");
    Map<String, Object> info = new HashMap<String, Object>();
    info.put("username", username);
    info.put("loginPWD", loginPWD);
    info.put("payPWD", payPWD);
    info.put("image", image);
    info.put("age", Integer.valueOf(age));
    info.put("tel", tel);
    info.put("friendsid", friendsid);
    info.put("idCard", idCard);
    info.put("name", name);
    info.put("inorout", inorout);
    info.put("lastLoginDate", lastLoginDate);
    info.put("money", Integer.valueOf(money));
    return info;
  }
}
