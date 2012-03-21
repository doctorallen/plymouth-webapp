<script>
var currentTime = new Date()
var startTime= new Date();

$(function(){
	$( "#startdate , #enddate" ).datepicker({ minDate: currentTime });
	
	//When the startdate changes enddates dates are blocked out from those dates and the new date is changed to the start date(if it was below the new start date) 
	$( "#startdate" ).change(function (){
		var startTime = ($("#startdate").val());
		$("#enddate").datepicker('option','minDate',startTime);

	});
	
	//$( "#enddate" ).datepicker({ minDate: currentTime });
});

</script>
{include file="status.tpl"}
{box size="16" title="Event Information"}
<form class="label-left" name ="event_info" method="POST" action="{$PHP.BASE_URL}/reserve/event">
          <ul>
<li>
          	<h4>Contact Information:</h4>
          </li>

          <li>
          	<label class="required">First Name:<em>*</em></label>
          	<input type="text" name="first_name" size="25" value="{$user->first_name}"></input>
          </li>

          <li>  
          	<label class="required">Last Name:<em>*</em></label>
          	<input type="text" name="last_name" size="25" value="{$user->last_name}">
          </li>

          <li>
          	<label class="required">Phone Number:<em>*</em></label>
          	<input id="phone" type="text" name="phone" size="14">
          </li>
		<li>
          	<label>Secondary Phone Number(Cell):</label>
          	<input id="phone" type="text" name="secondary_phone" size="14">
          </li>

          <li>
          	<label class="required">Campus Email:<em>*</em></label>
          	<input type="email" name ="email" value="{$user->wp_email}"> <!-- wp_email -->
		</li>
            <li>
              <h4>Event Information: </h4>
            </li>
            <li>
              <label class="required">Event Title or Course Number and Section:<em>*</em></label>
              <input type="text" name="title" size="25">
            </li>
            <li>
              <label class="required">Location:<em>*</em></label>
			{html_options name=location options=$locations}
		  </li>
		  <li>
		    <label class="required">Room Number:<em>*</em></label>
              <input type="text" name="room" size="5">
            </li>
            <li>
             <label>Purpose, Details or Comments:</label>
             <textarea  name="comments" rows="5" cols="40"></textarea>
            </li>
		  <li>
		  	<label class="required">Event Start:<em>*</em></label>
		  	<input id="startdate" type="text" name="start_date" readonly="true"> at 
			<select name="starthour">
			{section name=starthours start=1 loop=13}

				<option value="{$smarty.section.starthours.index}">{$smarty.section.starthours.index}</option>
			{/section}
			
			</select>
			:
			<select name="startminute">
			{section name=startminutes start=00 loop=60 step=5}

				<option value="{$smarty.section.startminutes.index}">{$smarty.section.startminutes.index|string_format:"%02d"}</option>
			{/section}
			
			</select>
			-
			<select name="startampm">
				<option>AM</option>
				<option>PM</option>
			</select>
		  </li>
		  <li>
		  	<label class="required">Event End:<em>*</em></label>
		  	<input id="enddate" type="text" name="end_date" readonly="true"> at
			<select name="endhour">
			{section name=endhours start=1 loop=13}

				<option value="{$smarty.section.endhours.index}">{$smarty.section.endhours.index}</option>
			{/section}
			
			</select>
			:
			<select name="endminute">
			{section name=endminutes start=00 loop=60 step=5}

				<option value="{$smarty.section.endminutes.index}">{$smarty.section.endminutes.index|string_format:"%02d"}</option>
			{/section}
			
			</select>
			-
			<select name="endampm">
				<option>AM</option>
				<option>PM</option>
			</select>
		   </li>
		   <li>
		<input type="radio" id="equipment" name="radio" value="equipment" checked="true"/>I will pick up and return the equipment to the learning Commons Information Desk in Lamson Library
		  </li>
		  <li>
			<input type="radio" id="sponsored" name="radio" value="sponsored" />I will need the Classrom Technology Staff to deliver and retrieve the equipment at the location specified
		  </li>
		  <li>
              <input type="Submit" name="Submit_event" value="Proceed to Equipment Choice">
            </li>
  </ul>
</form>
{/box}
