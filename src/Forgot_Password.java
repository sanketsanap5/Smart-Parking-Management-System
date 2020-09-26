

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgot_Password
 */
@WebServlet("/Forgot_Password")
public class Forgot_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       All_Retriving_Methods m=new All_Retriving_Methods();
	private String Email;
	private String Mobile_No;
	private String message;
       
       public void Accept_Data(HttpServletRequest request) 
       {
    	   Email=(String) request.getParameter("Email");
   		   Mobile_No=(String) request.getParameter("Mobile_No");
   		
   		/*Adding into session*/
   		HttpSession session=request.getSession();
   		session.setAttribute("Email", Email);
   		session.setAttribute("Mobile_No", Mobile_No);
   		session.setAttribute("OTP_For", "Forgot_Password");
   		session.setAttribute("OTP_Attempt", 1);
		
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.Accept_Data(request);
		if(m.Reset_Password_OTP_Send(request, response))
		{
			response.sendRedirect("Accept_OTP.jsp");
			
		}
		else
		{
			   message="Invalid Credentials . Try Again";
			   response.sendRedirect("Forgot_Password.jsp?message="+URLEncoder.encode(message,"UTF-8"));
		}
		
	}

}
