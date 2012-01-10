/*
Copyright (c) 2012, Weikexin eeplat.com
Released under the MIT license.
http://www.opensource.org/licenses/mit-license.php
 */
package com.eeplat.social.openapi.renren;

import com.eeplat.social.openapi.callback.GlobalConfig;
import com.renren.api.client.RenrenApiConfig;

/**
 * Wrapper Redirect Url Helper Class for RenRen
 * 
 * @author Weikexin
 * 
 */
public class URIUtil {
	public static final String RENREN_ADDRESS = "https://graph.renren.com/oauth/authorize";

	/**
	 * RenRen's redirectUrl is combination of response_type,display,client_id
	 * and redirect_uri.
	 * 
	 * @param redirectUri
	 * @return wrapped uri
	 */
	public static String wrappRedirectUri() {

		StringBuffer sb = new StringBuffer(RENREN_ADDRESS);
		sb.append("?response_type=code&display=page&client_id=")
				.append(RenrenApiConfig.renrenAppID).append("&redirect_uri=")
				.append(GlobalConfig.getCallBack("renren.cb"));
		return sb.toString();
	}

}
