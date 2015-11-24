<cfcomponent displayname="Application" output="true" hint="Handle the application.">

	<cfset this.applicationName = "RoboLogger">

	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" hint="Fires when the application is first created.">
		<cfset application.rootDirectory = "/robologger">
		<cfreturn true />
	</cffunction>

	<cffunction name="OnSessionStart" access="public" returntype="void" output="false" hint="Fires when the session is first created.">
		<cfreturn />
	</cffunction>

	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="true" hint="Fires at first part of page processing.">
		<cfargument name="TargetPage" type="string" required="true" />				
		<cfreturn true  />
	</cffunction>
 
	<cffunction name="OnRequestEnd" access="public" returntype="void" output="true" hint="Fires after the page processing is complete.">
		<cfreturn />
	</cffunction>

	<cffunction name="OnSessionEnd" access="public" returntype="void" output="false" hint="Fires when the session is terminated.">
		<cfargument name="SessionScope" type="struct" required="true" />
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		<cfreturn />
	</cffunction>

	<cffunction name="OnApplicationEnd" access="public" returntype="void" output="false" hint="Fires when the application is terminated.">
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		<cfreturn />
	</cffunction>

	<cffunction name="OnError" access="public" returntype="void" output="true" hint="Fires when an exception occures that is not caught by a try/catch.">
		<cfargument name="Exception" type="any" required="true" />
		<cfargument name="EventName" type="string" required="false" default="" />
		
		<cfset var strError = "">
		<!--- if timeout error, tack on an extra 3 seconds to write the log --->
		<cfsetting requesttimeout="#(GetRequestTimeout() + 3)#" />
		<cfif find("coldfusion.runtime.RequestTimedOutException",arguments.exception.StackTrace)>
			<cfoutput>Your request timed out.</cfoutput>
		<cfelse>
			<cfset log = createObject("component","robologger.components.roboLog").init()>
			<cfset log.logException(exception=arguments.Exception,logType="file",logName="robologgerErrors",displayFriendlyError=1)>		

		</cfif>

		<cfreturn />
	</cffunction>
	
	<cffunction name="GetRequestTimeout" access="public" returntype="numeric" output="false" hint="Returns the current request timeout for the current page page request.">
		<cfset var LOCAL = StructNew() />
		<cfset LOCAL.RequestMonitor = CreateObject("java", "coldfusion.runtime.RequestMonitor") />
		<cfreturn LOCAL.RequestMonitor.GetRequestTimeout() />
	</cffunction>

</cfcomponent>