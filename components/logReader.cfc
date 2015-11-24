<cfcomponent displayname="logReader" output="false">
	<cffunction name="init" access="public" output="false" returntype="logReader">
		<cfset variables.serializer = createObject("component","serializer")>
		<cfreturn this />
	</cffunction>
	<cffunction name="readEvent" access="package" output="false">
		<cfargument name="exception" required="true" type="any" default="">
		<cfset var e = variables.serializer.deserialize(arguments.exception)>		
		<cfreturn e>			
	</cffunction>
	
	<cffunction name="getLogList" access="package" output="false">
		<cfargument name="logDirectory" required="true" type="string">
		<cfset var logList = queryNew("")>
		
		<cfdirectory action="list" directory="#arguments.logDirectory#" name="logList">

		<cfreturn logList>

	</cffunction>

<!--- 	<cffunction name="getLogDetails" access="package" output="false">
		<cfargument name="logDirectory" required="true" type="string">
		<cfset var logList = queryNew("")>
		
		<cfdirectory action="list" directory="#arguments.logDirectory#" name="logList">

		<cfreturn logList>

	</cffunction>
 --->
	<cffunction name="getLogEntries" access="package" output="false">
		<cfargument name="dir" required="true" type="string">
		<cfargument name="file" required="true" type="string">
		<cfset var qLogFile = queryNew("")>
		<cfset var details = "">		
		<cffile action="read" file="#arguments.dir#/#arguments.file#" variable="details">
		<cfif Len(details)>
			<cfset qLogFile = convertToQuery(ListToArray(details,chr(10)))>
		</cfif>
		<cfreturn qLogFile>
	</cffunction>

	<cffunction name="convertToQuery" access="private" output="false">
		<cfargument name="inArray" type="array" required="true">
		<cfset var qRet = queryNew("")>
		<cfset queryAddColumn(qRet,"logEntries","VarChar",arguments.inArray)>
		<cfreturn qRet>
	</cffunction>

</cfcomponent>