<cfcomponent displayname="logWriter" output="false">
	<cffunction name="init" access="public" output="false" returntype="logWriter">
		<cfset variables.serializer = createObject("component","serializer")>
		<cfreturn this />
	</cffunction>
	<cffunction name="logFileEvent" access="package" output="false">
		<cfargument name="exception" required="true" type="any">
		<cfargument name="logName" required="false" default="#application.applicationName#_ERRORS" type="string">
		
		<cfset var serializedData = variables.serializer.serialize(arguments.exception)>
		<cfset var message = "">
		<cfset var detail = ""> 
		<cfif structKeyExists(arguments.exception,"message")>
			<cfset message = arguments.exception.message>
		</cfif>
		<cfif structKeyExists(arguments.exception,"detail")>
			<cfset detail = arguments.exception.detail>
		</cfif>

		<cflog file="#arguments.logName#" type="error" text="<!|090|!>#message#<!|090|!>#detail#<!|090|!>#serializedData#">		

		<cfreturn />	
	</cffunction>
</cfcomponent>