

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import windowsup.All_Retriving_Methods;


@WebServlet("/RemoveVehicle")
public class RemoveVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   All_Retriving_Methods m=new All_Retriving_Methods();

    public RemoveVehicle() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int rfid_no=Integer.parseInt(request.getParameter("rfidno"));
		int updatedrows=0;
		try {
			updatedrows=m.removeVehicle(rfid_no);
			if(updatedrows!=0) {
				response.sendRedirect("vehicles.jsp");
				PrintWriter out=response.getWriter();
				out.println("<script>alert('Vehicle Removed Successfully');</script>");
			}else {
				response.sendRedirect("vehicleinfo.jsp");
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.sendRedirect("errorPage.jsp");
			e.printStackTrace();
		}
		
	}

}
