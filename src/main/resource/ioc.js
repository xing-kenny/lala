var ioc = {
		dataSource:{
			type:"org.apache.commons.dbcp.BasicDataSource",
			events:{
				depose:"close"
			},
			fields:{
				driverClassName:"com.mysql.jdbc.Driver",
				url:"jdbc:mysql://127.0.0.1:3306/lala?useUnicode=true&characterEncoding=utf-8",
				username:"root",
				password:"root"
			} 
		},	
	dao : {
		type : 'org.nutz.dao.impl.NutDao',
		args : [{refer:'dataSource'}]		
	},
	log : {
		type : 'org.nutz.aop.interceptor.LoggingMethodInterceptor'
	}
	,
	aopTry : {
		type : 'org.kenny.drillmgt.interceptor.AopTryInterceptor'
	}
	,
	$aop : {
		type : 'org.nutz.ioc.aop.config.impl.ComboAopConfigration',
		fields : {
			aopConfigrations  : [
   			   { type : 'org.nutz.ioc.aop.config.impl.JsonAopConfigration',
   				 fields : {
   					itemList : [
   					    ['.+','list','ioc:log'],
   					    ['.+','list','ioc:aopTry']
   					]
   				 } 
   			   },			                     	
			   { type : 'org.nutz.ioc.aop.config.impl.AnnotationAopConfigration'}			                     	
			]
		}	
	}
};