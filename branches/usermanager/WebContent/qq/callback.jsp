<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.eeplat.social.openapi.http.HttpClient" %>
<%@ page language="java" import="com.eeplat.social.openapi.http.Response" %>
<%@ page language="java" import="com.eeplat.social.openapi.qq.AuthUtil" %>
<%@ page language="java" import="com.eeplat.social.openapi.qq.URIUtil" %>
<%@ page language="java" import="org.json.JSONObject" %>
<%@ page language="java" import="com.eeplat.social.openapi.user.SocialUser,com.eeplat.social.openapi.user.SocialUserManager" %>
<%
	String oauth_code = request.getParameter("code");

    String accessToken = AuthUtil.getAccessToken(oauth_code);
    
    String openid = AuthUtil.getOpenID(accessToken);
    
    JSONObject currentUser = AuthUtil.getUserInfo(accessToken,openid);

	System.out.println("CurrentUser:::" + currentUser);
	SocialUser user = new SocialUser();
	user.setUserId(openid);
	user.setNickName((String)currentUser.get("nickname"));
	user.setFigureurl((String)currentUser.get("figureurl"));
	user.setFigureurl1((String)currentUser.get("figureurl1"));
	user.setFigureurl2((String)currentUser.get("figureurl2"));
	if("男".equals(currentUser.get("gender"))){
		user.setGender("M");
	}else{
		user.setGender("F");
	}
	user.setOpenSite(SocialUser.OPEN_SITE_QQ);
	SocialUserManager.storeUser(user);
    
 	out.println("Just for a test,您使用QQ成功登录！");
%>   