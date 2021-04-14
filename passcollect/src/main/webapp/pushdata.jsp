<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.muthagroup.conUtil.Connection_Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html lang="en"> 
<head> 
  <title>Push Data</title> 
  <!-- Bootstrap CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="css/elegant-icons-style.css" rel="stylesheet" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/daterangepicker.css" rel="stylesheet" />
  <link href="css/bootstrap-datepicker.css" rel="stylesheet" />
  <link href="css/bootstrap-colorpicker.css" rel="stylesheet" />
  <!-- date picker -->
<script type="text/javascript"> 
    function ChangeColor(tableRow, highLight) {
		if (highLight) {
			tableRow.style.backgroundColor = '#CFCFCF';
		} else {
			tableRow.style.backgroundColor = '#FFFFFF';
		}
	}
</script>   
<style type="text/css">
table.gridtable {
	font-family: verdana, arial, sans-serif; 
	color: black;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}

table.gridtable th {
	font-size: 10px;
	border-width: 1px;
	padding: 3px;
	border-style: solid;
	border-color: #666666;
	text-align: center;
	color: black;
	/* background-color: #dedede; */
}

table.gridtable td {
font-size: 10px;
	border-width: 1px;
	padding: 2px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
} 
</style> 
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet" />  
</head> 
<body>  
<%
try{
%>
<!---------------------------------------------------------------  Include Header ---------------------------------------------------------------------------------------->
<%@include file="Header.jsp" %>
<!---------------------------------------------------------------  Include Sidebar ---------------------------------------------------------------------------------------->
 <section class="wrapper">
		<div class="row">
          <div class="col-lg-12"> 
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="Home.jsp">Home</a></li>
              <li><i class="fa fa-laptop"></i>Dashboard - Data Collection Hub</li>
            </ol>
          </div>
        </div>
   	<!-- ********************************************************************************************************************* -->
	<!-- **************************************************** Data Goes Here ************************************************* -->
	<!-- ********************************************************************************************************************* -->
<%
int vendor= Integer.valueOf(request.getParameter("field"));
int machine= Integer.valueOf(request.getParameter("mac"));
String vendor_name = "";
Connection con = Connection_Util.getConnectionMaster();
Connection con_vendor = Connection_Util.getConnectionVendorMaster();
DecimalFormat noDecimal = new DecimalFormat("#");
PreparedStatement ps_check = con.prepareStatement("SELECT * FROM Baker_site where enable=1 and id="+vendor);
ResultSet rs_check = ps_check.executeQuery();
while(rs_check.next()){
	vendor_name=rs_check.getString("site_name");
}
%>	
<form action="Database_Schedule" method="post" onsubmit="submit.disabled = true; return true;">
<input type="hidden" name="vendor_name" id="vendor_name" value="<%=vendor%>">
<input type="hidden" name="machine" id="machine" value="<%=machine%>">
  <table class="gridtable" width="70%">
  <tr>
    <th style="font-size: 14px;background-color: #000f6e;color: white;font-size: 18px;" colspan="2"> <strong>Data Base Synchronization</strong></th> 
  </tr>
  <tr>
    <td style="font-size: 14px;"> <strong>Vendor Name</strong><b style="color: red;"> * </b></td>
    <td>
    	<strong style="font-size: 20px;"><%=vendor_name %></strong>
    </td>
  </tr>
  <tr>
    <td style="font-size: 14px;"><strong>Auto Gauge Machine No</strong><b style="color: red;"> * </b></td>
    <td><strong style="font-size: 20px;"><%=machine %></strong> </td>
  </tr>  
  <%
  if(request.getParameter("start")!=null){
  %>
  <tr style="height: 50px;">
    <td colspan="2" align="center"> 
   <img alt="#" src="img/loaddb.png"><br> <strong style="font-size: 15px;">Database upload started, Now you can close the browser or wait till Completion...<br>Check below details and click refresh for real-time update..</strong>
    </td> 
  </tr>
  <%
  	String db_name="";
	double rowMutha =0.0,rowVendor=0.0;
	ps_check = con.prepareStatement("select db_name from Baker_site_rel where enable=1 and vendor_id="+vendor+" and vendor_machine="+machine);
	rs_check = ps_check.executeQuery();
	while (rs_check.next()) {
		db_name = rs_check.getString("db_name");
	}
	
	ps_check = con.prepareStatement("select count(*) as max_rows from "+db_name+" where enable=1");
	rs_check = ps_check.executeQuery();
	while (rs_check.next()) {
		rowMutha = Double.valueOf(rs_check.getString("max_rows"));
	}
	
	ps_check = con_vendor.prepareStatement("select count(*) as max_rows from baker_summary");
	rs_check = ps_check.executeQuery();
	while (rs_check.next()) {
		rowVendor = Double.valueOf(rs_check.getString("max_rows"));
	}
  %>
  <tr>
    <td style="font-size: 14px;"> <strong>Total Records</strong><b style="color: red;"> * </b></td>
    <td><strong style="font-size: 20px;"><%=noDecimal.format(rowVendor) %></strong></td>
  </tr>
  <tr>
    <td style="font-size: 14px;"> <strong>Total Transferred</strong><b style="color: red;"> * </b></td>
    <td style="font-size: 20px;"><strong><%=noDecimal.format(rowMutha) %></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="pushdata.jsp?start=on&field=<%=vendor %>&mac=<%=machine%>"><img alt="#" src="img/refresh.png"><strong>Refresh</strong></a>
    </td>
  </tr>
  <%
  }
  if(request.getParameter("off")!=null){ 
  %> 
	<tr style="height: 50px;">
	    <td colspan="2" align="center"> 
	    <strong style="color: red;font-size: 16px;">VPN Connection is failed...!!!</strong>
	    </td> 
	</tr>
  <%
  }
  if(request.getParameter("start")==null){
  %>
	  <tr style="height: 50px;">
	    <td colspan="2" align="center"> 
	    <input type="submit" class="btn btn-primary" name="submit" id="submit" value="Click to Synchronize" style="font-weight: bold;"> </td> 
	  </tr>
  <%	    
  }
  %>
</table>  
</form>
<%
}catch(Exception e){
	e.printStackTrace();
}
%>
    </section> 
  <!-- container section end -->
  <!-- javascripts --> 
  <script src="js/bootstrap.min.js"></script> 
  <!-- jquery ui -->
  <script src="js/jquery-ui-1.9.2.custom.min.js"></script> 
  <!--custom checkbox & radio-->
  <script type="text/javascript" src="js/ga.js"></script>
  <!--custom switch-->
  <script src="js/bootstrap-switch.js"></script> 
  <script src="js/moment.js"></script>
  <script src="js/bootstrap-colorpicker.js"></script>
  <script src="js/daterangepicker.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <!-- ck editor -->
  <script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
  <!-- custom form component script for this page-->
  <script src="js/form-component.js"></script>
  <!-- custome script for all page -->
  <script src="js/scripts.js"></script>
 <script src="js/jquery.hotkeys.js"></script>
<script src="js/jquery.hotkeys.js"></script>
  <script src="js/bootstrap-wysiwyg.js"></script>
  <script src="js/bootstrap-wysiwyg-custom.js"></script>
</body>
</html>