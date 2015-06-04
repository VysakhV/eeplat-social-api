把新浪微博、网易、QQ、人人等官方提供的JAVA SDK集中在一起，形成开放SDK集合包。提供统一的开发和使用方式，方便接入。


新浪微博、网易、QQ、人人几乎涵盖了大陆所有的互联网上网人群。用户能使用这些网站的帐号一键登录，无需繁琐的注册过程，为自己的应用带来更多新用户。


## 目标： ##

1，提供更方便的集成登陆，类似（京东商城登陆截图）：

![http://eeplat-social-api.googlecode.com/files/login_tongyi.png](http://eeplat-social-api.googlecode.com/files/login_tongyi.png)


2，为多种开放平台使用统一的访问接口

_QQ并没有提供官方的JAVA SDK，eeplat-social-api为其实现了Auth2.0接口（http://code.google.com/p/connect-qq-oauth2/ ）。_


## 集成登陆功能已经完成： ##

测试地址：

> 简单测试： http://www.eeplat.com/login.jsp

> 集成测试： http://www.eeplat.com

## 如何使用 ##

> ### 要求： ###

> 有JAVA开发背景、对OAuth有一定了解，有微博、网易、QQ、人人等提供的consumerKey,consumerSecret。
> ### 本机测试： ###
> > 打开C:\WINDOWS\system32\drivers\etc\hosts这个文件,修改为如下面：
> > ![http://eeplat-social-api.googlecode.com/files/etc.png](http://eeplat-social-api.googlecode.com/files/etc.png)


> ### 修改consumerKey,consumerSecret参数： ###

> 微博、网易、QQ、人人提供的consumerKey,consumerSecret都被集中配置到social.properties文件里面，所以你只要修改这个文件就可以了，如下图：
> > ![http://eeplat-social-api.googlecode.com/files/social.png](http://eeplat-social-api.googlecode.com/files/social.png)


> ### 简单统一的开发方式： ###
> eeplat-social-api没有集成微博、网易、QQ、人人必须依赖lib之外的任何包，没有用servlet，所以非常方便集成使用。微博、网易、QQ、人人都统一使用call.jsp 发送请求， callback接收回调。如下图：

> ![http://eeplat-social-api.googlecode.com/files/tongyi.png](http://eeplat-social-api.googlecode.com/files/tongyi.png)


> ### 扩展使用，把用户持久化到数据库： ###

> 提供了一个分支 https://eeplat-social-api.googlecode.com/svn/branches/usermanager ，可以把用户统一持久化到账号表里面，对另外一个项目http://code.google.com/p/eeplat/ 提供的JAR包有依赖，仅提供一个参考，你可以使用自己熟悉的技术，如hibernate等。


## 下载： ##

> 推荐使用SVN下载，也可以下载压缩包。

> Openid集成登录Eclipse工程（推荐下载）：

> http://eeplat-social-api.googlecode.com/files/eeplat-social-api.zip


> Openid集成登录Eclipse工程，包含用户数据库的持久化：

> http://eeplat-social-api.googlecode.com/files/eeplat-social-api-um.zip


> QQ登陆OAuth2.0登录Eclipse工程：

> http://eeplat-social-api.googlecode.com/files/connect-qq-oauth2.zip


## 下列为开放平台提供的文档地址： ##

新浪微博：

> http://open.weibo.com/

> http://code.google.com/p/weibo4j/

网易：

> http://open.t.163.com/wiki/index.php

> http://code.google.com/p/t-163-open-java-api/

QQ:

> http://connect.qq.com/

> http://code.google.com/p/connect-qq-oauth2/ （eeplat-social-api的副产品）


人人：

> http://wiki.dev.renren.com/wiki/SDK


## 参与讨论： ##

> QQ群号：105867861

> 新浪微博：http://t.sina.com.cn/weikx

