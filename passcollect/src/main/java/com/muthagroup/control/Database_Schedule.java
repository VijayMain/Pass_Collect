package com.muthagroup.control;

import java.io.IOException;
import java.sql.Connection;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muthagroup.conUtil.Connection_Util;
import com.muthagroup.dao.Database_Schedule_DAO;
 
@WebServlet("/Database_Schedule")
public class Database_Schedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			Connection con = Connection_Util.getConnectionMaster();
			int vendor_name = Integer.valueOf(request.getParameter("vendor_name")); 
			int machine = Integer.valueOf(request.getParameter("machine"));
		//	System.out.println("ven = " + vendor_name + " machine = " + machine);
			if(con!=null){
						
			Timer timer = new Timer();
			TimerTask timerTask3 = new Database_Schedule_DAO(vendor_name,machine);
			timer.schedule(timerTask3, 10000, 60000);
			 
			
			response.sendRedirect("pushdata.jsp?start=on&field="+vendor_name+"&mac="+machine); 
			
			}else{
				response.sendRedirect("pushdata.jsp?off=off&field="+vendor_name+"&mac="+machine); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
