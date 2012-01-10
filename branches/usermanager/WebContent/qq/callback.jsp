<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.eeplat.social.openapi.http.HttpClient" %>
<%@ page language="java" import="com.eeplat.social.openapi.http.Response" %>
<%@ page language="java" import="com.eeplat.social.openapi.qq.AuthUtil" %>
<%@ page language="java" import="com.eeplat.social.openapi.qq.URIUtil" %>
<%
	String oauth_code = request.getParameter("code");

    String accessToken = AuthUtil.getAccessToken(oauth_code);
    
    String openid = AuthUtil.getOpenID(accessToken);
    
    out.println("UserInfo:::" +  AuthUtil.getUserInfo(accessToken,openid) );
    
 	out.println("Just for a test,您使用QQ成功登录！");
%>   