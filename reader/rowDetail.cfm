<cfset logEntry = structNew()>
<cfset variables.details = form.detailedError>

<cfset logEntry["Raw Entry"] = variables.details>

<cfif FindNoCase("<!|090|!>",variables.details)>
	<cfset variables.roboLogger = createObject("component","robologger.components.roboLog").init()>
	<cfset aMyArray = variables.details.split("\<\!\|090\|\!\>")>
	<cfset logEntry["Time Stamp"] = aMyArray[1]>
	<cfset logEntry["Message"] = aMyArray[2]>
	<cfset logEntry["Detail"] = aMyArray[3]>
	<cfset logEntry["Full Dump"] = variables.roboLogger.readException(ReReplaceNoCase(aMyArray[4],"""","","all"))>
</cfif>

<div class="divBody">
	<cfoutput>
	<h2>Item Details<Br></h2>
	<table border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td valign="top">Message</td>
			<td valign="top">#logEntry.message#</td>
		</tr>
		<tr>
			<td valign="top">Detail</td>
			<td valign="top">#logEntry.detail#</td>
		</tr>
		<tr>
			<td valign="top">Time Stamp</td>
			<td valign="top">#logEntry['time stamp']#</td>
		</tr>
		<tr>
			<td valign="top">Full Dump</td>
			<td valign="top">#logEntry['Full Dump']#</td>
		</tr>
	</table>
	</cfoutput>
</div>
<div class="divFooter"></div>

