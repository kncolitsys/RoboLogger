<cfajaxproxy bind="javascript:logDetailsFormChange({itemDetails.logEntries})">

<script language="javascript">
	logDetailsFormChange = function(logEntries){
		document.getElementById("detailedError").value = logEntries;
		submitForm('rowDetail.cfm','logRowDetails','logDetailsForm');
	}
</script>
<div class="divBody">
	<cfform id="logDetailsForm" name="logDetailsForm" format="html">
		<cfgrid format="html" name="itemDetails" bind="cfc:robologger.components.roboLog.readLog({listDetails.directory},{listDetails.name},{cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})" width="750" pagesize="5" selectOnLoad="false" selectmode="row" onChange="selectedLog">
			<cfgridcolumn width="750" name="logEntries" >		
		</cfgrid>
		<cfinput type="hidden" id="detailedError" name="detailedError" value="">
	</cfform>
</div>
<div class="divFooter"></div>