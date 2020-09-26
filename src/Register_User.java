

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;

/**
 * Servlet implementation class Register_User
 */
@WebServlet("/Register_User")
public class Register_User extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  
    String Full_Name,Email,Password,Mobile_No,OTP_Attempt;/*Max 3 OTP Attempt*/
     
    public All_Retriving_Methods m=new All_Retriving_Methods();
    
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    public void Accept_Data(HttpServletRequest request) {
		Full_Name=(String) request.getParameter("Full_Name");
		Email=(String) request.getParameter("Email");
		Password=(String) request.getParameter("Password");
		Mobile_No=(String) request.getParameter("Mobile_No");
		
		
		
		/*Adding into session*/
		HttpSession session=request.getSession();
		session.setAttribute("Full_Name", Full_Name);
		session.setAttribute("Email", Email);
		session.setAttribute("Password", Password);
		session.setAttribute("Mobile_No",Mobile_No);
   		session.setAttribute("OTP_For", "Register_User");
   		session.setAttribute("OTP_Attempt", 1);

		
		
		/**/
		
		
	}
    
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		this.Accept_Data(request);
		
		
		if(m.Send_OTP_SMS(request))
		  {
			//OTP SENT
			//session.setAttribute("OTP_Atte", arg1);
			response.sendRedirect("Accept_OTP.jsp");
		  }
		else 
		{
			System.out.println(" SMS Not Sent");
			
		}
	    
		
		
		
	}
	
	

}
