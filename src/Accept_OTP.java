

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Accept_OTP
 */
@WebServlet("/Accept_OTP")
public class Accept_OTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	All_Retriving_Methods m=new All_Retriving_Methods();
	private long Max_Session_Time=(long) (5*60000);

	private long Creation_Time;

	private long Current_Time;

	private String message;

	private String message_color;
	
	public HttpSession Setup_Time_For_Session(HttpServletRequest request) 
	{
		 HttpSession session=request.getSession(false);
		 Creation_Time=(long) session.getAttribute("Creation_Time");
		 Current_Time=System.currentTimeMillis();
		 return session;
	}
   
	public void Redirect(HttpServletResponse response,HttpServletRequest request,HttpSession session) 
	{
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		
		if(Current_Time > (Creation_Time + Max_Session_Time))
		  {
		out.println("<p>Your Session Expired !!!</p>");
		session.invalidate();
		session=null;
		/*Not registred actions*/
		  }
		else 
	       	{
			String Entered_OTP=request.getParameter("Entered_OTP");
			String Session_OTP=(String) session.getAttribute("OTP"); 
			
			if(Entered_OTP.equals(Session_OTP) && session!=null )
		  {
		
			  /*OTP For category */
		 	 /*Forgot Password*/
			if(session.getAttribute("OTP_For").equals("Forgot_Password"))
			   {
				try {
					response.sendRedirect("Reset_Password.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			   }
			  /*Succesfully registred actions*/
			else if (session.getAttribute("OTP_For").equals("Register_User"))
			    {
			  m.Register_New_User(request);
			 
			  
			  try {
				   message_color="green";
				   message="You Have Been Successfully Registerd . Login Now ";
				   response.sendRedirect("index.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  


	         	}
	       	}
			else
			{
			 
			  try {
				  message_color="red";
				  message="Wrong OTP Entered ! Re-Enter OTP ";
				   response.sendRedirect("Accept_OTP.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			}

		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		this.Redirect(response,request,this.Setup_Time_For_Session(request));
		
	
		
	}

}
