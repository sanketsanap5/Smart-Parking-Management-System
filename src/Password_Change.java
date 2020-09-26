

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Password_Change
 */
@WebServlet("/Password_Change")
public class Password_Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
    All_Retriving_Methods m=new All_Retriving_Methods();
	private String message;
	private String message_color;
	private String Current_Password;
	private String New_Password;
 
	  
    public void Accept_Data(HttpServletRequest request) {
    	Current_Password=(String) request.getParameter("Current_Password");
		New_Password=(String) request.getParameter("New_Password");

		
		/*Adding into session*/
		HttpSession session=request.getSession();
		session.setAttribute("Current_Password", Current_Password);
		session.setAttribute("New_Password", New_Password);
		
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		this.Accept_Data(request);
		if(m.Reset_Password_DB(request))
		{

			   message="Your Password Has Been Changed";
			   message_color="green";
			   response.sendRedirect("Change_Password.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
		   
		}
		else
		{

			   message="Invalid Current Password . Try Again";
			   message_color="red";
			   response.sendRedirect("Change_Password.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
		   
		}
	}

}
