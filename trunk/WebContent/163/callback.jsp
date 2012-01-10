<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="t4j.*" %>
<%@ page language="java" import="t4j.http.*" %>

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
					out.println("User::" + tblog.verifyCredentials());

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