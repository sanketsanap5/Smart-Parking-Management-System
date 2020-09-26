

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import windowsup.All_Retriving_Methods;

@WebServlet("/AddVehicle")
@MultipartConfig(maxFileSize=16177216)	//16MB
public class AddVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   All_Retriving_Methods m=new  All_Retriving_Methods();
       HttpSession session=null;
    public AddVehicle() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		
		OutputStream img=response.getOutputStream();				
		byte barry[];
		try {
			barry = m.getImage(id);
			response.setContentType("image/png");
			img.write(barry); 
			img.flush();
			img.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int rfid_no=Integer.parseInt(request.getParameter("rfidno")); 
		String vehicle_reg_no=request.getParameter("regno");
		String make=request.getParameter("make");
		String model=request.getParameter("model");
		String vehicle_status=" ";
		String vehicle_description=(make+" "+model);
		
		session=request.getSession(false);
		
		Part part=request.getPart("image");
		InputStream vehicle_image=part.getInputStream();
		int Qstatus;
		try {
			Qstatus=m.addNewVehicle((Integer)session.getAttribute("subscriber_id"), rfid_no, vehicle_reg_no, vehicle_description, vehicle_status, vehicle_image);
			
			if(Qstatus!=0) {
				m.Vehicle_Notification(request);
				response.sendRedirect("vehicles.jsp");
				System.out.println("Add Car Successful");
			}else {
				response.sendRedirect("addVehicles.jsp");
				System.out.println("Add Car Error");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.sendRedirect("errorPage.jsp");
			e.printStackTrace();
			
		}
		
	}

}
