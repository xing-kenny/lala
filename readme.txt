a nutz demo.
base on nutzdemo,git://github.com/nutzam/nutzdemo.git .
thanks! 
-------------------------------------------------------
** Dao
-------------------------------------------------------
* database��MySQL5.1
* Dao�����ַ�ʽ
      ��ʽһ��
    @IocBean
	public class BasicDao {
	
		@Inject
		protected Dao dao;
      ��ʽ������Module��ע��
* ����
  	@Id
	private int id;
* �������ֹ����� + @Next + @Prev
          
	public class Project implements Serializable {
	
		@Next(@SQL("select max(id) from t_project"))
		@Prev(@SQL("select max(id) + 1 from t_project"))
		@Id(auto = false)
		private int id;
      
* fastInsert
			if (plan.getId() != 0) {
				basicDao.update(plan);
			} else {
				dao.fastInsert(plan);// basicDao.save(plan);
			}
* ��ҳ��ѯ
	Util.getPageModel(Project.class, currentPage, basicDao)
* ʹ����ͼ
	@Table("t_Project")
	@View("v_project")
	public class Project implements Serializable {
	
	@Column
	@Readonly	//come from View
	private float actualMandays = 0.0f;

* �����ֶΡ�����ģ��
		FieldFilter.create(Project.class, "^id|status$").run(new Atom() {
			public void run() {
				Project p = basicDao.find(id, Project.class);
				p.setStatus(SystemContext.PROJECT_STATUS_DONE);
				basicDao.update(p);

			}
		});

* һ��һ��һ�Զࡢ��Զ�
  ...	
* �Զ���SQL
				Sql sql = Sqls.create("update t_course set status = " + o.getStatus()
						+ " where planId = " + id);
				dao.execute(sql);

-------------------------------------------------------
** Ioc
-------------------------------------------------------
* ���ϼ�����
	@IocBy(type = ComboIocProvider.class, args = {
			"*org.nutz.ioc.loader.json.JsonLoader", "ioc.js",
			"*org.nutz.ioc.loader.annotation.AnnotationIocLoader",
			"org.kenny.drillmgt" })
	public class MainModule {

* �¼�����
		dataSource:{
			type:"org.apache.commons.dbcp.BasicDataSource",
			events:{
				depose:"close"
			},
	
-------------------------------------------------------
** AOP
-------------------------------------------------------
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
	
	@Aop({ "log" })
	public Account doLogin(@Param("loginName") String loginName,

-------------------------------------------------------
** MVC
-------------------------------------------------------
* web.xml����ģ��
	<filter>
		<filter-name>nutz</filter-name>
		<filter-class>org.nutz.mvc.NutFilter</filter-class>
		<init-param>
			<param-name>modules</param-name>
			<param-value>org.kenny.drillmgt.MainModule</param-value>
		</init-param>
		<init-param>
			<param-name>ignore</param-name>
			<param-value>^(.+[.])(jsp|png|gif|jpg|js|css|jspx|jpeg|html)$</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>nutz</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>

* ��ģ�顢�Զ�����
	@Modules(value = { AccountModule.class }, scanPackage = true)
* ��ں���

	@IocBean
	@InjectName
	@At("/plan")
	public class PlanModule extends BaseModule {

		@At("/save")
		@Ok("jsp:views.plans")
		@Fail("jsp:views.planForm")
		public void save(@Param("::plan.") Plan plan, HttpServletRequest req)
				throws Exception {
	
* formBean
  	public void save(@Param("::plan.") Plan plan, HttpServletRequest req)
* ���ػ��ַ���
	@Localization("msg")
	public class MainModule {
* ������
	@Filters(@By(type = CheckSession.class, args = { "me", "/" }))
	public class MainModule {
	
		@At({ "/", "/logout" })
		@Ok("jsp:views.login")
		@Filters
		public String doIdx(HttpServletRequest req) {
	  
	@Filters
	public Account doLogin(@Param("loginName") String loginName,
			@Param("password") String password, HttpServletRequest req)
			throws Exception {

* REST
	��һ
	@At("/update/?")
	@Ok("jsp:views.accountForm")
	public void update(int id, HttpServletRequest req) {

	����
	@At("/delete/?/projectId/?")
	@Ok("jsp:views.plans")
	@Fail("jsp:views.plans")
	public void delete(int id, int projectId,
			HttpServletRequest req) {
	

-------------------------------------------------------
** JSP
-------------------------------------------------------
* taglib
  SecurityTag
  refer security.tld
	<security:check permission="2000"> 
		<li><a href="javascript:load('${ctx}/dept/list?currentPage=1');">���Ź���</a></li>
	</security:check>
   







      
      
      
         