<%@ page language="java" import="java.util.*" %> 
<%@ page language="java" import="net.codetojoy.component.WebComponent" %> 
<%@ page language="java" import="net.codetojoy.web.BuildInfo" %> 

<% 
String url = WebComponent.TEST_URL;
String jsonBody = WebComponent.TEST_JSON;
String result = new WebComponent().doHTTPPost(url, jsonBody);

String buildInfo = new BuildInfo().toString();
%>

<html>
<h3>HTTP post:</h3>
<p>result     : <%= result %></p>

<hr />

<h3>Build Info:</h3>
<pre>
<%= buildInfo %>
</pre>

<hr />

<h3>Current Time:</h3>
<pre>
<%= new Date() %>
</pre>
</html>
