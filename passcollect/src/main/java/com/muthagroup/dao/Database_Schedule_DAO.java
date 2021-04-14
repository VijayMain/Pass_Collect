package com.muthagroup.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;  

import com.muthagroup.conUtil.Connection_Util;

public class Database_Schedule_DAO extends TimerTask {

	int vendor_name=0,machine=0; 
	public Database_Schedule_DAO(int vendor_name2, int machine2) {
		this.vendor_name = vendor_name2;
		this.machine = machine2;
	}

	@Override
	public void run() {
		try {
			PreparedStatement ps_check = null, ps_check2 = null;
			ResultSet rs_check = null, rs_check2 = null;
			Connection con = Connection_Util.getConnectionMaster();
			Connection con_vendor = Connection_Util.getConnectionVendorMaster();
			Double rowMutha = 0.0,rowVendor=0.0,diff=0.0,cnt=0.0;			
			// *******************************************************************************************************************************************************************
			java.util.Date date = null;
			java.sql.Timestamp timeStamp = null;
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			java.sql.Date dt = new java.sql.Date(calendar.getTimeInMillis());
			java.sql.Time sqlTime = new java.sql.Time(calendar.getTime()	.getTime());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			SimpleDateFormat cellDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			date = simpleDateFormat.parse(dt.toString() + " "	+ sqlTime.toString());
			timeStamp = new java.sql.Timestamp(date.getTime());
			// *******************************************************************************************************************************************************************
		 
			//-----------------------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------------------
			// ps_check = con.prepareStatement("select count(*) as max_rows from baker_vendor_summary where enable=1 and vendor_name='"+vendor_name+"'");
			// Database Name
			String db_name="";
			ps_check = con.prepareStatement("select db_name from Baker_site_rel where enable=1 and vendor_id="+vendor_name+" and vendor_machine="+machine);
			rs_check = ps_check.executeQuery();
			while (rs_check.next()) {
				db_name = rs_check.getString("db_name");
			}
			
			ps_check = con.prepareStatement("select count(*) as max_rows from "+db_name+" where enable=1");
			rs_check = ps_check.executeQuery();
			while (rs_check.next()) {
				rowMutha = Double.valueOf(rs_check.getString("max_rows"));
			}
			// System.out.println("row Mutha = = " + rowMutha);
			/*
			ps_check = con_vendor.prepareStatement("select count(*) as max_rows from baker_summary");
			rs_check = ps_check.executeQuery();
			while (rs_check.next()) {
				rowVendor = Double.valueOf(rs_check.getString("max_rows"));
			}*/
			//-----------------------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------------------
			ps_check = con_vendor.prepareStatement("select * from baker_summary order by datetime_sheet");
			rs_check = ps_check.executeQuery();
			while (rs_check.next()) {
				//System.out.println(rowMutha + "row = = " + cnt); 
				if(rowMutha.equals(cnt)){
					ps_check2 = con.prepareStatement("insert into "+db_name+" (Part_name,serial_no,datetime_sheet,batch,machine,operator,top_id,bot_id,top_oval,bot_oval,taper,od,mh_ht,parality,th_ht,result,vendor_name,log_date,enable) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					ps_check2.setString(1,rs_check.getString("Part_name"));
					ps_check2.setString(2,rs_check.getString("serial_no"));
					ps_check2.setTimestamp(3,rs_check.getTimestamp("datetime_sheet"));
					ps_check2.setString(4,rs_check.getString("batch"));
					ps_check2.setString(5,rs_check.getString("machine"));
					ps_check2.setString(6,rs_check.getString("operator"));
					ps_check2.setString(7,rs_check.getString("top_id"));
					ps_check2.setString(8,rs_check.getString("bot_id"));
					ps_check2.setString(9,rs_check.getString("top_oval"));
					ps_check2.setString(10,rs_check.getString("bot_oval"));
					ps_check2.setString(11,rs_check.getString("taper"));
					ps_check2.setString(12,rs_check.getString("od"));
					ps_check2.setString(13,rs_check.getString("mh_ht"));
					ps_check2.setString(14,rs_check.getString("parality"));
					ps_check2.setString(15,rs_check.getString("th_ht"));
					ps_check2.setString(16,rs_check.getString("result"));
					ps_check2.setString(17,rs_check.getString("vendor_name"));
					ps_check2.setTimestamp(18,timeStamp);
					ps_check2.setInt(19,1);
					int up = ps_check2.executeUpdate();
				}else{
					cnt = cnt+1;
				}
			} 
			//-----------------------------------------------------------------------------------------------------------------
			//----------------------------------------------------------------------------------------------------------------- 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}