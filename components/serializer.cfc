<!---
The MIT License

Copyright (c) 2008 Stretford Interactive Consulting Services, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Created:  		3/9/2008
Created By:  	Andrew Powell (andy.powell@mac.com)
Modified By:	Andrew Powell (andy.powell@mac.com)
Modified:		3/9/2008

Modified By: 	Jason Betz
Modified:		4/5/2008
--->
<cfcomponent output="false">

	<cffunction name="serialize" access="public" returntype="string" output="false" hint="Serializes a given variable to a string">
		<cfargument name="input" type="any" required="true"/>
		<cfset var byteOut = CreateObject("java", "java.io.ByteArrayOutputStream")>
		<cfset var objOut = CreateObject("java", "java.io.ObjectOutputStream")>
		<cfset var e = "">	
		
		<cfset byteOut.init()>
		<cfset objOut.init(byteOut)>
	
		<cftry>
			<cfset objOut.writeObject(arguments.input)>
			<cfcatch type="java.io.NotSerializableException">
			</cfcatch>
		</cftry>

		<cfreturn ToBase64(byteOut.toByteArray())>
		
	</cffunction>
	
	<cffunction name="deserialize" access="public" returntype="Any" output="false" hint="Deserializes a string to it's original variable">
		<cfargument name="input" type="string" required="true"/>
		<cfset var byteIn = CreateObject("java", "java.io.ByteArrayInputStream")>
		<cfset var objIn = CreateObject("java", "java.io.ObjectInputStream")>

		<cfset byteIn.init(toBinary(arguments.input))>
		<cfset objIn.init(byteIn)>
		<cfreturn objIn.readObject()>
	</cffunction>

</cfcomponent>