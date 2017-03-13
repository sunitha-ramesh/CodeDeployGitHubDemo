<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="/struts-tags" prefix="s"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AWS SAMPLE APP</title>

<link rel="stylesheet" href="styles/jquery.dataTables_themeroller.css">
<link rel="stylesheet" href="styles/jquery-ui-1.8.4.custom.css">
<script type="text/javascript" src="scripts/jquery-1.11.3.js"></script>
<script type="text/javascript"
	src="scripts/jquery-ui-1.10.3.custom.min.js"></script>


<script src="scripts/timedropper.js"></script>
<script src="scripts/jquery.form.js"></script>
<script src="scripts/toastr.min.js"></script>
<style>
.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #e3f2fd !important;
	opacity: 0.8;
	z-index: 1001;
}
</style>
</head>
<body style="background-color: yellow;">
	<form name="manualMCSForm" id="manualMCSForm"
		enctype="multipart/form-data">
		<table style="width: auto; height: auto" align="center">
			<tr>
				<th colspan="2" align="center">AWS SAMPLE APPLICATION</th>
			</tr>
			<tr>
			<td><s:textfield id="recordCnt" name="recordCnt" label="No. of Records"
						style="width:200px"></s:textfield> </td>
				<td><s:textfield id="name" name="name" label="Student Name"
						style="width:200px"></s:textfield> </td>
				<td><s:textfield id="address" name="address" label="Address"
						style="width:200px"></s:textfield> </td>
				<td><s:textfield id="city" name="city" label="City"
						style="width:200px"></s:textfield> </td>
				<td colspan="2" style="text-align: right"><input type="button"
					value="Save" onclick="saveRecords();" /></td>
			</tr>
		</table>
		<table style="width: 100%">
		<tr>
		<td>Name:<input type="text" id="namesearch" name="namesearch"/></td>
		<td>Address:<input type="text" id="addresssearch" name="addresssearch"/></td>
		<td>City:<input type="text" id="citysearch" name="citysearch"/></td>
		<td><input type="button" onclick="getFilterValues();" value="Filter"/></td>
		</tr>
		<tr>
		<td colspan="4" id="allValues"></td>
		</tr>
		</table>
	</form>
</body>
<script>
		function saveRecords() {
		//manualMCSForm
		$(".overlay, .overlay-message").show();
		var url = "generateManualMCSAction";
		var requestParameters = $("#manualMCSForm").serialize();
		$.ajax({
			type : "POST",
			url : url,
			data : requestParameters,
			success : function(data) {

				alert(data);
				$(".overlay, .overlay-message").hide();
				$("#recordCnt").val("");
				$("#name").val("");
				$("#address").val("");
				$("#city").val("");
				getAllValues();

			}
		});
	}
		getAllValues();
		function getAllValues()
		{
			$(".overlay, .overlay-message").show();
			var url = "getAllValues";
			var requestParameters = $("#manualMCSForm").serialize();
			$.ajax({
				type : "POST",
				url : url,
				data : requestParameters,
				success : function(data) {

					$("#allValues").html(data);
					$(".overlay, .overlay-message").hide();
					//getAllValues();

				}
			});
		}
		
		function getFilterValues()
		{
			$(".overlay, .overlay-message").show();
			var url = "getFilterValues";
			var requestParameters = $("#manualMCSForm").serialize();
			$.ajax({
				type : "POST",
				url : url,
				data : requestParameters,
				success : function(data) {

					$("#allValues").html(data);
					$(".overlay, .overlay-message").hide();
					//getAllValues();

				}
			});
		}
</script>
</html>