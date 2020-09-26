package windowsup;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.Response;
import com.mysql.jdbc.PreparedStatement;

public class All_Retriving_Methods extends Thread{
	
	/*Declaration Section*/
	HttpSession session;
	Connection con=null;  
	java.sql.PreparedStatement ps=null;
	java.sql.PreparedStatement ps1=null;
	java.sql.PreparedStatement ps2=null;
	java.sql.PreparedStatement ps3=null;
    Statement s=null;  
    ResultSet rs=null;
    String Full_Name,Email,Password;
    long Mobile_No;
    String Query;
    String Name;

    int Rows_Affected; 
	private int updated_rows=0;
    int Subscriber_Id;
	boolean flag=false;
	private String OTP;
	private String sms_content;
	private String New_Password;
	
	private OutputStream Output_Image;
	private String Gender;
	/*Methods start*/
	private String Address_1;
	private String Dl_No;
    InputStream Profile_Photo;
	private String DOB;
	private String Current_Password;
	private byte[] Image;
	

	
	/*sanky start*/
	public boolean Vehicle_Notification(HttpServletRequest request)
	{
		 session=request.getSession(false);
		 Subscriber_Id=(Integer) session.getAttribute("subscriber_id");
		 con=this.Connect_To_DB();
		 try
		 {
			 ps=con.prepareStatement("insert into notify(message,time,subscriber_id) values('Your car was registered successfully',now(),?)");
			 ps.setInt(1, Subscriber_Id);
			 updated_rows=ps.executeUpdate();
			 if(updated_rows==0)
			 {
				 return false;
			 }
			
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return true;
	}
	public boolean Permit_Notification(HttpServletRequest request)
	{
		String status=null;
		 session=request.getSession(false);
		 Subscriber_Id=(Integer) session.getAttribute("subscriber_id");
		 con=this.Connect_To_DB();
		 try
		 {
			 ps=con.prepareStatement("select permit_status from parking_permits where subscriber_id=?;");
			 ps.setInt(1, Subscriber_Id);
				
				ResultSet rs=ps.executeQuery();

				if(rs.next())
				{
					 status=rs.getString(2);
				}
				if(status.equals("pending"))
				{
					ps=con.prepareStatement("insert into notify(message,time,subscriber_id) values('Permit pending',now(),?);");
					ps.setInt(1, Subscriber_Id);
					ps.executeUpdate();
				}
				else if(status.equals("approved"))
				{
					 ps=con.prepareStatement("insert into notify(message,time,subscriber_id) values('Permit granted',now(),?);");
					 ps.setInt(1, Subscriber_Id);
					ps.executeUpdate();
				}
				else
				{
					 ps=con.prepareStatement("insert into notify(message,time,subscriber_id) values('Permit denied',now(),?);");
					 ps.setInt(1, Subscriber_Id);
					ps.executeUpdate();
				}
				
			con.close();

			 
		 }
			
		 

	
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return true;
	}
	
	
	
	public int addNewVehicle(int subscriber_id,int rfid_no,String vehicle_reg_no,String vehicle_description,String vehicle_status,InputStream vehicle_image) throws ClassNotFoundException, SQLException {
		updated_rows=0;
		con=this.Connect_To_DB();
		ps=con.prepareStatement("insert into subscriber_vehicles(subscriber_id,rfid_no,vehicle_reg_no,vehicle_description,vehicle_status,vehicle_image) values(?,?,?,?,?,?)");
		ps.setInt(1, subscriber_id);
		ps.setInt(2, rfid_no);
		ps.setString(3, vehicle_reg_no);
		ps.setString(4,vehicle_description);
		ps.setString(5, vehicle_status);
		ps.setBlob(6, vehicle_image);
		
		updated_rows=ps.executeUpdate();
		
		return updated_rows;
	}
	
	public int getSubsciberId(String username,String password) throws ClassNotFoundException, SQLException {
		int subsciber_id=0;
		con=this.Connect_To_DB();
		ps=con.prepareStatement("select subscriber_id from subscriber where email_id=? and password=?");
		ps.setString(1, username);
		ps.setString(2,password);
		rs=ps.executeQuery();
		if(rs.next()) {
			subsciber_id=Integer.parseInt(rs.getString(1));
		}
		
		return subsciber_id;
	}
	
	public byte[] getImage(int rfid_no) throws ClassNotFoundException, SQLException {
		byte barry[]=null;
		con=this.Connect_To_DB();
		ps=con.prepareStatement("select vehicle_image from subscriber_vehicles where rfid_no=?");
		ps.setInt(1,rfid_no);
		rs=ps.executeQuery();
		if(rs.next()){
		barry=rs.getBytes(1);
		}
	
		return barry;
	}
	
	public ResultSet getVehicleList(int subscriber_id) throws ClassNotFoundException, SQLException {
		con=this.Connect_To_DB();
		ps=con.prepareStatement("select rfid_no,vehicle_reg_no,vehicle_description,vehicle_status  from subscriber_vehicles where subscriber_id=?");
		ps.setInt(1,subscriber_id);
		rs=ps.executeQuery();
		
		return rs;
	}
	
	public String checkVehicleIfParked(int rfid_no) throws ClassNotFoundException, SQLException {
		String status="No";
		con=this.Connect_To_DB();
		ps=con.prepareStatement("select rfid_no from parked_vehicles where rfid_no=?");
		ps.setInt(1, rfid_no);
		rs=ps.executeQuery();
		if(rs.next()) {
			if(rfid_no==rs.getInt(1)) {
				status="Yes";
			}
		}
		
		return status;
	}
	
	public int removeVehicle(int rfid_no) throws ClassNotFoundException, SQLException {
		updated_rows=0;
		con=this.Connect_To_DB();
		ps=con.prepareStatement("delete from subscriber_vehicles where rfid_no=?");
		ps.setInt(1,rfid_no);
		updated_rows=ps.executeUpdate();	
		
		return updated_rows;
	}
	
	
	public ResultSet getPermits(int subscriber_id) throws ClassNotFoundException, SQLException {
		rs=null;
		con=this.Connect_To_DB();
		ps=con.prepareStatement("select (select address_line_1 from parking_lots l where l.parking_lot_id=p.parking_lot_id),p.parking_floor_id ,p.parking_slot_id,p.parking_category ,p.permit_status from parking_permits p where p.subscriber_id=?");
		ps.setInt(1, subscriber_id);
		rs=ps.executeQuery();
		
		
		return rs;
	}
	
	public int permitRequest(int subscriber_id,int lot,int floor,int slot,String category,Date from_date ,Date to_date) throws ClassNotFoundException, SQLException {
		updated_rows=0;
		con=this.Connect_To_DB();
		ps=con.prepareStatement("insert into parking_permits (subscriber_id,parking_lot_id,parking_category,parking_floor_id ,parking_slot_id,permit_start_date,permit_end_date ) values(?,?,?,?,?,?,?) ");
		ps.setInt(1, subscriber_id);
		ps.setInt(2, lot);
		ps.setString(3, category);
		ps.setInt(4, floor);
		ps.setInt(5, slot);
		ps.setDate(6, from_date);;
		ps.setDate(7, to_date);
		updated_rows=ps.executeUpdate();
		
		
		return updated_rows;
	}
	

	
	public boolean Complete_Profile(HttpServletRequest request)
	{
	       con=this.Connect_To_DB();
	       session=request.getSession(false);
	       Gender=(String) session.getAttribute("Gender");
	       Address_1=(String) session.getAttribute("Address_1");
	       Dl_No=(String) session.getAttribute("Dl_No");
	       DOB=(String) session.getAttribute("DOB");
	       Profile_Photo=  (InputStream) session.getAttribute("Profile_Photo");
	       Email=(String) session.getAttribute("Email");
		   
		   
		   try {
			   ps=con.prepareStatement("update subscriber set subscriber_photo=?,gender=?,address_line_1=?,driving_licence_no=?,date_of_birth=? where email_id=?");
			  
			   if(Profile_Photo !=null)
			   {
			   ps.setBlob(1,Profile_Photo);
			   }
			   
			   ps.setString(2, Gender);
			   ps.setString(3,Address_1);
			   ps.setString(4, Dl_No);
			   ps.setString(5, DOB);
			   ps.setString(6,Email);
			   
			   Rows_Affected=ps.executeUpdate();
			   if(Rows_Affected==1)
			     {
				   System.out.println("1 USER'S DATA UPDATED");
				   return true;
			     }
			   /*closing db connection*/
			   con.close();

			   


			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		   return false;
		   
		   
		
	}
	

	public void  Get_Profile_Image(HttpServletRequest request,HttpServletResponse response,String email) {
		// TODO Auto-generated method stub
 	      con=this.Connect_To_DB();
 	      
 	      System.out.println(email);
 	     
 	   	   try {
 	 			ps=con.prepareStatement("select subscriber_photo from subscriber where email_id=?");
 	 			ps.setString(1, email);
 	 			rs=ps.executeQuery();
 	 			if(rs.next())
 			     {
 				  Image=rs.getBytes(1);
 				  response.setContentType("image/gif");
 				  Output_Image=response.getOutputStream();
 				  Output_Image.write(Image);
 				  Output_Image.flush();
 				  Output_Image.close();
 				  
 				   //return Output_Image;
 			     }
 	 			else
 					System.out.println("Photo error");
 	 				con.close();
 	 			   
 	         }
 	 			catch (Exception e) {
 					System.out.println("Photo error");
                    e.printStackTrace();
 	 				// TODO Auto-generated catch block
 	 				//return null;

 	 			}
 	   	  // return null;

	}

	public boolean Reset_Password_DB(HttpServletRequest request )
	{
		  session=request.getSession(false);
	      New_Password= (String) session.getAttribute("New_Password");
	      Current_Password= (String) session.getAttribute("Current_Password");

   	      Email=(String) session.getAttribute("Email");
   	      con=this.Connect_To_DB();
   	      
   	      
   	    
   	      
   	   try {
 			ps=con.prepareStatement("update subscriber set password=? where email_id=? and password=? ");
 			ps.setString(1, New_Password);
 			ps.setString(2, Email);
 			ps.setString(3, Current_Password);

 			Rows_Affected=ps.executeUpdate();
 			if(Rows_Affected==1)
		     {
			   System.out.println("Password has been Changed");
			   return true;
		     }
 			else
				System.out.println("Password has not been Changed");

 				con.close();
 			   
         }
 			catch (SQLException e) {
 				// TODO Auto-generated catch block
 				return false;

 			}
			return false;

		
		
		
	}
	public boolean Reset_Password_OTP_Send(HttpServletRequest request,HttpServletResponse response) 
	{
		session=request.getSession(false);
		con=this.Connect_To_DB();
		if(this.Validate_User(request,con))
		   {
	        Email=  (String) session.getAttribute("Email");
	        Mobile_No= Long.parseLong((String) session.getAttribute("Mobile_No"));
            

			  try {
					ps=con.prepareStatement("select name from subscriber where email_id=?");
					ps.setString(1, Email);
					rs=ps.executeQuery();
					if(rs.next())
					   { 
						    Name=rs.getString("name");
							Name=Name.split("\\s+")[0];
						    OTP=this.Generate_OTP(request);
						    sms_content="Hi "+Name +",Your OTP for WindowsUp forgot password is : "+OTP+" .\nThis OTP is valid upto next 5 minutes.\nThank You ! -Team WindowsUp";
						    System.out.println(sms_content);
						    flag=this.Send_Sms(sms_content,Long.toString(Mobile_No));
						    if(flag)
							{ session.setAttribute("Creation_Time", System.currentTimeMillis());  						    
							  return true;
							}
					   }
				

			
				} catch (Exception e) {
					// TODO Auto-generated catch block
					return false;
					
				}
			}
		
	    	return false;
	

	}
    
    private boolean Validate_User(HttpServletRequest request, Connection con)
    {
    	session=request.getSession(false);
        Email=  (String) session.getAttribute("Email");
        Mobile_No= Long.parseLong((String) session.getAttribute("Mobile_No"));
              
          try {
  			ps=con.prepareStatement("select mobile_no from subscriber where email_id=?");
  			ps.setString(1, Email);
  			rs=ps.executeQuery();
  			if(rs.next())
  			   { 
  				if(Long.toString(Mobile_No).equals(rs.getString("mobile_no")))
  				  {
  					System.out.println("User is valid");
  					return true;
  				  }
  				
  				else
  					System.out.println("User is not  valid");

  			   }
  			else
					System.out.println("User is not  valid");

          }
  			catch (SQLException e) {
  				// TODO Auto-generated catch block
  				return false;

  			}
			return false;

      }
  		
	

	public boolean Validate_Login(HttpServletRequest request)
    {
      session=request.getSession(false);
      Email=  (String) session.getAttribute("Email");
      Password= (String) session.getAttribute("Password");
    
      con=this.Connect_To_DB();
      
        try {
			ps=con.prepareStatement("select password from subscriber where email_id=?");
			ps.setString(1, Email);
			rs=ps.executeQuery();
			if(rs.next())
			   { 
				if(Password.equals(rs.getString("password")))
				  {
					return true;
				  }
				
			   }
		
		con.close();

	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return false;
			
		}
    	
		return false;

    	
		
	}
	
	 public Connection Connect_To_DB() {
    	 
	        
	        try {
				Class.forName("com.mysql.jdbc.Driver");    
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/windowsup","root","");
				System.out.println("Connected");
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Not Connected");
	            e.printStackTrace();
			}   
	        return con;
	    	
	    	
		}
	
	
	
	public boolean Register_New_User(HttpServletRequest request) 
	{
	   session=request.getSession(false);
	   Full_Name=(String) session.getAttribute("Full_Name");
	   Email=(String) session.getAttribute("Email");
	   Mobile_No=Long.parseLong( (String) session.getAttribute("Mobile_No"));
	   Password=(String) session.getAttribute("Password");
       
	   

	   
	   
	   con=this.Connect_To_DB();
	   
	   
	   try {
		   /*Inserting empty values temporarily before completing profile*/
		   
		   
		   ps=con.prepareStatement("INSERT INTO subscriber (name,"
		   		+ " mobile_no, email_id, password, address_line_1, address_line_2, address_line_3,"
		   		+ " driving_licence_no,registration_time) VALUES "
		   		+ "(?,  ?, ?, ?, '', '', '', '', CURRENT_TIMESTAMP)");
		   
		   ps.setString(1, Full_Name);
		   ps.setLong(2,Mobile_No);
		   ps.setString(3, Email);
		   ps.setString(4, Password);
		   
		   Rows_Affected=ps.executeUpdate();
		   if(Rows_Affected==1)
		     {
			   System.out.println("1 NEW USER ADDED");
			   return true;
		     }
		   /*closing db connection*/
		   con.close();

		  


		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		
		e.printStackTrace();
	}
	   return false;
	   
	   
	   
	}
	public String Generate_OTP(HttpServletRequest request) 
	{	
		
		session=request.getSession(false);
		String OTP="";
	    final Random R = new SecureRandom();
        final int OTP_LENGTH = 6;
        
        String letters = "1234567890";         
	      for (int i=0; i<OTP_LENGTH; i++)
	      {
	          int index = (int)(R.nextDouble()*letters.length());
	          OTP += letters.substring(index, index+1);
	      }     
	     
		    session.setAttribute("OTP", OTP);

		return OTP;
	}
	
	
	public boolean Send_Sms(String sms_content,String mobile_no ) {
		
		//return true;
		try {
			// Construct data
			String apiKey = "apikey=" + "bJV+C8OwYgw-4Ayy1r7OrZNSRfhkXxR78JFue5L056";
			String message = "&message="+sms_content;
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" +mobile_no ;
			

			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			
		
			
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			//Response By Gateway 
			
			System.out.println( stringBuffer.toString());
			System.out.println("SMS Send successfully......");
			return true;
		} catch (Exception e) {
			
			System.out.println("Error SMS "+e);
            return false;
		}
		
	}

	public boolean Send_OTP_SMS(HttpServletRequest request) {
		
		
		/*Generate sms*/
		session=request.getSession(false);
		
	    Name=(String) session.getAttribute("Full_Name");
		Name=Name.split("\\s+")[0];
		String Mobile_No=(String) session.getAttribute("Mobile_No");
		String OTP=this.Generate_OTP(request);
		
		/*Setting otp to session*/
		
		
		String Message="Hi "+Name +",Your OTP for WindowsUp profile registration is : "+OTP+" .\nThis OTP is valid upto next 5 minutes.\nThank You ! -Team WindowsUp";
		
		System.out.println(Message);
        flag=this.Send_Sms(Message,Mobile_No );
        if(flag)
		session.setAttribute("Creation_Time", System.currentTimeMillis());

		return flag;
		
	}
	public ResultSet Get_Notifications(HttpServletRequest request) throws IOException {
		 session=request.getSession(false);
		
		 Subscriber_Id=	(Integer) session.getAttribute("subscriber_id");
		
			
		 
		 
		 con=this.Connect_To_DB();
		 try {
			 ps=con.prepareStatement("update notify set message_displayed='Yes' where subscriber_id=?");
			 ps.setInt(1, Subscriber_Id);
			 ps.executeUpdate();
			 
			 ps=con.prepareStatement("select message,time from notify where subscriber_id=? order by sr_no desc limit 7 ");
			 ps.setInt(1, Subscriber_Id);
			 rs=ps.executeQuery();
			 
			 return rs;
		/*	 if(rs.isBeforeFirst())
			 {
				 return rs;
			 }*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 return null;
		}
		 
		 
  
		
	}
	
	

  //  Object obj1 = new Object();
    
  public void run() {
	  
	  for(;;) {
	  try {
		Check_Status_After_3_Seconds((HttpServletRequest)session.getAttribute("request"),(HttpServletResponse)session.getAttribute("response"));
		Thread.sleep(3000);
	  } catch (InterruptedException | SQLException | IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  }
	  
}
    
    public void Check_Status_After_3_Seconds(HttpServletRequest request,HttpServletResponse response) throws InterruptedException, SQLException, IOException {
       /* for(;;){
            Runnable helloTask = new Runnable(){
                @Override
                public void run(){
                    try {
						new All_Retriving_Methods().Is_there_message(request,response);
					} catch (SQLException | IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
                    try {
						Thread.sleep(3000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                }
            };

         

            Thread t1 = new Thread(helloTask);
         
            t1.start();
            //t1.join();     
        }
        
        */
    	
    	Is_there_message(request, response);
    }
    
    public void setMessagePushed(HttpServletRequest request,String msg) throws SQLException {
    	session=request.getSession(false);

		Subscriber_Id=	(Integer) session.getAttribute("subscriber_id");

		con=this.Connect_To_DB();
		ps=con.prepareStatement("update parked_vehicles set message_pushed='"+msg+"' where subscriber_id=?");
		ps.setInt(1, Subscriber_Id);
		ps.executeUpdate();
		
    }   
    
    
    
public void Is_there_message(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {
	 {
		session=request.getSession(false);

		Subscriber_Id=	(Integer) session.getAttribute("subscriber_id");

		con=this.Connect_To_DB();

		ps=con.prepareStatement("select rfid_no,parking_lot_id,parking_status,message_pushed from parked_vehicles where subscriber_id=?");
		ps.setInt(1, Subscriber_Id);
		rs=ps.executeQuery();
		
		String isMesssagePushed;
		int parkinglotid;
		String paringlotname=" ";
		String rfid_no;
		String vehicleRegno=" ";
		String parking_status;
		if(rs.next()) {
			
			parkinglotid=rs.getInt("parking_lot_id");
			isMesssagePushed=rs.getString("message_pushed");
			rfid_no=rs.getString("rfid_no");
			parking_status=rs.getString("parking_status");
			
			vehicleRegno=getVehicleRegno(rfid_no);
			
			paringlotname=getparkinglot_name(parkinglotid);
			
			
			if(parking_status.equalsIgnoreCase("Parked") && isMesssagePushed.equalsIgnoreCase("No") ) {

				//////////////////////// For Parked Status
				Entry_Notification(request,paringlotname,vehicleRegno);
				setMessagePushed(request,"Yes");
				//	response.sendRedirect("notifications.jsp");

			}

			if(parking_status.equalsIgnoreCase("Exit") && isMesssagePushed.equalsIgnoreCase("Yes")  ) {

				//////////////////////// For Exit Status
				Exit_Notification(request,paringlotname,vehicleRegno);
				setMessagePushed(request,"No");
				//	response.sendRedirect("notifications.jsp");

			}

		}

	}
}

    public int  Entry_Notification(HttpServletRequest request,String parkinglotname,String vehicleRegno) throws SQLException {

    	session=request.getSession(false);

    	Subscriber_Id=	(Integer) session.getAttribute("subscriber_id");

    	con=this.Connect_To_DB();


    	String entry_message="Your Vehicle "+ vehicleRegno +" Has Been Parked at "+parkinglotname;				// Add Vehicle Info in Query

    	ps=con.prepareStatement("insert into notify(message,time,subscriber_id) values('"+entry_message +"',now(),?);");
    	ps.setInt(1, Subscriber_Id);
    	Rows_Affected=	ps.executeUpdate();

    	return Rows_Affected;
    }
	
    public String getparkinglot_name(int parking_lot_id) throws SQLException {
    	String lotname=" ";
		con=this.Connect_To_DB();

		ps=con.prepareStatement("SELECT address_line_1 FROM parking_lots WHERE parking_lot_id=?");
		ps.setInt(1, parking_lot_id);
		rs=ps.executeQuery();
		if(rs.next()) {
			lotname=rs.getString("address_line_1");
		}
    	
    	return lotname;	
    }
    
    
    public String getVehicleRegno(String rfid_no) throws SQLException {
    	String vehicleName=" ";
    	con=this.Connect_To_DB();

		ps=con.prepareStatement("SELECT vehicle_reg_no FROM subscriber_vehicles WHERE rfid_no=?");
		ps.setString(1, rfid_no);
		rs=ps.executeQuery();
		if(rs.next()) {
			vehicleName=rs.getString("vehicle_reg_no");
		}
    	
    	return vehicleName;
		
	}
    
    
 public int  Exit_Notification(HttpServletRequest request,String parkinglotname,String vehicleRegno) throws SQLException {

	 session=request.getSession(false);

	 Subscriber_Id=	(Integer) session.getAttribute("subscriber_id");

	 con=this.Connect_To_DB();

	 String entry_message="Your Vehicle "+ vehicleRegno +"  Exited from "+parkinglotname;				// Add Vehicle And PArking Lot Info in Query

	 ps=con.prepareStatement("insert into notify(message,time,subscriber_id) values('"+entry_message +"',now(),?);");
	 ps.setInt(1, Subscriber_Id);
	 Rows_Affected=	ps.executeUpdate();

	 return Rows_Affected;
    }
	
  public int getUnRead_Messages(int subscriber_id) throws SQLException {
	  int unRead_Messages=0;
	  con=this.Connect_To_DB();

	  ps=con.prepareStatement("select COUNT(message_displayed) from notify where subscriber_id=? and message_displayed='No';");
	  ps.setInt(1, subscriber_id);
	  rs=ps.executeQuery();
	  if(rs.next()) {
		  unRead_Messages=rs.getInt(1);
	  }

	  return unRead_Messages;
  }
  

	
}
