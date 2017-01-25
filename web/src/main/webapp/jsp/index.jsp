<%@ page language="java" import="java.util.*" %> 
<%@ page language="java" import="java.util.regex.*" %> 
<%@ page language="java" import="net.codetojoy.component.WebComponent" %> 
<%@ page language="java" import="net.codetojoy.web.BuildInfo" %> 

<% 
// NOTE: The Jetty plugin doesn't seem to like Pattern (!?)
Pattern regex = Pattern.compile(".*:(\\d\\d\\d\\d).*");
String requestURL = request.getRequestURL().toString();
Matcher matcher = regex.matcher(requestURL);
String backgroundColor = "white";
if (matcher.matches()) {
    Map<String,String> map = new HashMap<String,String>();
    map.put("5150", "#b9fb9d");     // local green    
    map.put("5555", "#fbdb9b");     // DEV tan
    map.put("5566", "#9dc4f9");     // QA blue
    map.put("5577", "#b9fb9d");     // UAT green
    String port = matcher.group(1); 
    if (map.keySet().contains(port)) {
        backgroundColor = map.get(port);
    }
}

String url = WebComponent.TEST_URL;
String jsonBody = WebComponent.TEST_JSON;
String result = new WebComponent().doHTTPPost(url, jsonBody);

String buildInfo = new BuildInfo().toString();
%>

<html>
<body style="background-color:<%= backgroundColor %>;">

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

</body>
</html>
