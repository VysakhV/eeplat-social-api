<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="java.util.HashMap,java.util.Map,java.util.UUID" %>
<%@ page language="java" import="org.json.simple.JSONArray,org.json.simple.JSONObject,org.json.simple.JSONValue" %>
<%@ page language="java" import="com.renren.api.client.param.impl.AccessToken,com.renren.api.client.RenrenApiClient,com.renren.api.client.utils.HttpURLUtils,com.renren.api.client.RenrenApiConfig" %>
<%@ page language="java" import="com.eeplat.social.openapi.callback.GlobalConfig" %>


<%
	
String code = request.getParameter("code");

//到人人网的OAuth 2.0的token endpoint用code换取access token
String rrOAuthTokenEndpoint = "https://graph.renren.com/oauth/token";
Map  parameters = new HashMap();
parameters.put("client_id", RenrenApiConfig.renrenApiKey);
parameters.put("client_secret", RenrenApiConfig.renrenApiSecret);
parameters.put("redirect_uri", GlobalConfig.getCallBack("renren.cb"));
                      //这个redirect_uri要和之前传给authorization endpoint的值一样
parameters.put("grant_type", "authorization_code");
parameters.put("code", code);
String tokenResult = HttpURLUtils.doPost(rrOAuthTokenEndpoint, parameters);
JSONObject tokenJson = (JSONObject) JSONValue.parse(tokenResult);
if (tokenJson != null) {
	
	
	String accessToken = (String) tokenJson.get("access_token");
	AccessToken at = new AccessToken(accessToken);
	

	RenrenApiClient apiClient = new RenrenApiClient(accessToken, true); 

	
	int rrUid = apiClient.getUserService().getLoggedInUser(at); 
	JSONArray userInfo = apiClient.getUserService().getInfo(String.valueOf(rrUid),at); 
	if (userInfo != null && userInfo.size() > 0)
	{ 
		JSONObject currentUser = (JSONObject) userInfo.get(0);
		out.println("CurrentUser:::" + currentUser);
	}
	
	out.println("<br/>Just for a test,您使用RenRen账号成功登录！");
	
}else{
	
	out.println("请修改回调地址!");
}

%>   