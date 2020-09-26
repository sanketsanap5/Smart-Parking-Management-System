

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Resend_OTP
 */
@WebServlet("/Resend_OTP")
public class Resend_OTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
	All_Retriving_Methods m=new All_Retriving_Methods();
	private int otp_attempt;
	private String message;
	private String message_color;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(false);
		
		if(session.getAttribute("OTP_For").equals("Register_User") && (int)session.getAttribute("OTP_Attempt") <=3)
		{
			
			otp_attempt = (int)session.getAttribute("OTP_Attempt")+1;
			session.setAttribute("OTP_Attempt", otp_attempt);
			
			if(m.Send_OTP_SMS(request))
			{
				   message="OTP Been Resend To Your Mobile No";
				   message_color="green";
				   response.sendRedirect("Accept_OTP.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
			}
			
		}
		else if((int)session.getAttribute("OTP_Attempt") <=3)
		{
			otp_attempt = (int)session.getAttribute("OTP_Attempt")+1;
			session.setAttribute("OTP_Attempt", otp_attempt);
			if(m.Reset_Password_OTP_Send(request, response))
			{
				   message="OTP Been Resend To Your Mobile No";
				   message_color="green";
				   response.sendRedirect("Accept_OTP.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
			}
			
		}
		else
		{
			
			  message="Your OTP Limit Exceeded .";
			  message_color="red";
			  response.sendRedirect("index.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
		}
	}

}
