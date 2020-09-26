

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
 * Servlet implementation class Reset_Password
 */
@WebServlet("/Reset_Password")
public class Reset_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
    All_Retriving_Methods m=new All_Retriving_Methods();
	private String New_Password;
	private String Email;
	private String message;
	private String message_color;
       
	public void Accept_Data(HttpServletRequest request)
	{	    New_Password=(String) request.getParameter("New_Password");
            HttpSession session=request.getSession(false); 
	   		session.setAttribute("New_Password", New_Password);

	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	   PrintWriter out=response.getWriter();
           this.Accept_Data(request);
		if(m.Reset_Password_DB(request))
		 try {
				 message="Your Password Has Been Successfully Changed ";
				 message_color="green";
				 response.sendRedirect("index.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
			 } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		             // response.sendRedirect("index.jsp");

		}
	}


