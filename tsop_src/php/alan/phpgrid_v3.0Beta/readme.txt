关于PHPGRID

PHPGRID是一个用于快速开发MIS系统(如ERP,CRM,HR)，网站后台，演示程序的PHP类库，
PHPGRID不仅具有数据添加编辑删除的基本功能，还具有表单自动生成，排序，分页，查询，权限设定，缓存的功能，而且这些功能是可定制的。
对于特殊或则复杂的业务的需求，您只需编写少量的代码来继承于PHPGRID。


环境要求
PHP运行环境，并安装Mysql函数或PDO扩展
MYSQL数据库，支持Mysql3.2以上版本



如何安装Phpgrid3.0
将Phpgrid3.0压缩包释放到你的PHP程序目录，在你需要的地方引入Datagrid.php，
详细使用请参考examples下的例子或查看用户手册

如何运行examples中例子
步骤：
在MYSQL数据库中建立任意一个数据库，
然后在该数据库下执行example_sql.txt中的SQL语句，将数据导入到该库，
接着修改config.inc.php的数据库连接项，
最后在浏览器中访问example的文件。


文件结构说明
   phpgrid3.0beta
   |
   |-...
   |
   +--cache			存放缓存目录			
   +--js          		Javascript目录  	   
   +--css			Css样式目录，用于控制界面的皮肤                      
   +--examples			一些典型的例子                  	 
   +--images                      
   +--lang			语言包，支持多国语言
   +--uploadfiles		默认的文件上传目录，你可以在代码指定另外一个目录			
   |-...
   |-config.inc.php		全局配置文件，主要设置数据库连接，时区和语言
   |-Dataview.php		Phpgrid3.0的基类文件，该类只是显示一个表格，类似ASP.NET的dataview
   |-Datagrid.php		Phpgrid3.0的核心文件，继承于Dataview，具有Dataview全部和附件特性
   |-Mysql.php			连接MYSQL的类库，支持PDO和MYSQL函数，如果安装了PDO扩展那么将不使用MYSQL函数

使用手册参见http://phpgrid.sf.net的文档






