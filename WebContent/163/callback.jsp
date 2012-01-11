<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="t4j.*" %>
<%@ page language="java" import="t4j.http.*" %>
<%@ page language="java" import="t4j.data.User" %>
<%@ page language="java" import="com.eeplat.social.openapi.user.SocialUser,com.eeplat.social.openapi.user.SocialUserManager" %>

<%
	TBlog tblog = new TBlog();
	
	String verifier=request.getParameter("oauth_token");
	
	if(verifier!=null)
	{
	System.out.println("oauth:"+verifier);
		RequestToken resToken=(RequestToken) session.getAttribute("resToken");

		if(resToken!=null)
		{
	AccessToken accessToken= tblog.getOAuthAccessToken(resToken);
		if(accessToken!=null)
		{
	User currentUser =  tblog.verifyCredentials();
	

	SocialUser user = new SocialUser();
	System.out.println(currentUser);
	user.setUserId(String.valueOf(currentUser.getId()));
	user.setNickName( currentUser.getName() );
	user.setUserName(currentUser.getName());
	user.setLocation(currentUser.getLocation());
	
	
	user.setFigureurl(currentUser.getProfileImageURL());
	user.setFigureurl1(currentUser.getUrl());
	user.setUserDescription(currentUser.getDescription());
	
	
	System.out.print(currentUser.getGender()==0);
	
	System.out.print(currentUser.getGender());
	
	if(currentUser.getGender()==0){
		user.setGender("M");
	}else{
		user.setGender("F");
	}

	user.setOpenSite(SocialUser.OPEN_SITE_163);
	
	System.out.println( "user::" + user);
	SocialUserManager.storeUser(user);

	out.println("Just for a test,您使用网易账号成功登录！");		
		}else
	{
	out.println("请修改回调地址！");
	}
		
		}
		else
	{
	out.println("request token session error");
	}
	}
	else
		{
		out.println("verifier String error");
		}
%>   