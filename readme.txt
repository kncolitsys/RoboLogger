1. To install and use robologger, simply place the roboLogger directory in a folder under your web root. Must be under your web root.
Virtual mappings will not work as they break the Ajax Databinding for the reader.

2. RoboLogger consists of two parts, the writer and the reader. They can be used separately or together.

3. Assuming you place robologger in your webroot, the following will setup (aka install robologger)
Add the following to your App.cfc onError method.
<cfset log = createObject("component","robologger.components.roboLog").init()>
<cfset log.logException(exception=arguments.Exception,logType="file",logName="myAplicationErrors",displayFriendlyError=1)>

4. Presently, robologger logs to text files only. DB writing is planned.

5. If you want to use the friendly display, edit the error.cfm in the root to look as you like.

6. To access the reader, simply go to /roboLogger/reader (assuming you installed in the webroot)

7. Future planned features
	a. Reader security
	b. Logging to db
	c. Additional feature request appreciated.