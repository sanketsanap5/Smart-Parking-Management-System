

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Email;
	private String Password;
	All_Retriving_Methods m=new All_Retriving_Methods();
	private String message;
	private String message_color;
	private Object subscriber_id;
  

    
    public void Accept_Data(HttpServletRequest request) {
		Email=(String) request.getParameter("Email");
		Password=(String) request.getParameter("Password");
		
		/*Adding into session*/
		HttpSession session=request.getSession();
		session.setAttribute("Email", Email);
		session.setAttribute("Password", Password);
	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	this.Accept_Data(request);
	if(m.Validate_Login(request))
		{
		response.sendRedirect("notifications.jsp");
		}
	   else
	   {  
		   message="Invalid Credentials . Try Again";
		   message_color="red";
		   response.sendRedirect("index.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
	   }
	
	
	}

}
