package com.renren.api.client.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class ConfigUtil {
    private static URL filePath=Thread.currentThread().getContextClassLoader().getResource("");
    private static String fileName = "social.properties";
    public ConfigUtil(){}
    private static Properties props = new Properties(); 
    static{
        try {
        	//modify this
            props.load(ConfigUtil.class.getResourceAsStream("/" + fileName));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static String getValue(String key){
        return props.getProperty(key);
    }

    public static void updateProperties(String key,String value) {    
            props.setProperty(key, value); 
    } 
}
