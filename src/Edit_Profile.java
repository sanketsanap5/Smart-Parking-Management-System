

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Edit_Profile
 */
@WebServlet("/Edit_Profile")
@MultipartConfig
public class Edit_Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String Dl_No;
	private String Address_1;
	private String Gender;
    InputStream inputStream=null;
    Part Image_Part=null;
	String ImageName;

       All_Retriving_Methods m=new All_Retriving_Methods();
	private String message_color;
	private String message;
	private String DOB;
	 
        public void Accept_Data(HttpServletRequest request) {
        Gender=(String) request.getParameter("gendre");
		Address_1=(String) request.getParameter("address1");
		Dl_No=(String) request.getParameter("dlno");
		DOB=(String) request.getParameter("dob");
		/*Adding into session*/
		HttpSession session=request.getSession();
		session.setAttribute("Gender", Gender);
		session.setAttribute("Address_1", Address_1);
		session.setAttribute("Dl_No", Dl_No);
		session.setAttribute("DOB", DOB);

		

		try {
			Image_Part=request.getPart("ImgInp");
			if(Image_Part!=null)
			{				
				System.out.println(Image_Part.getName());
				System.out.println(Image_Part.getContentType());
				System.out.println(Image_Part.getSize());
				inputStream=Image_Part.getInputStream();
				session.setAttribute("Profile_Photo", inputStream);

			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.Accept_Data(request);
		if(m.Complete_Profile(request))
		{
			   message="Data Updated Successfully";
			   message_color="green";
			   response.sendRedirect("Edit_Profile.jsp?message="+URLEncoder.encode(message,"UTF-8")+"&&color="+message_color);
		  
			
		}
		else
		{
			  System.out.println("Data not updated");
			
		}
	}

}
