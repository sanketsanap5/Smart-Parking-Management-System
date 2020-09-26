

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class unread
 */
@WebServlet("/unread")
public class unread extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	All_Retriving_Methods m=new All_Retriving_Methods();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public unread() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();

		System.out.println("working");
		int UnReadMessages=0;
		try {
			UnReadMessages = m.getUnRead_Messages((int) session.getAttribute("subscriber_id"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		if(UnReadMessages>0){
		out.print("<html>");
		out.print("<body>");
		out.print("<span class='badge' style='background-color: #5cb85c; color: #fff;'>"+UnReadMessages+"</span>");
		out.print("</body>");
		out.print("</html>");
		
		System.out.println("working");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

}
