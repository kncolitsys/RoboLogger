<!--- Load our header using dynamic path --->
<cfmodule template="#application.rootDirectory#/customtags/header.cfm">

<cfajaximport tags="cfdiv,cfform,cfgrid">

<cfparam name="qLogList" default="#QueryNew("id,directory,name,size")#">

<script language="javascript">
	submitForm = function(TargetURL,returnDiv,formID){
		ColdFusion.navigate(TargetURL,returnDiv,'','','POST',formID);		
	}
</script>


<div id="mainBody">
	<div id="topRow">
		<cfdiv id="formLogList">
			<cfoutput>
				<cfform id="logList" name="logList" format="html" >
					<div style="position:absolute;left:10px;top:10px;">
						<cfinput type="text" name="logDir" required="true" message="Please enter a valid log directory path." size="30"  value="Enter path to log file">
						<a href="javascript:submitForm('logList.cfm','logListResults','logList');"><img src="#application.rootDirectory#/images/go.gif" border="0" align="absmiddle"></a>
					</div>
					<div style="position:absolute;left:272px;top:2px;">
						<a href="javascript:robo_toggleDiv('logHelp','helpbutton','#application.rootDirectory#/images/help');"><img src="#application.rootDirectory#/images/help_def.gif" name="helpbutton" border="0" alt="Toggle Help Display"></a>
					</div>
					<!--- Comment: What is this for?? /Applications/JRun4/servers/myfarcry/cfusion.ear/cfusion.war/WEB-INF/cfusion/logs --->
				</cfform>
			</cfoutput>
		</cfdiv>
	</div>
	<div id="logHelp">
		<div class="divBody">
			<h3>Help</h3>
			<p>How to read log files: Enter path to log files and click "Go"...</p>
			<p>Code usage: </p>
			<p>A cornpie production.</p>
			<br />
		</div>
		<div class="divFooter"></div>
	</div>	
		
	<table id="mainTable">
		<tr>
			<td valign="top">
				<div class="listHeader">
					<div class="rowHeader">Logs</div>
					<div style="position:absolute;left:751px;top:0px;">
						<cfoutput>
							<a href="javascript:robo_toggleDivSize('logListResults','listDivButton','#application.rootDirectory#/images/divToggle');"><img src="#application.rootDirectory#/images/divToggle_def.gif" name="listDivButton" border="0" alt="Toggle Help Display"></a>
						</cfoutput>
					</div>
				</div>
				<cfdiv id="logListResults">
				</cfdiv>
				
				<div class="listHeader">
					<div class="rowHeader">Log Entries</div>
					<div style="position:absolute;left:751px;top:0px;">
						<cfoutput>
							<a href="javascript:robo_toggleDivSize('logListDetails','listEntryDivButton','#application.rootDirectory#/images/divToggle');"><img src="#application.rootDirectory#/images/divToggle_def.gif" name="listEntryDivButton" border="0" alt="Toggle Help Display"></a>
						</cfoutput>
					</div>
				</div>
				<cfdiv id="logListDetails"></cfdiv>
				
				<div class="listHeader">
					<div class="rowHeader">Error Detail</div>
					<div style="position:absolute;left:751px;top:0px;">
						<cfoutput>
							<a href="javascript:robo_toggleDivSize('logRowDetails','rowDetailDivButton','#application.rootDirectory#/images/divToggle');"><img src="#application.rootDirectory#/images/divToggle_def.gif" name="rowDetailDivButton" border="0" alt="Toggle Help Display"></a>
						</cfoutput>
					</div>
				</div>
				<cfdiv id="logRowDetails">
				</cfdiv>
			</td>
		</tr>
	</table>
</div>
<div id="bottomRow"></div>
<!--- Load our footer using dynamic path --->
<cfmodule template="#application.rootDirectory#/customtags/footer.cfm">

