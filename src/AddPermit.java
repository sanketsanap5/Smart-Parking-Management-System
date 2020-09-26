

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import windowsup.All_Retriving_Methods;

/**
 * Servlet implementation class AddPermit
 */
@WebServlet("/AddPermit")
public class AddPermit extends HttpServlet {
	private static final long serialVersionUID = 1L;
   All_Retriving_Methods m=new All_Retriving_Methods();
   HttpSession session=null; 
    public AddPermit() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int lot=Integer.parseInt(request.getParameter("lot"));
		int floor=Integer.parseInt(request.getParameter("floor"));
		int slot=Integer.parseInt(request.getParameter("slot"));
		String Category=request.getParameter("category");
		String from_dates=request.getParameter("from_date");
	//	String from_time=request.getParameter("from_time");
		String to_dates=request.getParameter("to_date");
	//	String to_time=request.getParameter("to_time");
			
		
		
			java.sql.Date from_date;
			java.sql.Date to_date;

			
			from_date =  java.sql.Date.valueOf(from_dates);
			to_date=  java.sql.Date.valueOf(to_dates);

			session=request.getSession(false);


		
		int Qstatus=0;
		try {
			
			Qstatus=m.permitRequest((Integer)session.getAttribute("subscriber_id"),lot,floor,slot,Category,from_date,to_date);
			if(Qstatus!=0) {
				m.Permit_Notification(request);
				response.sendRedirect("permits.jsp");
				System.out.println("Request added Successfully");
			}else {
				response.sendRedirect("addpermit.jsp");
				System.out.println("Request Error");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.sendRedirect("errorPage.jsp");
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

}
