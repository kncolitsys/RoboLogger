<cfajaxproxy bind="javascript:logNameGridChange({listDetails.Directory},{listDetails.Name})">

<script language="javascript">
	logNameGridChange = function(){
		submitForm('logDetail.cfm','logListDetails','logListDetailsForm');
	}
</script>
<div class="divBody">
	<cfform id="logListDetailsForm" name="logListDetailsForm" format="html">
		<cfgrid format="html" name="listDetails" bind="cfc:robologger.components.roboLog.logList({logDir},{cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})" width="750" pagesize="5" selectOnLoad="false" selectmode="row" onChange="selectedLog">
			<cfgridcolumn width="300" name="Directory">		
			<cfgridcolumn width="175" name="Name">		
			<cfgridcolumn width="75" name="Size">		
			<cfgridcolumn width="200" name="DateLastModified">		
		</cfgrid>
	</cfform>
</div>
<div class="divFooter"></div>


