package com.eeplat.social.openapi.user;

import com.exedosoft.plat.DAOUtil;
import com.exedosoft.plat.ExedoException;

public class SocialUserManager {
	
	
	private static  DAOUtil daoUtil = DAOUtil.currentDataSource("/globals.xml");

	public static SocialUser storeUser(SocialUser aUser) {

		if (aUser == null || aUser.getUserId() == null) {
			return null;
		}

		SocialUser existUser = daoUtil.getByProperty(SocialUser.class, "user_id",
				aUser.getUserId());

		if (existUser == null) {
			try {
				existUser = daoUtil.store(aUser);
			} catch (ExedoException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return existUser;
	}
	
	public static void main(String[] args){
		
		
	}

}
