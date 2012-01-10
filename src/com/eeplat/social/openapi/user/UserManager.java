package com.eeplat.social.openapi.user;

import com.exedosoft.plat.DAOUtil;
import com.exedosoft.plat.ExedoException;

public class UserManager {
	
	
	private static  DAOUtil daoUtil = DAOUtil.currentDataSource("/globals.xml");

	public static User storeUser(User aUser) {

		if (aUser == null || aUser.getUserId() == null) {
			return null;
		}

		User existUser = daoUtil.getByProperty(User.class, "user_id",
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
