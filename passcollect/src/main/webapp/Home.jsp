<!DOCTYPE html>
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

<div class="row">
			<a href="pushdata.jsp?field=1&mac=1">
           <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box blue-bg">
              <i class="icon_building"></i> 
              <div class="count" style="font-size: 25px;">SIDDHARTH</div>
              <div class="count" style="font-size: 22px;">Machine 1</div> 
            </div>
            <!--/.info-box-->
          </div>
          </a>
          <!--/.col-->
		
		<a href="pushdata.jsp?field=1&mac=2">
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box blue-bg">
              <i class="icon_building"></i> 
              <div class="count" style="font-size: 25px;">SIDDHARTH</div>
              <div class="count" style="font-size: 22px;">Machine 2</div> 
            </div>
            <!--/.info-box-->
          </div>
          </a>
          <!--/.col-->

		  <a href="pushdata.jsp?field=2&mac=1">
          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box orange-bg">
              <i class="icon_building"></i> 
              <div class="count" style="font-size: 25px;">JAY</div> 
            </div>
            <!--/.info-box-->
          </div>
          </a>
          <!--/.col-->

		  <a href="pushdata.jsp?field=3&mac=1">
          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box green-bg">
              <i class="icon_building"></i> 
              <div class="count" style="font-size: 25px;">ARYAN</div> 
            </div>
            <!--/.info-box-->
          </div>
          </a>
          <!--/.col-->
 
        </div>


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