<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet"></link>

<script>
	$(document).ready(function (){
		var minDate=new Date();
		$("#s_date").datepicker({
			showAnim: 'drop',
			numberOfMonth: 1,
			minDate: minDate,
			dateFormat: 'dd-mm-yy',
			onClose: function (selectedDate){
				$('#e_date').datepicker("option","minDate",selectedDate);
			}
		});
		
		$("#e_date").datepicker({
			showAnim: 'drop',
			numberOfMonth: 1,
			minDate: minDate,
			dateFormat: 'dd-mm-yy'
		});
	});
</script>


</head>
<body>
	<form action="training" method="get">
		Course: <select name="course">
			<option value="java">java</option>
			<option value="python">python</option>
			<option value="cpp">cpp</option>
			<option value="scala">scala</option>
		</select> <br />
		Trainer: <select name="trainer">
			<option value="trainer1">trainer1</option>
			<option value="trainer2">trainer2</option>
			<option value="trainer3">trainer3</option>
			<option value="trainer4">trainer4</option>
		</select> <br />
		Start_date: <input type="text" name="start_date" id="s_date" placeholder="start_date" /> <br /> 
		End_date: <input type="text" name="end_date" id="e_date" placeholder="end_date" /> <br /> 
		Description: <input type="text" name="desc" placeholder="description" /> <br /> 
		<input type="submit" value="submit" />
	</form>
</body>
</html>