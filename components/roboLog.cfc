<cfcomponent displayname="log4cf" output="false">
	<cffunction name="init" access="public" output="false" returntype="roboLog">
		<cfset variables.logWriter = createObject("component","logWriter").init()>
		<cfset variables.logReader = createObject("component","logReader").init()>
		<cfreturn this />
	</cffunction>
	<cffunction name="logException" access="public" output="true">
		<cfargument name="exception" required="true" type="any">
		<cfargument name="logType" required="false" default="file" type="string" hint="file|db">
		<cfargument name="logName" required="false" default="#application.applicationName#_ERRORS" type="string">
		<cfargument name="displayFriendlyError" required="false" default="0">
		<cfset var logWriter = variables.logWriter>
		<cfset var local = structNew()>

		<cfswitch expression="#arguments.logType#">
			<cfcase value="file">
				<cfset local.retLog = logWriter.logFileEvent(exception=arguments.exception,logName=arguments.logName)>								
			</cfcase>			
		</cfswitch>
		<cfif arguments.displayFriendlyError>
			<cfinclude template="/robologger/error.cfm">
		</cfif>
		<cfreturn />
	</cffunction>

	<cffunction name="readException" access="public" output="false">
		<cfargument name="exception" type="string" required="true">
		<cfset var e = variables.logReader.readEvent(arguments.exception)>
		<cfreturn e>
	</cffunction>

	<cffunction name="readLog" access="remote" output="true">
		<cfargument name="dir" type="string" required="true">
		<cfargument name="file" type="string" required="true">
        <cfargument name="page">
        <cfargument name="pageSize">
        <cfargument name="gridsortcolumn">
        <cfargument name="gridsortdirection">
		<cfset var i = init()>
		<cfset var logEntries = variables.logReader.getLogEntries(arguments.dir,arguments.file)>
		<cfreturn QueryConvertForGrid(logEntries,page,pageSize)>
	</cffunction>
	
	<cffunction name="logList" access="remote" output="true">
		<cfargument name="logDir" type="string" required="true">
        <cfargument name="page">
        <cfargument name="pageSize">
        <cfargument name="gridsortcolumn">
        <cfargument name="gridsortdirection">
		<cfset var i = init()>
		<cfset var logList = variables.logReader.getLogList(arguments.logDir)>
		<cfreturn QueryConvertForGrid(logList,page,pageSize)>
	</cffunction>

</cfcomponent>