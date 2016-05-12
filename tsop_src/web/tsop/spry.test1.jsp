<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Copyright (c) 2006. Adobe Systems Incorporated. All rights reserved. -->
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:spry="http://ns.adobe.com/spry">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Form Validation Widgets Demo</title>
<link href="../css/screen.css" rel="stylesheet" type="text/css" media="all" />
<link href="../../widgets/textfieldvalidation/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link href="../../widgets/selectvalidation/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<link href="../../widgets/textareavalidation/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<link href="../../widgets/checkboxvalidation/SpryValidationCheckbox.css" rel="stylesheet" type="text/css" />
<link href="validation.css" rel="stylesheet" type="text/css" media="all" />

<script type="text/javascript" src="../../widgets/textfieldvalidation/SpryValidationTextField.js"></script>
<script type="text/javascript" src="../../widgets/selectvalidation/SpryValidationSelect.js"></script>
<script type="text/javascript" src="../../widgets/textareavalidation/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="../../widgets/checkboxvalidation/SpryValidationCheckbox.js"></script>

</head>

<body><%@include file="includes/head.html" %>
<noscript><h1>This page requires JavaScript. Please enable JavaScript in your browser and reload this page.</h1></noscript>
<div id="wrap">
  <h1>Validation Widgets Demo
  	<span class="return">
  		<a href="../index.html">Back to Demos</a></span><span class="source">
		<a href="source.html">View Source </a>
	</span>
  </h1>
  
 <div id="CentralColumn">
	<div id="articles">
		<form id="form1" name="form1" method="post">
		<div id="formregion">
			
		<div id="theTitle">
			<div class="formLabel">Title:</div>
			<input name="movieName" type="text" id="theMovieTitle" value="Conquistador" />
			<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
			<span class="textfieldRequiredMsg">Please enter a title.</span>
		</div>

		<div id="theRating">
			<div class="formLabel">Rating:</div>
			<select name="Rating" id="movieRating">
				<option value="">Please select</option>
				<option value="5">*****</option>
				<option value="4">****</option>
				<option value="3">***</option>
				<option value="2">**</option>
				<option value="1">*</option>
			</select>
			<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
			<span class="selectRequiredMsg">Please select a rating.</span>
		</div>

		<div id="theDate">
			<div class="formLabel">Date:</div>
			<input name="movieDate" type="text" id="movieYear" value="" />
			<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
			<span class="textfieldRequiredMsg">Please enter a date.</span>
			<span class="textfieldInvalidFormatMsg">Please enter a valid date (mm/dd/yyyy).</span>
		</div>
    
		<div id="theDuration">
			<div class="formLabel">Duration (minutes):</div>
			<input name="movieDuration" type="text" id="movieTime" value="1h 35min" />
			<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
			<span class="textfieldRequiredMsg">Please enter a duration.</span>
			<span class="textfieldInvalidFormatMsg">Please enter a positive number.</span>
		</div>
		
		<div id="theStudio">
			<div class="formLabel">Studio:</div>
			<select name="movieStudio" id="movieStudio">
				<option value="" selected>Please select</option>
				<option value="13Foxes">Thirteen Foxes</option>
				<option value="StudioMartin">Studio Martin</option>
				<option value="Kristal">Kristal</option>
				<option value="NorthEastStars">NorthEast Stars</option>
				<option value="Multiplex">Multiplex</option>
				<option value="ACME">ACME</option>
			</select>
			<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
			<span class="selectRequiredMsg">Please select a studio.</span>
		 </div>

		<div id="theDescription">
		 	<div class="formLabel">Description:</div>
			<table border="0">
			<tr>
				<td valign="top" rowspan="2">
					<textarea name="movieDescription" id="movieDescription" cols="45" rows="5">The story of a historian accompanying Cortez in his quest in the New World.</textarea>
				</td>
				<td valign="top" width="325">				
					<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
					<span class="textareaRequiredMsg">Please enter a description.</span>
					<span class="textareaMinCharsMsg">Please enter at least 20 characters.</span>
				</td>
			</tr>
			<tr>
				<td valign="bottom"><span id="Countvalidta1"> </span> / 180</td>
			</tr>
			</table>
		</div>

		<div id="checkboxes">
			<div class="formLabel">Genre:</div>
			<div id="validcheckbox">
				<label for="checkbox_1">Crime</label>
				<div class="input_container">
						<input type="checkbox" name="movieGenre" id="checkbox_1" value="1"/>
				</div>
			</div>	
			<div id="validcheckbox">
				<label for="checkbox_2">Mystery</label>
				<div class="input_container">
						<input type="checkbox" name="movieGenre" id="checkbox_2" value="2"/>
				</div>
			</div>
			<div id="validcheckbox">
				<label for="checkbox_3">Drama</label>
				<div class="input_container">
						<input type="checkbox" name="movieGenre" id="checkbox_3" value="3"/>
				</div>
			</div>
			<div id="validcheckbox">
				<label for="checkbox_4">Romance</label>
				<div class="input_container">
						<input type="checkbox" name="movieGenre" id="checkbox_4" value="4"/>
				</div>
			</div>
			
			<div id="validcheckbox">
				<label for="checkbox_5">Comedy</label>
				<div class="input_container">
						<input type="checkbox" name="movieGenre" id="checkbox_5" value="5"/>
				</div>
			</div>
			<div id="errors">
				<img src="images/ok.gif" title="Valid" alt="Valid" class="validMsg" border="0"/>
				<span class="checkboxRequiredMsg">Please select at least a genre.</span>
				<span class="checkboxMaxSelectionsMsg">Only maximum 3 genres can be selected.</span>
			</div>
			<br style="clear:both"/>
		</div>
			
		<div class="buttons">
			<input type="submit" name="Submit" id="submit" value="Submit"/>
			<input type="reset" name="Reset" id="reset" value="Reset" />
		</div>
      </form>
    </div>
  </div>
  <div class="ClearAll"> </div>
</div>
</form>

<script type="text/javascript">
<!--
	var theTitle = new Spry.Widget.ValidationTextField("theTitle", "none", {useCharacterMasking:true, validateOn:["change"]});
	var theDate = new Spry.Widget.ValidationTextField("theDate", "date", {useCharacterMasking:true, format:"mm/dd/yyyy", hint:"mm/dd/yyyy", validateOn:["change"]});
	var theDuration = new Spry.Widget.ValidationTextField("theDuration", "integer", {useCharacterMasking:true, validateOn:["change"], allowNegative:false});
	var theRating = new Spry.Widget.ValidationSelect("theRating", {validateOn:["change"]});
	var theStudio = new Spry.Widget.ValidationSelect("theStudio", {validateOn:["change"]});
	var theDescription = new Spry.Widget.ValidationTextarea("theDescription", {useCharacterMasking:true, minChars:20, maxChars:180, counterType:"chars_count", counterId:"Countvalidta1", validateOn:["change"]});
	var checkboxes = new Spry.Widget.ValidationCheckbox("checkboxes", {validateOn:["change"], maxSelections:3});
//-->
</script>
<jsp:include page="includes/copyright.jsp" /></body>
</html>

