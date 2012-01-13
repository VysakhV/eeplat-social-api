<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="weibo4j.http.*" %>
<%@ page language="java" import="weibo4j.*" %>

<%
	
	String verifier=request.getParameter("oauth_verifier");
	Weibo weibo = new Weibo();
	if(verifier!=null)
	{
		RequestToken resToken=(RequestToken) session.getAttribute("resToken");

		if(resToken!=null)
		{
			AccessToken accessToken=weibo.getOAuthAccessToken(resToken,verifier);
				if(accessToken!=null)
				{
				
					System.out.println("UserID:::" + accessToken.getUserId());
					System.out.println("Nick Name:::" + accessToken.getScreenName());
					out.println("UserInfo:::" + weibo.verifyCredentials());
					
					out.println("<br/>Just for a test,您使用新浪微博成功登录！");				
				}else
					{
					out.println("access token request error");
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