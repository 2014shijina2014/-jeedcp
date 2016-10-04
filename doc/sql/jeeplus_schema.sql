-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.96-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema jeeplus_schema
--

CREATE DATABASE IF NOT EXISTS jeeplus_schema;
USE jeeplus_schema;

--
-- Definition of table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(64) default NULL COMMENT '事件标题',
  `starttime` varchar(64) character set latin1 default NULL COMMENT '事件开始时间',
  `endtime` varchar(64) character set latin1 default NULL COMMENT '事件结束时间',
  `allday` varchar(64) character set latin1 default NULL COMMENT '是否为全天时间',
  `color` varchar(64) character set latin1 default NULL COMMENT '时间的背景色',
  `userid` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历';

--
-- Dumping data for table `calendar`
--

/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` (`id`,`title`,`starttime`,`endtime`,`allday`,`color`,`userid`) VALUES 
 ('343ed3c7486f41298a9bc9df342b8d27','sss','2016-04-27','','1','#f30','1'),
 ('74b3da86093c4d8eb3a95093d6c8b212','333','2016-05-04','','1','#06c','1'),
 ('ac9d77bb842a4e7f9afb55d26e8fd51d','上午开会','2016-04-05 08:00:00','2016-04-05 12:00:00','0','#f30',NULL),
 ('d468d4f2982e409280c1d328d9f3d1c0','一起吃饭','2016-04-21','','1','#360',NULL),
 ('ed8112f26f764301b73ee6671806b6e1','去看电影','2016-04-23','','1','#06c',NULL),
 ('fe29fbbdc50e4d27b266b15fb90f0d41','早上要开会','2016-04-07','2016-04-07','1','#06c',NULL);
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;


--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `name` varchar(64) character set utf8 default NULL COMMENT '类型名',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品类型';

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`,`name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('3ad3eaad0f9c4be29623b8820440c86e','服装','1','2016-05-04 21:18:50','1','2016-05-04 21:18:50','服装类型','0'),
 ('3fa938e1b6c346f9bcb129313e782ac1','化妆品','1','2016-05-04 21:19:01','1','2016-05-04 21:19:01','化妆品类型','0');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `form_leave`
--

DROP TABLE IF EXISTS `form_leave`;
CREATE TABLE `form_leave` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `user_id` varchar(64) default NULL COMMENT '员工',
  `office_id` varchar(64) default NULL COMMENT '归属部门',
  `area_id` varchar(64) default NULL COMMENT '归属区域',
  `begin_date` datetime default NULL COMMENT '请假开始日期',
  `end_date` datetime default NULL COMMENT '请假结束日期',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(257) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='请假单';

--
-- Dumping data for table `form_leave`
--

/*!40000 ALTER TABLE `form_leave` DISABLE KEYS */;
INSERT INTO `form_leave` (`id`,`user_id`,`office_id`,`area_id`,`begin_date`,`end_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('a88d10bfac914f43b700388f09d77813','0fb8ebbff20a46029596806aa077d3c2','5','90ecd439eb3845db97a627d9242145e8','2016-06-14 00:00:00','2016-06-11 00:00:00','1','2016-06-22 01:28:20','1','2016-06-22 01:28:20','sss','0'),
 ('fd1ef2ce5cce4f209f3e7300c038df5c','0fb8ebbff20a46029596806aa077d3c2','5','90ecd439eb3845db97a627d9242145e8','2016-05-06 00:00:00','2016-05-20 00:00:00','1','2016-05-06 23:31:08','1','2016-05-06 23:31:08','你好','0');
/*!40000 ALTER TABLE `form_leave` ENABLE KEYS */;


--
-- Definition of table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) default NULL COMMENT '名称',
  `category` varchar(2000) default NULL COMMENT '分类',
  `package_name` varchar(500) default NULL COMMENT '生成包路径',
  `module_name` varchar(30) default NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) default NULL COMMENT '生成子模块名',
  `function_name` varchar(500) default NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) default NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) default NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) default NULL COMMENT '生成表编号',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

--
-- Dumping data for table `gen_scheme`
--

/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` (`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('000fbb2eef694532ab9df8c83632cba6',NULL,'curd','com.thinkgem.jeesite.modules','test','test','test','test','test','547be5f2504d4da8bf971ee0db0b625f','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 20:30:28','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 20:30:51',NULL,'0'),
 ('01402519916b41c99373f258d77d0d92',NULL,'curd','com.jeeplus.modules','test','grid','商品','商品','liugf','cc721887670a4aabbf2b1446e697d1d5','1','2016-05-04 21:00:00','1','2016-05-06 23:05:24',NULL,'0'),
 ('11c16185e21a473b8dd961dfcddaa4c5',NULL,'treeTable','com.jeeplus.modules','test','tree','组织机构','机构','liugf','bae082dbd74a4ca381c0ad24c886f991','1','2016-01-07 22:14:21','1','2016-05-06 23:05:39',NULL,'0'),
 ('2917758f13eb4984934b2cbc9f94dc81',NULL,'curd_many','com.thinkgem.jeesite','test','','test','test','test','73326f175c2d4a63b2d89820a79ba2eb','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 21:45:23','8b454376c0434e2792a1dc57edf80dbd','2016-01-04 11:02:09',NULL,'0'),
 ('2ce1d36d0aa449a6866b3c79b8eaa553',NULL,'curd','com.jeeplus.modules','test','grid','商品分类','商品分类','liugf','f72052c4a67842978605d07848c8e5ea','1','2016-05-04 21:00:24','1','2016-05-06 23:05:14',NULL,'0'),
 ('35ba95c3d13c47fcb70b92247d38ca7a',NULL,'curd','com.jeeplus.modules','test','one','员工请假','请假单','liugf','0a8f05eb973b4942af37c45109bd2502','1','2016-01-11 22:59:26','1','2016-06-22 01:25:20',NULL,'0'),
 ('505b3e23c7234df79c14c0dce24af75a',NULL,'curd','com.thinkgem.jeesite.modules','test','test','test','test','test','7612365ac0c645008661aaf479c45b82','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 20:27:12','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 20:28:48',NULL,'0'),
 ('99e7ce82581c4b8281605bf1aca6c8d1',NULL,'curd','com.jeeplus.modules','cms','','用户','用户','lgf','3ff13327cbc1445c9dab3873f7c4947d','1','2016-05-23 23:40:33','1','2016-05-23 23:47:42',NULL,'0'),
 ('a93238d2954a4da0a0a7a3c551803913',NULL,'curd_many','com.jeeplus.modules','test','onetomany','票务代理','票务代理','liugf','e08d6fbc393047748a2d45c98be42676','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 21:46:09','1','2016-06-22 01:25:04',NULL,'0'),
 ('b0b6d611c1ec4b72bf024c53c6758bb5',NULL,'curd','com.jeeplus.modules','test','note','富文本测试','富文本测试','liugf','42e6faa2c1c24e36b3178f7baae938de','1','2016-05-04 22:31:38','1','2016-05-06 23:34:49',NULL,'0'),
 ('ccaca8cec8f04a1ab7e9c61da147c85c',NULL,'curd','com.jeeplus.modules','echarts','','综合报表1','综合报表1','lgf','ebcefab3cf7a49029b38e7037ce65aa1','1','2016-06-22 00:49:14','1','2016-06-22 00:49:14',NULL,'0'),
 ('f601f3d3db9e4f8887c4da600364013f',NULL,'curd','com.jeeplus.modules','echarts','','综合报表2','综合报表2','lgf','e56394cfd55446518c38bc59384c0b38','1','2016-06-22 00:51:23','1','2016-06-22 00:51:23',NULL,'0');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;


--
-- Definition of table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) default NULL COMMENT '名称',
  `comments` varchar(500) default NULL COMMENT '描述',
  `class_name` varchar(100) default NULL COMMENT '实体类名称',
  `parent_table` varchar(200) default NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) default NULL COMMENT '关联父表外键',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) default '0' COMMENT '删除标记（0：正常；1：删除）',
  `issync` varchar(45) default NULL COMMENT '同步',
  `table_type` varchar(45) default NULL COMMENT '表类型',
  PRIMARY KEY  (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

--
-- Dumping data for table `gen_table`
--

/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` (`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`issync`,`table_type`) VALUES 
 ('0a8f05eb973b4942af37c45109bd2502','form_leave','请假单','FormLeave','','','1','2016-01-11 22:32:01','1','2016-06-22 01:25:14',NULL,'0','1','0'),
 ('3f7c20cfa7b840dc854d9ea27f4de539','test_data_child3','汽车票','TestDataChild3','test_data_main','test_data_main','1','2016-01-14 23:12:14','1','2016-05-05 22:15:45',NULL,'0','1','2'),
 ('3ff13327cbc1445c9dab3873f7c4947d','member','用户表','Member','','','1','2016-05-23 23:39:24',NULL,'2016-05-28 23:46:02',NULL,'0','1','0'),
 ('42e6faa2c1c24e36b3178f7baae938de','testnote','富文本测试','TestNote','','','1','2016-05-04 22:29:01','1','2016-05-06 23:34:44',NULL,'0','1','0'),
 ('73326f175c2d4a63b2d89820a79ba2eb','test_data_child','火车票','TestDataChild','test_data_main','test_data_main_id','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 21:44:06',NULL,'2016-05-06 23:01:21',NULL,'0','1','2'),
 ('90d8fc88828d47a99fcbfeaa4f95f0db','test_data_child2','飞机票','TestDataChild2','test_data_main','test_data_main','1','2016-01-04 18:48:19',NULL,'2016-05-06 23:28:12',NULL,'0','1','2'),
 ('bae082dbd74a4ca381c0ad24c886f991','test_tree','组织机构','TestTree','','','1','2016-01-06 23:49:45',NULL,'2016-05-06 23:28:46',NULL,'0','1','3'),
 ('cc721887670a4aabbf2b1446e697d1d5','goods','商品','Goods','','','1','2016-05-04 19:46:25',NULL,'2016-05-04 21:13:27',NULL,'0','1','0'),
 ('e08d6fbc393047748a2d45c98be42676','test_data_main','票务代理','TestDataMain','','','8b454376c0434e2792a1dc57edf80dbd','2016-01-03 21:44:00','1','2016-06-22 01:24:42',NULL,'0','1','1'),
 ('e56394cfd55446518c38bc59384c0b38','test_line_weather_main_city','城市气温; InnoDB free: 6144 kB','ChinaWeatherDataBean','','','1','2016-06-22 00:50:02','1','2016-06-22 00:50:56',NULL,'0','','0'),
 ('ebcefab3cf7a49029b38e7037ce65aa1','test_pie_class','班级; InnoDB free: 6144 kB','PieClass','','','1','2016-06-22 00:47:02','1','2016-06-22 00:48:53',NULL,'0','','0'),
 ('f72052c4a67842978605d07848c8e5ea','category','商品类型','Category','','','1','2016-05-04 19:39:36',NULL,'2016-05-04 19:39:36',NULL,'0','1','0');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;


--
-- Definition of table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) default NULL COMMENT '归属表编号',
  `name` varchar(200) default NULL COMMENT '名称',
  `comments` varchar(500) default NULL COMMENT '描述',
  `jdbc_type` varchar(100) default NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) default NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) default NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) default NULL COMMENT '是否主键',
  `is_null` char(1) default NULL COMMENT '是否可为空',
  `is_insert` char(1) default NULL COMMENT '是否为插入字段',
  `is_edit` char(1) default NULL COMMENT '是否编辑字段',
  `is_list` char(1) default NULL COMMENT '是否列表字段',
  `is_query` char(1) default NULL COMMENT '是否查询字段',
  `query_type` varchar(200) default NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) default NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) default NULL COMMENT '字典类型',
  `settings` varchar(2000) default NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) default NULL COMMENT '排序（升序）',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) default '0' COMMENT '删除标记（0：正常；1：删除）',
  `is_form` varchar(45) default NULL COMMENT '是否表单显示',
  `tableName` varchar(45) default NULL COMMENT '管理的查询表名',
  `fieldLabels` varchar(512) default NULL,
  `fieldKeys` varchar(512) default NULL,
  `searchLabel` varchar(45) default NULL,
  `searchKey` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

--
-- Dumping data for table `gen_table_column`
--

/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` (`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`is_form`,`tableName`,`fieldLabels`,`fieldKeys`,`searchLabel`,`searchKey`) VALUES 
 ('009722f1e90f444fbfc11b6f956908d3','3ff13327cbc1445c9dab3873f7c4947d','username','用户名','nvarchar(64)','String','username','0','1','1','1','1','0','like','input','',NULL,'1','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('011e80aa50794624bf74714750d60176','cc721887670a4aabbf2b1446e697d1d5','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'6','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','0','','','','',''),
 ('06a95c27cb254f9e945b73e4a7f9d099','e08d6fbc393047748a2d45c98be42676','in_date','加入日期','date','java.util.Date','inDate','0','0','1','1','1','1','between','dateselect','',NULL,'6','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('083a733c7dbf4b7eb8154defb11572c7','e56394cfd55446518c38bc59384c0b38','shenyang_mintemp','沈阳最低气温','double','String','shenyangMintemp','0','1','1','1','0','0','=','input','',NULL,'13','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('09487f3972fb4e7099a8e6f2d84c1c2e','f72052c4a67842978605d07848c8e5ea','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'3','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','0','','','','',''),
 ('0963726a316f4240a5c914631e6f3760','ebcefab3cf7a49029b38e7037ce65aa1','class_name','班级','varchar(64)','String','className','0','1','1','1','0','0','=','input','',NULL,'6','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('09dfc79caea946a9af4477264a08577f','e56394cfd55446518c38bc59384c0b38','beijing_maxtemp','北京最高气温','double','String','beijingMaxtemp','0','1','1','1','0','0','=','input','',NULL,'8','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('0fbbba9634394dd88687bbc4669fe02c','bae082dbd74a4ca381c0ad24c886f991','parent_id','父级编号','varchar(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect','',NULL,'3','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','1','','','','',''),
 ('1215e9c9d6b7461fba4035fee5dbecec','ebcefab3cf7a49029b38e7037ce65aa1','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('169a013f7f934b3abdfd2e6beac8ca2e','e56394cfd55446518c38bc59384c0b38','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','1','1','0','0','0','=','radiobox','del_flag',NULL,'6','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('17110f0303f04d1cafc9399823c9f65f','e08d6fbc393047748a2d45c98be42676','user_id','归属用户','varchar(64)','com.jeeplus.modules.sys.entity.User','tuser.id|name','0','0','1','1','1','1','=','userselect','',NULL,'1','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('17b41fd7990146ad8b1c151076d5bb33','f72052c4a67842978605d07848c8e5ea','name','类型名','nvarchar(64)','String','name','0','1','1','1','1','1','=','input','',NULL,'1','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','1','','','','',''),
 ('1962b5082fcf43109c5dc8cc3de4ca16','90d8fc88828d47a99fcbfeaa4f95f0db','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'9','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','1','','','','',''),
 ('19dbd7ae0d8c4f3498272dd45006010b','bae082dbd74a4ca381c0ad24c886f991','sort','排序','decimal(10,0)','Integer','sort','0','0','1','1','0','0','=','input','',NULL,'2','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','1','','','','',''),
 ('1b9b8a47f2e4435f9c898ec8656ecbf6','ebcefab3cf7a49029b38e7037ce65aa1','create_by','创建者','varchar(64)','com.jeeplus.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'1','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('22840f9ef08145da99c08d015dfae2ce','0a8f05eb973b4942af37c45109bd2502','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'11','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','0','','','','',''),
 ('25057a6662e246b9bb161003c5ead269','3f7c20cfa7b840dc854d9ea27f4de539','endarea','目的地','varchar(64)','com.jeeplus.modules.sys.entity.Area','endArea.id|name','0','0','1','1','1','1','=','areaselect','',NULL,'2','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','1','','','','',''),
 ('280b93a7908d4f3fb874984c442bb97c','3f7c20cfa7b840dc854d9ea27f4de539','startarea','出发地','varchar(64)','com.jeeplus.modules.sys.entity.Area','startArea.id|name','0','0','1','1','1','1','=','areaselect','',NULL,'1','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','1','','','','',''),
 ('28b7501d9f3b44ef9e181ea7b27f5068','bae082dbd74a4ca381c0ad24c886f991','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'10','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','0','','','','',''),
 ('28dd86adc38c4927a5e7be7f8e6754f7','0a8f05eb973b4942af37c45109bd2502','remarks','备注信息','nvarchar(257)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'10','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','1','','','','',''),
 ('2a0530eb05fa4ef7a1f30084482d5d4b','90d8fc88828d47a99fcbfeaa4f95f0db','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'8','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('2a558b81714043db8703db4f5788bd86','f72052c4a67842978605d07848c8e5ea','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'7','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','0','','','','',''),
 ('2a67d818040241d4a5f022b32a651f0e','cc721887670a4aabbf2b1446e697d1d5','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'7','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','0','','','','',''),
 ('2a776c9b2d9c4076bfe37aa0127113c1','cc721887670a4aabbf2b1446e697d1d5','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'9','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','0','','','','',''),
 ('3293d74f0eb84f71af261a8f0c157201','f72052c4a67842978605d07848c8e5ea','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'5','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','0','','','','',''),
 ('33630ba65cc44369883b10281836336c','bae082dbd74a4ca381c0ad24c886f991','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'6','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','0','','','','',''),
 ('3acb459899e24fbc8c60d754a743daa5','3ff13327cbc1445c9dab3873f7c4947d','logo','企业logo','longblob','String','logo','0','1','1','1','1','0','=','fileselect','',NULL,'5','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('3bbeeefd69a2442786314eeeb6dc288b','73326f175c2d4a63b2d89820a79ba2eb','test_data_main_id','业务主表ID','varchar(64)','String','testDataMain.id','0','0','1','1','0','0','=','input','',NULL,'4','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('3df924d44f3a46b1a36aaafabc342184','90d8fc88828d47a99fcbfeaa4f95f0db','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'7','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('3f00becc717c4649a4af2e494752d440','0a8f05eb973b4942af37c45109bd2502','area_id','归属区域','varchar(64)','com.jeeplus.modules.sys.entity.Area','area.id|name','0','1','1','1','1','0','=','areaselect','',NULL,'3','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','1','','','','',''),
 ('44509ff25c7f4c97af37b3cffd2d3ff7','90d8fc88828d47a99fcbfeaa4f95f0db','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'6','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('44be572cd93e4f6ba5ce1a5fd8838922','ebcefab3cf7a49029b38e7037ce65aa1','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','1','1','0','0','0','=','radiobox','del_flag',NULL,'5','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('44d572e978334b9aa24643431536971a','ebcefab3cf7a49029b38e7037ce65aa1','num','人数','int(11)','String','num','0','1','1','1','0','0','=','input','',NULL,'7','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('47f68ab2174f452787281c3a9fa67597','3ff13327cbc1445c9dab3873f7c4947d','mail','邮箱','varchar(64)','String','mail','0','1','1','1','1','0','=','input','',NULL,'7','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('4a504be65e0c4aada9a18a86e98c6503','e08d6fbc393047748a2d45c98be42676','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'11','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('4a8c0e047ddb4d4190544894904fa85a','73326f175c2d4a63b2d89820a79ba2eb','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'8','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('4b9e81dac2d745d4a41d22c20333815c','ebcefab3cf7a49029b38e7037ce65aa1','update_by','更新者','varchar(64)','com.jeeplus.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'3','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('4fbccfbd81ad411da7642fa91b60533c','42e6faa2c1c24e36b3178f7baae938de','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'5','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('4fe79fdd4ea14d2b91e1fd889398450f','0a8f05eb973b4942af37c45109bd2502','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','0','','','','',''),
 ('50bd0ed1e5404185af7f06422c32a663','cc721887670a4aabbf2b1446e697d1d5','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'8','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','1','','','','',''),
 ('55002fd40e21485aab11029c7c8672eb','90d8fc88828d47a99fcbfeaa4f95f0db','test_data_main','外键','varchar(64)','String','testDataMain.id','0','0','1','1','0','0','=','input','',NULL,'4','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('56ca6faaaa8e425db93333c1cc553230','42e6faa2c1c24e36b3178f7baae938de','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'3','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('57a324b8d64c44e4a6ee52a8f5796b1d','f72052c4a67842978605d07848c8e5ea','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'2','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','0','','','','',''),
 ('57ff765b52d34432b1d255b29d9805e9','e56394cfd55446518c38bc59384c0b38','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('583b63c122124dd2b76b20e6892588ed','f72052c4a67842978605d07848c8e5ea','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'6','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','1','','','','',''),
 ('58e6f70f1cca4ce79a8ca21827c621d9','73326f175c2d4a63b2d89820a79ba2eb','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'9','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','1','','','','',''),
 ('5ae4c9719e9b4e19a69536d064b26fe7','90d8fc88828d47a99fcbfeaa4f95f0db','endarea','目的地','varchar(64)','com.jeeplus.modules.sys.entity.Area','endArea.id|name','0','0','1','1','1','1','=','areaselect','',NULL,'2','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','1','','','','',''),
 ('5aff1d364bbe4320aff06cf03fedaa11','e08d6fbc393047748a2d45c98be42676','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'10','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','0','','','','',''),
 ('5b8a94ade1254871aea19d166b64cc19','cc721887670a4aabbf2b1446e697d1d5','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'5','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','0','','','','',''),
 ('5c9729806c1640dbad6bb8d451558540','cc721887670a4aabbf2b1446e697d1d5','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'4','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','0','','','','',''),
 ('5ca10a82578b4a1eaf5ba312ca742400','73326f175c2d4a63b2d89820a79ba2eb','price','代理价格','double','Double','price','0','0','1','1','1','0','=','input','',NULL,'3','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','1','','','','',''),
 ('5cf6c917b4f740e6a678b1f6a615690c','3f7c20cfa7b840dc854d9ea27f4de539','price','代理价格','double','Double','price','0','1','1','1','1','0','=','input','',NULL,'3','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','1','','','','',''),
 ('5fd8ea977bfb4f8a89b46795b6ea9d68','73326f175c2d4a63b2d89820a79ba2eb','startarea','出发地','varchar(64)','com.jeeplus.modules.sys.entity.Area','startArea.id|name','0','0','1','1','1','0','=','areaselect','',NULL,'1','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','1','','','','',''),
 ('62d7671bfefb4046adb4fa9e8aed2d91','3f7c20cfa7b840dc854d9ea27f4de539','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'9','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','1','','','','',''),
 ('634f4d950ccf4448800d583057d8632d','e56394cfd55446518c38bc59384c0b38','changchun_mintemp','长春最低气温','double','String','changchunMintemp','0','1','1','1','0','0','=','input','',NULL,'11','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('6507335b3a5d44a4aa2848eb36cf5574','e56394cfd55446518c38bc59384c0b38','update_by','更新者','varchar(64)','com.jeeplus.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'3','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('65a01ddf20c54f979f6e669923ae1481','e56394cfd55446518c38bc59384c0b38','haerbin_mintemp','哈尔滨最低气温','double','String','haerbinMintemp','0','1','1','1','0','0','=','input','',NULL,'15','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('67907b03916e4d1aa3f7e53ea84198a4','e08d6fbc393047748a2d45c98be42676','office_id','归属部门','varchar(64)','com.jeeplus.modules.sys.entity.Office','office.id|name','0','0','1','1','1','0','=','officeselect','',NULL,'2','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('68bd6117513d42a485531bb521e30ed2','42e6faa2c1c24e36b3178f7baae938de','contents','内容','longblob','String','contents','0','1','1','1','1','0','=','umeditor','',NULL,'8','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','1','','','','',''),
 ('6b146ba6378a46db8a043ca04c9e84d3','cc721887670a4aabbf2b1446e697d1d5','price','价格','varchar(64)','String','price','0','1','1','1','1','0','=','input','',NULL,'3','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','1','','','','',''),
 ('6ecd8a871e0340608ac378c64dc0fb23','e08d6fbc393047748a2d45c98be42676','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'9','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','0','','','','',''),
 ('70be54c97756432793264df5c928b9eb','73326f175c2d4a63b2d89820a79ba2eb','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'5','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('751e9719daf347968b195860425d2031','cc721887670a4aabbf2b1446e697d1d5','category_id','所属类型','varchar(64)','com.jeeplus.modules.test.entity.grid.Category','category.id|name','0','1','1','1','1','1','=','gridselect','',NULL,'2','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','1','category','商品分类|备注','name|remarks','分类名','name'),
 ('76835b75945e4454b47e4779969ed04a','3f7c20cfa7b840dc854d9ea27f4de539','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'5','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('7db11e7931984c00a757a2791c442bd0','ebcefab3cf7a49029b38e7037ce65aa1','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,'2','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('7db87d8e5be24fae9ca43eaeccde0eed','f72052c4a67842978605d07848c8e5ea','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'4','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','0','','','','',''),
 ('7f43c25d8890401c89e4e70f00a68f71','e56394cfd55446518c38bc59384c0b38','haerbin_maxtemp','哈尔滨最高气温','double','String','haerbinMaxtemp','0','1','1','1','0','0','=','input','',NULL,'14','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('7f92916d81b3461ea08b5bf07a5c7ba7','90d8fc88828d47a99fcbfeaa4f95f0db','id','主键','varchar(64)','String','id','1','0','0','0','0','0','=','input','',NULL,'0','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('843bfb9d93574672bd34375f3f32b50c','90d8fc88828d47a99fcbfeaa4f95f0db','price','代理价格','double','Double','price','0','1','1','1','1','0','=','input','',NULL,'3','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','1','','','','',''),
 ('869b60bf5c87472590ef61f8f1fdbed1','3ff13327cbc1445c9dab3873f7c4947d','password','密码','nvarchar(64)','String','password','0','1','1','1','1','0','=','input','',NULL,'2','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('86f0452ae228406b97918664669af2bb','bae082dbd74a4ca381c0ad24c886f991','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'7','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','0','','','','',''),
 ('88fe3ce527b44133b11763fc4d81dfb2','73326f175c2d4a63b2d89820a79ba2eb','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'7','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('8b0aec712f7b4bb0ae7b4225e6e3190a','90d8fc88828d47a99fcbfeaa4f95f0db','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'10','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('8b6188c2a115490d9f4e6cf2d9800810','73326f175c2d4a63b2d89820a79ba2eb','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('8d4433f8b7e54b11965c5f1ea01172b7','0a8f05eb973b4942af37c45109bd2502','user_id','员工','varchar(64)','com.jeeplus.modules.sys.entity.User','tuser.id|name','0','0','1','1','1','1','=','userselect','',NULL,'1','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','1','','','','',''),
 ('8d5435eb156c42898fd91e994b5929ff','3f7c20cfa7b840dc854d9ea27f4de539','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'8','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('8e7f4cf28fcc4e4ba2e58694e53e2297','3f7c20cfa7b840dc854d9ea27f4de539','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'10','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('8f726193d00741febacbbd94012e7569','0a8f05eb973b4942af37c45109bd2502','end_date','请假结束日期','datetime','java.util.Date','endDate','0','0','1','1','1','0','=','dateselect','',NULL,'5','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','1','','','','',''),
 ('908154ceaebd4e3da3e04f48d2628e45','ebcefab3cf7a49029b38e7037ce65aa1','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,'4','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('92535e609d484f28b152bb6f8b60f74c','73326f175c2d4a63b2d89820a79ba2eb','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'6','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('93c15a567bb1403193313014b73315af','e56394cfd55446518c38bc59384c0b38','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'5','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('9798a2db9f4947a5917b22c744f7e59f','0a8f05eb973b4942af37c45109bd2502','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'9','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','0','','','','',''),
 ('990ce28436754d7091aad24da37e22ef','0a8f05eb973b4942af37c45109bd2502','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'6','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','0','','','','',''),
 ('9b0ebd64613440689fb9505c27d5d7cb','0a8f05eb973b4942af37c45109bd2502','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'7','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','0','','','','',''),
 ('9c1b7511c8244f388e23b68472768a5b','e08d6fbc393047748a2d45c98be42676','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'7','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','0','','','','',''),
 ('9c84857f84764d4a996813f83a8d2e0d','0a8f05eb973b4942af37c45109bd2502','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'8','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','0','','','','',''),
 ('9e642a92e369499a89014a97b11e8cc3','bae082dbd74a4ca381c0ad24c886f991','remarks','备注信息','nvarchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'9','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','1','','','','',''),
 ('a1b39badc53646fa8b1c4df16c8a74cd','90d8fc88828d47a99fcbfeaa4f95f0db','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'5','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','0','','','','',''),
 ('a1bf1b8fc3a24ef59206afcf918e5afa','ebcefab3cf7a49029b38e7037ce65aa1','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'8','1','2016-06-22 00:48:53','1','2016-06-22 00:48:53',NULL,'0','0','','','','',''),
 ('a3857ae5b8844370add84c4ecb52c1c8','90d8fc88828d47a99fcbfeaa4f95f0db','startarea','出发地','varchar(64)','com.jeeplus.modules.sys.entity.Area','startArea.id|name','0','0','1','1','1','1','=','areaselect','',NULL,'1','1','2016-05-06 23:28:12','1','2016-05-06 23:28:12',NULL,'0','1','','','','',''),
 ('a469c943b7194bdb8d258a0e1e19686f','3ff13327cbc1445c9dab3873f7c4947d','status','审核状态','varchar(64)','String','status','0','1','1','1','1','0','=','select','audit_status',NULL,'8','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('a888471b964846dc80d7fede3f50a1f2','42e6faa2c1c24e36b3178f7baae938de','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'2','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('a98326cecb4f4c1b8c9feb166429da7c','0a8f05eb973b4942af37c45109bd2502','office_id','归属部门','varchar(64)','com.jeeplus.modules.sys.entity.Office','office.id|name','0','0','1','1','1','0','=','officeselect','',NULL,'2','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','1','','','','',''),
 ('ac81fa4c4b4c436889293fd879ecb897','f72052c4a67842978605d07848c8e5ea','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-04 19:39:36','1','2016-05-04 19:39:36',NULL,'0','0','','','','',''),
 ('af268b2fa0914144b9ee35b74659fb90','e08d6fbc393047748a2d45c98be42676','sex','性别','char(1)','String','sex','0','0','1','1','1','1','=','radiobox','sex',NULL,'5','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('af7e6450994a4a5da5e1f9daa5a45e06','bae082dbd74a4ca381c0ad24c886f991','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'8','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','0','','','','',''),
 ('b1440f45c2a44990a7bbfa0e8714939f','e08d6fbc393047748a2d45c98be42676','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','0','','','','',''),
 ('b3d8a562635f4bd99c4842f9a9c933fb','3ff13327cbc1445c9dab3873f7c4947d','duty','职务','nvarchar(64)','String','duty','0','1','1','1','1','0','=','input','',NULL,'6','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('b514052dcb784510907cb1c596947bd9','e56394cfd55446518c38bc59384c0b38','changchun_maxtemp','长春最高气温','double','String','changchunMaxtemp','0','1','1','1','0','0','=','input','',NULL,'10','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('b7dcc6b25b1c424fbd759f9129cdb6a4','42e6faa2c1c24e36b3178f7baae938de','title','标题','nvarchar(64)','String','title','0','1','1','1','1','0','=','input','',NULL,'7','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','1','','','','',''),
 ('b86fb3c7df714168b7032a66b8b43a44','e08d6fbc393047748a2d45c98be42676','area_id','归属区域','varchar(64)','com.jeeplus.modules.sys.entity.Area','area.id|name','0','0','1','1','1','0','=','areaselect','',NULL,'3','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('b876b932650c473fbf650b627ae0617b','3f7c20cfa7b840dc854d9ea27f4de539','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('b91ac53d22d649ffbab96a5eba3dcb4b','42e6faa2c1c24e36b3178f7baae938de','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'1','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('be3c83a0c2974af898ac6782714dddf7','bae082dbd74a4ca381c0ad24c886f991','name','名称','nvarchar(100)','String','name','0','0','1','1','1','1','like','input','',NULL,'1','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','1','','','','',''),
 ('be8deb76383f4fc88c1a5f4a22bb785f','0a8f05eb973b4942af37c45109bd2502','begin_date','请假开始日期','datetime','java.util.Date','beginDate','0','0','1','1','1','0','=','dateselect','',NULL,'4','1','2016-06-22 01:25:14','1','2016-06-22 01:25:14',NULL,'0','1','','','','',''),
 ('c5f22f24dcd6427c91f35d8349e3dc58','3f7c20cfa7b840dc854d9ea27f4de539','test_data_main','外键','varchar(64)','String','testDataMain.id','0','0','1','1','0','0','=','input','',NULL,'4','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('c7bec48a70544762ad607c62e5b09223','e08d6fbc393047748a2d45c98be42676','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'12','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','0','','','','',''),
 ('c8d5e3ba50274f7d84106b48be37cca5','42e6faa2c1c24e36b3178f7baae938de','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'4','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('cb1c3fc26ecb4e1e8e8666177931bd6e','3f7c20cfa7b840dc854d9ea27f4de539','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'6','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('cca197b5851a46d1ad480cadc5f7c1a8','e56394cfd55446518c38bc59384c0b38','create_by','创建者','varchar(64)','com.jeeplus.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'1','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('d4ad2c99685a4338a23b25c7df25fec6','e56394cfd55446518c38bc59384c0b38','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,'2','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('d6f1f088f6af4e10a5f66dff205b5acb','bae082dbd74a4ca381c0ad24c886f991','create_by','创建者','varchar(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,'5','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','0','','','','',''),
 ('d9c52b1bd09a49039eb643c3a8fbbc58','e56394cfd55446518c38bc59384c0b38','datestr','日期','datetime','java.util.Date','datestr','0','1','1','1','0','0','=','input','',NULL,'7','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('dab37f3b88ab4dba8354d00fd264ad1c','3ff13327cbc1445c9dab3873f7c4947d','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','0','','','','',''),
 ('db35ea82b7524297a580714184588bc8','3f7c20cfa7b840dc854d9ea27f4de539','update_by','更新者','varchar(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'7','1','2016-05-05 22:15:45','1','2016-05-05 22:15:45',NULL,'0','0','','','','',''),
 ('dbdea8036a4d43fd867a218d305dfed6','cc721887670a4aabbf2b1446e697d1d5','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','0','','','','',''),
 ('e15a0990cc1c4eadacb3ee9d288c2bf2','e56394cfd55446518c38bc59384c0b38','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,'4','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('e3206352e45a4bb9b5ccfb2aa0801f4c','e08d6fbc393047748a2d45c98be42676','name','名称','varchar(100)','String','name','0','0','1','1','1','1','like','input','',NULL,'4','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','1','','','','',''),
 ('e352dff1d8214877b24de1cb00d71890','cc721887670a4aabbf2b1446e697d1d5','name','商品名称','nvarchar(64)','String','name','0','1','1','1','1','1','=','input','',NULL,'1','1','2016-05-04 21:13:27','1','2016-05-04 21:13:27',NULL,'0','1','','','','',''),
 ('e5c1e48e88e5469d9d3d6103c139f5dc','73326f175c2d4a63b2d89820a79ba2eb','endarea','目的地','varchar(64)','com.jeeplus.modules.sys.entity.Area','endArea.id|name','0','0','1','1','1','0','=','areaselect','',NULL,'2','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','1','','','','',''),
 ('eab434f8c86f4f34a0c5a5637a999832','3ff13327cbc1445c9dab3873f7c4947d','name','姓名','nvarchar(64)','String','name','0','1','1','1','1','0','like','input','',NULL,'3','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('ec42679503134d3f87e58b000f168830','e56394cfd55446518c38bc59384c0b38','shenyang_maxtemp','沈阳最高气温','double','String','shenyangMaxtemp','0','1','1','1','0','0','=','input','',NULL,'12','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('eeb37ee2003d4f61b71b29c045f7d3d8','e56394cfd55446518c38bc59384c0b38','beijing_mintemp','北京最低气温','double','String','beijingMintemp','0','1','1','1','0','0','=','input','',NULL,'9','1','2016-06-22 00:50:56','1','2016-06-22 00:50:56',NULL,'0','0','','','','',''),
 ('f099c4375f074a55a037db9a24fc78fd','73326f175c2d4a63b2d89820a79ba2eb','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'10','1','2016-05-06 23:01:21','1','2016-05-06 23:01:21',NULL,'0','0','','','','',''),
 ('f4b8f85502fc4851b09e2139822b5458','bae082dbd74a4ca381c0ad24c886f991','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','0','','','','',''),
 ('f73676917e7a4f05bccb6bb29ffdb46a','42e6faa2c1c24e36b3178f7baae938de','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'0','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('f740d6ee46ad40ba91ab13536ca7806e','bae082dbd74a4ca381c0ad24c886f991','parent_ids','所有父级编号','varchar(2000)','String','parentIds','0','0','1','1','0','0','like','input','',NULL,'4','1','2016-05-06 23:28:46','1','2016-05-06 23:28:46',NULL,'0','1','','','','',''),
 ('fb8bfb4e09ba44f9a376dc551ba38747','3ff13327cbc1445c9dab3873f7c4947d','company','企业全称','nvarchar(64)','String','company','0','1','1','1','1','0','=','input','',NULL,'4','1','2016-05-28 23:46:02','1','2016-05-28 23:46:02',NULL,'0','1','','','','',''),
 ('fbc3f2f02f0e4e73a828ce0f3b9f13bb','42e6faa2c1c24e36b3178f7baae938de','del_flag','逻辑删除标记（0：显示；1：隐藏）','varchar(64)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'6','1','2016-05-06 23:34:44','1','2016-05-06 23:34:44',NULL,'0','0','','','','',''),
 ('fbc40bad621f4858bb85fa2ab1c29e8e','e08d6fbc393047748a2d45c98be42676','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','1','0','0','=','dateselect','',NULL,'8','1','2016-06-22 01:24:42','1','2016-06-22 01:24:42',NULL,'0','0','','','','','');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;


--
-- Definition of table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) default NULL COMMENT '名称',
  `category` varchar(2000) default NULL COMMENT '分类',
  `file_path` varchar(500) default NULL COMMENT '生成文件路径',
  `file_name` varchar(200) default NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

--
-- Dumping data for table `gen_template`
--

/*!40000 ALTER TABLE `gen_template` DISABLE KEYS */;
INSERT INTO `gen_template` (`id`,`name`,`category`,`file_path`,`file_name`,`content`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('0','0',',,','0','0','0',NULL,NULL,'1','2016-06-22 01:23:58',NULL,'0');
/*!40000 ALTER TABLE `gen_template` ENABLE KEYS */;


--
-- Definition of table `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `name` varchar(64) character set utf8 default NULL COMMENT '商品名称',
  `category_id` varchar(64) default NULL COMMENT '所属类型',
  `price` varchar(64) default NULL COMMENT '价格',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品';

--
-- Dumping data for table `goods`
--

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`,`name`,`category_id`,`price`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('50229d8a1f7c4e78af67cdc712880f63','香水','3fa938e1b6c346f9bcb129313e782ac1','65','1','2016-05-06 23:48:15','1','2016-05-06 23:48:15','96','0'),
 ('5b4cab46889c4119989e6333cb33ceab','香水','3fa938e1b6c346f9bcb129313e782ac1','28','1','2016-05-04 21:19:22','1','2016-05-04 21:19:22','','0');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;


--
-- Definition of table `iim_chat_history`
--

DROP TABLE IF EXISTS `iim_chat_history`;
CREATE TABLE `iim_chat_history` (
  `id` varchar(64) NOT NULL,
  `userid1` varchar(64) character set utf8 default NULL,
  `userid2` varchar(64) character set utf8 default NULL,
  `msg` varchar(1024) character set utf8 default NULL,
  `status` varchar(45) default NULL,
  `create_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iim_chat_history`
--

/*!40000 ALTER TABLE `iim_chat_history` DISABLE KEYS */;
INSERT INTO `iim_chat_history` (`id`,`userid1`,`userid2`,`msg`,`status`,`create_date`) VALUES 
 ('2cd3a1d1f8e541e58cdd3e23f8062dfa','thinkgem','jn_zhb','sss','0','2016-01-08 22:35:20'),
 ('93def2f93d204ba09bdc89f0aaafffb7','thinkgem','thinkgem','nihao\n','1','2016-01-10 19:02:07'),
 ('d81eb8af34994115a21ce4c95b6b3d2a','thinkgem','test2','rrr\n','1','2016-01-09 22:41:35'),
 ('dbffb2079ca14b739d0c1a5a9075aaa2','thinkgem','jn_zhb','84\n','0','2016-01-08 23:51:54'),
 ('e153986319414782a40b8443059184d6','thinkgem','jn_zhb','111\n','0','2016-01-10 18:31:16');
/*!40000 ALTER TABLE `iim_chat_history` ENABLE KEYS */;


--
-- Definition of table `iim_mail`
--

DROP TABLE IF EXISTS `iim_mail`;
CREATE TABLE `iim_mail` (
  `id` varchar(64) NOT NULL,
  `title` varchar(128) default NULL COMMENT '标题',
  `overview` varchar(128) default NULL COMMENT '内容概要',
  `content` longblob COMMENT '内容',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件';

--
-- Dumping data for table `iim_mail`
--

/*!40000 ALTER TABLE `iim_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `iim_mail` ENABLE KEYS */;


--
-- Definition of table `iim_mail_box`
--

DROP TABLE IF EXISTS `iim_mail_box`;
CREATE TABLE `iim_mail_box` (
  `id` varchar(64) NOT NULL,
  `readstatus` varchar(45) default NULL COMMENT '状态 0 未读 1 已读',
  `senderId` varchar(64) default NULL COMMENT '发件人',
  `receiverId` varchar(6400) default NULL COMMENT '收件人',
  `sendtime` datetime default NULL COMMENT '发送时间',
  `mailid` varchar(64) default NULL COMMENT '邮件外键',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件箱';

--
-- Dumping data for table `iim_mail_box`
--

/*!40000 ALTER TABLE `iim_mail_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `iim_mail_box` ENABLE KEYS */;


--
-- Definition of table `iim_mail_compose`
--

DROP TABLE IF EXISTS `iim_mail_compose`;
CREATE TABLE `iim_mail_compose` (
  `id` varchar(64) NOT NULL,
  `status` varchar(45) default NULL COMMENT '状态 0 草稿 1 已发送',
  `readstatus` varchar(45) default NULL COMMENT '状态 0 未读 1 已读',
  `senderId` varchar(64) default NULL COMMENT '发送者',
  `receiverId` varchar(6400) default NULL COMMENT '接收者',
  `sendtime` datetime default NULL COMMENT '发送时间',
  `mailId` varchar(64) default NULL COMMENT '邮件id',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件箱 草稿箱';

--
-- Dumping data for table `iim_mail_compose`
--

/*!40000 ALTER TABLE `iim_mail_compose` DISABLE KEYS */;
/*!40000 ALTER TABLE `iim_mail_compose` ENABLE KEYS */;


--
-- Definition of table `monitor`
--

DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `cpu` varchar(64) default NULL COMMENT 'cpu使用率',
  `jvm` varchar(64) default NULL COMMENT 'jvm使用率',
  `ram` varchar(64) default NULL COMMENT '内存使用率',
  `toemail` varchar(64) default NULL COMMENT '警告通知邮箱',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='系统监控';

--
-- Dumping data for table `monitor`
--

/*!40000 ALTER TABLE `monitor` DISABLE KEYS */;
INSERT INTO `monitor` (`id`,`cpu`,`jvm`,`ram`,`toemail`) VALUES 
 ('1','99','99','99','117575171@qq.com');
/*!40000 ALTER TABLE `monitor` ENABLE KEYS */;


--
-- Definition of table `oa_notify`
--

DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) default NULL COMMENT '类型',
  `title` varchar(200) default NULL COMMENT '标题',
  `content` varchar(2000) default NULL COMMENT '内容',
  `files` varchar(2000) default NULL COMMENT '附件',
  `status` char(1) default NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';

--
-- Dumping data for table `oa_notify`
--

/*!40000 ALTER TABLE `oa_notify` DISABLE KEYS */;
INSERT INTO `oa_notify` (`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('0191c8b6b276404881679e570778047e','2','11','11','|/jeeplus/userfiles/1/files/oa/notify/2015/12/a1.jpg','1','1','2015-12-29 21:25:14','1','2015-12-29 21:25:14',NULL,'0'),
 ('03da36624829477493bfc949f22efdec','2','erere','222222222222332','|/HeartCare/userfiles/1/files/oa/notify/2015/10/profile_small.jpg','1','1','2015-10-30 18:43:38','1','2015-10-30 18:43:38',NULL,'1'),
 ('07faef27eb744abe9b9d247a9b0765da','1','22','222','','1','1','2015-11-03 14:19:09','1','2015-11-03 14:19:09',NULL,'1'),
 ('0f0f932cdbc14629aa94aba0bb333a06','2','test','weew','','1','1','2015-11-02 16:13:09','1','2015-11-02 16:13:09',NULL,'1'),
 ('13d61fb791e64f41b94e856c3c446c1d','2','1212','12121','','1','1','2015-11-05 10:50:45','1','2015-11-05 10:50:45',NULL,'1'),
 ('14535c661515479f954cf3a192a6329f','2','222','22','','1','1','2015-12-01 10:35:06','1','2015-12-01 10:35:06',NULL,'0'),
 ('1a3428088ad347269b52ed50dfcb81c9','2','ewww','wew','','1','1','2015-11-04 10:53:34','1','2015-11-04 10:53:34',NULL,'1'),
 ('1e4f735c49a844c6be507572a94d1bb1','','','','',NULL,'1','2015-11-03 15:19:35','1','2015-11-03 15:19:35',NULL,'1'),
 ('2055ff60abd4465c9d3c0934a2c43ba9','2','2121','212121','','1','1','2015-11-05 10:50:58','1','2015-11-05 10:50:58',NULL,'1'),
 ('227b389e540f4beb85a4448e00beac5d','1','ss','ssss','|/HeartCare/userfiles/1/files/oa/notify/2015/10/profile_small.jpg','1','1','2015-11-03 16:25:53','1','2015-11-03 16:25:53',NULL,'1'),
 ('2757b0387e6c4449b3bac78ced1abf58','2','e4re','e3434343','','1','1','2015-11-02 11:12:29','1','2015-11-02 11:12:29',NULL,'1'),
 ('28d2622a6e0a4ab485e1c082d30c75ef','2','22','222','','1','1','2015-11-03 14:24:19','1','2015-11-03 14:38:56',NULL,'1'),
 ('2b14a498414b44778cc100c2032e2c5a','1','test','test','|/jeeplus/userfiles/1/files/oa/notify/2015/12/a1.jpg','0','1','2015-12-29 21:20:33','1','2015-12-29 21:20:33',NULL,'0'),
 ('393f25fd98c34992bcc72eea2929ea63','2','test','sss','','1','1','2015-11-24 16:56:00','1','2015-11-24 16:56:28',NULL,'0'),
 ('39de39ff1ab74233bce9c5a913af2c9c','2','test','223','','1','1','2015-11-02 16:12:08','1','2015-11-02 16:12:08',NULL,'1'),
 ('4226f5d40009414d854569158e5bcc44','1','444','4444','','0','1','2015-11-15 10:45:30','1','2015-11-15 10:45:30',NULL,'1'),
 ('46a635664fb5420ea1aa533969a08301','2','test','121212121','','1','1','2015-11-02 11:37:02','1','2015-11-02 11:37:02',NULL,'1'),
 ('48e71d295aed4d1c94eced78488abce1','2','sss','ssswwww','','1','1','2015-11-03 12:04:56','1','2015-11-03 12:04:56',NULL,'1'),
 ('4e5f48bc8efe4ef3806bd6da18dccc57','2','Highcharts Demo','pp','','1','1','2015-11-02 14:17:27','1','2015-11-02 14:17:27',NULL,'1'),
 ('522ca59deba34f268077efd3c439eb3d','1','test','twtw','','1','1','2016-01-13 23:34:33','1','2016-01-13 23:34:33',NULL,'0'),
 ('530b93241fc9479f9c6bbadb32b65149','3','test','12345677','','1','1','2015-11-02 11:19:38','1','2015-11-02 11:19:38',NULL,'1'),
 ('5eb0dfee1de948348bbf7663c7c81854','2','www','weewew','','1','1','2015-11-03 18:41:03','1','2015-11-03 18:41:03',NULL,'1'),
 ('69abb236d4a44bd3bb31cfedf273c031','1','99','99','','1','1','2015-11-15 08:32:17','1','2015-11-15 09:41:37',NULL,'1'),
 ('7fe83bb7ca9a413bb37acac91215ea16','3','eee','45454','','1','1','2015-11-02 11:12:14','1','2015-11-02 11:12:14',NULL,'1'),
 ('88d32ebd5a5944ec92ebdf99cc00d356','3','wewe','wewew','','1','1','2015-11-03 18:41:13','1','2015-11-03 18:41:13',NULL,'1'),
 ('8a14c7e5c5e2486ea004765160ee1324','1','test','232','|/jeeplus/userfiles/1/files/oa/notify/2015/12/a1.jpg','0','1','2015-12-29 21:19:24','8b454376c0434e2792a1dc57edf80dbd','2015-12-30 20:09:23',NULL,'0'),
 ('8ae80eff98be40aa9acdd2a01e6920ef','1','tew','sss','','1','1','2015-11-03 18:40:30','1','2015-11-03 18:40:30',NULL,'1'),
 ('8d67574047ed4d7790381fb5fc4019a8','2','test','sfssf','','1','1','2015-11-02 18:38:57','1','2015-11-02 18:38:57',NULL,'1'),
 ('958a69bb33e54832b049f5e17bd9bbd3','','','','',NULL,'1','2015-11-03 14:21:06','1','2015-11-03 14:21:06',NULL,'1'),
 ('9b73f6e4d0ae4d23b1d98f4f8ca6873a','3','免费体检了','sss','','1','1','2015-10-30 14:48:19','1','2015-10-30 14:48:19',NULL,'1'),
 ('c00f8c9d385042949724953f9a5faed9','1','大家头注意了','哈哈哈哈','|/HeartCare/userfiles/1/files/oa/notify/2015/10/profile_small.jpg','1','1','2015-10-30 14:25:43','1','2015-10-30 14:25:43',NULL,'1'),
 ('c3ac32da72644cd0805fa663bed26edf','1','test','ssss','','0','1','2015-11-15 18:04:49','1','2015-11-15 19:35:17',NULL,'0'),
 ('c76b572ff8884896a16a42c08ff2da95','2','343','3434334','','1','1','2015-11-02 11:33:37','1','2015-11-02 11:33:37',NULL,'1'),
 ('cc4ca4ce262247adb662c3ce2631a1db','2','test','23232','','1','1','2015-11-02 16:14:25','1','2015-11-02 16:14:25',NULL,'1'),
 ('cd96f7d2cffe4c268e1fe8b93940f97a','2','888','48558','','1','1','2015-11-02 11:21:59','1','2015-11-02 11:21:59',NULL,'1'),
 ('d59f683455884cd18d412879d6f9d042','1','22','22','|/HeartCare/userfiles/1/files/oa/notify/2015/10/profile_small.jpg','1','1','2015-11-05 17:14:27','1','2015-11-05 17:14:27',NULL,'1'),
 ('dba81703f6874b82935ca389317d6d19','2','wwww','wwww','','1','1','2015-11-03 18:40:45','1','2015-11-03 18:40:45',NULL,'1'),
 ('e2ae2d875fda4f0d9e9db79954c05834','1','111','11','','1','1','2015-11-05 10:50:30','1','2015-11-05 10:50:30',NULL,'1'),
 ('e422136885a3473aa85f9f0749c75a78','1','test','sssssssssss','','0','1','2015-11-05 16:46:24','1','2015-11-05 16:46:24',NULL,'1'),
 ('e48bb0cd337947dcad57ed1ba5036c0a','3','wewew','ewewew','','1','1','2015-11-03 18:41:23','1','2015-11-03 18:41:23',NULL,'1'),
 ('f0dff7a394e34f82a78a510fd0ceac02','1','明天开会','大家都要到哦','|/jeeplus/userfiles/1/files/oa/notify/2015/12/a1.jpg','1','1','2015-12-30 19:29:25','1','2015-12-30 19:29:25',NULL,'0'),
 ('f3b7b7409d6642ac9e1249011915b65f','3','4444','444','|/HeartCare/userfiles/1/files/oa/notify/2015/10/profile_small.jpg','1','1','2015-10-30 18:15:00','1','2015-10-30 18:15:00',NULL,'1'),
 ('f6781437795d48e5a74d6d43828208b0','1','11','111','','0','1','2015-11-15 10:40:04','1','2015-11-15 10:40:04',NULL,'1');
/*!40000 ALTER TABLE `oa_notify` ENABLE KEYS */;


--
-- Definition of table `oa_notify_record`
--

DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) default NULL COMMENT '通知通告ID',
  `user_id` varchar(64) default NULL COMMENT '接受人',
  `read_flag` char(1) default '0' COMMENT '阅读标记',
  `read_date` date default NULL COMMENT '阅读时间',
  PRIMARY KEY  (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';

--
-- Dumping data for table `oa_notify_record`
--

/*!40000 ALTER TABLE `oa_notify_record` DISABLE KEYS */;
INSERT INTO `oa_notify_record` (`id`,`oa_notify_id`,`user_id`,`read_flag`,`read_date`) VALUES 
 ('002bdb88f7034cc1b847d7630cfd87c7','51649ecc4891453886fe523ff106ca8b','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('0041be7b4c3b4f479caff6f818f3fde8','28d2622a6e0a4ab485e1c082d30c75ef','3','0',NULL),
 ('0074402a7d784dee976dcb100dceffd3','1a3428088ad347269b52ed50dfcb81c9','12','0',NULL),
 ('00d728f3ec1a452bbe2df993d699e60e','88d32ebd5a5944ec92ebdf99cc00d356','5','0',NULL),
 ('01632d2547ab4f80baddc7dc53b9befe','dba81703f6874b82935ca389317d6d19','9','0',NULL),
 ('01d6d6d480234c5682bcc80489bbd708','51649ecc4891453886fe523ff106ca8b','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('01d7b8665dd6440081e7dd1377a5c9fb','e48bb0cd337947dcad57ed1ba5036c0a','6','0',NULL),
 ('01dbbe02d9e44fdaa290ef6ce6168054','e2ae2d875fda4f0d9e9db79954c05834','7','0',NULL),
 ('0202582ac32b4789a337141e6dae73f6','f0dff7a394e34f82a78a510fd0ceac02','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('027d8a82bd4840819033317d7a42d883','393f25fd98c34992bcc72eea2929ea63','8','0',NULL),
 ('0358141106354561bb7994d6fd380a90','f0dff7a394e34f82a78a510fd0ceac02','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('038223843d01450c926718f54606521f','c76b572ff8884896a16a42c08ff2da95','12','0',NULL),
 ('038656c834ee4ff1ad62daef6ce8951e','69abb236d4a44bd3bb31cfedf273c031','12','0',NULL),
 ('03ca06eaf18d4bfb9fca532810f264c1','fcdd1348b7644afea196695b1eede954','1','1','2015-12-29'),
 ('041cb519bcfa45909123ff46ba3aabe3','51649ecc4891453886fe523ff106ca8b','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('045784a1f76343169e45a9b539c54104','cc4ca4ce262247adb662c3ce2631a1db','12','0',NULL),
 ('04881ba7acbd4164b0fa10e06be65b71','cd96f7d2cffe4c268e1fe8b93940f97a','6','0',NULL),
 ('04c81e9a36984ec79129c81123a1e82e','8d67574047ed4d7790381fb5fc4019a8','1','1','2015-11-03'),
 ('05c47727d8fc418f9cd360c43f35e666','9b73f6e4d0ae4d23b1d98f4f8ca6873a','11','0',NULL),
 ('06257bc4ee7146f0a5b08f4af74ad8de','c76b572ff8884896a16a42c08ff2da95','7','0',NULL),
 ('06668825592a4482b37b645110882978','c76b572ff8884896a16a42c08ff2da95','2','0',NULL),
 ('06f5597b46454640be6ab03d2388de37','f3b7b7409d6642ac9e1249011915b65f','9','0',NULL),
 ('08ae96cd9c8b459680aa77b1d884490d','c3ac32da72644cd0805fa663bed26edf','10','0',NULL),
 ('08bf727263d0463ea0abfefe85dc2385','69abb236d4a44bd3bb31cfedf273c031','10','0',NULL),
 ('08c09163d4964e8f8d07390f095e0032','0191c8b6b276404881679e570778047e','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('08e25250a0564623a8e74de3c51689f9','0191c8b6b276404881679e570778047e','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('08f7a46ee7ba4da9be3fe643b8060fba','cc4ca4ce262247adb662c3ce2631a1db','7','0',NULL),
 ('0922e5321bc941718b8355ea753ad969','fcdd1348b7644afea196695b1eede954','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('0a046837ce4c4ba39a72244f54deff9d','8a14c7e5c5e2486ea004765160ee1324','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('0a5af3f03f914fd6b6c2b5188b5ee642','f0dff7a394e34f82a78a510fd0ceac02','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('0a7d27288af14b45aa0deceb80227d4b','e2ae2d875fda4f0d9e9db79954c05834','11','0',NULL),
 ('0af491ed432642838bc76ff798e854b1','fcdd1348b7644afea196695b1eede954','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('0b21cfe6d24e40c685b41a865c596910','cc4ca4ce262247adb662c3ce2631a1db','10','0',NULL),
 ('0b5c07cbeb754e2996369c1616749dde','14535c661515479f954cf3a192a6329f','2','0',NULL),
 ('0b683a9665fd4f01b80171d4f6b509f3','51649ecc4891453886fe523ff106ca8b','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('0b8838f612fc46688b9ae943bcea1c62','530b93241fc9479f9c6bbadb32b65149','12','0',NULL),
 ('0b8e0769f72c4493949e4f897eb5774a','39de39ff1ab74233bce9c5a913af2c9c','2','0',NULL),
 ('0baac962368746c898bd6275b51915fb','4226f5d40009414d854569158e5bcc44','9','0',NULL),
 ('0cab13f7146a46d7b238329cf719b49f','638da80f1e8f4fc28c421d8febc9a7fe','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('0cbd421f7e2a450bbadbc803f9085d12','e422136885a3473aa85f9f0749c75a78','4','0',NULL),
 ('0d2f34662b8046fd95f59d53ce5fa427','8d67574047ed4d7790381fb5fc4019a8','10','0',NULL),
 ('0d700de7577d4d28b0c501911024bead','fcdd1348b7644afea196695b1eede954','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('0d9c3f21a72a4f639b4dd42b9567f1b4','d59f683455884cd18d412879d6f9d042','6','0',NULL),
 ('0da7d0df28ad470aaff6d306fd82114f','4226f5d40009414d854569158e5bcc44','7','0',NULL),
 ('0e19ddf40c9d4cb5840907aac2a97a84','f6781437795d48e5a74d6d43828208b0','12','0',NULL),
 ('0f176f91728e4e019ea0aaf80ab6b967','638da80f1e8f4fc28c421d8febc9a7fe','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('0f86f1f0ff254a158f1288e19b55cd2b','03da36624829477493bfc949f22efdec','7','0',NULL),
 ('108ffa30c07b46d5b8250bec4c26d864','c00f8c9d385042949724953f9a5faed9','5','0',NULL),
 ('11359bebb9a544e8a50c6f16c1dfbcb0','0f0f932cdbc14629aa94aba0bb333a06','1','0',NULL),
 ('1197d0ed166b4d8bb54e09adf588fa03','393f25fd98c34992bcc72eea2929ea63','11','0',NULL),
 ('11f80d4af550427689d8a71ef8794470','14535c661515479f954cf3a192a6329f','10','0',NULL),
 ('1238622f71f644a9958ff2044ceb79da','8a14c7e5c5e2486ea004765160ee1324','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('1256754d81c34892b1098c358eeb756a','e48bb0cd337947dcad57ed1ba5036c0a','10','0',NULL),
 ('127000ca70ae4b2eb1486657d6141568','e48bb0cd337947dcad57ed1ba5036c0a','3','0',NULL),
 ('127bfde828994fc1b5f43a847ab1f04b','dba81703f6874b82935ca389317d6d19','2','0',NULL),
 ('12d06baa2eaa4d04aa3334043a5a7e6f','48e71d295aed4d1c94eced78488abce1','1','1','2015-11-03'),
 ('12fcbea705f44851ab279fee5b9e4276','0191c8b6b276404881679e570778047e','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('138c5375cfdb4dd3821bfb298a8c4989','227b389e540f4beb85a4448e00beac5d','5','0',NULL),
 ('1499bcad78f74b588c60bd71872d8add','7fe83bb7ca9a413bb37acac91215ea16','8','0',NULL),
 ('14b08b78d3b84a7ca356b27dbada4ed6','d59f683455884cd18d412879d6f9d042','7','0',NULL),
 ('14b9a4e9a0934926be7048b41fe70c76','8a14c7e5c5e2486ea004765160ee1324','9','0',NULL),
 ('151452421ba4400a83e42091f863fc77','522ca59deba34f268077efd3c439eb3d','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('1528f7b583d14f11b68771e4c7b9558c','48e71d295aed4d1c94eced78488abce1','12','0',NULL),
 ('1548aac269f44763b2f6f24edf7583a5','c3ac32da72644cd0805fa663bed26edf','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('1561a460eb7c4a029122924f219b232b','5eb0dfee1de948348bbf7663c7c81854','8','0',NULL),
 ('15993d63c42e45919dc738f7678fc5de','cd96f7d2cffe4c268e1fe8b93940f97a','2','0',NULL),
 ('159f61bfeff1471dbb438cb971409f30','8ae80eff98be40aa9acdd2a01e6920ef','7','0',NULL),
 ('15fa380af80643249ddfcda43233a42b','c76b572ff8884896a16a42c08ff2da95','13','0',NULL),
 ('16627ce05e6740d194c288f58d67d878','9b73f6e4d0ae4d23b1d98f4f8ca6873a','12','0',NULL),
 ('167b4a5b2dc5438e8c40f298170c0d9f','4e5f48bc8efe4ef3806bd6da18dccc57','1','1','2015-11-02'),
 ('16f70a76e63f4750a66b119a43c7b8bf','8a14c7e5c5e2486ea004765160ee1324','7','0',NULL),
 ('183e673f686e4eac88928d098fa29738','4e5f48bc8efe4ef3806bd6da18dccc57','11','0',NULL),
 ('1901788f02bd412fb55cc4077cfe2185','e48bb0cd337947dcad57ed1ba5036c0a','9','0',NULL),
 ('1a0e250074484b02a749934432fdb6bb','5eb0dfee1de948348bbf7663c7c81854','5','0',NULL),
 ('1bf0fb492b874ae098e603849d9d39b6','522ca59deba34f268077efd3c439eb3d','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('1c1e2da9540e4f24aecbb9dc2c9050ad','4226f5d40009414d854569158e5bcc44','6','0',NULL),
 ('1d318d0b5f5f452a87c70f05655f5f7a','2757b0387e6c4449b3bac78ced1abf58','4','0',NULL),
 ('1fb07a1cc1f644fc887170a1e285413a','530b93241fc9479f9c6bbadb32b65149','13','0',NULL),
 ('1fc0153eeea74403acd926cbbf5a5282','522ca59deba34f268077efd3c439eb3d','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('20101e45b87143b78054b1111e24b9e4','2055ff60abd4465c9d3c0934a2c43ba9','6','0',NULL),
 ('217c236ddcfd4dba94653787c845d43e','530b93241fc9479f9c6bbadb32b65149','10','0',NULL),
 ('21c357badd834c2db21549d46e9a9fdd','46a635664fb5420ea1aa533969a08301','3','0',NULL),
 ('21f4dcdea15e467aa1f523316084a22f','0f0f932cdbc14629aa94aba0bb333a06','13','0',NULL),
 ('22464a7fa54a48f5a9e74da1d9d3cdc2','e48bb0cd337947dcad57ed1ba5036c0a','1','1','2015-11-04'),
 ('22b99ef8a77f4c70b45aa76a946cc1f3','9b73f6e4d0ae4d23b1d98f4f8ca6873a','7','0',NULL),
 ('237577173ce04db38053a92a00888f58','13d61fb791e64f41b94e856c3c446c1d','6','0',NULL),
 ('23c50ce7e5524bdea69bd0d7667ec924','522ca59deba34f268077efd3c439eb3d','7','0',NULL),
 ('2439587f5ae44f30875e35b747d6bf4f','f6781437795d48e5a74d6d43828208b0','7','0',NULL),
 ('2449319c22524954aa979965a97d711e','13d61fb791e64f41b94e856c3c446c1d','8','0',NULL),
 ('25ca5042702749a5b152d45315c23128','69abb236d4a44bd3bb31cfedf273c031','2','0',NULL),
 ('25eeb515142d4dfdacc68588f9aaab6e','530b93241fc9479f9c6bbadb32b65149','9','0',NULL),
 ('268c6f9c90c4412da5f8100ff0ac4419','28d2622a6e0a4ab485e1c082d30c75ef','5','0',NULL),
 ('269d16f7aba2448ca85fc839bddeb5aa','5eb0dfee1de948348bbf7663c7c81854','1','0',NULL),
 ('26a1c2e51b9b49e2a9c4f6898620401d','f0dff7a394e34f82a78a510fd0ceac02','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('27420747148d486a83e0c97a510cf621','51649ecc4891453886fe523ff106ca8b','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('27733aeefa474df1b45cf257d458d21b','39de39ff1ab74233bce9c5a913af2c9c','6','0',NULL),
 ('279edd0668bf48419a5c7920f443b4e7','cd96f7d2cffe4c268e1fe8b93940f97a','1','1','2015-11-02'),
 ('27a5b1b79c3b4340a11560ed248d3848','f0dff7a394e34f82a78a510fd0ceac02','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('2897158b700f47c5a888a75b7cfd34f4','f0dff7a394e34f82a78a510fd0ceac02','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('2970f13622244ad5abf8950642d5dd9c','8d67574047ed4d7790381fb5fc4019a8','11','0',NULL),
 ('29f23238716946768c4601a72fddcd9f','28d2622a6e0a4ab485e1c082d30c75ef','6','0',NULL),
 ('2a3b020701644609844aed49d076a633','fcdd1348b7644afea196695b1eede954','42f5435f943a4e8cbcd86ec07b1d922a','0',NULL),
 ('2a4b18269a21439e8a901dbaf19c040a','1a3428088ad347269b52ed50dfcb81c9','8','0',NULL),
 ('2a6d81a28793421c92c8a43fee13b34f','e422136885a3473aa85f9f0749c75a78','9','0',NULL),
 ('2a747d071f46478cb92696017e5a1f66','d59f683455884cd18d412879d6f9d042','8','0',NULL),
 ('2aa59f1aef3a45a28dd8981cae3fdd26','393f25fd98c34992bcc72eea2929ea63','a91be50880744e4787a77e0f97f8dbb5','0',NULL),
 ('2ba82910271b405d9b30a2af886282b9','e48bb0cd337947dcad57ed1ba5036c0a','13','0',NULL),
 ('2c65cb7c19894f30afa5e5f5823a9cb4','c00f8c9d385042949724953f9a5faed9','6','0',NULL),
 ('2c82ea48eb3342778fe98e6ed4e0e1d3','dba81703f6874b82935ca389317d6d19','3','0',NULL),
 ('2d1d2c74d1f04089abff3584e240f7ce','5eb0dfee1de948348bbf7663c7c81854','9','0',NULL),
 ('2daf8925d62f4f3e8065d4cad373fb1b','0191c8b6b276404881679e570778047e','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('2e02843ebc4445ea88cfc3849051c212','393f25fd98c34992bcc72eea2929ea63','9','0',NULL),
 ('2e793dcd78484727aff7f316eddef1bf','88d32ebd5a5944ec92ebdf99cc00d356','2','0',NULL),
 ('2e7e88746e7f4964acbfe18b03c768b7','2b14a498414b44778cc100c2032e2c5a','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('2e8539e546414258a957a6b6381ba2cf','0191c8b6b276404881679e570778047e','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('2f11d95edf194079a54431cc532e49be','51649ecc4891453886fe523ff106ca8b','8b454376c0434e2792a1dc57edf80dbd','0',NULL),
 ('2f6398d02add49d3b6b7f5f95c0c76e9','8a14c7e5c5e2486ea004765160ee1324','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('2ff4d2f6c67442a49ee0d2aa3b7428ca','69abb236d4a44bd3bb31cfedf273c031','6d69972a880f4228b88f28254c3e417e','0',NULL),
 ('2ffe4f7f7b6a4c7a8a82a4e9de42b4b8','0f0f932cdbc14629aa94aba0bb333a06','3','0',NULL),
 ('3020be690bc844b9b9e35318ff3a1687','e422136885a3473aa85f9f0749c75a78','11','0',NULL),
 ('311da526bea74230b30d5c55b8104bb7','f0dff7a394e34f82a78a510fd0ceac02','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('317cf30ce990477e828ea3751f451d96','14535c661515479f954cf3a192a6329f','a91be50880744e4787a77e0f97f8dbb5','0',NULL),
 ('32345dd46c454886895cccee8d8f751f','2757b0387e6c4449b3bac78ced1abf58','3','0',NULL),
 ('32901be5326240d682547e52d59f1e10','f0dff7a394e34f82a78a510fd0ceac02','8b454376c0434e2792a1dc57edf80dbd','1','2015-12-30'),
 ('338798d1b703474f9bbfd8553d3f19ba','51649ecc4891453886fe523ff106ca8b','1','1','2015-12-29'),
 ('33e464651eaf48c3bb59c1c7cc21cebf','03da36624829477493bfc949f22efdec','5','0',NULL),
 ('3418319ca4ac4b578ffe35fbe2cd7a62','522ca59deba34f268077efd3c439eb3d','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('341e0fdecb1c4f4ea068022b00bb895d','e2ae2d875fda4f0d9e9db79954c05834','1','0',NULL),
 ('343004d7fd7945dd976d1a2cf4a8fe30','e422136885a3473aa85f9f0749c75a78','7','0',NULL),
 ('3461e1303b8a4354880699d5a3ee5375','39de39ff1ab74233bce9c5a913af2c9c','10','0',NULL),
 ('353b4871cf0d4617a25144f422f013c0','8ae80eff98be40aa9acdd2a01e6920ef','4','0',NULL),
 ('35b746552e4a4f09909764f48fb1c60f','4e5f48bc8efe4ef3806bd6da18dccc57','8','0',NULL),
 ('35c1bf047c6e4a4290f960cbdb94def1','2757b0387e6c4449b3bac78ced1abf58','13','0',NULL),
 ('3615368d503f42c484f2c1ce2a07dc9f','8a14c7e5c5e2486ea004765160ee1324','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('361ec31d41124d1cab915e5ec0b6b8c2','530b93241fc9479f9c6bbadb32b65149','5','0',NULL),
 ('36be1372b7724a8a98446e9bab4e8036','2b14a498414b44778cc100c2032e2c5a','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('36d7f28ceed64c7d909865591ec52776','d59f683455884cd18d412879d6f9d042','11','0',NULL),
 ('36ff9d8c226743bf8991de37b870b3c1','cc4ca4ce262247adb662c3ce2631a1db','6','0',NULL),
 ('3896f3b4510b43469f89154c961a923c','7fe83bb7ca9a413bb37acac91215ea16','5','0',NULL),
 ('389b4660180d476b9c627ed1b55960fc','8a14c7e5c5e2486ea004765160ee1324','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('38e41df06ac244d3aa5130edd0a05860','8d67574047ed4d7790381fb5fc4019a8','2','0',NULL),
 ('39198cfca8314a9c83d56601ab5be45e','638da80f1e8f4fc28c421d8febc9a7fe','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('3a88ec8423be4b158a5e3a92cd941739','fcdd1348b7644afea196695b1eede954','cb359e3089224f97adae46cf03c0ed94','1','2015-12-29'),
 ('3acabde7fda544c3ac54847f7303205e','39de39ff1ab74233bce9c5a913af2c9c','13','0',NULL),
 ('3bce6879db944107bc9e9cd18b409ab1','f6781437795d48e5a74d6d43828208b0','2','0',NULL),
 ('3bf00fb38999402c94863d29392a6c0d','8d67574047ed4d7790381fb5fc4019a8','6','0',NULL),
 ('3ce7a1c4ecf74d059a82101221bf41da','0191c8b6b276404881679e570778047e','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('3d064a881d804414bd29169f4d863897','51649ecc4891453886fe523ff106ca8b','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('3d471f3d98454d05b1838c936e08a966','13d61fb791e64f41b94e856c3c446c1d','5','0',NULL),
 ('3d5c1a31ec244b30b5fbfdc853e24b87','0191c8b6b276404881679e570778047e','1','1','2015-12-29'),
 ('3d5fc0647f0c4c28b39d6e2dd7eb0450','14535c661515479f954cf3a192a6329f','11','0',NULL),
 ('3d8fc36c4eb5422aaf7fe862a133c3f7','4226f5d40009414d854569158e5bcc44','12','0',NULL),
 ('3e4827a8666d480ab2bf1d6ff07ada72','0191c8b6b276404881679e570778047e','7','0',NULL),
 ('3ed170c1a0fd4bb0a54fce8eb4f8bd87','69abb236d4a44bd3bb31cfedf273c031','8','0',NULL),
 ('3f060ba3417f42059e87202299440b79','638da80f1e8f4fc28c421d8febc9a7fe','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('3f668ebcef7a44e8bfb41d1c9a0afba0','f0dff7a394e34f82a78a510fd0ceac02','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('4006c5e40918462a82b9ec4c71bde096','7fe83bb7ca9a413bb37acac91215ea16','6','0',NULL),
 ('40a8a7ffe0174214933f3371e8dc44fd','638da80f1e8f4fc28c421d8febc9a7fe','7','0',NULL),
 ('40ba6246aeb2421cbf00478c56f49177','f6781437795d48e5a74d6d43828208b0','6d69972a880f4228b88f28254c3e417e','0',NULL),
 ('40d9f26c9fc74e27a59b7cf9dc9b0754','5eb0dfee1de948348bbf7663c7c81854','7','0',NULL),
 ('413a9f7aefae4e0285b85b227105a73a','227b389e540f4beb85a4448e00beac5d','4','0',NULL),
 ('4162182718d34e77b7c7b75f1b589be5','5eb0dfee1de948348bbf7663c7c81854','12','0',NULL),
 ('416c466cabf94d22ba9004d15e855ed5','cd96f7d2cffe4c268e1fe8b93940f97a','7','0',NULL),
 ('417db99fa1be43609ef8ec8c689a5ac1','69abb236d4a44bd3bb31cfedf273c031','9','0',NULL),
 ('41aa771e12b640a7a5298856d931f509','8ae80eff98be40aa9acdd2a01e6920ef','10','0',NULL),
 ('4388767f6c764e1bab5212b13607c7f5','c76b572ff8884896a16a42c08ff2da95','6','0',NULL),
 ('43a38799e8a14753a2a982a5630b1b89','227b389e540f4beb85a4448e00beac5d','8','0',NULL),
 ('44cdc8be0a8948128fba4893f5fb3a5b','e48bb0cd337947dcad57ed1ba5036c0a','11','0',NULL),
 ('450eaf08451e4a4794848d43401b9981','03da36624829477493bfc949f22efdec','11','0',NULL),
 ('45ce15d94c054127b15cfb41efd96941','2b14a498414b44778cc100c2032e2c5a','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('45f3c5ce94064517a0d6e830b67609bd','0f0f932cdbc14629aa94aba0bb333a06','2','0',NULL),
 ('463328a1ab9f41df96c8ff0a87247144','f3b7b7409d6642ac9e1249011915b65f','11','0',NULL),
 ('46433f11f8b7465eab48b4e811694b33','c3ac32da72644cd0805fa663bed26edf','5','0',NULL),
 ('46cd679cea0d4054ac8e4a8903f4d745','51649ecc4891453886fe523ff106ca8b','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('48de75c163544a28ae932390be1adfd0','e422136885a3473aa85f9f0749c75a78','12','0',NULL),
 ('48ee859184cb406aa1c252af9d74c80e','48e71d295aed4d1c94eced78488abce1','7','0',NULL),
 ('49eba45da2f9450c9e5463d9d55e2fe6','227b389e540f4beb85a4448e00beac5d','11','0',NULL),
 ('4a1c1a2bec3244d59ff5708c5371ce84','14535c661515479f954cf3a192a6329f','7','0',NULL),
 ('4ae08812cf9f45d2b235804ce36fab55','c3ac32da72644cd0805fa663bed26edf','2','0',NULL),
 ('4b56ebdbb410457ea46a4519de96f937','39de39ff1ab74233bce9c5a913af2c9c','9','0',NULL),
 ('4bc1914b12d34708987123ee6c971c9a','88d32ebd5a5944ec92ebdf99cc00d356','6','0',NULL),
 ('4bc26730c5384df1b08113ebd5de6d12','2b14a498414b44778cc100c2032e2c5a','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('4bed33efd3644eff8f7b9ecfd6231a4d','cd96f7d2cffe4c268e1fe8b93940f97a','4','0',NULL),
 ('4c04c800c11e41dfaabe5a2a083128f4','2b14a498414b44778cc100c2032e2c5a','4','0',NULL),
 ('4cb99ad6b0d6455692e64a02d4ed9965','cc4ca4ce262247adb662c3ce2631a1db','3','0',NULL),
 ('4cc6e7818efe4fc6bd54c1b7689d4cb6','69abb236d4a44bd3bb31cfedf273c031','4','0',NULL),
 ('4cf31423094a4015b44cdb5e742b5cbc','4226f5d40009414d854569158e5bcc44','4','0',NULL),
 ('4d4f54b5dba6466eaa7a456d81ee8c02','0191c8b6b276404881679e570778047e','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('4d89673c81464514b8353093298183f5','7fe83bb7ca9a413bb37acac91215ea16','9','0',NULL),
 ('4db762cce06648df8eb43678985e2d9b','e422136885a3473aa85f9f0749c75a78','10','0',NULL),
 ('4e1190423b664b57864fd2a26ecba10a','88d32ebd5a5944ec92ebdf99cc00d356','13','0',NULL),
 ('4ebcf28ce43449c0bc65e50f9bfd1336','f0dff7a394e34f82a78a510fd0ceac02','42f5435f943a4e8cbcd86ec07b1d922a','0',NULL),
 ('4edd3bd42e4b41af873d085e68a577dc','393f25fd98c34992bcc72eea2929ea63','1','1','2015-11-25'),
 ('4f01ed52d8464503afbc65226afec24b','51649ecc4891453886fe523ff106ca8b','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('4fad66ba10a64fd48b0ad3462c99d149','2055ff60abd4465c9d3c0934a2c43ba9','11','0',NULL),
 ('50ff85571d574987b07a2c44cf7853ca','0191c8b6b276404881679e570778047e','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('512938e286d5471db35224901108d7e4','8a14c7e5c5e2486ea004765160ee1324','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('512fa1b1ca314d00b682ae98c7848e60','530b93241fc9479f9c6bbadb32b65149','6','0',NULL),
 ('5132f793fb4d4a1ba74eb25875d67726','f6781437795d48e5a74d6d43828208b0','4','0',NULL),
 ('5149a7b436184a83b2c2586ecada077e','4e5f48bc8efe4ef3806bd6da18dccc57','9','0',NULL),
 ('521e2594726148bfa8c138f6e946c631','1a3428088ad347269b52ed50dfcb81c9','3','0',NULL),
 ('5241ab188131470ea29dac046e43daf8','2b14a498414b44778cc100c2032e2c5a','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('52c835cebc2441d7bf8d7ca01176602b','0f0f932cdbc14629aa94aba0bb333a06','10','0',NULL),
 ('52f5b3ad56434be29bfa91b4170f2b07','46a635664fb5420ea1aa533969a08301','7','0',NULL),
 ('53562384f9ef450385e0f4297bd1699c','28d2622a6e0a4ab485e1c082d30c75ef','11','0',NULL),
 ('535b945c7ca740ab80acaf8ea1ab8dd0','51649ecc4891453886fe523ff106ca8b','7','0',NULL),
 ('53ea00e27c4142c5844f2026bcc78732','0f0f932cdbc14629aa94aba0bb333a06','8','0',NULL),
 ('5422baf92b604aefba2d44bf35bd730b','14535c661515479f954cf3a192a6329f','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('5517916299d5499da057d150fcddf81a','c76b572ff8884896a16a42c08ff2da95','11','0',NULL),
 ('55aa46a9e2dd405e9874985f0992f399','8a14c7e5c5e2486ea004765160ee1324','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('56614b3b7ae44ad392a294b65f8647f6','2757b0387e6c4449b3bac78ced1abf58','8','0',NULL),
 ('5672621a91514c5eae1b7f31a6a0bd99','c76b572ff8884896a16a42c08ff2da95','5','0',NULL),
 ('56884d430e1a404296321da42e6fae46','cc4ca4ce262247adb662c3ce2631a1db','1','1','2015-11-02'),
 ('568ba891f97e4b03bd451ec0fd78f451','393f25fd98c34992bcc72eea2929ea63','2','0',NULL),
 ('56b951000fb74b85bc0f01ecfc41417a','4e5f48bc8efe4ef3806bd6da18dccc57','2','0',NULL),
 ('57035b07bd9c4abbb2abd19c76f22cdb','f3b7b7409d6642ac9e1249011915b65f','8','0',NULL),
 ('577ab929dc96447cb18a74e44078558c','03da36624829477493bfc949f22efdec','3','0',NULL),
 ('57fd0ecd6dc74880ba33257f49ec63e5','39de39ff1ab74233bce9c5a913af2c9c','4','0',NULL),
 ('581102bbc6a24f23b6f405f22ed8863b','393f25fd98c34992bcc72eea2929ea63','5','0',NULL),
 ('581a7e26f0514e499350dd1dfc1eaef0','c00f8c9d385042949724953f9a5faed9','2','0',NULL),
 ('5850d21b1edc4e25a35c3ab828ac4576','2b14a498414b44778cc100c2032e2c5a','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('58f319630e8449b8b1764a75036f4370','51649ecc4891453886fe523ff106ca8b','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('5920c7f4bdde4f8f8a1415edb1cba648','522ca59deba34f268077efd3c439eb3d','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('59245e202fd34519ba4fdc026b0773db','638da80f1e8f4fc28c421d8febc9a7fe','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('5a9ceb8416a148f8903bfb67034d3277','5eb0dfee1de948348bbf7663c7c81854','3','0',NULL),
 ('5b3515b607e34e98bfc890761b518a34','c3ac32da72644cd0805fa663bed26edf','1','0',NULL),
 ('5d3d01defc544a02854772b15d2e3833','d59f683455884cd18d412879d6f9d042','3','0',NULL),
 ('5e5a8b89bf9a4f8fafaae4a43b26fee2','14535c661515479f954cf3a192a6329f','6','0',NULL),
 ('5fe793461af040de9dbf4106ee7e2d03','88d32ebd5a5944ec92ebdf99cc00d356','12','0',NULL),
 ('5fe97d5c00ee4939b7034ea09604af21','dba81703f6874b82935ca389317d6d19','6','0',NULL),
 ('601a567b43bd4b50b5ff2f0a44493ee3','c3ac32da72644cd0805fa663bed26edf','8','0',NULL),
 ('608f6b3bcbe14c078ecf3d6f2b47a92b','f3b7b7409d6642ac9e1249011915b65f','7','0',NULL),
 ('60d8e97334bc466abb7a0bbb6e1af211','c76b572ff8884896a16a42c08ff2da95','10','0',NULL),
 ('610470697e63452fb9949d102a198ff7','0f0f932cdbc14629aa94aba0bb333a06','7','0',NULL),
 ('61301757b08c472aafcb1546c9027401','530b93241fc9479f9c6bbadb32b65149','1','1','2015-11-02'),
 ('63840ee62744455184f32f5113a83adf','4226f5d40009414d854569158e5bcc44','5','0',NULL),
 ('63d4997a249d4072871ef306eb07f096','2055ff60abd4465c9d3c0934a2c43ba9','4','0',NULL),
 ('63dff4dcb7b244d185c4046e2e84101a','e422136885a3473aa85f9f0749c75a78','2','0',NULL),
 ('64a18f8c903042a493ccd30ad0022ef4','13d61fb791e64f41b94e856c3c446c1d','4','0',NULL),
 ('64aef030afb148dd8b266ad6a546c97c','0191c8b6b276404881679e570778047e','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('6541da05751d41f2844854313ee1bb54','03da36624829477493bfc949f22efdec','10','0',NULL),
 ('656f85ac84d7427b95eb830a1f778682','522ca59deba34f268077efd3c439eb3d','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('65d36f48798b439085a6c5765907e574','1a3428088ad347269b52ed50dfcb81c9','7','0',NULL),
 ('65d7ccedec614dadab164ab8a93b2324','f0dff7a394e34f82a78a510fd0ceac02','cb359e3089224f97adae46cf03c0ed94','0',NULL),
 ('669fecb01b864c1d9e8b8a84eaaaf614','0191c8b6b276404881679e570778047e','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('66cd8e14bb2c4e2d986ea1e9f51d4018','fcdd1348b7644afea196695b1eede954','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('66f666ee5c954284921372878a65b053','e2ae2d875fda4f0d9e9db79954c05834','9','0',NULL),
 ('6708fc9aea3e4f7fb130c45406642ed8','638da80f1e8f4fc28c421d8febc9a7fe','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('6766c88ba16c4dc897d30630cd977fe0','4e5f48bc8efe4ef3806bd6da18dccc57','4','0',NULL),
 ('67caa45f8e1f4509bdba23a4d2b2f1a4','522ca59deba34f268077efd3c439eb3d','8','0',NULL),
 ('68abdc34a85045b882929694d338aee0','2b14a498414b44778cc100c2032e2c5a','7','0',NULL),
 ('68e77b6e76fd4c33b384f74790cf2f1e','f0dff7a394e34f82a78a510fd0ceac02','9','0',NULL),
 ('695bf65cdd3544d1904d7ffb7676d7dd','14535c661515479f954cf3a192a6329f','1','1','2015-12-01'),
 ('69fa50beff4345468dd6fc128e11c8b9','69abb236d4a44bd3bb31cfedf273c031','6','0',NULL),
 ('6a07525fb76c493684b9ecdab28cafd7','f0dff7a394e34f82a78a510fd0ceac02','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('6a49f47babe245f69893250e1fd12a63','1a3428088ad347269b52ed50dfcb81c9','9','0',NULL),
 ('6a942589ff4945cea45add8425b9a80f','f0dff7a394e34f82a78a510fd0ceac02','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('6b0e0c8d96d74ee983049e9ee113800e','13d61fb791e64f41b94e856c3c446c1d','9','0',NULL),
 ('6b1e1d7eba2e4b8aa08d20e1a09efad5','c3ac32da72644cd0805fa663bed26edf','12','0',NULL),
 ('6b7120852b9a4088973887a2949e7a40','8a14c7e5c5e2486ea004765160ee1324','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('6ca3628c80ae405b9bab275811a6821e','8a14c7e5c5e2486ea004765160ee1324','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('6e1c509a80154f2eb23dd393eeb7f10c','e2ae2d875fda4f0d9e9db79954c05834','4','0',NULL),
 ('6e416c04f02d4ae0a9a7a797297f4267','48e71d295aed4d1c94eced78488abce1','6','0',NULL),
 ('6e7bab211b124eb6a5568fc7da8e97c4','9b73f6e4d0ae4d23b1d98f4f8ca6873a','9','0',NULL),
 ('6eb330d6028844e38449975d409e6da8','e422136885a3473aa85f9f0749c75a78','8','0',NULL),
 ('6ecc67f6716d464b8d0f8fc4b4803511','522ca59deba34f268077efd3c439eb3d','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('6ee84da951b24cf9b6bd06b8943cdc68','2757b0387e6c4449b3bac78ced1abf58','11','0',NULL),
 ('6f391de4e20140008be560273c019b4a','227b389e540f4beb85a4448e00beac5d','7','0',NULL),
 ('6f8693fc2ed94267be4822d739e482bf','530b93241fc9479f9c6bbadb32b65149','11','0',NULL),
 ('6fdaf302c3c6401e98329f41c42dc79e','8a14c7e5c5e2486ea004765160ee1324','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('706c0c68703f4c38b02af365f70242bd','fcdd1348b7644afea196695b1eede954','8b454376c0434e2792a1dc57edf80dbd','0',NULL),
 ('706c1e8c108846508c0ad01ee79ef0b0','f6781437795d48e5a74d6d43828208b0','11','0',NULL),
 ('70e80661bf424ab48a6ed9aeb41a1f72','7fe83bb7ca9a413bb37acac91215ea16','4','0',NULL),
 ('712419847c7c4eb1b69a2983d945835b','cd96f7d2cffe4c268e1fe8b93940f97a','10','0',NULL),
 ('713b3f1697a0464c827b1866d1b23b47','88d32ebd5a5944ec92ebdf99cc00d356','4','0',NULL),
 ('7154a93378be4a3fb7eb5e08ebca17c1','2b14a498414b44778cc100c2032e2c5a','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('71f689059f7f4e2eafe7715e9e79f388','c00f8c9d385042949724953f9a5faed9','12','0',NULL),
 ('724eb2ce1b814180bb863255c28d769f','fcdd1348b7644afea196695b1eede954','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('7419da59b03e4d598b40f63946a62373','fcdd1348b7644afea196695b1eede954','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('7444ff91051847718c1c13cc01505086','51649ecc4891453886fe523ff106ca8b','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('74873fae448d409d8e1b349f5edc8d53','0f0f932cdbc14629aa94aba0bb333a06','9','0',NULL),
 ('74d41bcb22f847769f4dba652a6b679b','2b14a498414b44778cc100c2032e2c5a','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('75b418d60a3e489d8321ac79ce858a10','88d32ebd5a5944ec92ebdf99cc00d356','10','0',NULL),
 ('7621db2bda3440b3bc090f6b481067c0','522ca59deba34f268077efd3c439eb3d','42f5435f943a4e8cbcd86ec07b1d922a','0',NULL),
 ('76c819e6e6524258b43221afe2e4706e','f6781437795d48e5a74d6d43828208b0','5','0',NULL),
 ('76cd8a83f9954c1a865414bb6fcb7520','393f25fd98c34992bcc72eea2929ea63','4','0',NULL),
 ('76eaf39ea9334a1a9e1a1709de7de406','2757b0387e6c4449b3bac78ced1abf58','10','0',NULL),
 ('778cc57bb2184e38a74c60c818f1bbbd','0191c8b6b276404881679e570778047e','9','0',NULL),
 ('78140dff2a2d4eb287d8a9e3fd11fc12','638da80f1e8f4fc28c421d8febc9a7fe','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('78269df9b73341f394ac6ddfd6d8ed60','0191c8b6b276404881679e570778047e','8b454376c0434e2792a1dc57edf80dbd','1','2015-12-30'),
 ('7898efe914094ac3aba45a1ba92fb197','48e71d295aed4d1c94eced78488abce1','8','0',NULL),
 ('79ea0462c97a4455b46ab585f42d01a6','638da80f1e8f4fc28c421d8febc9a7fe','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('7ae530a74583460a839184e24fd06a8e','48e71d295aed4d1c94eced78488abce1','3','0',NULL),
 ('7af21cb1379d493a87455c036f412ed5','4e5f48bc8efe4ef3806bd6da18dccc57','12','0',NULL),
 ('7b89ebfcffd341508c4f5c1f78adb0d4','4e5f48bc8efe4ef3806bd6da18dccc57','5','0',NULL),
 ('7b9837a645ae4673842590e0be89b8a9','638da80f1e8f4fc28c421d8febc9a7fe','1','1','2015-12-29'),
 ('7c37fb05d9d14211b7400263ddf7de11','2757b0387e6c4449b3bac78ced1abf58','5','0',NULL),
 ('7ca3121ddb3743bfae53bf6b30ed8393','39de39ff1ab74233bce9c5a913af2c9c','5','0',NULL),
 ('7d5466bcb26e42b7bc1c11e9c000991e','522ca59deba34f268077efd3c439eb3d','95b3b09fa0b34ac6b95907237c744c55','0',NULL),
 ('7ebc430668a5429987b77a3d2f0d73fb','cd96f7d2cffe4c268e1fe8b93940f97a','13','0',NULL),
 ('7f4499dcc4b84b50b4225ca2329f4152','8ae80eff98be40aa9acdd2a01e6920ef','13','0',NULL),
 ('80837ebad4944f95b208e6e97b4f1339','2b14a498414b44778cc100c2032e2c5a','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('80a94cf8487b41d1b462786fdacb1233','51649ecc4891453886fe523ff106ca8b','4','0',NULL),
 ('80f4190b09d64ba8a9252629945e1d37','8a14c7e5c5e2486ea004765160ee1324','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('812a85731ccb452e896308c59043615e','9b73f6e4d0ae4d23b1d98f4f8ca6873a','8','0',NULL),
 ('81a00fd99d02423295a2fb3e3fc76a19','e48bb0cd337947dcad57ed1ba5036c0a','4','0',NULL),
 ('81b4d981487e444a9b39dd0f440ca61e','8d67574047ed4d7790381fb5fc4019a8','8','0',NULL),
 ('81f58f5abe754ba8a222c166c34a1ece','2757b0387e6c4449b3bac78ced1abf58','2','0',NULL),
 ('830f034e34684495a98114b2a7dd9685','48e71d295aed4d1c94eced78488abce1','5','0',NULL),
 ('833e6f4dd6a7460abac322406e275b91','cc4ca4ce262247adb662c3ce2631a1db','11','0',NULL),
 ('83b14099f3da4793ab0cf3328d0b343a','c00f8c9d385042949724953f9a5faed9','8','0',NULL),
 ('85848f47671d4105b07c3ed1b6eba68f','69abb236d4a44bd3bb31cfedf273c031','7','0',NULL),
 ('8589646bb1ec4eb48ac33ad4949b6fa4','4226f5d40009414d854569158e5bcc44','8','0',NULL),
 ('859f6d7f9a3f46fba44cb6dda39748db','e48bb0cd337947dcad57ed1ba5036c0a','8','0',NULL),
 ('860e085f2c4a445590e62f935cce2ac3','c3ac32da72644cd0805fa663bed26edf','9','0',NULL),
 ('866df98865584998bc8b4391524deca2','c00f8c9d385042949724953f9a5faed9','10','0',NULL),
 ('86b1eba867be4b58b8a166d57684a483','393f25fd98c34992bcc72eea2929ea63','6d69972a880f4228b88f28254c3e417e','0',NULL),
 ('870167924d014d90a4dd8cf1ebc0b8b3','03da36624829477493bfc949f22efdec','1','1','2015-11-02'),
 ('873290e045ff4ceaa19906bc3d95fbf6','8ae80eff98be40aa9acdd2a01e6920ef','9','0',NULL),
 ('873b0ad5aef84258bbb8fb05137ed187','c76b572ff8884896a16a42c08ff2da95','8','0',NULL),
 ('879badfbf1df453b888c942ba6f3bf12','c3ac32da72644cd0805fa663bed26edf','a91be50880744e4787a77e0f97f8dbb5','0',NULL),
 ('890d19ab048a4f3cb9db8e4282066f88','638da80f1e8f4fc28c421d8febc9a7fe','9','0',NULL),
 ('893417a5b0ef44b0adf0607b5ffe3abf','cc4ca4ce262247adb662c3ce2631a1db','13','0',NULL),
 ('89395dfda2054fa7a8676d70d1355f8c','fcdd1348b7644afea196695b1eede954','4','0',NULL),
 ('8a84c85a5ff445a09e78b5040c93e517','530b93241fc9479f9c6bbadb32b65149','3','0',NULL),
 ('8a89abc54ea440f693b64576359adcd4','c00f8c9d385042949724953f9a5faed9','3','0',NULL),
 ('8bb1845d1d86428fb5934cd33e7899db','c00f8c9d385042949724953f9a5faed9','11','0',NULL),
 ('8c20d024720d419f8187f928781432c9','f3b7b7409d6642ac9e1249011915b65f','12','0',NULL),
 ('8c9c6f8723c54384be0b925b06f9cb83','cc4ca4ce262247adb662c3ce2631a1db','8','0',NULL),
 ('8cd770282c8b4a5ba6be9b97fd3c6e75','8d67574047ed4d7790381fb5fc4019a8','9','0',NULL),
 ('8d0de484fa364d21a32b4cffc0510538','51649ecc4891453886fe523ff106ca8b','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('8d5c617d85364b13abf4c846aa4557b6','f6781437795d48e5a74d6d43828208b0','1','0',NULL),
 ('8deda12d044b4c098729256e9e147af3','8d67574047ed4d7790381fb5fc4019a8','4','0',NULL),
 ('8e2f08eaf87643d1abe709d403f1b7e3','393f25fd98c34992bcc72eea2929ea63','7','0',NULL),
 ('8e61a4b0bce949f28532d81946e9e073','c00f8c9d385042949724953f9a5faed9','4','0',NULL),
 ('8e7cf24b278e4b50b2a74855a4732348','48e71d295aed4d1c94eced78488abce1','2','0',NULL),
 ('8f1d47eacea5458999d1a5e3f1d7744f','7fe83bb7ca9a413bb37acac91215ea16','11','0',NULL),
 ('8f1e413a0c674d40bb8e77ec2a683dca','2b14a498414b44778cc100c2032e2c5a','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('8f8ef225a4c44d54b2b0de7424356cef','8a14c7e5c5e2486ea004765160ee1324','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('8f93f79e9fa84406be7db95e921f1eff','51649ecc4891453886fe523ff106ca8b','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('8fb33dc7a96f49108ec49df22b4c1c10','03da36624829477493bfc949f22efdec','2','0',NULL),
 ('8fb6e938a5d649cf805781a57713d884','e2ae2d875fda4f0d9e9db79954c05834','12','0',NULL),
 ('904050c4d47445a2b43d70d813dc046d','8a14c7e5c5e2486ea004765160ee1324','1','0',NULL),
 ('907033fbc00845b593c93f98edc16910','4e5f48bc8efe4ef3806bd6da18dccc57','3','0',NULL),
 ('91406f57ade64bf5938e070382e2572f','c76b572ff8884896a16a42c08ff2da95','9','0',NULL),
 ('914521f1479f4b7ca3a03cf4bb7394c3','fcdd1348b7644afea196695b1eede954','7','0',NULL),
 ('91c7cb4598f64463b20d302ffb98efd1','522ca59deba34f268077efd3c439eb3d','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('9207ddeae4c441c2aaa257de50bb1f73','88d32ebd5a5944ec92ebdf99cc00d356','8','0',NULL),
 ('92451d3270e945d18ee150ce9aff3a5b','51649ecc4891453886fe523ff106ca8b','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('924c40c7046b40e2b2afc2a81b50e7ef','03da36624829477493bfc949f22efdec','8','0',NULL),
 ('92b73e2b46ba404e9e1d79a0113052e7','dba81703f6874b82935ca389317d6d19','12','0',NULL),
 ('93738b75636d433c956c2f8e81299bb2','dba81703f6874b82935ca389317d6d19','13','0',NULL),
 ('93d11da075ab4e5eb33ff97e4a700396','46a635664fb5420ea1aa533969a08301','5','0',NULL),
 ('93ebeae9b44744448e8bfcbba71d3d8d','4e5f48bc8efe4ef3806bd6da18dccc57','10','0',NULL),
 ('948debc47d6f4b01b6b70e6655bc0e52','f0dff7a394e34f82a78a510fd0ceac02','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('95531c9f86b4467ab8ad782f6f6be2c6','0191c8b6b276404881679e570778047e','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('958fb34bb53a48a899bb4a061af5c27a','2055ff60abd4465c9d3c0934a2c43ba9','1','1','2015-11-06'),
 ('96630330da9444be8cd5e8b0c23fb1ee','0f0f932cdbc14629aa94aba0bb333a06','12','0',NULL),
 ('96a3977ca4a145ba89c1006eac9162a8','8d67574047ed4d7790381fb5fc4019a8','13','0',NULL),
 ('970c7d463aff4fd98a084a9f8ff5bcc0','88d32ebd5a5944ec92ebdf99cc00d356','3','0',NULL),
 ('97bfc585e3c749bcae0133543bf9f41e','2055ff60abd4465c9d3c0934a2c43ba9','2','0',NULL),
 ('9887728824c8409b8173b0af757feee0','e422136885a3473aa85f9f0749c75a78','6','0',NULL),
 ('9897c896475345e8b8955d9b240144bb','48e71d295aed4d1c94eced78488abce1','10','0',NULL),
 ('995d084ff2014a9d87198ab81d8a643a','522ca59deba34f268077efd3c439eb3d','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('99edaf1fef134e7090fa0786f78e0731','0191c8b6b276404881679e570778047e','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('9a60df47f1044ad38b6dd738e44b7346','638da80f1e8f4fc28c421d8febc9a7fe','8b454376c0434e2792a1dc57edf80dbd','0',NULL),
 ('9a975f1c379148fdb91c56c6441ab363','227b389e540f4beb85a4448e00beac5d','1','1','2015-11-03'),
 ('9adf517f7fe141f8b7544b677df1a3a4','7fe83bb7ca9a413bb37acac91215ea16','13','0',NULL),
 ('9b5d6138fe8b4bee8982a126441661a6','c3ac32da72644cd0805fa663bed26edf','3','0',NULL),
 ('9ba988c2ff8e44f586a61fc41186cfce','fcdd1348b7644afea196695b1eede954','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('9be2d79e58d343dcba12657a64331a66','8a14c7e5c5e2486ea004765160ee1324','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('9c0db4b5b9ee4e38a31acdc2f6710985','1a3428088ad347269b52ed50dfcb81c9','13','0',NULL),
 ('9c606f818e384a8299db561199bd2558','f0dff7a394e34f82a78a510fd0ceac02','1','1','2015-12-30'),
 ('9c6fc908e1df4281bcfabd414e619821','48e71d295aed4d1c94eced78488abce1','13','0',NULL),
 ('9d1d9b59cd8a4ee8b54609a90bfb1db4','dba81703f6874b82935ca389317d6d19','7','0',NULL),
 ('9f08c8e5f690435ea5370fd803a9119a','2055ff60abd4465c9d3c0934a2c43ba9','3','0',NULL),
 ('9f10896eeb664ae3843484c299cc8f2e','69abb236d4a44bd3bb31cfedf273c031','5','0',NULL),
 ('a1150f9fea2a4100932a400fcb824d8e','522ca59deba34f268077efd3c439eb3d','8b454376c0434e2792a1dc57edf80dbd','0',NULL),
 ('a1d9880f68224e389f8825a68891f2ef','638da80f1e8f4fc28c421d8febc9a7fe','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('a2484682b2644c5eba8db02c686c58b2','c00f8c9d385042949724953f9a5faed9','9','0',NULL),
 ('a28be5be1d5844428ae3b3213f6fb57c','d59f683455884cd18d412879d6f9d042','1','1','2015-11-06'),
 ('a33b16cfceb640f181ccec592451dcba','f3b7b7409d6642ac9e1249011915b65f','13','0',NULL),
 ('a37d8587a9294ab6bbdbf68c92c19cc0','8d67574047ed4d7790381fb5fc4019a8','3','0',NULL),
 ('a4423d4a7a9f4acf945f6fad28935fc2','2b14a498414b44778cc100c2032e2c5a','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('a48ca1f3596c42b1a6e526e75dd29d20','46a635664fb5420ea1aa533969a08301','4','0',NULL),
 ('a4c7ac7e2d3d406a8c91652f072537e6','28d2622a6e0a4ab485e1c082d30c75ef','2','0',NULL),
 ('a4e57a23af064c6a9b1abf75b1f0b0c1','e48bb0cd337947dcad57ed1ba5036c0a','7','0',NULL),
 ('a5227dd005d44a33b9003088a32fc60a','d59f683455884cd18d412879d6f9d042','9','0',NULL),
 ('a54c275cf1db479fa1d52576a9b5b7c3','69abb236d4a44bd3bb31cfedf273c031','1','0',NULL),
 ('a57a43254dc9458da0be27c76499a025','8ae80eff98be40aa9acdd2a01e6920ef','3','0',NULL),
 ('a58ab1be71b0463ba7ec624ad8e9333d','88d32ebd5a5944ec92ebdf99cc00d356','9','0',NULL),
 ('a5ec41281132436ab71cd4c2cd1df0d4','14535c661515479f954cf3a192a6329f','4','0',NULL),
 ('a62ede5803c64a76a5eac58a6ef2cd3a','39de39ff1ab74233bce9c5a913af2c9c','7','0',NULL),
 ('a65af476501647e6ae04284490b6768a','0191c8b6b276404881679e570778047e','4','0',NULL),
 ('a66ce5d3852440a4b4f03a35fb8dc0e7','e422136885a3473aa85f9f0749c75a78','1','0',NULL),
 ('a68d7dd57a8b48f6b898eed8b47ebce9','2b14a498414b44778cc100c2032e2c5a','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('a6960834f54f41a4980e2399ceb4745c','dba81703f6874b82935ca389317d6d19','1','1','2015-11-10'),
 ('a6bbf8ddbbc543cd853cd714d70cc876','46a635664fb5420ea1aa533969a08301','9','0',NULL),
 ('a83b4087ed0540eba2fb6795172f2f6e','7fe83bb7ca9a413bb37acac91215ea16','2','0',NULL),
 ('a86688d0d48e42429e786bfbc4988599','69abb236d4a44bd3bb31cfedf273c031','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('a8b5e81543854d09840d2114c02be3be','13d61fb791e64f41b94e856c3c446c1d','11','0',NULL),
 ('a8d749d3ffe640af945ef47d32b86da1','4226f5d40009414d854569158e5bcc44','2','0',NULL),
 ('a91f52355c8f4c54bfcb0bd230c12008','f6781437795d48e5a74d6d43828208b0','6','0',NULL),
 ('a929ff8db87642ffa6b417e61048e192','f0dff7a394e34f82a78a510fd0ceac02','4','0',NULL),
 ('a9c1736e157345ccacd47e3867360abc','522ca59deba34f268077efd3c439eb3d','4','0',NULL),
 ('aa32554c9d874dea828d538ce72f5220','48e71d295aed4d1c94eced78488abce1','11','0',NULL),
 ('aa605b20026f45fcbdca0794122882a0','8a14c7e5c5e2486ea004765160ee1324','4','0',NULL),
 ('aaf5b42072c44722bb7c409a7749dd7e','8ae80eff98be40aa9acdd2a01e6920ef','2','0',NULL),
 ('ab06e5a26dea456785174c8c79c0b42b','13d61fb791e64f41b94e856c3c446c1d','3','0',NULL),
 ('aba47a6e435445fe8da7f697275fffd6','4e5f48bc8efe4ef3806bd6da18dccc57','7','0',NULL),
 ('ac11154f93664db0863e37a1db65b4d8','28d2622a6e0a4ab485e1c082d30c75ef','1','0',NULL),
 ('ac26984d05c640e8ab2e2f818f402532','fcdd1348b7644afea196695b1eede954','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('ad53c7adec954418b2889f0e116bd49d','fcdd1348b7644afea196695b1eede954','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('adf4665c7f1b4ff3adfca7a4a26733c7','e2ae2d875fda4f0d9e9db79954c05834','3','0',NULL),
 ('adf50ed98fe949ae835cc0f676052202','e2ae2d875fda4f0d9e9db79954c05834','10','0',NULL),
 ('aed0fdb7651b447e9a6c5caf055398cf','8ae80eff98be40aa9acdd2a01e6920ef','8','0',NULL),
 ('af8c5f5f187e40518cee6cb9dc3a796f','4226f5d40009414d854569158e5bcc44','1','0',NULL),
 ('afc50ce904bc4bf8b0daaa5355588faf','0191c8b6b276404881679e570778047e','8','0',NULL),
 ('b011233c89e54da8a6abf4684a805e00','88d32ebd5a5944ec92ebdf99cc00d356','7','0',NULL),
 ('b0431ec47b2844308b6ac84e613a0cb4','69abb236d4a44bd3bb31cfedf273c031','3','0',NULL),
 ('b13fd8414a544bdca6b9c61263e3de26','8ae80eff98be40aa9acdd2a01e6920ef','5','0',NULL),
 ('b156580f00284f0587a99c117cfab9e4','393f25fd98c34992bcc72eea2929ea63','12','0',NULL),
 ('b2b5ddee082d421bb197fde5649e7252','638da80f1e8f4fc28c421d8febc9a7fe','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('b354a8d671494195a90bcd8192c735f0','d59f683455884cd18d412879d6f9d042','10','0',NULL),
 ('b3ae34c1459540278f835df5f1d32622','8d67574047ed4d7790381fb5fc4019a8','7','0',NULL),
 ('b3ec764f64ba40d1b8c927f433c502cf','69abb236d4a44bd3bb31cfedf273c031','11','0',NULL),
 ('b3f750f5b6af4528a1d581881fee96d7','c3ac32da72644cd0805fa663bed26edf','11','0',NULL),
 ('b485ddea354649fda3a373eb5c62caff','638da80f1e8f4fc28c421d8febc9a7fe','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('b4ca354437ed4528ac61d5a6bc1b7781','cd96f7d2cffe4c268e1fe8b93940f97a','12','0',NULL),
 ('b56f9f1d5fc34ae4809481e01552efb1','227b389e540f4beb85a4448e00beac5d','3','0',NULL),
 ('b5a37a6dc97b4feabc1a1c777448f10f','2b14a498414b44778cc100c2032e2c5a','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('b5cbbb2ac25a40cc93559195d1ad7cd8','2757b0387e6c4449b3bac78ced1abf58','6','0',NULL),
 ('b5e72947b3dc4ecb9f0f8b98f15c2c41','f6781437795d48e5a74d6d43828208b0','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('b601ef12e0c845ad90fad44a3032f960','7fe83bb7ca9a413bb37acac91215ea16','1','1','2015-11-02'),
 ('b6381a630e88475d9f995c6fe4dbb66a','d59f683455884cd18d412879d6f9d042','5','0',NULL),
 ('b63ea90d0cad4866b1c80cd6174f864c','0191c8b6b276404881679e570778047e','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('b66dbe0433ac4ad9a49797910d7ea6db','227b389e540f4beb85a4448e00beac5d','12','0',NULL),
 ('b6fdb76ccf914dd997832a1d29d7913d','393f25fd98c34992bcc72eea2929ea63','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('b79a87472ebe4698b7bb913ed4c4249a','f0dff7a394e34f82a78a510fd0ceac02','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('b7a4c1a8e1ae4b2c844e914f78de2d30','638da80f1e8f4fc28c421d8febc9a7fe','8','0',NULL),
 ('b7b3096845774532a683786921161c4a','e2ae2d875fda4f0d9e9db79954c05834','8','0',NULL),
 ('b8f93db6cde04052885d3f92b4726ffc','2b14a498414b44778cc100c2032e2c5a','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('b9121d3fe8654698896a7314e8c6daca','5eb0dfee1de948348bbf7663c7c81854','2','0',NULL),
 ('b96409a9f8ff44c9baf86f452ff3ba1e','8d67574047ed4d7790381fb5fc4019a8','5','0',NULL),
 ('b9d6546c41cd4f49b22c8fe6c6e9620e','2055ff60abd4465c9d3c0934a2c43ba9','5','0',NULL),
 ('b9d8bd9ba5ba42069a398cedaa417b38','fcdd1348b7644afea196695b1eede954','d8de25a1f872404e82f669c04091685e','0',NULL),
 ('ba6b26c69e53440f8c2ec0a3f27ad5e0','51649ecc4891453886fe523ff106ca8b','dc9663e71aaa42f0a2634770896ec74c','0',NULL),
 ('baa0ae72ed444750a5411a29bf799c74','46a635664fb5420ea1aa533969a08301','11','0',NULL),
 ('bc0792efb0e14feca3e87ed5b60bf287','4226f5d40009414d854569158e5bcc44','3','0',NULL),
 ('bc3589ab3cb14d89893b5dfa24cbe946','e2ae2d875fda4f0d9e9db79954c05834','6','0',NULL),
 ('bc393288eb474da1b5b7c28cf9c46e09','f6781437795d48e5a74d6d43828208b0','9','0',NULL),
 ('bc73430cbdeb432c9c2cb6cf8f5b9d5d','2055ff60abd4465c9d3c0934a2c43ba9','7','0',NULL),
 ('bc88ddf4fe924fb897d93fb069e1bcc3','f0dff7a394e34f82a78a510fd0ceac02','6474fda3f35c4d1580b646a42f190cf7','0',NULL),
 ('bcb78bfbfb1c45569ab5f3867f5d9ebe','cc4ca4ce262247adb662c3ce2631a1db','2','0',NULL),
 ('bcf972eadc0e47038e9137ce9dce4aa2','7fe83bb7ca9a413bb37acac91215ea16','7','0',NULL),
 ('bd9077c9154447dea2b1019290a6fe98','f0dff7a394e34f82a78a510fd0ceac02','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('bddc75cc8dcc420f8f6023a2a340f291','28d2622a6e0a4ab485e1c082d30c75ef','9','0',NULL),
 ('be13b6c7d2ef4afb9629a3c32310bc68','d59f683455884cd18d412879d6f9d042','12','0',NULL),
 ('be19597554b94a6dacd76fd778c85174','8a14c7e5c5e2486ea004765160ee1324','8','0',NULL),
 ('be95969ff93247c29d89392566fdf3f1','51649ecc4891453886fe523ff106ca8b','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('bef586d733cf4093a8f8e7f3cb0bb7f5','46a635664fb5420ea1aa533969a08301','10','0',NULL),
 ('bf205161000c4a68988b91eeb586f05c','13d61fb791e64f41b94e856c3c446c1d','12','0',NULL),
 ('c01f8fa7585e43b6ba15e881e8053e4e','393f25fd98c34992bcc72eea2929ea63','6','0',NULL),
 ('c04451704997461a86a701fb85708ccc','f6781437795d48e5a74d6d43828208b0','8','0',NULL),
 ('c053c4945f0e48859e2d78f599c83f2d','14535c661515479f954cf3a192a6329f','3','0',NULL),
 ('c0f96c418d79454e8d70aff77728d451','4226f5d40009414d854569158e5bcc44','6d69972a880f4228b88f28254c3e417e','0',NULL),
 ('c1988bf4eca34b2b83c804a1302276b9','48e71d295aed4d1c94eced78488abce1','9','0',NULL),
 ('c224e47bc9e146acbb9715791d34794a','9b73f6e4d0ae4d23b1d98f4f8ca6873a','13','0',NULL),
 ('c22a47519b224b91bf5666542084bde1','2757b0387e6c4449b3bac78ced1abf58','7','0',NULL),
 ('c2a76b8aae5f43c887b800cb220fffda','46a635664fb5420ea1aa533969a08301','1','1','2015-11-02'),
 ('c2cd380bd8f64a7cbbca04babc75b988','dba81703f6874b82935ca389317d6d19','8','0',NULL),
 ('c2faec835ad94bb9af8d991a4cac87b2','03da36624829477493bfc949f22efdec','6','0',NULL),
 ('c3f7f1daf93047b48b7f6afbfc5b879c','1a3428088ad347269b52ed50dfcb81c9','6','0',NULL),
 ('c3fa4e736005461e8d862f203b37b4a4','46a635664fb5420ea1aa533969a08301','6','0',NULL),
 ('c4d92abddbe04f549ffeea2d2b14210a','fcdd1348b7644afea196695b1eede954','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('c523385c3b61485fb4c47da3bffb455c','638da80f1e8f4fc28c421d8febc9a7fe','4','0',NULL),
 ('c53bdb731d1e476d9c8428f0bff2bece','dba81703f6874b82935ca389317d6d19','4','0',NULL),
 ('c5b62b3a7ec541839928a5670af13555','4226f5d40009414d854569158e5bcc44','10','0',NULL),
 ('c670586f2cfd426c9d229a1e38a089d1','2757b0387e6c4449b3bac78ced1abf58','12','0',NULL),
 ('c7612230469b42288cbedd2133ea629a','7fe83bb7ca9a413bb37acac91215ea16','12','0',NULL),
 ('c7614c06968944d69b3a5d3968342429','2757b0387e6c4449b3bac78ced1abf58','1','1','2015-11-02'),
 ('c768363447da4ac59f72df4db2dcc246','5eb0dfee1de948348bbf7663c7c81854','11','0',NULL),
 ('c79df692db0a4b7dad3f66ce2bc72546','fcdd1348b7644afea196695b1eede954','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('c9d6f62797c144cd91b11fd5afb5a5a1','51649ecc4891453886fe523ff106ca8b','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('cb2064c0981d4a4fabde36ca8fb47eaa','c3ac32da72644cd0805fa663bed26edf','4','0',NULL),
 ('cb7b218088b14624a82bad3fb8220e36','1a3428088ad347269b52ed50dfcb81c9','1','0',NULL),
 ('cbe658001b0d4f08bd7005e777c371a9','cd96f7d2cffe4c268e1fe8b93940f97a','9','0',NULL),
 ('cbf64b39136e45f39d9602f3cbbc62a7','5eb0dfee1de948348bbf7663c7c81854','13','0',NULL),
 ('cc7ef76c3a4240b6b8507c50182f6c21','fcdd1348b7644afea196695b1eede954','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('cd46f43bc4934d1b9a2bcb8fc607f560','fcdd1348b7644afea196695b1eede954','8','0',NULL),
 ('cd4a4399431b44599609115d26186512','1a3428088ad347269b52ed50dfcb81c9','2','0',NULL),
 ('cd698972f50643e59680e305930e7035','fcdd1348b7644afea196695b1eede954','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('cee185522af948b4a43027519581ad26','13d61fb791e64f41b94e856c3c446c1d','2','0',NULL),
 ('cee6b4e5e6464ed384ffe06279687331','f0dff7a394e34f82a78a510fd0ceac02','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('cee92afd7f654a6a8a98449f919f5de2','c00f8c9d385042949724953f9a5faed9','1','1','2015-10-30'),
 ('cf08226f7c30409facdb0c5e642ba9f4','1a3428088ad347269b52ed50dfcb81c9','4','0',NULL),
 ('cfdc4e48539845d98f4a8e418199cd4b','227b389e540f4beb85a4448e00beac5d','9','0',NULL),
 ('d0ba28e957424124a123dcec2eef3a2e','8ae80eff98be40aa9acdd2a01e6920ef','12','0',NULL),
 ('d0e035a993324c48b4ab54e65c6343e3','8ae80eff98be40aa9acdd2a01e6920ef','11','0',NULL),
 ('d135d17cf5dd4de6ab78bd73e0f46fe3','0191c8b6b276404881679e570778047e','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('d1e91a6b04134332a17ff3acfea50e13','39de39ff1ab74233bce9c5a913af2c9c','12','0',NULL),
 ('d1f4e65e05b2476e9e7b809590bca150','03da36624829477493bfc949f22efdec','9','0',NULL),
 ('d20161629ae94f63aae91b3de9ca3210','f0dff7a394e34f82a78a510fd0ceac02','8','0',NULL),
 ('d2175c7c6ebc45ca85a011761b3d0045','2757b0387e6c4449b3bac78ced1abf58','9','0',NULL),
 ('d21b81f2bc244e9a964722d7a84380fc','0f0f932cdbc14629aa94aba0bb333a06','5','0',NULL),
 ('d21c190a84614fcea3d0bc03c23d5d19','46a635664fb5420ea1aa533969a08301','12','0',NULL),
 ('d40effffe9e443e096664ec157f4a8fb','530b93241fc9479f9c6bbadb32b65149','7','0',NULL),
 ('d4183fffcb7b4649ae077ed780698333','d59f683455884cd18d412879d6f9d042','2','0',NULL),
 ('d490484cb9fb46e9a41d561deab62aac','227b389e540f4beb85a4448e00beac5d','10','0',NULL),
 ('d49801a4390e47d7b2c586d34169fb98','2055ff60abd4465c9d3c0934a2c43ba9','10','0',NULL),
 ('d580e993de3a45aeb0117ec6b56a0d45','39de39ff1ab74233bce9c5a913af2c9c','8','0',NULL),
 ('d5c89baf40754d338425eb8febaa0403','c00f8c9d385042949724953f9a5faed9','13','0',NULL),
 ('d64416f1f98c4d85a630778bb6a808a3','2b14a498414b44778cc100c2032e2c5a','8b454376c0434e2792a1dc57edf80dbd','0',NULL),
 ('d65af4c12e5a483e9fbf55e3189b50d8','8d67574047ed4d7790381fb5fc4019a8','12','0',NULL),
 ('d73fa9b775074d94bdff42749087cf13','1a3428088ad347269b52ed50dfcb81c9','11','0',NULL),
 ('d7876494f5094d8885d382f417eb6513','e2ae2d875fda4f0d9e9db79954c05834','2','0',NULL),
 ('d799a474279e49bdae11e24ff90f5eca','f0dff7a394e34f82a78a510fd0ceac02','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('d799c93869864a98ac8b1cde858d5de7','c3ac32da72644cd0805fa663bed26edf','6d69972a880f4228b88f28254c3e417e','0',NULL),
 ('d8b661abfc9541c488d2836b1eb27ff5','2b14a498414b44778cc100c2032e2c5a','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('d962e3fd408e4941932a15e285625b80','14535c661515479f954cf3a192a6329f','5','0',NULL),
 ('d9ce8d88904949cebd9350efbe66e535','522ca59deba34f268077efd3c439eb3d','5091ca619fbf49209bce020859103ba5','0',NULL),
 ('da96b798e02a42819b055c84bbdf73aa','14535c661515479f954cf3a192a6329f','12','0',NULL),
 ('dac57037346f429f8c479a97744d0eea','638da80f1e8f4fc28c421d8febc9a7fe','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('dc0614d187bd44b4873df6187f318e05','e48bb0cd337947dcad57ed1ba5036c0a','5','0',NULL),
 ('dc66cfaf71674f72b4be47f039257941','0191c8b6b276404881679e570778047e','5b61eb41f80f43c5b8e485866178f63d','0',NULL),
 ('dcb7106651a74917b36c7f9598a9fbc4','2b14a498414b44778cc100c2032e2c5a','1','0',NULL),
 ('dcbb3ec285e04625af05ca9498021211','e48bb0cd337947dcad57ed1ba5036c0a','12','0',NULL),
 ('dce6d6e8ab3645f7ae2318bcbb37e9d7','638da80f1e8f4fc28c421d8febc9a7fe','eca1a51b803449d59ce4e2a3b0f4f787','0',NULL),
 ('dce7c0e9254b4195850bcf75ce28f5f1','14535c661515479f954cf3a192a6329f','8','0',NULL),
 ('dd599af2bad740068e312f54d588ab0a','2b14a498414b44778cc100c2032e2c5a','9','0',NULL),
 ('dd5cb62c1c624740a67ceb54cd606317','227b389e540f4beb85a4448e00beac5d','6','0',NULL),
 ('ddda86cd6b7a46cda2a14bf332149ca6','48e71d295aed4d1c94eced78488abce1','4','0',NULL),
 ('ddf0caa9581d401b8aa45524aa61b105','13d61fb791e64f41b94e856c3c446c1d','10','0',NULL),
 ('de04988cdfec4c7ba8105b63c3f5583f','2055ff60abd4465c9d3c0934a2c43ba9','9','0',NULL),
 ('de26a7f1ab2646ad94194742535dc608','4226f5d40009414d854569158e5bcc44','11','0',NULL),
 ('de7c3786b285492790bc3c592f0d4966','fcdd1348b7644afea196695b1eede954','9','0',NULL),
 ('de9c4009a28a4b4f9f37628f2a38fcaa','2055ff60abd4465c9d3c0934a2c43ba9','8','0',NULL),
 ('df07298d754248ab9f4ba87b21ea68a4','0191c8b6b276404881679e570778047e','19e655ebcd844747aa0e46efe9870169','0',NULL),
 ('df3131a956e044cdb6288dbe555c4a40','cd96f7d2cffe4c268e1fe8b93940f97a','3','0',NULL),
 ('df96ae3bee0149f7adabab8e1b84bb16','7fe83bb7ca9a413bb37acac91215ea16','10','0',NULL),
 ('e02c9fb93e6e421ebbb8e08e578123bc','39de39ff1ab74233bce9c5a913af2c9c','11','0',NULL),
 ('e037f8fe57e649899aef38e4dc53cc57','522ca59deba34f268077efd3c439eb3d','cb359e3089224f97adae46cf03c0ed94','0',NULL),
 ('e079010bd03a47afa7001e706abe7b93','530b93241fc9479f9c6bbadb32b65149','8','0',NULL),
 ('e101e5fda5d840f1a22b83789e73e493','7fe83bb7ca9a413bb37acac91215ea16','3','0',NULL),
 ('e1215d40a0d94357ae9502079f46af3c','5eb0dfee1de948348bbf7663c7c81854','10','0',NULL),
 ('e13635002a534f2d92e9fb14cc6dc0a5','13d61fb791e64f41b94e856c3c446c1d','7','0',NULL),
 ('e1e593b37e8547789e37e6d5c6315d52','8a14c7e5c5e2486ea004765160ee1324','8b454376c0434e2792a1dc57edf80dbd','0',NULL),
 ('e1e7968219644139a78f29db78b6a6b4','f6781437795d48e5a74d6d43828208b0','3','0',NULL),
 ('e2b7f1c3417644c3877321e15c682510','2055ff60abd4465c9d3c0934a2c43ba9','12','0',NULL),
 ('e33900bcf3994b4c88af6f9a013b00cc','c76b572ff8884896a16a42c08ff2da95','3','0',NULL),
 ('e35264ca816a46afaba9255bc561d3cf','4e5f48bc8efe4ef3806bd6da18dccc57','13','0',NULL),
 ('e37d11789bd4489d8df7b4073bb2a2a0','8a14c7e5c5e2486ea004765160ee1324','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('e3bb99c7f2644b5aa169313532e85aa0','28d2622a6e0a4ab485e1c082d30c75ef','10','0',NULL),
 ('e4723b5bf660481fa671089ff46afcc8','e48bb0cd337947dcad57ed1ba5036c0a','2','0',NULL),
 ('e49627f6cad74b068ec669ded40c7614','638da80f1e8f4fc28c421d8febc9a7fe','3f7ef2d4761f445e946413ab9bea23db','0',NULL),
 ('e4e9c3a4889b489da82353739b0e7e9a','227b389e540f4beb85a4448e00beac5d','2','0',NULL),
 ('e4f29bf9437f42a09976f7a6978daf33','14535c661515479f954cf3a192a6329f','6d69972a880f4228b88f28254c3e417e','0',NULL),
 ('e5244ccfdde24b76a626e72adab0fbc3','522ca59deba34f268077efd3c439eb3d','d355e9e6b4ad48a59fa0a983e8b7b583','0',NULL),
 ('e53392a5e9d342f0a0fa592ec09c5500','88d32ebd5a5944ec92ebdf99cc00d356','11','0',NULL),
 ('e562754e38354a48ac5019156e64e4e6','14535c661515479f954cf3a192a6329f','9','0',NULL),
 ('e5628cd2f3744f19ade2d4de1ea1166e','522ca59deba34f268077efd3c439eb3d','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('e588afe33c234575b811e5c5b56860c3','cd96f7d2cffe4c268e1fe8b93940f97a','8','0',NULL),
 ('e5f545fb272e429ea00e40a7c0abb4bc','393f25fd98c34992bcc72eea2929ea63','10','0',NULL),
 ('e72dd6df344d40d884913383fff2e9ce','28d2622a6e0a4ab485e1c082d30c75ef','7','0',NULL),
 ('e7b8135c64404c7592aeb87f6fbe3429','522ca59deba34f268077efd3c439eb3d','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('e801730955104376a44c2cd5c5206fa5','e422136885a3473aa85f9f0749c75a78','5','0',NULL),
 ('e82054e7858d4aa895af8c67c6209e04','227b389e540f4beb85a4448e00beac5d','13','0',NULL),
 ('e83f630374a6418da685b9d5a63b1ca9','f6781437795d48e5a74d6d43828208b0','10','0',NULL),
 ('e867d15b4b7b4eb589a7e45dba6ff1a6','28d2622a6e0a4ab485e1c082d30c75ef','12','0',NULL),
 ('e8e230d0277c4b92befeb4b4709a28be','2b14a498414b44778cc100c2032e2c5a','8','0',NULL),
 ('e8f0ed90496043f9ad41629946f68a2a','51649ecc4891453886fe523ff106ca8b','9','0',NULL),
 ('e905ea570ce14214b1dba65d05e091e1','c76b572ff8884896a16a42c08ff2da95','4','0',NULL),
 ('e92623eff5f94b6cac014d948773fb67','2b14a498414b44778cc100c2032e2c5a','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('e995b307259c4461848d925bda3d8a31','03da36624829477493bfc949f22efdec','4','0',NULL),
 ('ea4bcbe0fe804333a20b4101334a10fb','0f0f932cdbc14629aa94aba0bb333a06','11','0',NULL),
 ('eab8e1402e4a4ea58517323a5f8f010f','28d2622a6e0a4ab485e1c082d30c75ef','4','0',NULL),
 ('eac2393beb5c4224ab195e7524038620','fcdd1348b7644afea196695b1eede954','f12330474f634e2897878e8f56a910ae','0',NULL),
 ('eaf685c95903478c929b3faefb7547dd','51649ecc4891453886fe523ff106ca8b','8','0',NULL),
 ('eb866519888d4a28b99c478ebf0a1b19','4226f5d40009414d854569158e5bcc44','da60c61cf2aa4cb2810c629c7045c538','0',NULL),
 ('eb8730b9c1a04f23bf5da197ae9d5909','13d61fb791e64f41b94e856c3c446c1d','1','1','2015-11-10'),
 ('ec7013a4ecb641068a23beafec961b3e','46a635664fb5420ea1aa533969a08301','2','0',NULL),
 ('eccdb1ae52c24c7fbee6866f8781bcd6','cc4ca4ce262247adb662c3ce2631a1db','5','0',NULL),
 ('ecd3a92cdf674277bbddac74713d5c2a','cc4ca4ce262247adb662c3ce2631a1db','9','0',NULL),
 ('ecdc6f385d324fca9f893f5d0b9fd42e','8ae80eff98be40aa9acdd2a01e6920ef','6','0',NULL),
 ('ed9a70fb752d4323b4e731d0025383fe','5eb0dfee1de948348bbf7663c7c81854','4','0',NULL),
 ('edcb74e386e64ddcb79387c7aa3ad914','1a3428088ad347269b52ed50dfcb81c9','5','0',NULL),
 ('ee033d370b894169adcc502cdef72a7a','28d2622a6e0a4ab485e1c082d30c75ef','8','0',NULL),
 ('ee2ddc87896b497a9c002347f253e1eb','5eb0dfee1de948348bbf7663c7c81854','6','0',NULL),
 ('eeb2bfe1168f4636aa431ddbc9de5c1a','46a635664fb5420ea1aa533969a08301','13','0',NULL),
 ('eed21f8a809648bc95426a7c3fc09223','638da80f1e8f4fc28c421d8febc9a7fe','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('eefbef7e7eae4083a281002386b59e97','530b93241fc9479f9c6bbadb32b65149','4','0',NULL),
 ('ef5183c128ad43cd82aaead5c9803134','cd96f7d2cffe4c268e1fe8b93940f97a','5','0',NULL),
 ('f0db0b07d4ec41e7b017c78ce30a18c8','1a3428088ad347269b52ed50dfcb81c9','10','0',NULL),
 ('f0ed980b1cab492297def7b86d4f7432','e422136885a3473aa85f9f0749c75a78','3','0',NULL),
 ('f10a409a624e44838c06f2d7d3923990','f0dff7a394e34f82a78a510fd0ceac02','7','0',NULL),
 ('f12b0aeeef744dea993bcf54d6b10800','dba81703f6874b82935ca389317d6d19','10','0',NULL),
 ('f1a78dd218664eae8fdb87cbaf35fa7b','28d2622a6e0a4ab485e1c082d30c75ef','13','0',NULL),
 ('f25420b78ed84fa288252b8a28083962','dba81703f6874b82935ca389317d6d19','11','0',NULL),
 ('f4642143bb1a4da1a245f216e86174e9','0f0f932cdbc14629aa94aba0bb333a06','4','0',NULL),
 ('f4c87bfc60374d15afb69a7d51677a17','cc4ca4ce262247adb662c3ce2631a1db','4','0',NULL),
 ('f4f16f3a27634ac7b9c236254ee712b4','fcdd1348b7644afea196695b1eede954','bb81a0c098a444e69028380e80852d91','0',NULL),
 ('f4f98c817c24485da07d8c2543f535de','530b93241fc9479f9c6bbadb32b65149','2','0',NULL),
 ('f50b9310c82941a684da97b9406eaf70','393f25fd98c34992bcc72eea2929ea63','3','0',NULL),
 ('f5f92d9abe3b4b28a18e32625b8216fb','8a14c7e5c5e2486ea004765160ee1324','d42378c9621b4551a0c4c63c82f0aa33','0',NULL),
 ('f6037272ff6f499b93af47e4131b7412','4e5f48bc8efe4ef3806bd6da18dccc57','6','0',NULL),
 ('f65c31d42a1b4fb4b7b859edacc1f8e9','8ae80eff98be40aa9acdd2a01e6920ef','1','1','2015-11-10'),
 ('f6d9bca8a2b94c26974ccd3d11b13fd7','c3ac32da72644cd0805fa663bed26edf','7','0',NULL),
 ('f6f6364eae254a59ae49aa4441a916b3','c76b572ff8884896a16a42c08ff2da95','1','1','2015-11-02'),
 ('f79ace9786fb4f85afe575bcd9578904','0f0f932cdbc14629aa94aba0bb333a06','6','0',NULL),
 ('f7bf8f004ed84af5b584aff7cdbb0606','39de39ff1ab74233bce9c5a913af2c9c','3','0',NULL),
 ('f7c0d34f764d4319a293ee48c01e561d','522ca59deba34f268077efd3c439eb3d','9','0',NULL),
 ('f88293e176854317bb9c3c299ba9b840','39de39ff1ab74233bce9c5a913af2c9c','1','1','2015-11-02'),
 ('f88a35866e18436bb97867220b0b2345','f3b7b7409d6642ac9e1249011915b65f','10','0',NULL),
 ('f94dddcdc88744e5a503790ca8f3cddf','e2ae2d875fda4f0d9e9db79954c05834','5','0',NULL),
 ('f9d35de186774cc09f5b0c06fd558ece','03da36624829477493bfc949f22efdec','12','0',NULL),
 ('f9f1434b2d154e3c8c16bab172321c62','c3ac32da72644cd0805fa663bed26edf','6','0',NULL),
 ('fa663f950c09485f8c32b370069804e1','46a635664fb5420ea1aa533969a08301','8','0',NULL),
 ('fb5d4654922c4b28986c0bca0f2d3e30','cd96f7d2cffe4c268e1fe8b93940f97a','11','0',NULL),
 ('fbb4504b2a39402780d96228d58a5782','c00f8c9d385042949724953f9a5faed9','7','0',NULL),
 ('fc1f320b407143efaf5e14ac980e0c98','d59f683455884cd18d412879d6f9d042','4','0',NULL),
 ('fc368e5f262f49399171fa193f54f554','522ca59deba34f268077efd3c439eb3d','1','1','2016-01-13'),
 ('fcc7588d032944a5b4fdcc36333599fc','88d32ebd5a5944ec92ebdf99cc00d356','1','1','2015-11-06'),
 ('fd195dc60f9f49f8aea5d5229848ab72','03da36624829477493bfc949f22efdec','13','0',NULL),
 ('fe2d00cd9edc40bd881ce884d72eea31','9b73f6e4d0ae4d23b1d98f4f8ca6873a','10','0',NULL),
 ('fea944dbcf464d63ad6ed7b7c0fd5f83','638da80f1e8f4fc28c421d8febc9a7fe','5ad0d1f9efdc44b481b02c26b67e832e','0',NULL),
 ('fec1a845003b428894777fede9df03d6','8a14c7e5c5e2486ea004765160ee1324','4639f877ec7149258cadcf145b4182a7','0',NULL),
 ('ffb53b7e968f43d49c566e67407920ab','dba81703f6874b82935ca389317d6d19','5','0',NULL);
/*!40000 ALTER TABLE `oa_notify_record` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(36) NOT NULL default '' COMMENT '主键',
  `create_by` varchar(32) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` varchar(32) default NULL COMMENT '删除标记（0：正常；1：删除）',
  `name` varchar(32) default NULL COMMENT 'name',
  `c_id` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='student';

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) default NULL COMMENT '区域编码',
  `type` char(1) default NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

--
-- Dumping data for table `sys_area`
--

/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` (`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('1','0','0,','中国','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('17e8e72326574a0ea94b15d6eeddbb6d','364a832bee8a42afa333e338813330de','0,1,c11497c3311a4be29253f29bd59ab485,364a832bee8a42afa333e338813330de,','软件大道','30','','4','1','2016-01-11 23:09:38','1','2016-01-11 23:09:38','','0'),
 ('19298dc65ecd45cc803a6da294d1ff60','1','0,1,','北京','30','','2','1','2016-01-15 19:55:09','1','2016-01-15 19:55:09','','0'),
 ('364a832bee8a42afa333e338813330de','c11497c3311a4be29253f29bd59ab485','0,1,c11497c3311a4be29253f29bd59ab485,','南京','30','','3','1','2015-12-24 21:38:02','1','2016-01-11 23:09:25','','0'),
 ('90ecd439eb3845db97a627d9242145e8','1','0,1,','上海','30','','2','1','2016-01-15 19:54:55','1','2016-01-15 19:54:55','','0'),
 ('c11497c3311a4be29253f29bd59ab485','1','0,1,','江苏','30','','2','1','2015-11-11 17:37:48','1','2015-11-11 17:38:14','','0'),
 ('e418dc99691d4e29961d53ca218ece8b','1','0,1,','福建','30','0100','2','1','2016-01-15 19:54:30','1','2016-01-15 19:54:30','','0'),
 ('ee38f91df4444529b00f093be5a07b7a','e418dc99691d4e29961d53ca218ece8b','0,1,e418dc99691d4e29961d53ca218ece8b,','福州','30','0200','1','1','2016-01-15 19:54:44','1','2016-01-15 19:54:44','','0');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;


--
-- Definition of table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) default '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

--
-- Dumping data for table `sys_dict`
--

/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` (`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('0a22f3278a624882a822e0820f27efcb','1','主表','table_type','表类型','20','0','1','2016-01-05 21:47:14','1','2016-01-05 21:53:34','','0'),
 ('1','0','正常','del_flag','删除标记','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('10','yellow','黄色','color','颜色值','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('100','java.util.Date','Date','gen_java_type','Java类型\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('104','Custom','Custom','gen_java_type','Java类型\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('108','0','草稿','oa_notify_status','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('109','1','发布','oa_notify_status','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('11','orange','橙色','color','颜色值','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('110','0','未读','oa_notify_read','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('111','1','已读','oa_notify_read','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),
 ('12','default','默认主题','theme','主题方案','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('13','cerulean','天蓝主题','theme','主题方案','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('14','readable','橙色主题','theme','主题方案','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('17','1','国家','sys_area_type','区域类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('18','2','省份、直辖市','sys_area_type','区域类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('19','3','地市','sys_area_type','区域类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('1c0ac576c33d41fcb4c16602bf4fad5d','post','post','interface_type','接口类型','20','0','1','2015-11-30 15:52:25','1','2015-11-30 15:52:39','','0'),
 ('2','1','删除','del_flag','删除标记','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('20','4','区县','sys_area_type','区域类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('21','1','公司','sys_office_type','机构类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('22','2','部门','sys_office_type','机构类型','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('221a918bd1e149239a17ab0fdeaf5ecd','get','get','interface_type','接口类型','10','0','1','2015-11-30 15:51:56','1','2015-11-30 15:51:56','','0'),
 ('23','3','小组','sys_office_type','机构类型','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('24','4','其它','sys_office_type','机构类型','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('25','1','综合部','sys_office_common','快捷通用部门','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('26','2','开发部','sys_office_common','快捷通用部门','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('27','3','人力部','sys_office_common','快捷通用部门','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('28','1','一级','sys_office_grade','机构等级','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('29','2','二级','sys_office_grade','机构等级','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('3','1','显示','show_hide','显示/隐藏','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('30','3','三级','sys_office_grade','机构等级','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('31','4','四级','sys_office_grade','机构等级','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('32','1','所有数据','sys_data_scope','数据范围','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('33','2','所在公司及以下数据','sys_data_scope','数据范围','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('34','3','所在公司数据','sys_data_scope','数据范围','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('35','4','所在部门及以下数据','sys_data_scope','数据范围','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('36','5','所在部门数据','sys_data_scope','数据范围','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('37','8','仅本人数据','sys_data_scope','数据范围','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('38','9','按明细设置','sys_data_scope','数据范围','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('39','1','系统管理','sys_user_type','用户类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('4','0','隐藏','show_hide','显示/隐藏','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('40','2','部门经理','sys_user_type','用户类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('41','3','普通用户','sys_user_type','用户类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('42','basic','基础主题','cms_theme','站点主题','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('43','blue','蓝色主题','cms_theme','站点主题','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('43c9472f411c4d3eafb3bf5319ffe499','2','异常报告','report_type','异常的报告','20','0','1','2015-12-08 17:49:57','1','2015-12-08 17:49:57','','0'),
 ('44','red','红色主题','cms_theme','站点主题','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('45','article','文章模型','cms_module','栏目模型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('46','picture','图片模型','cms_module','栏目模型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('47','download','下载模型','cms_module','栏目模型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('48','link','链接模型','cms_module','栏目模型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('49','special','专题模型','cms_module','栏目模型','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('5','1','是','yes_no','是/否','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('50','0','默认展现方式','cms_show_modes','展现方式','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('51','1','首栏目内容列表','cms_show_modes','展现方式','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('52','2','栏目第一条内容','cms_show_modes','展现方式','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('53','0','发布','cms_del_flag','内容状态','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('54','1','删除','cms_del_flag','内容状态','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('55','2','审核','cms_del_flag','内容状态','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('56','1','首页焦点图','cms_posid','推荐位','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('57','2','栏目页文章推荐','cms_posid','推荐位','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('58','1','咨询','cms_guestbook','留言板分类','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('59','2','建议','cms_guestbook','留言板分类','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('5b899603552c48519e7ba8eb9da0b41f','0','单表','table_type','表类型','10','0','1','2016-01-05 21:46:39','1','2016-01-05 21:53:50','','0'),
 ('6','0','否','yes_no','是/否','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('60','3','投诉','cms_guestbook','留言板分类','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('61','4','其它','cms_guestbook','留言板分类','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),
 ('62','1','公休','oa_leave_type','请假类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('63','2','病假','oa_leave_type','请假类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('638e9284e89b42119c10c0de75a48c15','0','未审核','audit_status','未审核','1','0','1','2016-05-23 23:45:59','1','2016-05-29 00:06:24','','0'),
 ('64','3','事假','oa_leave_type','请假类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('65','4','调休','oa_leave_type','请假类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('66','5','婚假','oa_leave_type','请假类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('67','1','接入日志','sys_log_type','日志类型','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
 ('68','2','异常日志','sys_log_type','日志类型','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
 ('680ddd8c91fe43588a7bb7aafe816633','1','正常报告','report_type','正常的报告','10','0','1','2015-12-08 17:49:28','1','2015-12-08 17:49:28','正常的报告','0'),
 ('69','leave','请假流程','act_type','流程类型','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
 ('7','red','红色','color','颜色值','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('70','test_audit','审批测试流程','act_type','流程类型','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
 ('71','1','分类1','act_category','流程分类','10','0','1','2013-06-03 08:00:00','1','2015-11-06 16:08:42','','0'),
 ('71804c6b820048b09c9f6f2c11121113','ace','ACE风格','theme','主题方案','15','0','1','2016-04-20 21:57:21','1','2016-04-20 21:57:21','','0'),
 ('72','2','分类2','act_category','流程分类','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),
 ('73','crud','增删改查','gen_category','代码生成分类','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('75','tree','树结构','gen_category','代码生成分类','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('76','=','=','gen_query_type','查询方式','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('77','!=','!=','gen_query_type','查询方式','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('78','&gt;','&gt;','gen_query_type','查询方式','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('79','&lt;','&lt;','gen_query_type','查询方式','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('8','green','绿色','color','颜色值','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('80','between','Between','gen_query_type','查询方式','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('81','like','Like','gen_query_type','查询方式','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('82','left_like','Left Like','gen_query_type','查询方式','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('83','right_like','Right Like','gen_query_type','查询方式','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('84','input','文本框','gen_show_type','字段生成方案','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('85','textarea','文本域','gen_show_type','字段生成方案','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('86','select','下拉框','gen_show_type','字段生成方案','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('87','checkbox','复选框','gen_show_type','字段生成方案','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('88','radiobox','单选框','gen_show_type','字段生成方案','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('89','dateselect','日期选择','gen_show_type','字段生成方案','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('8da7dcc97af046f8b77db35dab88c7e5','1','审核通过','audit_status','审核通过','2','0','1','2016-05-23 23:46:23','1','2016-05-29 00:06:31','','0'),
 ('9','blue','蓝色','color','颜色值','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('90','userselect','人员选择\0','gen_show_type','字段生成方案','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('91','officeselect','部门选择','gen_show_type','字段生成方案','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('92','areaselect','区域选择','gen_show_type','字段生成方案','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('93','String','String','gen_java_type','Java类型','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('94','Long','Long','gen_java_type','Java类型','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('96','1','男','sex','性别','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),
 ('97','2','女','sex','性别','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),
 ('98','Integer','Integer','gen_java_type','Java类型\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('99','Double','Double','gen_java_type','Java类型\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),
 ('bde6043665ef4571b85d0edab667cd15','3','树结构表','table_type','表类型','40','0','1','2016-01-06 19:48:50','1','2016-01-06 19:48:50','','0'),
 ('cc94b0c5df554a46894991210a5fc486','2','附表','table_type','表类型','30','0','1','2016-01-05 21:47:38','1','2016-01-05 21:53:44','','0'),
 ('fabbaa2395a24aae8e89e986ad9a0477','3','审核不通过','audit_status','审核不通过','12','0','1','2016-05-23 23:46:37','1','2016-05-23 23:46:37','','0');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;


--
-- Definition of table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) default '1' COMMENT '日志类型',
  `title` varchar(255) default '' COMMENT '日志标题',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `remote_addr` varchar(255) default NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) default NULL COMMENT '用户代理',
  `request_uri` varchar(255) default NULL COMMENT '请求URI',
  `method` varchar(5) default NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY  (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

--
-- Dumping data for table `sys_log`
--

/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) VALUES 
 ('00883515771d4c6da8019f066f44f284','1','统计报表-综合报表2','1','2016-06-22 00:51:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/chinaWeatherDataBean','GET','',''),
 ('00b8ad0f4d714a86961e9ba1fb28a14f','1','企业用户','1','2016-05-29 21:51:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('015880decf5349a38f5b2df3ad53a85b','1','在线办公-通告管理','1','2016-05-08 22:55:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/oaNotify','GET','',''),
 ('028a3a1c6a8243debb98bf56c9c559ea','1','系统登录','1','2016-05-29 02:03:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('02fc5fee6f18482f92d045028f93b54a','1','系统设置-字典管理','1','2016-05-29 00:06:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','repage=&type=audit_status',''),
 ('04504e13018147fd81d924928a10d5e6','1','用户','1','2016-05-29 00:04:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('0478cac3683f4b64966a899412961862','1','系统登录','1','2016-06-22 00:40:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('05430f0750a4486292bf03a5b0c43921','1','系统登录','1','2016-05-29 00:58:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('05a6ddfc451049dcad9d31d7dab54d21','1','ONLINE开发-表单配置','1','2016-06-22 00:38:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('0659e3598042461cb0f1345ecc874033','1','ONLINE开发-表单配置-同步数据库','1','2016-05-09 01:22:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=9dc4a6b23a3f41279f9698f2e253acf7',''),
 ('0738c4ef7750405fb38cac9318f6846a','1','ONLINE开发-表单配置-生成代码','1','2016-05-09 01:58:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=ed889f3f28814d05ba9f9d3900c71579',''),
 ('0755f1dea1784a70a8bc99445f311c24','1','系统设置-菜单管理-删除','1','2016-05-09 02:08:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/deleteAll','GET','ids=ed9f6c6dbc334d0fb9607a52a818e102,ecd805be31dd4fa5b8c1b76a9a5ac85f',''),
 ('0786d35ae3814b7e95098fb9eee30c6f','1','ONLINE开发-表单配置','1','2016-05-09 01:51:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('07ce1a27fbfa48edae847ba5580447f5','1','ONLINE开发-表单配置-导入','1','2016-05-08 23:07:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','GET','',''),
 ('082b726e97ab4f168ab3fe7047867e80','1','系统监控-系统配置','1','2016-05-09 01:05:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('08f60eec1db940049c780741f2f63792','1','用户-删除','1','2016-05-29 00:08:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=c9c40a67930749a19e7beb23676f4f3f',''),
 ('08f98f5b8e524a11a89164b79ddba72f','1','系统登录','1','2016-05-29 00:04:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('0a6025e10fe2433b9d81190b0dce1293','1','用户-删除','1','2016-05-28 23:46:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=5b85a1067c294d0e9ae636cd5d1c9da7,6501172d5cd542febe6271a79d4b302b',''),
 ('0ae6af8c9af9496691ec23348af1ce23','1','代码生成-生成示例-票务代理(一对多）','1','2016-06-22 01:27:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('0bf798532bbc4d9e9ee00189ac23a03b','1','ONLINE开发-表单配置-导入','1','2016-05-09 01:22:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','GET','',''),
 ('0c483e261a254e8c83c7a08d63831ca2','1','系统设置-角色管理','1','2016-05-09 01:03:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/role/','GET','',''),
 ('0cf7cd16c3944456a82adb9ed7e56e99','1','在线办公-个人办公-我的任务','1','2016-05-08 22:55:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/act/task/todo/','GET','',''),
 ('0d19019cf36d4a1ca9f8ec1c46087dee','1','系统监控-日志查询','1','2016-05-08 22:55:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/log','GET','',''),
 ('0dd53744e80f4d33b1f48d381879cf76','1','在线办公-通告管理','1','2016-06-22 00:52:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/oaNotify','GET','',''),
 ('0f3711e4cc044d9ea26e6d48fd50d49a','1','系统登录','1','2016-05-29 01:43:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('0f5dbe8f683c4f20a7cb23ca6d6bad34','1','系统设置-菜单管理-删除','1','2016-06-22 00:40:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/deleteAll','GET','ids=3f61535789054d6a816fa827e0432fad',''),
 ('10596ebd3d71443bb29d54e3f7bfab28','1','在线办公-我的通告','1','2016-05-23 22:36:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/oaNotify/self','GET','',''),
 ('105f9b9acdf34c32b216d48aa5fc6a12','1','系统设置-菜单管理','1','2016-05-09 02:08:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('10e7a0f16646408d9d19c4991a76d1a8','1','用户','1','2016-05-29 01:44:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('123c5ea936da42c2b681986fa63af164','1','ONLINE开发-表单配置-导入','1','2016-05-08 23:17:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','GET','',''),
 ('136afcc6e11e4425948d3c149b943463','1','ONLINE开发-生成示例-商品','1','2016-05-30 17:03:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/goods','GET','',''),
 ('152d95209c234ee19f0df42d5cad8782','1','系统登录','1','2016-05-28 23:52:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('155c03b04600400da166594b752069b9','1','代码生成-表单配置-生成代码','1','2016-06-22 01:25:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=e08d6fbc393047748a2d45c98be42676',''),
 ('1653a8e8b40149afbefc12f7bccb9848','1','常用工具-表单构建器','1','2016-05-08 22:56:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/tools/beautifyhtml','GET','',''),
 ('170402f2b48c4a2193fbfe1c24867768','1','企业用户','1','2016-05-29 21:48:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('174291eeee344b5a9aaa2f6dae535a9a','1','系统登录','1','2016-05-09 01:03:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('1a53b1ccc22d4e278cbc3b8e2a54a791','1','系统登录','1','2016-06-22 01:27:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('1af8092e1e0c425b94c3036b7ab792be','1','用户-删除','1','2016-05-29 02:03:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=7a9390716f2d4a85a2af0d7c663b5357',''),
 ('1b29995643414c6584998651dc3a6d72','1','系统登录','1','2016-05-29 01:56:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('1bc46b80d8a24d3d9c3987370dfd8351','1','系统监控-系统监控管理','1','2016-05-08 22:56:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','',''),
 ('1c181e0cd91f4a0e9483cd520df0aecc','1','系统登录','1','2016-05-29 21:48:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=38fc18a52eb24968b2245be561e72c85','GET','',''),
 ('1cbcfbc98fc8430bb50dd3b60a4ddb8d','1','代码生成-生成示例-商品','1','2016-06-22 00:52:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/goods','GET','',''),
 ('1ea05d3627c344fe88e8c7af7a25a64d','1','用户','1','2016-05-24 23:10:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('1efa9ab2ac0749bda17a43f11c026d92','1','系统设置-菜单管理','1','2016-05-29 02:05:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('1fbaff7e5c874524b7bc7ca72df38c37','1','ONLINE开发-生成示例-富文本测试','1','2016-05-25 10:21:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('200f0c215616486a851003a84a74b7cd','1','代码生成-生成示例-票务代理(一对多）','1','2016-06-22 00:52:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('208e5f1ab1ec4b14810c0b0840db1a5e','1','系统设置-菜单管理','1','2016-06-22 00:43:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('20bdcdf5ac1e449a972d98d7fc521543','1','ONLINE开发-表单配置','1','2016-05-09 02:01:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('24ff9c33a14c4769bc7fc390ae41ccaf','1','常用工具-二维码测试','1','2016-05-08 22:56:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/tools/TwoDimensionCodeController','GET','',''),
 ('2601418a5793407e97edd149117ff40f','1','系统监控-系统监控管理','1','2016-05-09 01:02:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','',''),
 ('2615e469934a417e94ab2899b8535f88','1','用户','1','2016-05-29 00:05:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('26e03a11dccc4d6b8666481b61ddaf00','1','用户','1','2016-05-28 23:41:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('272163a7e7ba4f61ba40e1fd08181968','1','ONLINE开发-表单配置','1','2016-05-08 23:17:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('276a8a0f312c434baa9fd5b3c4a17fab','1','用户','1','2016-05-29 01:00:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('295b47356cc44b6087bb0d6fb07a038f','1','系统设置-菜单管理','1','2016-05-09 02:00:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('29c1d8ff55184c8a8d180b16eba15ae3','1','系统登录','1','2016-05-25 22:33:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('2a41b7d54faa4f8c8c25492ee2a7945b','1','ONLINE开发-生成示例-请假表单(单表）','1','2016-05-30 17:03:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/one/formLeave','GET','',''),
 ('2aaa99a38a864f52bd586c60ac6d31bb','1','常用工具-接口测试-接口测试','1','2016-05-08 22:56:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/tools/testInterface/test','GET','',''),
 ('2b70443007e14c7ab4e8873e5117c1cc','1','系统监控-系统配置','1','2016-05-09 02:08:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('2bb95c0d1fcd4dfc990ad75ef7fb0988','1','代码生成-表单配置','1','2016-06-22 00:53:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('2d8e9ffab57b4908b11cfe3f45b67f47','1','系统监控-系统监控管理','1','2016-05-09 01:04:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','',''),
 ('2db3b6de48b84b5da3fc4f8c8e4d471c','1','用户-删除','1','2016-05-29 00:07:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=28f4b772ba0e4e8893e828ee9d0c5ed7,2b076c10d1e444d7b08f9d0a899270d1,2ff51a7c68324c2cb5ed693fc229e2d...',''),
 ('2e6e84b164b242f7bfd81730baab281e','1','我的面板-个人信息-test','1','2016-06-22 00:52:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/user/info','GET','',''),
 ('2e94d3b39c894545949dcf3a8da5f84b','1','系统监控-系统配置','1','2016-05-09 01:03:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('2ebabdad1b8541e58383f6445f3fd2eb','1','用户','1','2016-05-23 23:42:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('2eca72d7a2e24722a036e651be77fe84','1','用户','1','2016-05-29 02:04:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('2ee70cd8e7e64f45baf86bcc6ad34764','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:57:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteDb','GET','id=9615c80ce6b54a73b528effeb183ed93',''),
 ('2ff0c9a4a0294072bea8da54214f8c47','1','系统登录','1','2016-05-09 02:03:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('3015efce0abe48c8a923aeace8aeab81','1','ONLINE开发-表单配置','1','2016-05-09 01:15:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('3061ee0089d44812812ad7e374cb1a54','1','系统设置-菜单管理','1','2016-06-22 00:44:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('30c7c93070cc48c89f0611de719db54e','1','系统设置-菜单管理','1','2016-05-09 02:01:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('30fcaae0f31a4111ba5b7626e10b24b3','1','代码生成-表单配置-生成代码','1','2016-06-22 01:25:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=0a8f05eb973b4942af37c45109bd2502',''),
 ('315f3b40f4124e118e267f91a6aedc48','1','系统登录','1','2016-05-30 17:02:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=2822ee131829477c90f7fd6243b54f9d','GET','',''),
 ('317f1aa702704d57a9c20c269e8aa4a7','1','系统设置-菜单管理','1','2016-05-29 00:06:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('31c3bbaca6e94fe589a4996eace116c7','1','系统设置-字典管理','1','2016-05-23 23:45:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','',''),
 ('31f4ac86cc054766b3b5b37d592d6f7f','1','ONLINE开发-表单配置','1','2016-05-09 01:46:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('325fe8305cf0433dab5043a05888da65','1','系统设置-角色管理','1','2016-05-08 22:55:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/role/','GET','',''),
 ('33187da95bc040a985b38ff7a164dcd8','1','ONLINE开发-表单配置','1','2016-05-08 22:55:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('336ecbecc4cb44c2a157a84d2b57fd2b','1','系统登录','1','2016-05-29 01:45:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('35d393b7bdb84724ad1fade351239501','1','用户','1','2016-05-23 23:46:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('374b504835ed420c9f711d189503a333','1','代码生成-表单配置','1','2016-06-22 00:46:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('3755eb27945a4d458f98267bfa29ce4e','1','ONLINE开发-表单配置','1','2016-05-29 02:07:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('38e79f83d0df4dde967d528f0385f719','1','代码生成-表单配置-生成代码','1','2016-06-22 00:48:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=ebcefab3cf7a49029b38e7037ce65aa1',''),
 ('3929f5e6c7ec4bbdaa658f8f4e27bee8','1','系统登录','1','2016-05-09 01:10:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('39444a95e9a849eab8d093a3ba4e5860','1','在线办公-个人办公-请假办理','1','2016-05-08 22:55:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/leave','GET','',''),
 ('39bc2b42c63d491ca303acd5e16c9f18','2','系统监控-系统监控管理','1','2016-05-09 01:05:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\n'),
 ('3af841d9a10e4236a612dab1c9d834af','1','系统登录','1','2016-05-23 23:45:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('3c4289ed9eaa4364aa4d8d871e624990','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:15:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteAll','GET','ids=ed889f3f28814d05ba9f9d3900c71579',''),
 ('3ce07e069d5344b997b39683c152535e','1','系统登录','1','2016-05-29 02:11:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('3d3608c0df6c4cf4b263aeeaf5597cc8','1','在线办公-我的通告','1','2016-05-08 22:55:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/oaNotify/self','GET','',''),
 ('3dc568c39fa54bd191b38101e62ef0c9','1','我的面板-通讯录','1','2016-05-08 22:55:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/iim/contact/index','GET','',''),
 ('3dc7f6e160464e5e9ff589c4d3229571','1','系统登录','1','2016-05-09 02:02:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('3e1240bb79684f48b1d1574067c8bdaf','1','ONLINE开发-表单配置','1','2016-05-25 22:33:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('40b45dfbd5524421b45ee97477eccf6b','1','ONLINE开发-表单配置','1','2016-05-28 23:45:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('4181175b5abf4a1698547b5d032986bc','1','系统登录','1','2016-05-28 23:32:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('41fbf2ed6a1e4b99bdab081bd109f75f','1','企业用户','1','2016-05-29 02:11:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('434c8f601d434564acbde6902df2c989','1','ONLINE开发-表单配置-生成代码','1','2016-05-23 23:42:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('440a1b552d8342d0b812eb6a88bfdf53','1','ONLINE开发-生成示例-富文本测试','1','2016-05-23 23:39:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('44c8148f8e684332bf4c32e59d767710','1','系统登录','1','2016-05-29 02:17:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('477f37978f904401bdc316b4cf3f9167','1','统计报表-折线图','1','2016-06-22 00:52:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/line','GET','',''),
 ('47ef5b7efcb24abeb8df440b87a2583d','1','ONLINE开发-表单配置','1','2016-05-30 17:03:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('48d2d786e50f46a08770e8d3caeeae26','1','系统设置-用户管理','1','2016-05-23 22:36:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/user/index','GET','',''),
 ('492f09c70ea7429788049e833aef53f0','1','用户-删除','1','2016-05-29 00:07:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=05c6ca088f3043a8af8de01b2dad2539,062e7f67e40c404287d410d13795525d,09e1d06357b149c78d3fec8a402529b...',''),
 ('495054909da248c68a999fe925c0d998','1','代码生成-表单配置','1','2016-06-22 01:23:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('4af2e7592c9145a184b25bc29bcf3d12','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:58:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteDb','GET','id=ed889f3f28814d05ba9f9d3900c71579',''),
 ('4af615f9937148258f9438436b6b5300','1','ONLINE开发-表单配置','1','2016-05-08 23:20:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('4b16ebb803df4275ad398a62b4d85681','1','系统设置-菜单管理','1','2016-05-09 02:07:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('4b55c594257d4ea18dfd7ba260903773','1','我的面板-我的日程','1','2016-06-22 00:52:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/iim/myCalendar','GET','',''),
 ('4d9b6623f17246919076293e05c2f3b7','1','ONLINE开发-生成示例-票务代理(一对多）','1','2016-05-09 02:09:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('4da0244d7f224fe09c5b42fa670bd74a','1','统计报表-柱状图','1','2016-06-22 00:53:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/bar','GET','',''),
 ('4e1a92c7632c436cae435bf5227ab6cc','1','系统登录','1','2016-05-28 22:08:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('4f960893988949628f330eefaab5224c','1','系统登录','1','2016-06-22 01:23:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('4fecade3a06744ecbc7cb4afd186f887','1','系统设置-菜单管理','1','2016-05-08 22:55:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('50016ce0f96246828c23c81a9c6dd853','1','代码生成-表单配置-生成代码','1','2016-06-22 00:51:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=e56394cfd55446518c38bc59384c0b38',''),
 ('5016d539f6a84c71bdf2fb94df75a76d','1','系统登录','1','2016-05-23 23:48:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('516943e243d54d7fac6ce5c3651995db','1','系统登录','1','2016-05-09 01:57:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('519ad413a3db4a36989ecb38c04dbf75','1','系统设置-字典管理','1','2016-05-29 00:06:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','repage=&type=audit_status',''),
 ('522d2e4bacfe41ad80a4e8fea06dcd89','1','系统登录','1','2016-05-29 21:57:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=38fc18a52eb24968b2245be561e72c85','GET','',''),
 ('5449fce287db4a2399fc01640b2f77dd','1','代码生成-表单配置','1','2016-06-22 00:49:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('5526cd2b656e4b698888f350efcc6a03','2','ONLINE开发-表单配置','1','2016-05-09 00:55:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: com.jeeplus.modules.gen.util.GenUtils\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 56 more\r\n'),
 ('5576806861ab45b2a1c68970ec42d75e','1','系统登录','1','2016-05-29 01:44:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/form','GET','id=31f9afbf18b1460c8202a292f2af7062',''),
 ('55ac68406daf479284417a6c61440fc2','2','ONLINE开发-表单配置','1','2016-05-08 23:13:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: org/apache/jsp/tag/web/sys/message_tag\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: org/apache/jsp/tag/web/sys/message_tag\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspx_meth_sys_005fmessage_005f0(genTableList_jsp.java:413)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:263)\r\n	... 55 more\r\n'),
 ('55ddb67da3d6447f97a48c474dd960a0','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:22:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteAll','GET','ids=f72052c4a67842978605d07848c8e5ea,0a8f05eb973b4942af37c45109bd2502,cc721887670a4aabbf2b1446e697d1d...',''),
 ('57b32c4d94a34dddbf23a704d078776d','1','系统设置-机构管理','1','2016-05-08 22:55:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/office/','GET','',''),
 ('5a34727a86fe4e83960cbf612ba30928','1','统计报表-折线图','1','2016-06-22 00:53:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/line','GET','',''),
 ('5aaa2d243ed4414b9f6887e75e8a5077','1','企业用户','1','2016-05-29 02:06:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('5b20e3b5568e4b97bf3f75f7c642b61e','2','ONLINE开发-表单配置','1','2016-05-09 01:04:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: com.jeeplus.modules.gen.util.GenUtils\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 56 more\r\n'),
 ('5be6cfe86da94385847d4c53d9e19cc9','1','系统设置-菜单管理','1','2016-05-29 02:05:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('5d30421b9b8f451ea2a51054f1015fff','1','系统登录','1','2016-05-29 21:33:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=fbcd23e6f7f84d8090741e4550d5efdb','GET','',''),
 ('5e06374724494f058f4a4dfa9e687a1b','1','系统登录','1','2016-05-23 23:46:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('5e4fb20277e841a790a28756b9c38bb8','1','系统登录','1','2016-05-29 02:14:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('5ee08f8fce40413aaacb71f4d576d76e','1','系统设置-区域管理','1','2016-05-09 02:08:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/area/','GET','',''),
 ('60227252e04547b3af294bef61be7bfd','1','企业用户','1','2016-05-29 02:09:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('606b26d8a9da4088b14aa1ab1537ca8a','2','ONLINE开发-表单配置','1','2016-05-09 01:05:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: com.jeeplus.modules.gen.util.GenUtils\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 56 more\r\n'),
 ('609a78957810432d825b97ea7849004f','1','系统设置-菜单管理','1','2016-06-22 00:40:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','','');
INSERT INTO `sys_log` (`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) VALUES 
 ('60a105e723e64e2b932e33650641bc76','1','系统登录','1','2016-05-09 00:49:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('60b6abc9d3cb4bce9a8eb0f1d6ec9765','1','系统登录','1','2016-06-22 00:50:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/save','POST','columnList[0].fieldLabels=&columnList[11].javaType=String&columnList[0].isList=0&columnList[1].name=create_by&columnList[12].queryType==&columnList[5].jdbcType=varchar(255)&columnList[6].isPk=0&columnList[9].genTable=e56394cfd55446518c38bc59384c0b38&columnList[0].javaField=id&columnList[14].id=cef807858916471fa881d008252bc493&columnList[13].searchLabel=&columnList[2].isInsert=1&columnList[1].isNull=1&columnList[8].isQuery=0&columnList[10].isInsert=1&columnList[7].queryType==&columnList[13].isForm=0&columnList[12].searchLabel=&columnList[2].isNull=1&columnList[2].fieldKeys=&columnList[4].isNull=1&columnList[8].searchLabel=&columnList[3].jdbcType=varchar(64)&columnList[2].searchKey=&columnList[13].isNull=1&columnList[8].id=4243ed8b87934edfbea2edd3f95aefb5&columnList[7].tableName=&columnList[1].isEdit=0&columnList[5].isNull=1&columnList[7].javaType=java.util.Date&columnList[8].fieldLabels=&columnList[3].isPk=0&columnList[8].isNull=1&columnList[7].genTable=e56394cfd55446518c38bc59384c0b38&columnList[4].isPk=0&columnList[15].searchKey=&columnList[8].fieldKeys=&columnList[1].dictType=&columnList[10].jdbcType=double&columnList[14].showType=input&columnList[15].jdbcType=double&columnList[6].javaField=delFlag&columnList[1].showType=input&columnList[3].isEdit=1&columnList[8].sort=8&columnList[10].isNull=1&columnList[7].sort=7&columnList[15].javaType=String&columnList[6].sort=6&columnList[2].javaField=createDate&columnList[10].genTable=e56394cfd55446518c38bc59384c0b38&columnList[0].fieldKeys=&columnList[12].delFlag=0&parentTable=&comments=城市气温; InnoDB free: 6144 kB&columnList[11].isForm=0&columnList[3].isList=0&columnList[15].genTable=e56394cfd55446518c38bc59384c0b38&columnList[11].isNull=1&columnList[3].searchKey=&columnList[14].isForm=0&columnList[9].javaField=beijingMintemp&columnList[15].isNull=1&columnList[4].fieldLabels=&columnList[0].isInsert=1&columnList[4].isForm=0&columnList[7].jdbcType=datetime&columnList[15].sort=15&columnList[13].javaField=shenyangMintemp&columnList[11].javaField=changchunMintemp&columnList[6].isInsert=1&columnList[12].showType=input&columnList[10].searchLabel=&page-columnList[8].name=beijing_maxtemp&columnList[7].javaField=datestr&columnList[0].jdbcType=varchar(64)&columnList[13].tableName=&columnList[5].fieldLabels=&columnList[15].isForm=0&_columnList[0].isPk=1&columnList[4].comments=更新时间&columnList[9].isPk=0&ck=0&columnList[13].isQuery=0&columnList[15].javaField=haerbinMintemp&_columnList[4].isList=1&columnList[2].fieldLabels=&_columnList[11].isNull=1&columnList[7].delFlag=0&columnList[10].javaField=changchunMaxtemp&columnList[14].genTable=e56394cfd55446518c38bc59384c0b38&columnList[0].genTable=e56394cfd55446518c38bc59384c0b38&columnList[5].fieldKeys=&columnList[5].searchLabel=&columnList[1].javaField=createBy.id&columnList[15].isList=0&columnList[4].jdbcType=datetime&columnList[6].isQuery=0&columnList[6].isNull=1&columnList[6].id=2485be6033854499a1a1b259ae99b965&page-columnList[0].name=id&columnList[8].jdbcType=double&columnList[9].sort=9&name=test_line_weather_main_city&columnList[13].javaType=String&columnList[2].dictType=&columnList[11].isPk=0&columnList[11].fieldLabels=&columnList[5].isForm=0&columnList[12].searchKey=&columnList[3].isQuery=0&columnList[11].showType=input&columnList[0].dictType=&columnList[14].isNull=1&columnList[6].comments=逻辑删除标记（0：显示；1：隐藏）&columnList[0].isQuery=0&columnList[9].tableName=&columnList[3].tableName=&columnList[12].dictType=&columnList[6].isForm=0&columnList[9].fieldKeys=&columnList[10].isEdit=1&columnList[4].showType=dateselect&columnList[14].tableName=&columnList[10].isList=0&columnList[10].delFlag=0&columnList[4].delFlag=0&columnList[10].javaType=String&columnList[1].genTable=e56394cfd55446518c38bc59384c0b38&columnList[10].fieldLabels=&columnList[6].isEdit=0&columnList[15].fieldKeys=&columnList[6].queryType==&columnList[12].jdbcType=double&columnList[8].isPk=0&columnList[13].delFlag=0&columnList[6].showType=radiobox&columnList[9].comments=北京最低气温&columnList[5].isPk=0&columnList[9].isInsert=1&columnList[13].dictType=&columnList[14].isPk=0&columnList[14].javaField=haerbinMaxtemp&columnList[8].dictType=&page-columnList[15].name=haerbin_mintemp&columnList[7].isForm=0&columnList[5].isEdit=1&columnList[14].delFlag=0&columnList[8].delFlag=0&columnList[3].searchLabel=&columnList[12].genTable=e56394cfd55446518c38bc59384c0b38&columnList[7].id=27c56d6f48c048e79f14f226c508acab&columnList[10].dictType=&columnList[9].isEdit=1&columnList[12].isNull=1&columnList[8].isEdit=1&columnList[4].id=49bb37c2f630446095341a6b18503439&columnList[9].queryType==&columnList[6].javaType=String&columnList[8].isForm=0&columnList[14].searchKey=&_columnList[4].isNull=1&columnList[1].isInsert=1&columnList[5].tableName=&columnList[14].isQuery=0&columnList[9].isNull=1&columnList[0].javaType=String&columnList[15].fieldLabels=&columnList[3].delFlag=0&columnList[11].isEdit=1&columnList[15].queryType==&columnList[13].isList=0&columnList[2].tableName=&columnList[12].isEdit=1&columnList[7].isQuery=0&columnList[10].searchKey=&_columnList[5].isList=1&columnList[7].isPk=0&columnList[11].isList=0&columnList[5].id=fbe0b13c2c384bc292197bdcf115a8a8&columnList[1].comments=创建者&columnList[0].isEdit=0&columnList[12].name=shenyang_maxtemp&columnList[10].sort=10&columnList[2].isForm=0&columnList[10].id=a909b9bfe0fd4603be67a29c0e058a92&columnList[0].tableName=&columnList[11].delFlag=0&columnList[13].sort=13&columnList[14].dictType=&columnList[1].id=e55044d4952849e3ba99ff211a667b7d&columnList[0].name=id&columnList[13].queryType==&columnList[2].delFlag=0&columnList[6].name=del_flag&columnList[13].isPk=0&columnList[12].sort=12&columnList[3].id=2a4e52272352471ea02b0e886aaf8f7c&columnList[6].searchLabel=&columnList[12].comments=沈阳最高气温&columnList[7].isNull=1&columnList[10].queryType==&columnList[9].delFlag=0&columnList[15].comments=哈尔滨最低气温&id=e56394cfd55446518c38bc59384c0b38&columnList[10].isQuery=0&columnList[11].name=changchun_mintemp&columnList[11].jdbcType=double&columnList[13].id=f068db9eed2e4a1b884794c81ab4a05d&columnList[4].searchKey=&columnList[15].name=haerbin_mintemp&columnList[10].name=changchun_maxtemp&columnList[0].showType=input&columnList[14].queryType==&columnList[0].queryType==&columnList[2].isPk=0&columnList[11].fieldKeys=&columnList[6].dictType=del_flag&columnList[1].fieldLabels=&columnList[9].id=3944b384bcde4802bdbe119af5bb8bc6&columnList[8].queryType==&columnList[0].searchKey=&_columnList[14].isNull=1&columnList[14].isInsert=1&columnList[13].genTable=e56394cfd55446518c38bc59384c0b38&columnList[9].isForm=0&columnList[8].comments=北京最高气温&columnList[3].isInsert=1&columnList[15].searchLabel=&columnList[4].javaType=java.util.Date&columnList[11].isQuery=0&columnList[5].showType=textarea&page-columnList[6].name=del_flag&columnList[1].delFlag=0&columnList[10].fieldKeys=&page-columnList[9].name=beijing_mintemp&page-columnList[1].name=create_by&page-columnList[13].name=shenyang_mintemp&columnList[2].jdbcType=datetime&columnList[3].javaField=updateBy.id&columnList[6].tableName=&columnList[11].comments=长春最低气温&columnList[5].searchKey=&columnList[0].isNull=0&columnList[1].queryType==&columnList[14].fieldLabels=&columnList[11].genTable=e56394cfd55446518c38bc59384c0b38&columnList[3].comments=更新者&page-columnList[11].name=changchun_mintemp&columnList[7].searchLabel=&columnList[3].queryType==&columnList[13].isEdit=1&columnList[13].fieldKeys=&parentTableFk=&columnList[13].showType=input&columnList[13].fieldLabels=&columnList[8].searchKey=&columnList[8].tableName=&columnList[15].showType=input&tableType=0&columnList[3].fieldKeys=&columnList[7].searchKey=&columnList[2].genTable=e56394cfd55446518c38bc59384c0b38&_columnList[1].isNull=1&columnList[10].showType=input&columnList[12].isQuery=0&columnList[1].isList=0&columnList[6].isList=0&columnList[1].isForm=0&columnList[15].delFlag=0&page-columnList[5].name=remarks&columnList[7].isInsert=1&_columnList[12].isNull=1&columnList[1].isPk=0&columnList[14].javaType=String&columnList[14].searchLabel=&columnList[12].fieldKeys=&columnList[1].isQuery=0&columnList[9].jdbcType=double&_columnList[13].isNull=1&columnList[4].isQuery=0&columnList[2].comments=创建时间&columnList[0].id=6615c9392cc44e2d99b1e44852444fef&_columnList[15].isNull=1&columnList[4].fieldKeys=&columnList[13].comments=沈阳最低气温&columnList[4].searchLabel=&columnList[14].isEdit=1&columnList[15].isInsert=1&columnList[14].jdbcType=double&columnList[2].id=68c043a8ec0e4c0c93610084bdeabe70&columnList[3].isNull=1&columnList[5].comments=备注信息&columnList[11].sort=11&columnList[8].isList=0&page-columnList[2].name=create_date&columnList[1].sort=1&columnList[5].isList=1&columnList[4].isEdit=1&columnList[4].isList=1&columnList[4].tableName=&columnList[12].isList=0&columnList[3].isForm=0&columnList[3].genTable=e56394cfd55446518c38bc59384c0b38&page-columnList[4].name=update_date&columnList[6].delFlag=0&columnList[2].searchLabel=&columnList[5].javaType=String&columnList[11].isInsert=1&columnList[7].isEdit=1&columnList[15].dictType=&columnList[5].dictType=&columnList[3].sort=3&columnList[7].showType=input&columnList[4].dictType=&columnList[7].fieldLabels=&_columnList[5].isNull=1&columnList[9].searchLabel=&columnList[2].name=create_date&columnList[7].dictType=&columnList[13].isInsert=1&columnList[3].name=update_by&columnList[1].searchKey=&className=ChinaWeatherDataBean&columnList[14].name=haerbin_maxtemp&columnList[12].id=13e04a4597264be1978867260a2615f6&columnList[1].jdbcType=varchar(64)&page-columnList[10].name=changchun_maxtemp&columnList[4].name=update_date&columnList[15].tableName=&page-columnList[7].name=datestr&columnList[4].sort=4&columnList[12].javaType=String&columnList[4].genTable=e56394cfd55446518c38bc59384c0b38&columnList[9].isQuery=0&columnList[12].isForm=0&columnList[5].delFlag=0&columnList[8].javaField=beijingMaxtemp&columnList[7].name=datestr&columnList[1].tableName=&columnList[9].searchKey=&columnList[11].tableName=&columnList[7].fieldKeys=&columnList[12].isInsert=1&columnList[12].javaField=shenyangMaxtemp&columnList[11].queryType==&columnList[13].name=shenyang_mintemp&columnList[2].isQuery=0&columnList[11].dictType=&columnList[2].isEdit=0&columnList[3].fieldLabels=&page-columnList[12].name=shenyang_maxtemp&columnList[2].sort=2&columnList[15].isPk=0&columnList[3].javaType=com.jeeplus.modules.sys.entity.User&page-columnList[3].name=update_by&columnList[9].isList=0&columnList[0].searchLabel=&columnList[6].fieldKeys=&columnList[5].isQuery=0&columnList[15].isQuery=0&isSync=&columnList[14].comments=哈尔滨最高气温&columnList[10].comments=长春最高气温&columnList[0].delFlag=0&columnList[13].searchKey=&columnList[9].javaType=String&_columnList[2].isNull=1&columnList[4].javaField=updateDate&columnList[7].comments=日期&columnList[6].fieldLabels=&_columnList[7].isNull=1&columnList[11].id=a6b8735814bf4ab7881687b7111a7078&columnList[6].jdbcType=varchar(64)&columnList[6].genTable=e56394cfd55446518c38bc59384c0b38&columnList[5].javaField=remarks&columnList[1].searchLabel=&columnList[12].isPk=0&columnList[9].showType=input&columnList[1].fieldKeys=&columnList[5].queryType==&columnList[2].isList=0&_columnList[10].isNull=1&columnList[14].fieldKeys=&columnList[5].isInsert=1&_columnList[6].isNull=1&columnList[4].queryType==&columnList[5].genTable=e56394cfd55446518c38bc59384c0b38&columnList[2].queryType==&columnList[11].searchKey=&columnList[15].id=0de703685db343ef9d6aa3d527ab4edd&columnList[11].searchLabel=&columnList[7].isList=0&columnList[3].showType=input&columnList[0].comments=主键&columnList[10].isForm=0&columnList[8].javaType=String&columnList[1].javaType=com.jeeplus.modules.sys.entity.User&columnList[8].genTable=e56394cfd55446518c38bc59384c0b38&columnList[0].isPk=1&columnList[14].sort=14&columnList[12].tableName=&columnList[0].isForm=0&columnList[3].dictType=&columnList[10].tableName=&_columnList[3].isNull=1&columnList[5].sort=5&columnList[2].showType=dateselect&columnList[6].searchKey=&columnList[9].fieldLabels=&columnList[9].name=beijing_mintemp&page-columnList[14].name=haerbin_maxtemp&columnList[13].jdbcType=double&columnList[4].isInsert=1&_columnList[8].isNull=1&columnList[10].isPk=0&columnList[14].isList=0&columnList[15].isEdit=1&columnList[5].name=remarks&columnList[0].sort=0&_columnList[9].isNull=1&columnList[8].isInsert=1&columnList[12].fieldLabels=&columnList[8].showType=input&columnList[8].name=beijing_maxtemp&columnList[2].javaType=java.util.Date&columnList[9].dictType=',''),
 ('61fed1dfd0b74e69993c34df4d8b316e','1','代码生成-生成示例-富文本测试','1','2016-06-22 00:52:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('64b1b1908b1b4f359e9e62e7c408ccf6','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:19:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteAll','GET','ids=f72052c4a67842978605d07848c8e5ea,0a8f05eb973b4942af37c45109bd2502,cc721887670a4aabbf2b1446e697d1d...',''),
 ('65ab3d633a63490aabe3cd6a0e2d8463','1','系统登录','1','2016-05-23 23:38:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('65c300c9df0648e89615a0da5d0d23fd','1','系统设置-菜单管理','1','2016-05-29 02:05:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('660f65e82ba64f669367deeda7397fa7','1','代码生成-表单配置-导入','1','2016-06-22 00:50:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','POST','name=test_line_weather_main_city&id=',''),
 ('66756a48b634452c8400be629d549f96','1','ONLINE开发-生成示例-商品','1','2016-05-09 02:09:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/goods','GET','',''),
 ('66e779a214124f299ef2687f262a531a','1','企业用户','1','2016-05-29 02:14:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('68c5ab544fa04b17a69f4fc3aa9bfee1','1','系统设置-字典管理','1','2016-05-29 00:06:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','',''),
 ('6b17f6fde4074b4288b708d4e84711c8','1','系统登录','1','2016-05-24 23:09:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('6ba38bbc549743dd9be9d1041e3cbb24','1','用户-删除','1','2016-05-28 23:44:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=256913475d124c4d869848a5bb58b9c1,2fc9a2561a5a479d971fab83ee27d056,474655a663e747598630dbd0b392379...',''),
 ('6c3a9d04e6ab45948e69ce921bc697e7','1','系统登录','1','2016-05-29 01:44:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/form','GET','id=31f9afbf18b1460c8202a292f2af7062',''),
 ('6ce1cf265e2241fb9ab82d01fa34e4f4','1','系统设置-菜单管理','1','2016-05-09 02:08:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('6d64a2abf772424684e2a765bf5159f3','1','系统登录','1','2016-05-29 21:40:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=fbcd23e6f7f84d8090741e4550d5efdb','GET','',''),
 ('6e1140abca89440bbd8ed51b31450885','1','ONLINE开发-表单配置-同步数据库','1','2016-05-23 23:39:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('6e1156359e40470982b02f0dd9382467','1','ONLINE开发-表单配置-导入','1','2016-05-09 01:15:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','GET','',''),
 ('6e45fce85d724701921aee3b2e6d8770','1','ONLINE开发-生成示例-商品','1','2016-05-23 23:39:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/goods','GET','',''),
 ('6eca0eb58f974ed9b9b0a6489b538d12','1','系统设置-菜单管理','1','2016-06-22 00:44:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('6f1325ae12c7483986d95e745c2b7d32','1','统计报表-柱状图','1','2016-06-22 00:51:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/bar','GET','',''),
 ('6f833dc139cd4709b7de1ce422c68376','1','系统登录','1','2016-05-29 22:00:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=38fc18a52eb24968b2245be561e72c85','GET','',''),
 ('701644eaf4ab49eab1ba282e255e53de','1','系统登录','1','2016-05-08 22:50:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('7055d22d3f8d4fbd9cdc2c108cabfd3a','2','','1','2016-05-09 01:02:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/systemInfo','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: com.jeeplus.modules.gen.util.GenUtils\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 56 more\r\n'),
 ('71c59c190691459e9625491ff547726e','1','用户','1','2016-05-23 23:45:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('7244e1fcef544d0097e8d6573733e83d','1','系统监控-系统监控管理','1','2016-05-09 01:03:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','',''),
 ('730a9acae0ff49719b0ae418e2218af7','1','系统登录','1','2016-05-09 01:08:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('7658654c4b9f41b3bd7b40fecae76bc7','1','ONLINE开发-表单配置-同步数据库','1','2016-05-09 01:20:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=9dc4a6b23a3f41279f9698f2e253acf7',''),
 ('774cf360d5e34d54a6eeff8f79d4e245','1','用户','1','2016-05-28 23:52:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('77a46933b84e450399559e7333670418','1','系统登录','1','2016-05-28 23:58:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('780a9eecdb194d31961e924306309747','1','系统设置-菜单管理-删除','1','2016-05-09 02:00:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/deleteAll','GET','ids=6dd55135a3ab45aca27ec15236f1af05',''),
 ('791462e6dc7944b693608ff53fc0407d','1','系统登录','1','2016-05-09 01:05:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('7962fcb6223b444ca17cba09b9c315ab','1','企业用户','1','2016-05-30 20:35:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('7a193c181d5a4c29b98f19166bb851d9','1','企业用户','1','2016-05-29 21:54:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('7a6dab89c91e41428ac285a48c19799d','1','我的面板-常用联系人','1','2016-05-08 22:55:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/iim/contact/myFriends','GET','',''),
 ('7c2113bc598b4c368b7ac5d0d814e501','1','统计报表-双数值轴折线图','1','2016-06-22 00:53:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/linedoublenum','GET','',''),
 ('7cf396c09f3a44b68a67d6accf57fc20','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:22:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/delete','GET','id=9dc4a6b23a3f41279f9698f2e253acf7',''),
 ('7d4fcdb94b8c41eaa8c155e67468c66a','1','ONLINE开发-表单配置','1','2016-05-29 01:45:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('7dc03ff5863a4ec983918a59580bb555','1','ONLINE开发-生成示例-组织结构(树结构)','1','2016-05-23 23:39:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/tree/testTree','GET','',''),
 ('7efa0b4075964d309d30b0ae2ef2e7dc','1','系统监控-系统配置','1','2016-05-09 01:04:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('81cfc5c58987490a9cb063edeef6c935','1','企业用户','1','2016-05-29 21:57:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('824da857ee1a4191bef54385eba1b0f5','1','系统登录','1','2016-05-29 00:35:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('82f4335177b54bd4817ce6a4bebccc75','1','系统登录','1','2016-05-29 00:03:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('8312ee004c4149ae85868c2e6668d21a','1','用户','1','2016-05-29 01:49:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('8349f3b71a574e85969716f3d754e82f','1','系统设置-字典管理','1','2016-05-23 23:46:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','repage=&type=audit_status',''),
 ('839e062b17e24b169c9f09397af44c50','1','用户-删除','1','2016-05-29 02:03:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=32487673e416417bb34e00e4ed0c5cf7',''),
 ('83f1ec50a4a9462eabbffa65eb862d8c','1','系统登录','1','2016-05-28 23:37:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','',''),
 ('842ac59ececb4ea1ac79eed9f052053c','1','用户-删除','1','2016-05-29 00:07:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=5837ec237af64cf09a895cdbed3aa6de,5897b08870cc4a21b93346a01f16ffe0,59aa2763227e4891884d128aaf2d6b6...',''),
 ('860b66906643401494561a0e32088bf3','1','代码生成-生成示例-商品分类','1','2016-06-22 00:52:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/category','GET','',''),
 ('87c42f85d0a948eeb7d558dd59623fe1','1','系统登录','1','2016-06-22 00:51:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('87fd63ebda8e48b6a452d0f5d7a6341a','1','ONLINE开发-生成示例-富文本测试','1','2016-05-08 22:55:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('8811c494dc8944a0a43af6267b2da740','1','系统设置-字典管理','1','2016-05-23 23:45:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','repage=&type=audit_status',''),
 ('8a99def59ada4913a93c35e46cf1ed17','1','常用工具-接口测试-接口列表','1','2016-05-08 22:56:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/tools/testInterface','GET','',''),
 ('8aa1f08ee01943dfb7055a36743425a7','1','统计报表-综合报表1','1','2016-06-22 00:51:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/pieClass','GET','',''),
 ('8b02f68e2048440fa6c832b10feb5011','1','系统设置-菜单管理','1','2016-06-22 00:39:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('8b0f47583461494cb2fca71eff7037d1','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:47:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteAll','GET','ids=ed889f3f28814d05ba9f9d3900c71579',''),
 ('8bac396815314695aa88d8c1c2085261','1','系统登录','1','2016-05-29 02:09:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('8bcbf1c4c87d4e999090e56a9db74dd6','1','系统登录','1','2016-06-22 00:40:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('8cbe264931a644c1897b4e5c2fe2ca50','1','系统登录','1','2016-05-29 02:00:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('8def1fba0ef94bf99b8d4f1e5ae1b780','2','系统监控-系统监控管理','1','2016-05-09 01:13:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','','org.apache.jasper.JasperException: An exception occurred processing JSP page /webpage/modules/gen/genTableList.jsp at line 151\n\n148: 		<input id=\"pageSize\" name=\"pageSize\" type=\"hidden\" value=\"${page.pageSize}\"/>\n149: 		<table:sortColumn id=\"orderBy\" name=\"orderBy\" value=\"${page.orderBy}\" callback=\"page();\"/>\n150: 		<div class=\"form-group\">\n151: 		<span>琛ㄥ悕锛�/span><form:input path=\"nameLike\" htmlEscape=\"false\" maxlength=\"50\" class=\" form-control input-sm\"/>\n152: 		<span>璇存槑锛�/span><form:input path=\"comments\" htmlEscape=\"false\" maxlength=\"50\" class=\" form-control input-sm\"/>\n153: 		<span>鐖惰〃琛ㄥ悕锛�/span><form:input path=\"parentTable\" htmlEscape=\"false\" maxlength=\"50\" class=\" form-control input-sm\"/>\n154: 		</div>\n\n\nStacktrace:\r\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:519)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:422)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:313)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:260)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.IllegalStateException: Neither BindingResult nor plain target object for bean name \'genTable\' available as request attribute\r\n	at org.springframework.web.servlet.support.BindStatus.<init>(BindStatus.java:144)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getBindStatus(AbstractDataBoundFormElementTag.java:168)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getPropertyPath(AbstractDataBoundFormElementTag.java:188)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getName(AbstractDataBoundFormElementTag.java:154)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.autogenerateId(AbstractDataBoundFormElementTag.java:141)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.resolveId(AbstractDataBoundFormElementTag.java:132)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.writeDefaultAttributes(AbstractDataBoundFormElementTag.java:116)\r\n	at org.springframework.web.servlet.tags.form.AbstractHtmlElementTag.writeDefaultAttributes(AbstractHtmlElementTag.java:422)\r\n	at org.springframework.web.servlet.tags.form.InputTag.writeTagContent(InputTag.java:142)\r\n	at org.springframework.web.servlet.tags.form.AbstractFormTag.doStartTagInternal(AbstractFormTag.java:84)\r\n	at org.springframework.web.servlet.tags.RequestContextAwareTag.doStartTag(RequestContextAwareTag.java:80)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspx_meth_form_005finput_005f0(genTableList_jsp.java:531)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspx_meth_form_005fform_005f0(genTableList_jsp.java:459)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:271)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:386)\r\n	... 56 more\r\n'),
 ('8eaa51a383aa4b6ea3add0bb0d29d666','1','用户','1','2016-05-25 22:33:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('8f29ed4f13844cad9267ba3259f13de7','1','系统设置-菜单管理','1','2016-05-09 02:00:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('9147e74d8f184c32829630ae75f44d17','1','在线办公-通告管理','1','2016-05-23 22:36:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/oaNotify','GET','',''),
 ('91a7aec6ddf1422981ac14cf15c7494e','1','ONLINE开发-表单配置-生成代码','1','2016-05-23 23:43:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('92ba143b13f242da8f633ee660c948bc','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:22:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteDb','GET','id=cc8e6f2db81040d1b11c3887d9b20ef6',''),
 ('92cc4fbf2bef4b82aa40f8c1f968f846','1','系统设置-菜单管理','1','2016-06-22 00:41:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('92eb931a3ce54fc299890d0c91c28b6f','1','系统设置-菜单管理','1','2016-05-23 22:36:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('93e1c1c3c9d54fa18f36b6c5458f66d4','1','系统设置-菜单管理','1','2016-05-28 22:09:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('947c0358243248a5a37902fd624bf434','2','系统监控-系统监控管理','1','2016-05-09 01:12:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','','org.apache.jasper.JasperException: Unable to compile class for JSP: \n\nAn error occurred at line: 10 in the generated java file\nOnly a type can be imported. com.jeeplus.modules.gen.util.GenUtils resolves to a package\n\nAn error occurred at line: 112 in the jsp file: /webpage/modules/gen/genTableList.jsp\nGenUtils cannot be resolved\n109: 	String username = getConfig(\"username\");\n110: 	String license = getConfig(\"license\");\n111: 	if (!(username == null || username.equals(\"\") || license == null\n112: 			|| license.equals(\"\") || !GenUtils.getSerial(username, \"5\").equals(license))) {\n113: \n114: 		\n115: \n\n\nStacktrace:\r\n	at org.apache.jasper.compiler.DefaultErrorHandler.javacError(DefaultErrorHandler.java:92)\r\n	at org.apache.jasper.compiler.ErrorDispatcher.javacError(ErrorDispatcher.java:330)\r\n	at org.apache.jasper.compiler.JDTCompiler.generateClass(JDTCompiler.java:439)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:349)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:327)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:314)\r\n	at org.apache.jasper.JspCompilationContext.compile(JspCompilationContext.java:592)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:326)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:313)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:260)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\n'),
 ('9653c02815404764ad14ee48695f81cd','1','系统登录','1','2016-05-29 21:51:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=38fc18a52eb24968b2245be561e72c85','GET','',''),
 ('9849c3211d36423b8de7b1d50b9145d4','1','系统设置-菜单管理','1','2016-05-29 02:06:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('99aa7d29dbbc476c8f940d956ada4e3f','1','用户','1','2016-05-29 00:03:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('9a313d973d97463798a2cf49a39c4e17','1','代码生成-表单配置-生成代码','1','2016-06-22 00:47:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=ebcefab3cf7a49029b38e7037ce65aa1',''),
 ('9c0f9f955c394999b76dd8aae84e02a9','1','系统设置-菜单管理-删除','1','2016-05-09 02:08:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/deleteAll','GET','ids=e2565667b9a745eb870debfd0830c46f',''),
 ('9c38e7f55f5a464ca86cf3e677787baf','1','ONLINE开发-表单配置-生成代码','1','2016-05-08 23:07:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=f72052c4a67842978605d07848c8e5ea',''),
 ('9d4c7083b93c4948ba7876185ba6d0a0','1','企业用户','1','2016-05-29 21:40:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('9ebc20d4e98b473eb271190cd0c433fd','1','系统登录','1','2016-05-29 00:48:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('9fdf4719b6fb40378a9e5543fe5d14ce','2','','1','2016-05-09 01:03:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/systemInfo','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: com.jeeplus.modules.gen.util.GenUtils\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 56 more\r\n'),
 ('a05d4ae80b374fc18107ad962a3097f5','1','系统监控-日志查询','1','2016-05-09 01:03:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/log','GET','',''),
 ('a0fad6dbbb494d95b74156735f1139dd','1','系统登录','1','2016-05-08 23:13:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('a100ba62f672443db07bb1ac2dcc4ece','1','系统登录','1','2016-05-09 00:57:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('a1219a808b6a46a5b2a81c3224c7151a','1','系统登录','1','2016-05-29 00:23:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/user/imageEdit','GET','',''),
 ('a177422d8f044d12a0c6634cc9a2e9ad','1','在线办公-个人办公-审批测试','1','2016-05-08 22:55:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/testAudit','GET','',''),
 ('a17c66c48964478b95a6208e3125ee02','1','企业用户','1','2016-06-22 00:38:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('a29c23bd43334a9b9683f2631178c48a','1','ONLINE开发-表单配置','1','2016-05-09 01:58:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('a37c1f7520794e4ea31e7eaa10f1ee35','1','系统登录','1','2016-05-09 01:12:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('a46708eb4c0f4868be797035da644cdd','1','ONLINE开发-生成示例-票务代理(一对多）','1','2016-05-08 22:55:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('a671d86e26d54b1e8b8aceaeb337ea49','1','用户','1','2016-05-23 23:46:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('a672036818204fc68ff3ca92b0c6aedb','1','统计报表-玫瑰图','1','2016-06-22 00:52:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/radar','GET','',''),
 ('a6cb0bf06c8c4a79afc37f451af80375','1','ONLINE开发-生成示例-商品分类','1','2016-05-30 17:03:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/category','GET','',''),
 ('a79fcfe0667944c093ae615550ad0ade','1','ONLINE开发-表单配置','1','2016-05-09 02:09:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('a8c562ef40f14d45b2845e42227f3104','1','系统登录','1','2016-05-09 02:01:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('a9e7e5306e7349b087c312fe27756e03','1','系统登录','1','2016-05-30 20:35:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=5e006a1023d044a8955dd6e8c9a9b38b','GET','','');
INSERT INTO `sys_log` (`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) VALUES 
 ('abd640c5fe674a23bc733589b0694d51','1','系统登录','1','2016-05-09 01:50:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('acefd7e573284d62b08ac59bca7e3bec','1','系统监控-系统配置','1','2016-05-09 01:02:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('ad1a4b971d7641149155f4bbe9fb036d','1','ONLINE开发-表单配置','1','2016-05-23 22:36:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('ad6d3d97e9a4479d9e0da3ce6dd8b91b','1','用户','1','2016-05-29 01:56:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('aea714a6c02244eba30688206536ff8e','1','用户','1','2016-05-28 22:08:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('af48e79bd2b64e66bcfde2d89769bb3a','1','ONLINE开发-生成示例-请假表单(单表）','1','2016-05-23 23:39:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/one/formLeave','GET','',''),
 ('afc89f4d1a43443e81b76a6e1bc3b394','1','系统设置-字典管理','1','2016-05-08 22:55:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','',''),
 ('afe7760fc5b14c059cb170ca889f8c08','2','ONLINE开发-表单配置','1','2016-05-08 23:13:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: org/apache/jsp/tag/web/sys/message_tag\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: org/apache/jsp/tag/web/sys/message_tag\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspx_meth_sys_005fmessage_005f0(genTableList_jsp.java:413)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:263)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: org.apache.jsp.tag.web.sys.message_tag\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 57 more\r\n'),
 ('b09d1917cbe9443ea6e6e2dc351cd318','1','代码生成-表单配置-导入','1','2016-06-22 00:46:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','GET','',''),
 ('b1e3c0235ab146fba79cfb380efb49f0','1','企业用户','1','2016-05-29 21:33:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('b2491bf449d1404baf9a26b8c2cf6b04','1','系统设置-菜单管理-删除','1','2016-06-22 00:39:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/deleteAll','GET','ids=3f61535789054d6a816fa827e0432fad',''),
 ('b2561d55be784e839a59e99d91eb1b36','1','ONLINE开发-表单配置','1','2016-05-09 02:06:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('b28c3e5cbc244525ae4bef6e98c9a01b','1','系统设置-菜单管理','1','2016-06-22 00:45:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('b295a55ffab74c2ea3e8ba65f5f98f4a','1','统计报表-饼图','1','2016-06-22 00:53:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/pie','GET','',''),
 ('b40bfaa0f153404cb9b473708bcaa42d','1','系统设置-菜单管理','1','2016-06-22 00:41:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('b47d41cd6e9047ddab4cd6d35bb7a7d2','1','我的面板-通讯录','1','2016-06-22 00:52:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/iim/contact/index','GET','',''),
 ('b583ee6991084c4badd8e4b31cbde79c','1','代码生成-表单配置-导入','1','2016-06-22 00:47:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','POST','id=&name=test_pie_class',''),
 ('b6076c63e774405495d6ad43e9a400ee','1','系统登录','1','2016-05-08 23:23:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('b6ec1ba29a55467dadf4b9ba204aa939','1','系统登录','1','2016-05-09 01:56:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('b71da1a3816d4b5d9e8d47f5423e8b5b','1','系统登录','1','2016-05-08 23:17:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('b825e572baf54f2d83b6a6acab30890b','1','ONLINE开发-生成示例-票务代理(一对多）','1','2016-05-30 17:03:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('b8384c5d26eb434d82dc02b5507ab6f4','1','我的面板-常用联系人','1','2016-06-22 00:52:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/iim/contact/myFriends','GET','',''),
 ('b882f95414214c998991840fc8d357d1','1','在线办公-我的通告','1','2016-06-22 00:52:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/oa/oaNotify/self','GET','',''),
 ('b88c1d8ffa684c1f951fc139f97e0af1','1','系统登录','1','2016-05-09 01:15:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('ba2824d1d5b749f49bf5497bf6cabfb9','1','企业用户','1','2016-05-30 17:02:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('ba963003749a49b399e558b171e99eb0','1','系统登录','1','2016-05-25 10:20:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('bb2cefed617144b18a50bbde007b5ec1','1','企业用户','1','2016-05-30 20:37:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('bb601cc284174842bbb4412cab8c8cb8','1','系统登录','1','2016-05-29 21:54:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a;JSESSIONID=38fc18a52eb24968b2245be561e72c85','GET','',''),
 ('bbc5be915b1c40dcb58b3c16a29a9777','1','用户','1','2016-05-29 02:00:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('bcb9856a365945b499b503d5cb4e062e','2','ONLINE开发-表单配置','1','2016-05-09 00:57:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\nCaused by: java.lang.ClassNotFoundException: com.jeeplus.modules.gen.util.GenUtils\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	... 56 more\r\n'),
 ('bd4c70c7e6fe4613a75dffa47512db3c','1','ONLINE开发-表单配置','1','2016-05-23 23:47:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('bd6945be0c2f4f818b55f396f727eae9','1','ONLINE开发-生成示例-富文本测试','1','2016-05-30 17:03:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('bd84061f6ff9447fa57ff8e458ee1701','1','ONLINE开发-表单配置-导入','1','2016-05-09 01:15:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','POST','id=&name=student',''),
 ('bd97579816684ff28e0c1253a01871cf','1','系统登录','1','2016-05-23 22:35:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('bef6de4caf034bc49ffa184ca7f230f7','1','用户','1','2016-05-23 23:48:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('bf513b3006a549ddbd9330267ff5056b','1','系统设置-菜单管理','1','2016-06-22 00:45:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('bfe0974b0a134e47a0d208f4eefeb12a','1','系统设置-机构管理','1','2016-05-09 02:08:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/office/','GET','',''),
 ('c196abc8d9bd4eca8ee12db7eef65b64','1','用户','1','2016-05-29 02:05:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('c291b1a324c94f98b32093ead710f79d','1','系统设置-角色管理','1','2016-05-09 02:08:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/role/','GET','',''),
 ('c2d2b56895a94d6bac3d42dea58b83f2','1','系统监控-系统配置','1','2016-05-09 01:15:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('c5ede9023fba444891efeb751aeb3056','1','系统登录','1','2016-05-08 23:07:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/form','GET','',''),
 ('c674a4d9a62a4331b1dd1331d9d4d021','1','ONLINE开发-表单配置-生成代码','1','2016-05-23 23:40:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('c6c73695101a4c2bb41a591da25b1058','1','用户','1','2016-05-29 02:04:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('c76535a68e0c47feaa2d1ff8058ecd62','1','ONLINE开发-表单配置-同步数据库','1','2016-05-23 23:42:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('c7d0ac3c73f3401c96abe526945fb7a8','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:16:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteAll','GET','ids=f72052c4a67842978605d07848c8e5ea,0a8f05eb973b4942af37c45109bd2502,cc721887670a4aabbf2b1446e697d1d...',''),
 ('c979156e4e8e4b6bb9e3218b4580bc9c','1','用户','1','2016-05-29 01:45:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('ca77c7e099d8485688b0402934363014','1','系统设置-字典管理','1','2016-05-09 02:08:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','',''),
 ('ca795b92c366475f99c95b5ab98f7ab8','1','系统设置-菜单管理','1','2016-05-09 02:08:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('cac17f90b8f74b74857777e5fcd8758a','1','ONLINE开发-表单配置','1','2016-05-09 02:02:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('cac4f9a28b594166bffceafccc760fd5','1','用户','1','2016-05-29 00:27:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('cae566f169c54a928e0784c8a59d482b','1','系统登录','1','2016-05-09 01:04:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('cb6e392d7a334cc7ad9b757040d12276','2','ONLINE开发-表单配置','1','2016-05-09 01:10:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: Error allocating a servlet instance\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:819)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:615)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: org/apache/jsp/webpage/modules/gen/genTableList_jsp (wrong name: org/apache/jsp/webpage/modules/gen/genTableList1_jsp)\r\n	at java.lang.ClassLoader.defineClass1(Native Method)\r\n	at java.lang.ClassLoader.defineClass(ClassLoader.java:791)\r\n	at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)\r\n	at org.apache.catalina.loader.WebappClassLoader.findClassInternal(WebappClassLoader.java:2818)\r\n	at org.apache.catalina.loader.WebappClassLoader.findClass(WebappClassLoader.java:1159)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1647)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1095)\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:809)\r\n	... 51 more\r\n'),
 ('cc30a08a85dc4db9b2256c132fa28d3c','1','用户','1','2016-05-29 01:48:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('cc369ad4158a4cc88491b5b4b321a75b','1','系统登录','1','2016-05-09 01:02:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('cc537beb424b4da2ab0bbb4fc4d94b80','1','系统设置-菜单管理','1','2016-06-22 00:40:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('ccdf7d2aceb943758563b4ca7138104e','1','用户','1','2016-05-29 00:59:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('cdc4181859134100b87b882ae00abcce','1','ONLINE开发-生成示例-富文本测试','1','2016-05-09 02:09:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('ce20f9f743fa48c78659e0146bbc7a13','1','系统登录','1','2016-05-09 00:55:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('cf7d275d3094498384bee8c25fda171a','1','系统设置-菜单管理','1','2016-06-22 00:46:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('cffaebcecad444eebb3934b6043b2053','1','系统登录','1','2016-05-29 01:48:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('d01e15df2012491499123a9f837aded6','1','用户','1','2016-05-29 00:35:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('d029bee6174b4efd956f542b6929ea4b','1','ONLINE开发-表单配置-同步数据库','1','2016-05-28 23:46:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('d0a87b70445243f08d4fb550ef09784e','1','ONLINE开发-生成示例-商品分类','1','2016-05-09 02:09:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/category','GET','',''),
 ('d181456e11754e0a8c01a41ff7a47ab3','1','系统登录','1','2016-05-08 22:55:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('d3ddc1a646654a8a9dca70c20d3fce7d','1','用户','1','2016-05-29 02:03:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('d43bcd9bcb944333a4f9a01bae273cc5','1','常用工具-外部邮件','1','2016-05-08 22:56:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/tools/email','GET','',''),
 ('d47350b36e3047e0846955fba3d349e2','1','ONLINE开发-表单配置','1','2016-05-23 23:39:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('d50372aea7b94032a7620655d30b8450','1','系统设置-菜单管理','1','2016-06-22 00:53:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('d50ecb25e7e04f9bb06a4ee6def47d8d','1','代码生成-生成示例-富文本测试','1','2016-06-22 01:23:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/note/testNote','GET','',''),
 ('d6b88e9aca1443fc89b951b34414e6fc','1','我的面板-我的日程','1','2016-05-08 22:55:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/iim/myCalendar','GET','',''),
 ('d6c198a8cd334abdab83be0d720b6ef4','1','用户','1','2016-05-29 02:04:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('d6eac0ac62b940c5bc77463581586ccb','2','','1','2016-05-09 01:04:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/systemInfo','GET','','javax.servlet.ServletException: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jasper.runtime.PageContextImpl.doHandlePageException(PageContextImpl.java:865)\r\n	at org.apache.jasper.runtime.PageContextImpl.handlePageException(PageContextImpl.java:794)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:359)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.NoClassDefFoundError: com/jeeplus/modules/gen/util/GenUtils\r\n	at org.apache.jsp.webpage.modules.gen.genTableList_jsp._jspService(genTableList_jsp.java:232)\r\n	... 55 more\r\n'),
 ('d873ef467e854f6db20a9d2db16688ef','1','系统登录','1','2016-05-09 01:46:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('d8a6f1e298e24625baf5a1f7c1bfdc7b','2','ONLINE开发-表单配置','1','2016-05-08 22:50:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','','javax.servlet.ServletException: Wrapper cannot find servlet class org.apache.jsp.webpage.modules.gen.genTableList_jsp or a class it depends on\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1103)\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:809)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:615)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.ClassNotFoundException: org.apache.jsp.webpage.modules.gen.genTableList_jsp\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1680)\r\n	at org.apache.catalina.loader.WebappClassLoader.loadClass(WebappClassLoader.java:1526)\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1095)\r\n	... 52 more\r\n'),
 ('d971dd813ca848b390285bec70c24c17','1','系统设置-菜单管理','1','2016-06-22 00:38:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('da279e77a71d4fcbaec0c94cd34b28db','1','企业用户','1','2016-05-29 02:17:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('da5d88ef277445f09d8756a038ef621c','2','系统监控-系统监控管理','1','2016-05-09 01:12:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','','org.apache.jasper.JasperException: Unable to compile class for JSP: \n\nAn error occurred at line: 10 in the generated java file\nOnly a type can be imported. com.jeeplus.modules.gen.util.GenUtils resolves to a package\n\nAn error occurred at line: 112 in the jsp file: /webpage/modules/gen/genTableList.jsp\nGenUtils cannot be resolved\n109: 	String username = getConfig(\"username\");\n110: 	String license = getConfig(\"license\");\n111: 	if (!(username == null || username.equals(\"\") || license == null\n112: 			|| license.equals(\"\") || !GenUtils.getSerial(username, \"5\").equals(license))) {\n113: \n114: 		\n115: \n\n\nStacktrace:\r\n	at org.apache.jasper.compiler.DefaultErrorHandler.javacError(DefaultErrorHandler.java:92)\r\n	at org.apache.jasper.compiler.ErrorDispatcher.javacError(ErrorDispatcher.java:330)\r\n	at org.apache.jasper.compiler.JDTCompiler.generateClass(JDTCompiler.java:439)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:349)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:327)\r\n	at org.apache.jasper.compiler.Compiler.compile(Compiler.java:314)\r\n	at org.apache.jasper.JspCompilationContext.compile(JspCompilationContext.java:592)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:326)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:313)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:260)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\n'),
 ('da6dbd87071b422c9920d9fa66b0b58c','1','用户-删除','1','2016-05-29 00:59:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=2766bd0e119e404397356364a81fae12,4fd6105a5ecb41719eaafd44391dc44f,50aaf45df74e4635befcda5a13e6fa3...',''),
 ('dbbd0145e3a749578c7797944fbf8f21','1','ONLINE开发-生成示例-商品分类','1','2016-05-08 22:55:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/category','GET','',''),
 ('dc09cfcc46f743ee8a3a1dfdc10287d1','1','ONLINE开发-表单配置','1','2016-05-23 23:43:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('dc6e5d45659d442f93fd0e67a19e98f7','1','ONLINE开发-生成示例-票务代理(一对多）','1','2016-05-08 23:23:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('dcf7465a79714043936d4f0693601738','1','ONLINE开发-表单配置-删除','1','2016-05-09 01:57:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/deleteDb','GET','id=15ffc109fca640d28ed0ab814fa0078f',''),
 ('dd5db4ed082a40c59b081c78ef372651','1','系统登录','1','2016-05-29 00:05:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('dfb83d3da6c847f48952ec847ec9c5cc','1','ONLINE开发-表单配置-导入','1','2016-05-09 01:22:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','POST','name=t1&id=',''),
 ('e0bd122df35c414a9b7cfbe3d73e2dcb','1','ONLINE开发-表单配置-生成代码','1','2016-05-09 01:20:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=9dc4a6b23a3f41279f9698f2e253acf7',''),
 ('e21e0672d6fe468c964c0b801e2f7651','1','系统监控-系统配置','1','2016-05-08 22:56:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/systemConfig','GET','',''),
 ('e2eb1a064702447794492050fda481b1','1','代码生成-生成示例-请假表单(单表）','1','2016-06-22 00:52:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/one/formLeave','GET','',''),
 ('e3d0842dbba5471098d7354488fa8a58','1','系统设置-菜单管理','1','2016-06-22 00:45:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('e45b530211214929b0e7933a46cb06fd','1','统计报表-双数值轴折线图','1','2016-06-22 00:52:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/linedoublenum','GET','',''),
 ('e49e4170185b4b3daf5ec79874983acb','1','系统设置-菜单管理','1','2016-05-09 02:01:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('e4fea97fe43444169e7ddce90979a7fa','1','代码生成-生成示例-请假表单(单表）','1','2016-06-22 01:28:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/one/formLeave','GET','',''),
 ('e6f50d2d2dab4d65b1a6a7efc9e98b3c','1','ONLINE开发-表单配置-同步数据库','1','2016-05-09 01:57:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=9615c80ce6b54a73b528effeb183ed93',''),
 ('e7c504ef9f4c4c7ab78e1318adf73ee7','1','用户','1','2016-05-28 23:46:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('e7fdcb3778cf448a99464dab4719308f','1','系统登录','1','2016-05-09 02:06:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('e91b05d3d71a4216aa541155a18838a9','1','ONLINE开发-表单配置','1','2016-05-09 01:57:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('ea157a580b2c4cfa9fa1ab9501945c4e','1','ONLINE开发-表单配置','1','2016-05-09 01:56:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('ea72e299fa1f4200a2d078a45d4e8614','1','统计报表-饼图','1','2016-06-22 00:52:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/pie','GET','',''),
 ('eb50bea6039348caafe65fc58d659052','1','系统登录','1','2016-06-22 00:38:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a','GET','login=',''),
 ('eb9209b88296471aafff4ac8e3740656','1','代码生成-表单配置-导入','1','2016-06-22 00:49:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/importTableFromDB','GET','',''),
 ('ec4f05d0374043eba0c4c0f5e2be8399','1','ONLINE开发-表单配置','1','2016-05-24 23:09:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('ec520b74c800493e9b6f8aefcc65a3b6','1','用户','1','2016-05-29 02:04:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('ec6f70c6b92746118a7cd019a8dec226','1','ONLINE开发-生成示例-组织结构(树结构)','1','2016-05-08 22:55:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/tree/testTree','GET','',''),
 ('ed26822cfe4e42019599a58a0ace0e13','1','系统设置-用户管理','1','2016-05-08 22:56:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/user/index','GET','',''),
 ('ed2cf79809df4b9e934c64bb1f0eb5c0','1','用户','1','2016-05-29 00:06:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('ed68477a34064d0ebbb40f5f02aceae7','1','在线办公-个人办公-我的任务','1','2016-05-09 02:07:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/act/task/todo/','GET','',''),
 ('edf94cad165c4ddfa20ca134e6c66dbd','1','ONLINE开发-表单配置','1','2016-05-23 22:37:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('ee4ec6d4d83346c6be2360ee878b2738','1','用户','1','2016-05-29 02:01:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','','');
INSERT INTO `sys_log` (`id`,`type`,`title`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) VALUES 
 ('ef54d0f80a174bc489e058214495f05c','1','系统监控-日志查询','1','2016-05-09 01:04:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/log','GET','',''),
 ('f1f43855436f493d9cdea6cadcb7ebf9','1','代码生成-生成示例-组织结构(树结构)','1','2016-06-22 00:52:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/tree/testTree','GET','',''),
 ('f2fb048f39cb42d5bc064f6aba4a7e95','1','ONLINE开发-表单配置','1','2016-05-08 23:23:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('f47fd5225aaf4d849dadc3a8367a528a','1','ONLINE开发-表单配置-生成代码','1','2016-05-08 23:17:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=15ffc109fca640d28ed0ab814fa0078f',''),
 ('f519578283224c8297b2fb8870f65aa8','1','ONLINE开发-表单配置-生成代码','1','2016-05-23 23:47:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=3ff13327cbc1445c9dab3873f7c4947d',''),
 ('f5981d836f39440fa462a35f2c08a794','1','ONLINE开发-生成示例-商品','1','2016-05-08 22:55:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/grid/goods','GET','',''),
 ('f5cbffc5a5744018b091b1489b55e32a','1','ONLINE开发-生成示例-票务代理(一对多）','1','2016-05-23 23:39:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/onetomany/testDataMain','GET','',''),
 ('f683799bc0964fb8a192a191aac2751e','1','用户-删除','1','2016-05-29 00:07:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=afd04b111b0c41cdab06039c70fd37f3,b112565900d040e6a58d9039ae6b77e0,bbf032e4d52e4ac1af3f02af3f11c78...',''),
 ('f70954c3355a4deeb68aadb15d12cd15','1','ONLINE开发-表单配置','1','2016-05-09 00:49:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('f7750d6d66394bdb977a9d486378d9f1','1','统计报表-玫瑰图','1','2016-06-22 00:53:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/echarts/radar','GET','',''),
 ('f7d980bb29a9461796c4bfea83b3d640','1','ONLINE开发-生成示例-请假表单(单表）','1','2016-05-08 22:55:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/test/one/formLeave','GET','',''),
 ('f7e97a3ec5834371a0f16756749183ca','1','用户','1','2016-05-28 23:37:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('f849786fb08d42daa0d1c657a9d00850','1','ONLINE开发-表单配置-同步数据库','1','2016-05-08 23:17:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/synchDb','GET','id=15ffc109fca640d28ed0ab814fa0078f',''),
 ('f987631252f34e27baf86dfc504c1b96','1','ONLINE开发-表单配置-生成代码','1','2016-05-08 23:17:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable/genCodeForm','GET','genTable.id=15ffc109fca640d28ed0ab814fa0078f',''),
 ('f9e0cc91d87945e8a3576fe3a6169b16','1','企业用户','1','2016-05-29 22:00:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('fba3774c09dd41b783685bf834b0e3a3','1','ONLINE开发-表单配置','1','2016-05-09 02:05:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('fca9fd2db59a445692c5c24b52d553d2','1','系统设置-菜单管理','1','2016-06-22 00:53:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/','GET','',''),
 ('fd87892cebf54d70a5e80070fb9e919e','1','系统设置-菜单管理-删除','1','2016-05-09 02:01:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/menu/deleteAll','GET','ids=6dd55135a3ab45aca27ec15236f1af05',''),
 ('fd9d5469f6bc444a8bbc64be48689938','2','系统监控-系统监控管理','1','2016-05-09 01:08:15','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/monitor/info','GET','','org.apache.jasper.JasperException: An exception occurred processing JSP page /webpage/modules/gen/genTableList1.jsp at line 151\n\n148: 		<input id=\"pageSize\" name=\"pageSize\" type=\"hidden\" value=\"${page.pageSize}\"/>\n149: 		<table:sortColumn id=\"orderBy\" name=\"orderBy\" value=\"${page.orderBy}\" callback=\"page();\"/>\n150: 		<div class=\"form-group\">\n151: 		<span>琛ㄥ悕锛�/span><form:input path=\"nameLike\" htmlEscape=\"false\" maxlength=\"50\" class=\" form-control input-sm\"/>\n152: 		<span>璇存槑锛�/span><form:input path=\"comments\" htmlEscape=\"false\" maxlength=\"50\" class=\" form-control input-sm\"/>\n153: 		<span>鐖惰〃琛ㄥ悕锛�/span><form:input path=\"parentTable\" htmlEscape=\"false\" maxlength=\"50\" class=\" form-control input-sm\"/>\n154: 		</div>\n\n\nStacktrace:\r\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:519)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:422)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:313)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:260)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:646)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:436)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:374)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:302)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:209)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:267)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1221)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1005)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:952)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:870)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:961)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:852)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:617)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:837)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:290)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:383)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:344)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:261)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:235)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:206)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:233)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:191)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:102)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:109)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:298)\r\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:859)\r\n	at org.apache.coyote.http11.Http11Protocol$Http11ConnectionHandler.process(Http11Protocol.java:588)\r\n	at org.apache.tomcat.util.net.JIoEndpoint$Worker.run(JIoEndpoint.java:489)\r\n	at java.lang.Thread.run(Thread.java:722)\r\nCaused by: java.lang.IllegalStateException: Neither BindingResult nor plain target object for bean name \'genTable\' available as request attribute\r\n	at org.springframework.web.servlet.support.BindStatus.<init>(BindStatus.java:144)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getBindStatus(AbstractDataBoundFormElementTag.java:168)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getPropertyPath(AbstractDataBoundFormElementTag.java:188)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getName(AbstractDataBoundFormElementTag.java:154)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.autogenerateId(AbstractDataBoundFormElementTag.java:141)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.resolveId(AbstractDataBoundFormElementTag.java:132)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.writeDefaultAttributes(AbstractDataBoundFormElementTag.java:116)\r\n	at org.springframework.web.servlet.tags.form.AbstractHtmlElementTag.writeDefaultAttributes(AbstractHtmlElementTag.java:422)\r\n	at org.springframework.web.servlet.tags.form.InputTag.writeTagContent(InputTag.java:142)\r\n	at org.springframework.web.servlet.tags.form.AbstractFormTag.doStartTagInternal(AbstractFormTag.java:84)\r\n	at org.springframework.web.servlet.tags.RequestContextAwareTag.doStartTag(RequestContextAwareTag.java:80)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList1_jsp._jspx_meth_form_005finput_005f0(genTableList1_jsp.java:531)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList1_jsp._jspx_meth_form_005fform_005f0(genTableList1_jsp.java:459)\r\n	at org.apache.jsp.webpage.modules.gen.genTableList1_jsp._jspService(genTableList1_jsp.java:271)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:717)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:386)\r\n	... 56 more\r\n'),
 ('fdd1ea929476420c928730e66f2662ec','1','ONLINE开发-表单配置','1','2016-05-09 02:03:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/gen/genTable','GET','',''),
 ('fdf31ce3fc7f46e8b83065abf2409a3d','1','用户','1','2016-05-29 00:48:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('fe3641543d1c4660a2b5a9f57ed01917','1','用户','1','2016-05-28 23:58:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member','GET','',''),
 ('fe3d278d3fe64f34a8cebafcda536ed9','1','系统设置-字典管理','1','2016-05-23 23:46:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/sys/dict/','GET','repage=&type=audit_status',''),
 ('fed3805ca10f44bdb361f5a1b9fa17f1','1','常用工具-短信工具','1','2016-05-08 22:56:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/tools/sms','GET','',''),
 ('fffd4d9f5a6f4c2c80e9b837ebeaf59d','1','用户-删除','1','2016-05-29 01:56:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','/jeeplus/a/cms/member/deleteAll','GET','ids=31f9afbf18b1460c8202a292f2af7062,a724b423bae940dcac232043932474ef,e81b64aa586242b08eae92b8ac65e24...','');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;


--
-- Definition of table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) default NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

--
-- Dumping data for table `sys_mdict`
--

/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;


--
-- Definition of table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) default NULL COMMENT '链接',
  `target` varchar(20) default NULL COMMENT '目标',
  `icon` varchar(100) default NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) default NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('0581067c09eb4acbbccb4cf00e05c898','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','折线图','60','/echarts/line','','','1','','1','2016-06-22 00:45:11','1','2016-06-22 00:45:11','','0'),
 ('0787b03f8a7d46d2b398ddcc23545d31','7ec930fe50fb41d0a9c7aeaa01804d16','0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,','增加','120','','','','0','tools:testInterface:add','1','2016-01-07 13:42:33','1','2016-01-12 23:52:06','','0'),
 ('079cc8bc633f403d90d817819dd31743','56dfdb85ae734bb49926402579d8649a','0,1,e768001e0fc44005b9ac92a32c96f730,56dfdb85ae734bb49926402579d8649a,','导入','150',NULL,NULL,NULL,'0','echarts:chinaWeatherDataBean:import','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('07f90eb4ad5848cba282a2e19bbebf60','55a33ae3ec2d466682ba2d701bea6fd0','0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,','增加','60','','','','0','test:one:formLeave:add','1','2016-01-11 23:06:37','1','2016-01-14 23:38:01','','0'),
 ('0aa3712414d049a6a24e8bcddeae509a','27','0,1,27,','我的日程','100','/iim/myCalendar','','','1','','1','2016-04-21 21:52:06','1','2016-04-21 21:52:06','','0'),
 ('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','组织结构(树结构)','90','/test/tree/testTree','','','1','test:tree:testTree:list','1','2013-08-12 13:10:05','1','2016-01-14 23:40:18','','0'),
 ('0fc22e838cb54627b31bd467e91f7c84','471f032f65384b4f81dc60b0671c7ce0','0,1,79,3c92c17886944d0687e73e286cada573,471f032f65384b4f81dc60b0671c7ce0,','查看','120',NULL,NULL,NULL,'0','test:grid:goods:view','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('1','0','0,','功能菜单','0',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('10','3','0,1,3,','字典管理','60','/sys/dict/','','th-list','1','sys:dict:list','1','2013-05-27 08:00:00','1','2015-12-24 22:23:07','','0'),
 ('11','10','0,1,3,10,','查看','30',NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('12','10','0,1,3,10,','修改','40',NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('14','3','0,1,3,','区域管理','50','/sys/area/','','th','1','sys:area:list','1','2013-05-27 08:00:00','1','2015-12-24 21:35:11','','0'),
 ('15','14','0,1,3,14,','查看','30',NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('16','14','0,1,3,14,','修改','40',NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('169219fbf6f641cdb3ff4d1e2c434ddd','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','双数值轴折线图','90','/echarts/linedoublenum','','','1','','1','2016-06-22 00:45:31','1','2016-06-22 00:45:31','','0'),
 ('17','3','0,1,3,','机构管理','40','/sys/office/','','th-large','1','sys:office:index','1','2013-05-27 08:00:00','1','2015-12-20 21:32:26','','0'),
 ('18','17','0,1,3,17,','查看','30',NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('19','17','0,1,3,17,','修改','40',NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('20','3','0,1,3,','用户管理','30','/sys/user/index','','icon-adjust','1','sys:user:index','1','2013-05-27 08:00:00','1','2015-12-19 21:46:20','','0'),
 ('2046d1618b8a4b4b9dcc25e655d7facb','56dfdb85ae734bb49926402579d8649a','0,1,e768001e0fc44005b9ac92a32c96f730,56dfdb85ae734bb49926402579d8649a,','删除','60',NULL,NULL,NULL,'0','echarts:chinaWeatherDataBean:del','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('21','20','0,1,3,20,','查看','30',NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('21c626fc496b49f8880bb47836507b50','471f032f65384b4f81dc60b0671c7ce0','0,1,79,3c92c17886944d0687e73e286cada573,471f032f65384b4f81dc60b0671c7ce0,','导出','180',NULL,NULL,NULL,'0','test:grid:goods:export','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('22','20','0,1,3,20,','修改','40',NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('23664b155b004c0ca9f79c2aec21ef04','2977e5b927cd41428b8f8d90359e0839','0,1,79,3c92c17886944d0687e73e286cada573,2977e5b927cd41428b8f8d90359e0839,','导入','150',NULL,NULL,NULL,'0','test:note:testNote:import','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('247bcf278dfc40cca447f5c736c6d849','55a33ae3ec2d466682ba2d701bea6fd0','0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,','删除','120','','','','0','test:one:formLeave:del','1','2016-01-11 23:07:26','1','2016-01-14 23:38:44','','0'),
 ('27','1','0,1,','我的面板','100','','','fa-columns','1','','1','2013-05-27 08:00:00','1','2015-12-13 20:18:41','','0'),
 ('28abe4b0cb3b4c8480f84c07a5dfaf06','90','0,1,62,90,','增加','60','','','','0','oa:oaNotify:add','1','2015-12-29 21:15:22','1','2015-12-29 21:15:22','','0'),
 ('28c963d85c794c3a93a5073da242d3d6','634e27e11ef64840a9ff7cca459599a8','0,1,e768001e0fc44005b9ac92a32c96f730,634e27e11ef64840a9ff7cca459599a8,','编辑','90',NULL,NULL,NULL,'0','echarts:pieClass:edit','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('29','27','0,1,27,','个人信息','30','/sys/user/info','','icon-adjust','1','','1','2013-05-27 08:00:00','1','2016-03-27 22:43:46','','0'),
 ('2977e5b927cd41428b8f8d90359e0839','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','富文本测试','15120','/test/note/testNote',NULL,'','1','test:note:testNote:list','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('2a0f940fbe304a05a6b4040ddf6df279','20','0,1,3,20,','增加','70','','','','0','sys:user:add','1','2015-12-19 21:47:00','1','2015-12-19 21:47:00','','0'),
 ('2d1a3790bf8c443dbb521edac779ac62','56dfdb85ae734bb49926402579d8649a','0,1,e768001e0fc44005b9ac92a32c96f730,56dfdb85ae734bb49926402579d8649a,','导出','180',NULL,NULL,NULL,'0','echarts:chinaWeatherDataBean:export','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('3','1','0,1,','系统设置','500','','','fa-cog','1','','1','2013-05-27 08:00:00','1','2015-11-04 17:27:37','','0'),
 ('31c4b44cf1bb40f69b405fce9af481e0','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','玫瑰图','150','/echarts/radar','','','1','','1','2016-06-22 00:46:03','1','2016-06-22 00:46:03','','0'),
 ('3c1c639c76f14f6f9903b0143371ea09','7','0,1,3,7,','添加','70','','','','0','sys:role:add','1','2015-12-23 21:35:08','1','2015-12-23 21:36:18','','0'),
 ('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例','120','','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),
 ('3d2697bb7fcf48a8967aa2a163a0a296','56dfdb85ae734bb49926402579d8649a','0,1,e768001e0fc44005b9ac92a32c96f730,56dfdb85ae734bb49926402579d8649a,','查看','120',NULL,NULL,NULL,'0','echarts:chinaWeatherDataBean:view','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('4','3','0,1,3,','菜单管理','30','/sys/menu/','','list-alt','1','sys:menu:list','1','2013-05-27 08:00:00','1','2015-12-20 18:59:32','','0'),
 ('471f032f65384b4f81dc60b0671c7ce0','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','商品','15120','/test/grid/goods',NULL,'','1','test:grid:goods:list','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看','30','','','','0','test:onetomany:testDataMain:view','1','2013-08-12 13:10:05','1','2016-01-14 23:44:21','','0'),
 ('4d463414bc974236941a6a14dc53c73a','56e274e0ec1c41298e19ab46cf4e001f','0,1,56e274e0ec1c41298e19ab46cf4e001f,','接口测试','15030','','','fa-venus','1','','1','2015-11-10 18:49:21','1','2016-03-05 10:11:25','','0'),
 ('5','4','0,1,3,4,','增加','30','','','','0','sys:menu:add','1','2013-05-27 08:00:00','1','2015-12-20 19:00:22','','0'),
 ('5239527958e94d418997b584b85d8b80','14','0,1,3,14,','删除','100','','','','0','sys:area:del','1','2015-12-24 21:37:13','1','2015-12-24 21:37:13','','0'),
 ('52ac2158c7ab4272a3469855de8bd78e','471f032f65384b4f81dc60b0671c7ce0','0,1,79,3c92c17886944d0687e73e286cada573,471f032f65384b4f81dc60b0671c7ce0,','删除','60',NULL,NULL,NULL,'0','test:grid:goods:del','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('55a33ae3ec2d466682ba2d701bea6fd0','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','请假表单(单表）','120','/test/one/formLeave','','','1','test:one:formLeave:list','1','2016-01-11 23:05:24','1','2016-01-14 23:37:07','','0'),
 ('55f7306aa1ee41ae9f93fc45d1497046','471f032f65384b4f81dc60b0671c7ce0','0,1,79,3c92c17886944d0687e73e286cada573,471f032f65384b4f81dc60b0671c7ce0,','编辑','90',NULL,NULL,NULL,'0','test:grid:goods:edit','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('56','27','0,1,27,','文件管理','90','/../static/ckfinder/ckfinder.html','','icon-zoom-out','1','','1','2013-05-27 08:00:00','1','2015-11-02 16:17:05','','0'),
 ('56dfdb85ae734bb49926402579d8649a','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','综合报表2','2040','/echarts/chinaWeatherDataBean',NULL,'','1','echarts:chinaWeatherDataBean:list','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('56e274e0ec1c41298e19ab46cf4e001f','1','0,1,','常用工具','2000','','','fa-anchor','1','','1','2016-03-03 16:30:04','1','2016-03-05 10:06:16','','0'),
 ('57','56','0,1,27,40,56,','查看','30',NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('57f1f00d6cb14819bef388acd10e6f5a','68','0,1,67,68,','删除','60','','','','0','sys:log:del','1','2015-12-25 20:25:55','1','2015-12-25 20:25:55','','0'),
 ('58','56','0,1,27,40,56,','上传','40',NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('59','56','0,1,27,40,56,','修改','50',NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('59f304d5312e4502930fef5dd8117b29','55a33ae3ec2d466682ba2d701bea6fd0','0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,','导入','180','','','','0','test:one:formLeave:import','1','2016-01-14 23:48:09','1','2016-01-14 23:48:09','','0'),
 ('6','4','0,1,3,4,','修改','40',NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('62','1','0,1,','OA办公','200','','','fa-desktop','1','','1','2013-05-27 08:00:00','1','2016-06-22 00:53:14','','0'),
 ('634e27e11ef64840a9ff7cca459599a8','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','综合报表1','2030','/echarts/pieClass',NULL,'','1','echarts:pieClass:list','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('64d6ba5e6d354581b5fa18fa300b2153','634e27e11ef64840a9ff7cca459599a8','0,1,e768001e0fc44005b9ac92a32c96f730,634e27e11ef64840a9ff7cca459599a8,','导出','180',NULL,NULL,NULL,'0','echarts:pieClass:export','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('6509eed6eb634030a46723a18814035c','7','0,1,3,7,','分配用户','100','','','','0','sys:role:assign','1','2015-12-23 21:35:37','1','2015-12-23 21:53:23','','0'),
 ('65272697795745c5beca02f6b295d1b4','2977e5b927cd41428b8f8d90359e0839','0,1,79,3c92c17886944d0687e73e286cada573,2977e5b927cd41428b8f8d90359e0839,','导出','180',NULL,NULL,NULL,'0','test:note:testNote:export','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('65db52b79f674799a818486349f11328','634e27e11ef64840a9ff7cca459599a8','0,1,e768001e0fc44005b9ac92a32c96f730,634e27e11ef64840a9ff7cca459599a8,','查看','120',NULL,NULL,NULL,'0','echarts:pieClass:view','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('67','1','0,1,','系统监控','985','','','fa-video-camera','1','','1','2013-06-03 08:00:00','1','2016-03-05 10:18:41','','0'),
 ('68','67','0,1,67,','日志查询','30','/sys/log','','pencil','1','sys:log:list','1','2013-06-03 08:00:00','1','2015-12-25 20:26:16','','0'),
 ('6890f329854d41bd92d4857e18ce641d','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','导出','150','','','','0','test:onetomany:testDataMain:export','1','2016-01-14 23:45:59','1','2016-01-14 23:45:59','','0'),
 ('68f9151151174868ab436e11e03bf548','4','0,1,3,4,','删除','70','','','','0','sys:menu:del','1','2015-12-20 19:01:16','1','2015-12-20 19:03:05','','0'),
 ('6abf277477e943b5b20ce205f30810cb','7a01ad47a4be4bc48a33c62180275ee8','0,1,79,3c92c17886944d0687e73e286cada573,7a01ad47a4be4bc48a33c62180275ee8,','编辑','90',NULL,NULL,NULL,'0','test:grid:category:edit','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('6ad303ae6a3f478e8f9b52e25ac46650','56dfdb85ae734bb49926402579d8649a','0,1,e768001e0fc44005b9ac92a32c96f730,56dfdb85ae734bb49926402579d8649a,','增加','30',NULL,NULL,NULL,'0','echarts:chinaWeatherDataBean:add','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('6c672b854d2b4821b89297640df5fc26','82','0,1,79,82,','同步数据库','180','','','','0','gen:genTable:synchDb','1','2016-01-07 11:31:00','1','2016-01-07 11:32:23','','0'),
 ('6d3a6777693f47c98e9b3051cacbcfdb','10','0,1,3,10,','增加','70','','','','0','sys:dict:add','1','2015-12-24 22:23:39','1','2015-12-24 22:24:22','','0'),
 ('7','3','0,1,3,','角色管理','50','/sys/role/','','lock','1','sys:role:list','1','2013-05-27 08:00:00','1','2015-12-23 21:33:46','','0'),
 ('70de7eac2f3e4632b1b7aa3cd536b35a','4d463414bc974236941a6a14dc53c73a','0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,','接口测试','200','/tools/testInterface/test','','','1','tools:testInterface:test','1','2015-11-30 15:21:14','1','2016-01-13 00:05:29','','0'),
 ('70e0cd35107f410dabad5a525d642ac6','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','饼图','120','/echarts/pie','','','1','','1','2016-06-22 00:45:47','1','2016-06-22 00:45:47','','0'),
 ('7601161b0f204feea5cb285083ad8c29','56e274e0ec1c41298e19ab46cf4e001f','0,1,56e274e0ec1c41298e19ab46cf4e001f,','短信工具','60','/tools/sms','','fa-commenting-o','1','','1','2016-03-04 00:19:43','1','2016-03-05 10:09:42','','0'),
 ('79','1','0,1,','代码生成','20','','','fa-codepen','1','','1','2013-10-16 08:00:00','1','2016-06-22 00:41:58','','0'),
 ('79a4cd230d6f48199aca81d46be39022','56dfdb85ae734bb49926402579d8649a','0,1,e768001e0fc44005b9ac92a32c96f730,56dfdb85ae734bb49926402579d8649a,','编辑','90',NULL,NULL,NULL,'0','echarts:chinaWeatherDataBean:edit','1','2016-06-22 00:51:39','1','2016-06-22 00:51:39',NULL,'0'),
 ('79f0ffa47dbe43ffa8824d97612d344f','4','0,1,3,4,','保存排序','100','','','','0','sys:menu:updateSort','1','2015-12-20 19:02:08','1','2015-12-20 19:02:08','','0'),
 ('79fca849d3da4a82a4ade3f6b9f45126','20','0,1,3,20,','删除','100','','','','0','sys:user:del','1','2015-12-19 21:47:44','1','2015-12-19 21:48:52','','0'),
 ('7a01ad47a4be4bc48a33c62180275ee8','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','商品分类','15120','/test/grid/category',NULL,'','1','test:grid:category:list','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('7ec930fe50fb41d0a9c7aeaa01804d16','4d463414bc974236941a6a14dc53c73a','0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,','接口列表','30','/tools/testInterface','','','1','tools:testInterface:list','1','2015-11-30 15:15:06','1','2016-01-12 23:50:52','','0'),
 ('8','7','0,1,3,7,','查看','30',NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('82','79','0,1,79,','表单配置','20','/gen/genTable','','','1','gen:genTable:list','1','2013-10-16 08:00:00','1','2016-01-07 20:48:49','','0'),
 ('84','67','0,1,67,','连接池监视','40','/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),
 ('8815c9a95cf54b19a39b0ce0ff4c32f8','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','删除','120','','','','0','test:onetomany:testDataMain:del','1','2016-01-04 15:50:07','1','2016-01-14 23:45:16','','0'),
 ('89','62','0,1,62,','我的通告','30','/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2016-04-21 22:37:41','','0'),
 ('8926112d6acd4a18b5e5dcf99a1f7ff3','7ec930fe50fb41d0a9c7aeaa01804d16','0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,','删除','150','','','','0','tools:testInterface:del','1','2016-01-07 13:43:13','1','2016-01-12 23:52:21','','0'),
 ('8930e4aad1ba4a1c958d303968d8c442','17','0,1,3,17,','删除','100','','','','0','sys:office:del','1','2015-12-20 21:19:16','1','2015-12-20 21:19:16','','0'),
 ('8e01a74a9ca94a26a5263769c354afb9','67','0,1,67,','系统配置','100','/sys/systemConfig','','','1','sys:systemConfig:index','1','2016-02-07 16:25:22','1','2016-02-07 16:25:22','','0'),
 ('8fafccd101914355ad4f19bf05daa9f0','634e27e11ef64840a9ff7cca459599a8','0,1,e768001e0fc44005b9ac92a32c96f730,634e27e11ef64840a9ff7cca459599a8,','导入','150',NULL,NULL,NULL,'0','echarts:pieClass:import','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('8ff255c054e5467aac19eb9d5abf8859','55a33ae3ec2d466682ba2d701bea6fd0','0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,','查看','30','','','','0','test:one:formLeave:view','1','2016-01-11 23:06:04','1','2016-01-14 23:37:42','','0'),
 ('9','7','0,1,3,7,','修改','40',NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('90','62','0,1,62,','通告管理','50','/oa/oaNotify','','','1','oa:oaNotify:list','1','2013-11-08 08:00:00','1','2016-04-21 22:38:02','','0'),
 ('91aa429a6cdc4a9b954d84ff1456934b','68','0,1,67,68,','查看','30','','','','0','sys:log:view','1','2015-12-25 20:25:25','1','2015-12-25 20:25:25','','0'),
 ('93635a11ad63482daca0291579c9b65e','2977e5b927cd41428b8f8d90359e0839','0,1,79,3c92c17886944d0687e73e286cada573,2977e5b927cd41428b8f8d90359e0839,','删除','60',NULL,NULL,NULL,'0','test:note:testNote:del','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('95a6a82dc5fc4d07b46e5df57a0606a3','27','0,1,27,','信箱','10000','/iim/mailBox/list?orderBy=sendtime desc','','','1','','1','2015-11-14 11:14:30','1','2015-11-24 18:01:46','','0'),
 ('9bc1aa1053144a608b73f6fbd841d1c6','10','0,1,3,10,','删除','100','','','','0','sys:dict:del','1','2015-12-24 22:24:04','1','2015-12-24 22:24:31','','0'),
 ('9fdf5971a9e64fac8bbffec2825a5f97','27','0,1,27,','常用联系人','180','/iim/contact/myFriends','','','1','','1','2015-12-28 22:10:06','1','2015-12-28 22:15:16','','0'),
 ('a28d551fc2f945e5b9aed595d45dfb62','2977e5b927cd41428b8f8d90359e0839','0,1,79,3c92c17886944d0687e73e286cada573,2977e5b927cd41428b8f8d90359e0839,','编辑','90',NULL,NULL,NULL,'0','test:note:testNote:edit','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('a4c3dcee6cbc4fc6a0bf617d8619edf3','17','0,1,3,17,','增加','70','','','','0','sys:office:add','1','2015-12-20 21:18:52','1','2015-12-20 21:18:52','','0'),
 ('a4cfc713c3c04c32a274fb59c71e34ed','7ec930fe50fb41d0a9c7aeaa01804d16','0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,','编辑','90','','','','0','tools:testInterface:edit','1','2015-11-30 16:08:40','1','2016-01-12 23:51:51','','0'),
 ('a8cf23d117bb439bb5954860a25e87bb','7a01ad47a4be4bc48a33c62180275ee8','0,1,79,3c92c17886944d0687e73e286cada573,7a01ad47a4be4bc48a33c62180275ee8,','导入','150',NULL,NULL,NULL,'0','test:grid:category:import','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('aab54af57cbc4e4687223cc01a53d0af','471f032f65384b4f81dc60b0671c7ce0','0,1,79,3c92c17886944d0687e73e286cada573,471f032f65384b4f81dc60b0671c7ce0,','增加','30',NULL,NULL,NULL,'0','test:grid:goods:add','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('af0a174b4f424bc09a8cc0db83a64105','27','0,1,27,','通讯录','120','/iim/contact/index','','','1','','1','2015-11-11 16:49:02','1','2015-11-11 16:49:02','','0'),
 ('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑','60','','','','0','test:tree:testTree:edit','1','2013-08-12 13:10:05','1','2016-01-14 23:40:58','','0'),
 ('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','票务代理(一对多）','60','/test/onetomany/testDataMain','','','1','test:onetomany:testDataMain:list','1','2013-08-12 13:10:05','1','2016-01-14 23:43:25','','0'),
 ('b86770f3e02b46148da7aa68d285835a','7a01ad47a4be4bc48a33c62180275ee8','0,1,79,3c92c17886944d0687e73e286cada573,7a01ad47a4be4bc48a33c62180275ee8,','删除','60',NULL,NULL,NULL,'0','test:grid:category:del','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('b9a776f5d7194406bb466388e3af9d08','20','0,1,3,20,','导出','160','','','','0','sys:user:export','1','2015-12-19 21:48:34','1','2015-12-19 21:48:34','','0'),
 ('be16a41c89be47cfa070f694e5e782da','7a01ad47a4be4bc48a33c62180275ee8','0,1,79,3c92c17886944d0687e73e286cada573,7a01ad47a4be4bc48a33c62180275ee8,','导出','180',NULL,NULL,NULL,'0','test:grid:category:export','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('c176ad1dee4a45be83acef60cf6f46cc','7a01ad47a4be4bc48a33c62180275ee8','0,1,79,3c92c17886944d0687e73e286cada573,7a01ad47a4be4bc48a33c62180275ee8,','增加','30',NULL,NULL,NULL,'0','test:grid:category:add','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看','30','','','','0','test:tree:testTree:view','1','2013-08-12 13:10:05','1','2016-01-14 23:40:41','','0'),
 ('c3de25a76785419b8a6820db3935941d','82','0,1,79,82,','导入','150','','','','0','gen:genTable:importDb','1','2016-01-07 11:30:25','1','2016-01-07 11:30:25','','0'),
 ('c6e0080e06014abd9240f870aadf3200','14','0,1,3,14,','增加','70','','','','0','sys:area:add','1','2015-12-24 21:35:39','1','2015-12-24 21:35:39','','0'),
 ('c7fa36c7142f481397c2cc12e2bc828a','90','0,1,62,90,','修改','90','','','','0','oa:oaNotify:edit','1','2015-12-29 21:15:50','1','2015-12-29 21:15:50','','0'),
 ('c824b5c244cc4098853671e75858ca55','55a33ae3ec2d466682ba2d701bea6fd0','0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,','编辑','90','','','','0','test:one:formLeave:edit','1','2016-01-11 23:07:05','1','2016-01-14 23:38:23','','0'),
 ('cac8d5931531427ca0ba7e55927dcdf2','55a33ae3ec2d466682ba2d701bea6fd0','0,1,79,3c92c17886944d0687e73e286cada573,55a33ae3ec2d466682ba2d701bea6fd0,','导出','150','','','','0','test:one:formLeave:export','1','2016-01-14 23:47:50','1','2016-01-14 23:47:50','','0'),
 ('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑','60','','','','0','test:onetomany:testDataMain:edit','1','2013-08-12 13:10:05','1','2016-01-14 23:44:45','','0'),
 ('d3f1b6f292904ef5b95f7800cc777a48','82','0,1,79,82,','查看','30','','','','0','gen:genTable:view,gen:genTableColumn:view','1','2016-01-07 11:26:42','1','2016-01-07 11:26:42','','0'),
 ('d64d25d7b3014f9ba7736867cb2ffc43','82','0,1,79,82,','生成代码','210','','','','0','gen:genTable:genCode','1','2016-01-07 11:31:24','1','2016-01-07 11:31:24','','0'),
 ('d75f64438d994fc4830b1b3d138cde32','82','0,1,79,82,','删除','120','','','','0','gen:genTable:del','1','2016-01-07 11:29:23','1','2016-01-07 11:29:23','','0'),
 ('d78a0f0a6c8c48699e5d081f64014b99','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','导入','180','','','','0','test:onetomany:testDataMain:import','1','2016-01-14 23:46:22','1','2016-01-14 23:46:22','','0'),
 ('dae12251f0234673bd7b21fdd47a02b9','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','删除','120','','','','0','test:tree:testTree:del','1','2016-01-06 22:50:25','1','2016-01-14 23:41:32','','0'),
 ('de7c50d276454f80881c41a096ecf55c','7','0,1,3,7,','删除','160','','','','0','sys:role:del','1','2015-12-23 21:59:46','1','2015-12-23 21:59:46','','0'),
 ('e03f8b6a5e454addb04fc08033b6f60b','82','0,1,79,82,','增加','90','','','','0','gen:genTable:add','1','2016-01-07 11:28:59','1','2016-01-07 11:28:59','','0'),
 ('e2efcf80fc3747329fe02d489dbfda95','90','0,1,62,90,','删除','120','','','','0','oa:oaNotify:del','1','2015-12-29 21:16:14','1','2015-12-29 21:16:14','','0'),
 ('e3b80fae59ab4b4099d8349ecaf8c4dc','29','0,1,27,29,','test','30','/sys/user/info','','','1','','1','2016-03-27 21:10:29','1','2016-03-27 22:43:57','','0'),
 ('e46555e269b84e2697857bdbb73f6676','56e274e0ec1c41298e19ab46cf4e001f','0,1,56e274e0ec1c41298e19ab46cf4e001f,','表单构建器','90','/tools/beautifyhtml','','fa-building-o','1','','1','2016-03-05 10:00:01','1','2016-03-05 10:10:09','','0'),
 ('e4e64e24aa134deaa9d69c3b9495c997','56e274e0ec1c41298e19ab46cf4e001f','0,1,56e274e0ec1c41298e19ab46cf4e001f,','二维码测试','15060','/tools/TwoDimensionCodeController','','fa-qrcode','1','','1','2015-12-10 13:03:43','1','2016-03-05 10:04:53','','0'),
 ('e668f4084dc9446ba32ad64633172ea0','e768001e0fc44005b9ac92a32c96f730','0,1,e768001e0fc44005b9ac92a32c96f730,','柱状图','30','/echarts/bar','','','1','','1','2016-06-22 00:44:47','1','2016-06-22 00:44:47','','0'),
 ('e768001e0fc44005b9ac92a32c96f730','1','0,1,','统计报表','10','','','fa-line-chart','1','','1','2016-06-22 00:43:08','1','2016-06-22 00:44:22','','0'),
 ('e824b7c20bb34c9ca9ad023e8873e67b','82','0,1,79,82,','编辑','60','','','','0','gen:genTable:edit,gen:genTableColumn:edit','1','2016-01-07 11:27:55','1','2016-01-07 11:31:46','','0'),
 ('e854d860eb7b4961af34202fef5dc8ad','634e27e11ef64840a9ff7cca459599a8','0,1,e768001e0fc44005b9ac92a32c96f730,634e27e11ef64840a9ff7cca459599a8,','增加','30',NULL,NULL,NULL,'0','echarts:pieClass:add','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('ea1046197b724b71b98c9eabf238f0af','2977e5b927cd41428b8f8d90359e0839','0,1,79,3c92c17886944d0687e73e286cada573,2977e5b927cd41428b8f8d90359e0839,','增加','30',NULL,NULL,NULL,'0','test:note:testNote:add','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('ec7cf7a144a440cab217aabd4ffb7788','4','0,1,3,4,','查看','130','','','','0','sys:menu:view','1','2015-12-20 19:02:54','1','2015-12-20 19:02:54','','0'),
 ('eda782d5db444d09ada20f0a95496b3b','7a01ad47a4be4bc48a33c62180275ee8','0,1,79,3c92c17886944d0687e73e286cada573,7a01ad47a4be4bc48a33c62180275ee8,','查看','120',NULL,NULL,NULL,'0','test:grid:category:view','1','2016-05-04 21:02:29','1','2016-05-04 21:02:29',NULL,'0'),
 ('eeac4932f81941bd8c83f3544c265d32','634e27e11ef64840a9ff7cca459599a8','0,1,e768001e0fc44005b9ac92a32c96f730,634e27e11ef64840a9ff7cca459599a8,','删除','60',NULL,NULL,NULL,'0','echarts:pieClass:del','1','2016-06-22 00:49:31','1','2016-06-22 00:49:31',NULL,'0'),
 ('f0214f8481134eb7a5528c638c3a2b76','471f032f65384b4f81dc60b0671c7ce0','0,1,79,3c92c17886944d0687e73e286cada573,471f032f65384b4f81dc60b0671c7ce0,','导入','150',NULL,NULL,NULL,'0','test:grid:goods:import','1','2016-05-04 21:02:39','1','2016-05-04 21:02:39',NULL,'0'),
 ('f07b7ea555f84116b5390d2a73740817','56e274e0ec1c41298e19ab46cf4e001f','0,1,56e274e0ec1c41298e19ab46cf4e001f,','外部邮件','30','/tools/email','','fa-envelope-o','1','','1','2016-03-03 20:39:12','1','2016-04-10 21:21:18','','0'),
 ('f18fac5c4e6145528f3c1d87dbcb37d5','67','0,1,67,','系统监控管理','70','/monitor/info','','','1','','1','2016-02-02 22:49:07','1','2016-02-02 23:15:07','','0'),
 ('f34887a78fa245c1977603ca7dc98e11','20','0,1,3,20,','导入','130','','','','0','sys:user:import','1','2015-12-19 21:48:13','1','2015-12-19 21:48:44','','0'),
 ('f5b2028cfad9470085c7c846de33193a','90','0,1,62,90,','查看','30','','','','0','oa:oaNotify:view','1','2015-12-29 21:14:46','1','2015-12-29 21:14:46','','0'),
 ('f87f68e686974c12b4923a81df0dfa7c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','添加','90','','','','0','test:tree:testTree:add','1','2016-01-06 22:49:44','1','2016-01-14 23:41:15','','0'),
 ('f910a9e29c414ed887906a3c9fa1625b','2977e5b927cd41428b8f8d90359e0839','0,1,79,3c92c17886944d0687e73e286cada573,2977e5b927cd41428b8f8d90359e0839,','查看','120',NULL,NULL,NULL,'0','test:note:testNote:view','1','2016-05-04 22:32:12','1','2016-05-04 22:32:12',NULL,'0'),
 ('f93f9a3a2226461dace3b8992cf055ba','7','0,1,3,7,','权限设置','130','','','','0','sys:role:auth','1','2015-12-23 21:36:06','1','2015-12-23 21:36:06','','0'),
 ('f9fe62186f0a4d7eada6c6827de79b26','7ec930fe50fb41d0a9c7aeaa01804d16','0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,','查看','30','','','','0','tools:testInterface:view','1','2015-11-30 16:08:14','1','2016-04-10 21:21:33','','0'),
 ('ff5af1be6f7544e2893b1c79dd6e0745','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','添加','90','','','','0','test:onetomany:testDataMain:add','1','2016-01-04 11:14:18','1','2016-01-14 23:45:01','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;


--
-- Definition of table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) default NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) default NULL COMMENT '联系地址',
  `zip_code` varchar(100) default NULL COMMENT '邮政编码',
  `master` varchar(100) default NULL COMMENT '负责人',
  `phone` varchar(200) default NULL COMMENT '电话',
  `fax` varchar(200) default NULL COMMENT '传真',
  `email` varchar(200) default NULL COMMENT '邮箱',
  `USEABLE` varchar(64) default NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) default NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) default NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

--
-- Dumping data for table `sys_office`
--

/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` (`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('1','0','0,','总公司','10','4d8ec70b0e0c4c97af07b97c9a906c40','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2015-11-11 17:40:49','','0'),
 ('4','1','0,1,','财务部','30','17e8e72326574a0ea94b15d6eeddbb6d','100003','2','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-01-11 23:10:27','','0'),
 ('5','1','0,1,','技术部','40','2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),
 ('6a642e140e40496a8d467c646b8e935e','1','0,1,','市场部','30','17e8e72326574a0ea94b15d6eeddbb6d','1000','2','1','','','','','','','1','','','1','2015-12-03 18:10:13','1','2016-01-11 23:10:10','','0'),
 ('e0ef8af9cae6416f8bb359714a1b4244','1','0,1,','行政部','30','4d8ec70b0e0c4c97af07b97c9a906c40','','2','1','','','','','','','1','','','1','2015-11-11 17:41:41','1','2015-11-11 17:41:55','','0');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;


--
-- Definition of table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) default NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) default NULL COMMENT '英文名称',
  `role_type` varchar(255) default NULL COMMENT '角色类型',
  `data_scope` char(1) default NULL COMMENT '数据范围',
  `is_sys` varchar(64) default NULL COMMENT '是否系统数据',
  `useable` varchar(64) default NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('1c54e003c1fc4dcd9b087ef8d48abac3','5','管理员','system','security-role','1','1','1','1','2015-11-11 15:59:43','1','2016-05-04 21:14:28','','0'),
 ('5','5','本部门管理员1','c2','security-role','8','0','0','1','2013-05-27 08:00:00','1','2015-12-23 20:18:16','111111111','0'),
 ('caacf61017114120bcf7bf1049b6d4c3','5','部门管理员','depart','assignment','8','0','1','1','2015-11-13 10:54:36','1','2016-03-19 21:29:18','','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;


--
-- Definition of table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY  (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`role_id`,`menu_id`) VALUES 
 ('03fcd9c5c28948eb827fcd3b852494a6','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('03fcd9c5c28948eb827fcd3b852494a6','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('03fcd9c5c28948eb827fcd3b852494a6','1'),
 ('03fcd9c5c28948eb827fcd3b852494a6','10'),
 ('03fcd9c5c28948eb827fcd3b852494a6','11'),
 ('03fcd9c5c28948eb827fcd3b852494a6','12'),
 ('03fcd9c5c28948eb827fcd3b852494a6','14'),
 ('03fcd9c5c28948eb827fcd3b852494a6','15'),
 ('03fcd9c5c28948eb827fcd3b852494a6','16'),
 ('03fcd9c5c28948eb827fcd3b852494a6','17'),
 ('03fcd9c5c28948eb827fcd3b852494a6','18'),
 ('03fcd9c5c28948eb827fcd3b852494a6','19'),
 ('03fcd9c5c28948eb827fcd3b852494a6','20'),
 ('03fcd9c5c28948eb827fcd3b852494a6','21'),
 ('03fcd9c5c28948eb827fcd3b852494a6','22'),
 ('03fcd9c5c28948eb827fcd3b852494a6','27'),
 ('03fcd9c5c28948eb827fcd3b852494a6','29'),
 ('03fcd9c5c28948eb827fcd3b852494a6','2a0f940fbe304a05a6b4040ddf6df279'),
 ('03fcd9c5c28948eb827fcd3b852494a6','3'),
 ('03fcd9c5c28948eb827fcd3b852494a6','30'),
 ('03fcd9c5c28948eb827fcd3b852494a6','3945952858c54ff6b928265e76416aa2'),
 ('03fcd9c5c28948eb827fcd3b852494a6','3c92c17886944d0687e73e286cada573'),
 ('03fcd9c5c28948eb827fcd3b852494a6','4'),
 ('03fcd9c5c28948eb827fcd3b852494a6','4855cf3b25c244fb8500a380db189d97'),
 ('03fcd9c5c28948eb827fcd3b852494a6','485c63cf6af1448880bb35b7b3f2bb1b'),
 ('03fcd9c5c28948eb827fcd3b852494a6','4d463414bc974236941a6a14dc53c73a'),
 ('03fcd9c5c28948eb827fcd3b852494a6','5'),
 ('03fcd9c5c28948eb827fcd3b852494a6','54afcfd125024b6eaeab9c5c3cea0009'),
 ('03fcd9c5c28948eb827fcd3b852494a6','56'),
 ('03fcd9c5c28948eb827fcd3b852494a6','57'),
 ('03fcd9c5c28948eb827fcd3b852494a6','58'),
 ('03fcd9c5c28948eb827fcd3b852494a6','59'),
 ('03fcd9c5c28948eb827fcd3b852494a6','5dfd09e5790b41388b8691ea9993eba5'),
 ('03fcd9c5c28948eb827fcd3b852494a6','6'),
 ('03fcd9c5c28948eb827fcd3b852494a6','62'),
 ('03fcd9c5c28948eb827fcd3b852494a6','63'),
 ('03fcd9c5c28948eb827fcd3b852494a6','64'),
 ('03fcd9c5c28948eb827fcd3b852494a6','65'),
 ('03fcd9c5c28948eb827fcd3b852494a6','66'),
 ('03fcd9c5c28948eb827fcd3b852494a6','67'),
 ('03fcd9c5c28948eb827fcd3b852494a6','68'),
 ('03fcd9c5c28948eb827fcd3b852494a6','68f9151151174868ab436e11e03bf548'),
 ('03fcd9c5c28948eb827fcd3b852494a6','69'),
 ('03fcd9c5c28948eb827fcd3b852494a6','7'),
 ('03fcd9c5c28948eb827fcd3b852494a6','70'),
 ('03fcd9c5c28948eb827fcd3b852494a6','70de7eac2f3e4632b1b7aa3cd536b35a'),
 ('03fcd9c5c28948eb827fcd3b852494a6','72'),
 ('03fcd9c5c28948eb827fcd3b852494a6','73'),
 ('03fcd9c5c28948eb827fcd3b852494a6','74'),
 ('03fcd9c5c28948eb827fcd3b852494a6','75'),
 ('03fcd9c5c28948eb827fcd3b852494a6','79'),
 ('03fcd9c5c28948eb827fcd3b852494a6','79f0ffa47dbe43ffa8824d97612d344f'),
 ('03fcd9c5c28948eb827fcd3b852494a6','79fca849d3da4a82a4ade3f6b9f45126'),
 ('03fcd9c5c28948eb827fcd3b852494a6','7bd4484bd13c441395e44ab86772da00'),
 ('03fcd9c5c28948eb827fcd3b852494a6','7ec930fe50fb41d0a9c7aeaa01804d16'),
 ('03fcd9c5c28948eb827fcd3b852494a6','8'),
 ('03fcd9c5c28948eb827fcd3b852494a6','80'),
 ('03fcd9c5c28948eb827fcd3b852494a6','81'),
 ('03fcd9c5c28948eb827fcd3b852494a6','82'),
 ('03fcd9c5c28948eb827fcd3b852494a6','83'),
 ('03fcd9c5c28948eb827fcd3b852494a6','84'),
 ('03fcd9c5c28948eb827fcd3b852494a6','86'),
 ('03fcd9c5c28948eb827fcd3b852494a6','87'),
 ('03fcd9c5c28948eb827fcd3b852494a6','88'),
 ('03fcd9c5c28948eb827fcd3b852494a6','89'),
 ('03fcd9c5c28948eb827fcd3b852494a6','8930e4aad1ba4a1c958d303968d8c442'),
 ('03fcd9c5c28948eb827fcd3b852494a6','9'),
 ('03fcd9c5c28948eb827fcd3b852494a6','90'),
 ('03fcd9c5c28948eb827fcd3b852494a6','95a6a82dc5fc4d07b46e5df57a0606a3'),
 ('03fcd9c5c28948eb827fcd3b852494a6','a4c3dcee6cbc4fc6a0bf617d8619edf3'),
 ('03fcd9c5c28948eb827fcd3b852494a6','a4cfc713c3c04c32a274fb59c71e34ed'),
 ('03fcd9c5c28948eb827fcd3b852494a6','af0a174b4f424bc09a8cc0db83a64105'),
 ('03fcd9c5c28948eb827fcd3b852494a6','afab2db430e2457f9cf3a11feaa8b869'),
 ('03fcd9c5c28948eb827fcd3b852494a6','b1f6d1b86ba24365bae7fd86c5082317'),
 ('03fcd9c5c28948eb827fcd3b852494a6','b9a776f5d7194406bb466388e3af9d08'),
 ('03fcd9c5c28948eb827fcd3b852494a6','ba8092291b40482db8fe7fc006ea3d76'),
 ('03fcd9c5c28948eb827fcd3b852494a6','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('03fcd9c5c28948eb827fcd3b852494a6','c99753f4ad0a4a458337b255c3b49095'),
 ('03fcd9c5c28948eb827fcd3b852494a6','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('03fcd9c5c28948eb827fcd3b852494a6','df7ce823c5b24ff9bada43d992f373e2'),
 ('03fcd9c5c28948eb827fcd3b852494a6','e2565667b9a745eb870debfd0830c46f'),
 ('03fcd9c5c28948eb827fcd3b852494a6','e3e131bb489f43dd865280e4f5932b6d'),
 ('03fcd9c5c28948eb827fcd3b852494a6','e4e64e24aa134deaa9d69c3b9495c997'),
 ('03fcd9c5c28948eb827fcd3b852494a6','ec7cf7a144a440cab217aabd4ffb7788'),
 ('03fcd9c5c28948eb827fcd3b852494a6','f34887a78fa245c1977603ca7dc98e11'),
 ('03fcd9c5c28948eb827fcd3b852494a6','f9fe62186f0a4d7eada6c6827de79b26'),
 ('1','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('1','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('1','0fde32c6c8204f92a6846714821491f7'),
 ('1','1'),
 ('1','10'),
 ('1','11'),
 ('1','12'),
 ('1','13'),
 ('1','14'),
 ('1','15'),
 ('1','16'),
 ('1','17'),
 ('1','18'),
 ('1','19'),
 ('1','1dc794e30998444489db19eec02915c3'),
 ('1','20'),
 ('1','21'),
 ('1','22'),
 ('1','27'),
 ('1','29'),
 ('1','3'),
 ('1','30'),
 ('1','31'),
 ('1','32'),
 ('1','33'),
 ('1','34'),
 ('1','35'),
 ('1','36'),
 ('1','37'),
 ('1','38'),
 ('1','39'),
 ('1','3c92c17886944d0687e73e286cada573'),
 ('1','4'),
 ('1','40'),
 ('1','41'),
 ('1','42'),
 ('1','43'),
 ('1','44'),
 ('1','45'),
 ('1','46'),
 ('1','47'),
 ('1','48'),
 ('1','4855cf3b25c244fb8500a380db189d97'),
 ('1','49'),
 ('1','5'),
 ('1','50'),
 ('1','51'),
 ('1','52'),
 ('1','53'),
 ('1','54'),
 ('1','55'),
 ('1','56'),
 ('1','57'),
 ('1','58'),
 ('1','59'),
 ('1','6'),
 ('1','60'),
 ('1','61'),
 ('1','62'),
 ('1','63'),
 ('1','64'),
 ('1','65'),
 ('1','66'),
 ('1','67'),
 ('1','68'),
 ('1','69'),
 ('1','6d7e99b2edf44c96b8bbb9c1ef6dfe66'),
 ('1','7'),
 ('1','70'),
 ('1','72'),
 ('1','73'),
 ('1','74'),
 ('1','79'),
 ('1','8'),
 ('1','80'),
 ('1','81'),
 ('1','82'),
 ('1','84'),
 ('1','872d2edc3b61405eb1448355e8f2c556'),
 ('1','88'),
 ('1','89'),
 ('1','9'),
 ('1','90'),
 ('1','afab2db430e2457f9cf3a11feaa8b869'),
 ('1','b1f6d1b86ba24365bae7fd86c5082317'),
 ('1','ba8092291b40482db8fe7fc006ea3d76'),
 ('1','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('1','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('1','dcea8b88d08c4723878d372d2139448d'),
 ('1','df7ce823c5b24ff9bada43d992f373e2'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','0787b03f8a7d46d2b398ddcc23545d31'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','07f90eb4ad5848cba282a2e19bbebf60'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','0aa3712414d049a6a24e8bcddeae509a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','0fc22e838cb54627b31bd467e91f7c84'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','1'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','10'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','11'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','12'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','14'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','15'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','16'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','17'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','18'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','19'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','20'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','20b1147d34e14580b88ed00dd5d3ef78'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','21'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','21c626fc496b49f8880bb47836507b50'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','22'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','2209119856094953ba6ebc339b415887'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','247bcf278dfc40cca447f5c736c6d849'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','27'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','28abe4b0cb3b4c8480f84c07a5dfaf06'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','29'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','2a0f940fbe304a05a6b4040ddf6df279'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','2c6838e2f935453485342836efb63c1f'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','3'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','3518c0cfa3b645b09a6fa979ac641f41'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','3c1c639c76f14f6f9903b0143371ea09'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','3c92c17886944d0687e73e286cada573'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','4'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','456fea6a94114987b3f4d5b973a4f46b'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','471f032f65384b4f81dc60b0671c7ce0'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','4855cf3b25c244fb8500a380db189d97'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','487af8d5d1034c9d852007f1b3a27342'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','4d463414bc974236941a6a14dc53c73a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','5'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','5239527958e94d418997b584b85d8b80'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','52ac2158c7ab4272a3469855de8bd78e'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','545bbb767e9049b39292b815c709c968'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','55a33ae3ec2d466682ba2d701bea6fd0'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','55f7306aa1ee41ae9f93fc45d1497046'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','56'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','56e274e0ec1c41298e19ab46cf4e001f'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','57'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','57f1f00d6cb14819bef388acd10e6f5a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','58'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','59'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','59f304d5312e4502930fef5dd8117b29'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','5b1ca1d4aa5b4a56a6682093fafda4f5'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','5ca66750233b46699593dc083f87cd60'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','62'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6509eed6eb634030a46723a18814035c'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','67'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','68'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6890f329854d41bd92d4857e18ce641d'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','68f9151151174868ab436e11e03bf548'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6abf277477e943b5b20ce205f30810cb'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6c672b854d2b4821b89297640df5fc26'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6d3a6777693f47c98e9b3051cacbcfdb'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','6edc1dc93aa14fc18a2db8bde9096660'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','7'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','70de7eac2f3e4632b1b7aa3cd536b35a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','70f867cb6f23489d8427e295e0e63a6f'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','7402c1aad68f46d99f3a0868737ca582'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','7601161b0f204feea5cb285083ad8c29'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','79'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','79f0ffa47dbe43ffa8824d97612d344f'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','79fca849d3da4a82a4ade3f6b9f45126'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','7a01ad47a4be4bc48a33c62180275ee8'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','7ec930fe50fb41d0a9c7aeaa01804d16'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','82'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8211dbd824ca422fb5baf1bade46696b'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','84'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8815c9a95cf54b19a39b0ce0ff4c32f8'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','89'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8926112d6acd4a18b5e5dcf99a1f7ff3'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8930e4aad1ba4a1c958d303968d8c442'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8e01a74a9ca94a26a5263769c354afb9'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8f6d10c69f0247a0806f0f1db4caef16'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','8ff255c054e5467aac19eb9d5abf8859'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','9'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','90'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','91aa429a6cdc4a9b954d84ff1456934b'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','95a6a82dc5fc4d07b46e5df57a0606a3'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','9bc1aa1053144a608b73f6fbd841d1c6'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','9fdf5971a9e64fac8bbffec2825a5f97'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','9fe9475cccba4e6fa3371cc5f023c32a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','a4c3dcee6cbc4fc6a0bf617d8619edf3'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','a4cfc713c3c04c32a274fb59c71e34ed'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','a734592d272a4859b8f76db16443296a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','a8cf23d117bb439bb5954860a25e87bb'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','aab54af57cbc4e4687223cc01a53d0af'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','ae4627d9a17c4593a171349a61ab6fcf'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','af0a174b4f424bc09a8cc0db83a64105'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','afab2db430e2457f9cf3a11feaa8b869'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','b03b375aeb1b40bc89e31f24730b6b25'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','b051156518fd413794cf0316830aaf07'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','b1f6d1b86ba24365bae7fd86c5082317'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','b86770f3e02b46148da7aa68d285835a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','b9a776f5d7194406bb466388e3af9d08'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','be16a41c89be47cfa070f694e5e782da'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c176ad1dee4a45be83acef60cf6f46cc'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c3a75c42193f4fec93f8c83de1035137'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c3de25a76785419b8a6820db3935941d'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c6e0080e06014abd9240f870aadf3200'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c7fa36c7142f481397c2cc12e2bc828a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','c824b5c244cc4098853671e75858ca55'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','cac8d5931531427ca0ba7e55927dcdf2'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','d3f1b6f292904ef5b95f7800cc777a48'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','d64d25d7b3014f9ba7736867cb2ffc43'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','d75f64438d994fc4830b1b3d138cde32'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','d78a0f0a6c8c48699e5d081f64014b99'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','dae12251f0234673bd7b21fdd47a02b9'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','de7c50d276454f80881c41a096ecf55c'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e03f8b6a5e454addb04fc08033b6f60b'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e2565667b9a745eb870debfd0830c46f'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e2efcf80fc3747329fe02d489dbfda95'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e3b80fae59ab4b4099d8349ecaf8c4dc'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e46555e269b84e2697857bdbb73f6676'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e4e64e24aa134deaa9d69c3b9495c997'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','e824b7c20bb34c9ca9ad023e8873e67b'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','ec7cf7a144a440cab217aabd4ffb7788'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','ecd805be31dd4fa5b8c1b76a9a5ac85f'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','ed9f6c6dbc334d0fb9607a52a818e102'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','eda782d5db444d09ada20f0a95496b3b'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f0214f8481134eb7a5528c638c3a2b76'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f07b7ea555f84116b5390d2a73740817'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f18fac5c4e6145528f3c1d87dbcb37d5'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f34887a78fa245c1977603ca7dc98e11'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f5b2028cfad9470085c7c846de33193a'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f87f68e686974c12b4923a81df0dfa7c'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f93f9a3a2226461dace3b8992cf055ba'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','f9fe62186f0a4d7eada6c6827de79b26'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','fea0f9ad7a8849679afa92ebf2b5c331'),
 ('1c54e003c1fc4dcd9b087ef8d48abac3','ff5af1be6f7544e2893b1c79dd6e0745'),
 ('2','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('2','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('2','0fde32c6c8204f92a6846714821491f7'),
 ('2','1'),
 ('2','10'),
 ('2','11'),
 ('2','12'),
 ('2','13'),
 ('2','14'),
 ('2','15'),
 ('2','16'),
 ('2','17'),
 ('2','18'),
 ('2','19'),
 ('2','1dc794e30998444489db19eec02915c3'),
 ('2','20'),
 ('2','21'),
 ('2','22'),
 ('2','27'),
 ('2','29'),
 ('2','3'),
 ('2','30'),
 ('2','31'),
 ('2','32'),
 ('2','33'),
 ('2','34'),
 ('2','35'),
 ('2','36'),
 ('2','37'),
 ('2','38'),
 ('2','39'),
 ('2','3c92c17886944d0687e73e286cada573'),
 ('2','4'),
 ('2','40'),
 ('2','41'),
 ('2','42'),
 ('2','43'),
 ('2','44'),
 ('2','45'),
 ('2','46'),
 ('2','47'),
 ('2','48'),
 ('2','4855cf3b25c244fb8500a380db189d97'),
 ('2','49'),
 ('2','5'),
 ('2','50'),
 ('2','51'),
 ('2','52'),
 ('2','53'),
 ('2','54'),
 ('2','55'),
 ('2','56'),
 ('2','57'),
 ('2','58'),
 ('2','59'),
 ('2','6'),
 ('2','60'),
 ('2','61'),
 ('2','62'),
 ('2','63'),
 ('2','64'),
 ('2','65'),
 ('2','66'),
 ('2','67'),
 ('2','68'),
 ('2','69'),
 ('2','6d7e99b2edf44c96b8bbb9c1ef6dfe66'),
 ('2','7'),
 ('2','70'),
 ('2','72'),
 ('2','73'),
 ('2','74'),
 ('2','79'),
 ('2','8'),
 ('2','80'),
 ('2','81'),
 ('2','82'),
 ('2','84'),
 ('2','85'),
 ('2','88'),
 ('2','89'),
 ('2','9'),
 ('2','90'),
 ('2','afab2db430e2457f9cf3a11feaa8b869'),
 ('2','b1f6d1b86ba24365bae7fd86c5082317'),
 ('2','ba8092291b40482db8fe7fc006ea3d76'),
 ('2','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('2','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('2','dcea8b88d08c4723878d372d2139448d'),
 ('2','df7ce823c5b24ff9bada43d992f373e2'),
 ('3','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('3','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('3','1'),
 ('3','10'),
 ('3','11'),
 ('3','12'),
 ('3','13'),
 ('3','14'),
 ('3','15'),
 ('3','16'),
 ('3','17'),
 ('3','18'),
 ('3','19'),
 ('3','20'),
 ('3','21'),
 ('3','22'),
 ('3','27'),
 ('3','29'),
 ('3','3'),
 ('3','30'),
 ('3','31'),
 ('3','32'),
 ('3','33'),
 ('3','34'),
 ('3','35'),
 ('3','36'),
 ('3','37'),
 ('3','38'),
 ('3','39'),
 ('3','3c92c17886944d0687e73e286cada573'),
 ('3','4'),
 ('3','40'),
 ('3','41'),
 ('3','42'),
 ('3','43'),
 ('3','44'),
 ('3','45'),
 ('3','46'),
 ('3','47'),
 ('3','48'),
 ('3','4855cf3b25c244fb8500a380db189d97'),
 ('3','49'),
 ('3','5'),
 ('3','50'),
 ('3','51'),
 ('3','52'),
 ('3','53'),
 ('3','54'),
 ('3','55'),
 ('3','56'),
 ('3','57'),
 ('3','58'),
 ('3','59'),
 ('3','6'),
 ('3','60'),
 ('3','61'),
 ('3','62'),
 ('3','63'),
 ('3','64'),
 ('3','65'),
 ('3','66'),
 ('3','67'),
 ('3','68'),
 ('3','69'),
 ('3','6d7e99b2edf44c96b8bbb9c1ef6dfe66'),
 ('3','7'),
 ('3','70'),
 ('3','72'),
 ('3','73'),
 ('3','74'),
 ('3','79'),
 ('3','8'),
 ('3','80'),
 ('3','81'),
 ('3','82'),
 ('3','84'),
 ('3','85'),
 ('3','88'),
 ('3','89'),
 ('3','9'),
 ('3','90'),
 ('3','afab2db430e2457f9cf3a11feaa8b869'),
 ('3','b1f6d1b86ba24365bae7fd86c5082317'),
 ('3','ba8092291b40482db8fe7fc006ea3d76'),
 ('3','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('3','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('3','dcea8b88d08c4723878d372d2139448d'),
 ('3','df7ce823c5b24ff9bada43d992f373e2'),
 ('5','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('5','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('5','1'),
 ('5','10'),
 ('5','11'),
 ('5','12'),
 ('5','14'),
 ('5','15'),
 ('5','16'),
 ('5','17'),
 ('5','18'),
 ('5','19'),
 ('5','20'),
 ('5','21'),
 ('5','22'),
 ('5','27'),
 ('5','29'),
 ('5','2a0f940fbe304a05a6b4040ddf6df279'),
 ('5','3'),
 ('5','30'),
 ('5','3c92c17886944d0687e73e286cada573'),
 ('5','4'),
 ('5','4855cf3b25c244fb8500a380db189d97'),
 ('5','4d463414bc974236941a6a14dc53c73a'),
 ('5','5'),
 ('5','56'),
 ('5','57'),
 ('5','58'),
 ('5','59'),
 ('5','6'),
 ('5','62'),
 ('5','63'),
 ('5','64'),
 ('5','65'),
 ('5','66'),
 ('5','67'),
 ('5','68'),
 ('5','68f9151151174868ab436e11e03bf548'),
 ('5','69'),
 ('5','7'),
 ('5','70'),
 ('5','70de7eac2f3e4632b1b7aa3cd536b35a'),
 ('5','72'),
 ('5','73'),
 ('5','74'),
 ('5','75'),
 ('5','79'),
 ('5','79f0ffa47dbe43ffa8824d97612d344f'),
 ('5','79fca849d3da4a82a4ade3f6b9f45126'),
 ('5','7ec930fe50fb41d0a9c7aeaa01804d16'),
 ('5','8'),
 ('5','80'),
 ('5','81'),
 ('5','82'),
 ('5','83'),
 ('5','84'),
 ('5','86'),
 ('5','87'),
 ('5','88'),
 ('5','89'),
 ('5','8930e4aad1ba4a1c958d303968d8c442'),
 ('5','9'),
 ('5','90'),
 ('5','95a6a82dc5fc4d07b46e5df57a0606a3'),
 ('5','a4c3dcee6cbc4fc6a0bf617d8619edf3'),
 ('5','a4cfc713c3c04c32a274fb59c71e34ed'),
 ('5','af0a174b4f424bc09a8cc0db83a64105'),
 ('5','afab2db430e2457f9cf3a11feaa8b869'),
 ('5','b1f6d1b86ba24365bae7fd86c5082317'),
 ('5','b9a776f5d7194406bb466388e3af9d08'),
 ('5','ba8092291b40482db8fe7fc006ea3d76'),
 ('5','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('5','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('5','df7ce823c5b24ff9bada43d992f373e2'),
 ('5','e2565667b9a745eb870debfd0830c46f'),
 ('5','e4e64e24aa134deaa9d69c3b9495c997'),
 ('5','ec7cf7a144a440cab217aabd4ffb7788'),
 ('5','f34887a78fa245c1977603ca7dc98e11'),
 ('5','f9fe62186f0a4d7eada6c6827de79b26'),
 ('78cf5521ff9e43ed80266adeff67d5ed','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('78cf5521ff9e43ed80266adeff67d5ed','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('78cf5521ff9e43ed80266adeff67d5ed','1'),
 ('78cf5521ff9e43ed80266adeff67d5ed','10'),
 ('78cf5521ff9e43ed80266adeff67d5ed','11'),
 ('78cf5521ff9e43ed80266adeff67d5ed','12'),
 ('78cf5521ff9e43ed80266adeff67d5ed','14'),
 ('78cf5521ff9e43ed80266adeff67d5ed','15'),
 ('78cf5521ff9e43ed80266adeff67d5ed','16'),
 ('78cf5521ff9e43ed80266adeff67d5ed','17'),
 ('78cf5521ff9e43ed80266adeff67d5ed','18'),
 ('78cf5521ff9e43ed80266adeff67d5ed','19'),
 ('78cf5521ff9e43ed80266adeff67d5ed','20'),
 ('78cf5521ff9e43ed80266adeff67d5ed','21'),
 ('78cf5521ff9e43ed80266adeff67d5ed','22'),
 ('78cf5521ff9e43ed80266adeff67d5ed','27'),
 ('78cf5521ff9e43ed80266adeff67d5ed','29'),
 ('78cf5521ff9e43ed80266adeff67d5ed','2a0f940fbe304a05a6b4040ddf6df279'),
 ('78cf5521ff9e43ed80266adeff67d5ed','3'),
 ('78cf5521ff9e43ed80266adeff67d5ed','30'),
 ('78cf5521ff9e43ed80266adeff67d5ed','3945952858c54ff6b928265e76416aa2'),
 ('78cf5521ff9e43ed80266adeff67d5ed','3c92c17886944d0687e73e286cada573'),
 ('78cf5521ff9e43ed80266adeff67d5ed','4'),
 ('78cf5521ff9e43ed80266adeff67d5ed','4855cf3b25c244fb8500a380db189d97'),
 ('78cf5521ff9e43ed80266adeff67d5ed','485c63cf6af1448880bb35b7b3f2bb1b'),
 ('78cf5521ff9e43ed80266adeff67d5ed','4d463414bc974236941a6a14dc53c73a'),
 ('78cf5521ff9e43ed80266adeff67d5ed','5'),
 ('78cf5521ff9e43ed80266adeff67d5ed','54afcfd125024b6eaeab9c5c3cea0009'),
 ('78cf5521ff9e43ed80266adeff67d5ed','56'),
 ('78cf5521ff9e43ed80266adeff67d5ed','57'),
 ('78cf5521ff9e43ed80266adeff67d5ed','58'),
 ('78cf5521ff9e43ed80266adeff67d5ed','59'),
 ('78cf5521ff9e43ed80266adeff67d5ed','5dfd09e5790b41388b8691ea9993eba5'),
 ('78cf5521ff9e43ed80266adeff67d5ed','6'),
 ('78cf5521ff9e43ed80266adeff67d5ed','62'),
 ('78cf5521ff9e43ed80266adeff67d5ed','63'),
 ('78cf5521ff9e43ed80266adeff67d5ed','64'),
 ('78cf5521ff9e43ed80266adeff67d5ed','65'),
 ('78cf5521ff9e43ed80266adeff67d5ed','66'),
 ('78cf5521ff9e43ed80266adeff67d5ed','67'),
 ('78cf5521ff9e43ed80266adeff67d5ed','68'),
 ('78cf5521ff9e43ed80266adeff67d5ed','68f9151151174868ab436e11e03bf548'),
 ('78cf5521ff9e43ed80266adeff67d5ed','69'),
 ('78cf5521ff9e43ed80266adeff67d5ed','7'),
 ('78cf5521ff9e43ed80266adeff67d5ed','70'),
 ('78cf5521ff9e43ed80266adeff67d5ed','70de7eac2f3e4632b1b7aa3cd536b35a'),
 ('78cf5521ff9e43ed80266adeff67d5ed','72'),
 ('78cf5521ff9e43ed80266adeff67d5ed','73'),
 ('78cf5521ff9e43ed80266adeff67d5ed','74'),
 ('78cf5521ff9e43ed80266adeff67d5ed','75'),
 ('78cf5521ff9e43ed80266adeff67d5ed','79'),
 ('78cf5521ff9e43ed80266adeff67d5ed','79f0ffa47dbe43ffa8824d97612d344f'),
 ('78cf5521ff9e43ed80266adeff67d5ed','79fca849d3da4a82a4ade3f6b9f45126'),
 ('78cf5521ff9e43ed80266adeff67d5ed','7bd4484bd13c441395e44ab86772da00'),
 ('78cf5521ff9e43ed80266adeff67d5ed','7ec930fe50fb41d0a9c7aeaa01804d16'),
 ('78cf5521ff9e43ed80266adeff67d5ed','8'),
 ('78cf5521ff9e43ed80266adeff67d5ed','80'),
 ('78cf5521ff9e43ed80266adeff67d5ed','81'),
 ('78cf5521ff9e43ed80266adeff67d5ed','82'),
 ('78cf5521ff9e43ed80266adeff67d5ed','83'),
 ('78cf5521ff9e43ed80266adeff67d5ed','84'),
 ('78cf5521ff9e43ed80266adeff67d5ed','85'),
 ('78cf5521ff9e43ed80266adeff67d5ed','86'),
 ('78cf5521ff9e43ed80266adeff67d5ed','87'),
 ('78cf5521ff9e43ed80266adeff67d5ed','88'),
 ('78cf5521ff9e43ed80266adeff67d5ed','89'),
 ('78cf5521ff9e43ed80266adeff67d5ed','8930e4aad1ba4a1c958d303968d8c442'),
 ('78cf5521ff9e43ed80266adeff67d5ed','9'),
 ('78cf5521ff9e43ed80266adeff67d5ed','90'),
 ('78cf5521ff9e43ed80266adeff67d5ed','95a6a82dc5fc4d07b46e5df57a0606a3'),
 ('78cf5521ff9e43ed80266adeff67d5ed','a4c3dcee6cbc4fc6a0bf617d8619edf3'),
 ('78cf5521ff9e43ed80266adeff67d5ed','a4cfc713c3c04c32a274fb59c71e34ed'),
 ('78cf5521ff9e43ed80266adeff67d5ed','af0a174b4f424bc09a8cc0db83a64105'),
 ('78cf5521ff9e43ed80266adeff67d5ed','afab2db430e2457f9cf3a11feaa8b869'),
 ('78cf5521ff9e43ed80266adeff67d5ed','b1f6d1b86ba24365bae7fd86c5082317'),
 ('78cf5521ff9e43ed80266adeff67d5ed','b9a776f5d7194406bb466388e3af9d08'),
 ('78cf5521ff9e43ed80266adeff67d5ed','ba8092291b40482db8fe7fc006ea3d76'),
 ('78cf5521ff9e43ed80266adeff67d5ed','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('78cf5521ff9e43ed80266adeff67d5ed','c99753f4ad0a4a458337b255c3b49095'),
 ('78cf5521ff9e43ed80266adeff67d5ed','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('78cf5521ff9e43ed80266adeff67d5ed','df7ce823c5b24ff9bada43d992f373e2'),
 ('78cf5521ff9e43ed80266adeff67d5ed','e2565667b9a745eb870debfd0830c46f'),
 ('78cf5521ff9e43ed80266adeff67d5ed','e3e131bb489f43dd865280e4f5932b6d'),
 ('78cf5521ff9e43ed80266adeff67d5ed','e4e64e24aa134deaa9d69c3b9495c997'),
 ('78cf5521ff9e43ed80266adeff67d5ed','ec7cf7a144a440cab217aabd4ffb7788'),
 ('78cf5521ff9e43ed80266adeff67d5ed','f34887a78fa245c1977603ca7dc98e11'),
 ('78cf5521ff9e43ed80266adeff67d5ed','f9fe62186f0a4d7eada6c6827de79b26'),
 ('91766cc228e34269a65f0564ba956bd7','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('91766cc228e34269a65f0564ba956bd7','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('91766cc228e34269a65f0564ba956bd7','1'),
 ('91766cc228e34269a65f0564ba956bd7','10'),
 ('91766cc228e34269a65f0564ba956bd7','11'),
 ('91766cc228e34269a65f0564ba956bd7','12'),
 ('91766cc228e34269a65f0564ba956bd7','14'),
 ('91766cc228e34269a65f0564ba956bd7','15'),
 ('91766cc228e34269a65f0564ba956bd7','16'),
 ('91766cc228e34269a65f0564ba956bd7','17'),
 ('91766cc228e34269a65f0564ba956bd7','18'),
 ('91766cc228e34269a65f0564ba956bd7','19'),
 ('91766cc228e34269a65f0564ba956bd7','20'),
 ('91766cc228e34269a65f0564ba956bd7','21'),
 ('91766cc228e34269a65f0564ba956bd7','22'),
 ('91766cc228e34269a65f0564ba956bd7','27'),
 ('91766cc228e34269a65f0564ba956bd7','29'),
 ('91766cc228e34269a65f0564ba956bd7','2a0f940fbe304a05a6b4040ddf6df279'),
 ('91766cc228e34269a65f0564ba956bd7','3'),
 ('91766cc228e34269a65f0564ba956bd7','30'),
 ('91766cc228e34269a65f0564ba956bd7','3945952858c54ff6b928265e76416aa2'),
 ('91766cc228e34269a65f0564ba956bd7','3c1c639c76f14f6f9903b0143371ea09'),
 ('91766cc228e34269a65f0564ba956bd7','3c92c17886944d0687e73e286cada573'),
 ('91766cc228e34269a65f0564ba956bd7','4'),
 ('91766cc228e34269a65f0564ba956bd7','4855cf3b25c244fb8500a380db189d97'),
 ('91766cc228e34269a65f0564ba956bd7','485c63cf6af1448880bb35b7b3f2bb1b'),
 ('91766cc228e34269a65f0564ba956bd7','4d463414bc974236941a6a14dc53c73a'),
 ('91766cc228e34269a65f0564ba956bd7','5'),
 ('91766cc228e34269a65f0564ba956bd7','54afcfd125024b6eaeab9c5c3cea0009'),
 ('91766cc228e34269a65f0564ba956bd7','56'),
 ('91766cc228e34269a65f0564ba956bd7','57'),
 ('91766cc228e34269a65f0564ba956bd7','58'),
 ('91766cc228e34269a65f0564ba956bd7','59'),
 ('91766cc228e34269a65f0564ba956bd7','5dfd09e5790b41388b8691ea9993eba5'),
 ('91766cc228e34269a65f0564ba956bd7','6'),
 ('91766cc228e34269a65f0564ba956bd7','62'),
 ('91766cc228e34269a65f0564ba956bd7','63'),
 ('91766cc228e34269a65f0564ba956bd7','64'),
 ('91766cc228e34269a65f0564ba956bd7','65'),
 ('91766cc228e34269a65f0564ba956bd7','6509eed6eb634030a46723a18814035c'),
 ('91766cc228e34269a65f0564ba956bd7','66'),
 ('91766cc228e34269a65f0564ba956bd7','67'),
 ('91766cc228e34269a65f0564ba956bd7','68'),
 ('91766cc228e34269a65f0564ba956bd7','68f9151151174868ab436e11e03bf548'),
 ('91766cc228e34269a65f0564ba956bd7','69'),
 ('91766cc228e34269a65f0564ba956bd7','7'),
 ('91766cc228e34269a65f0564ba956bd7','70'),
 ('91766cc228e34269a65f0564ba956bd7','70de7eac2f3e4632b1b7aa3cd536b35a'),
 ('91766cc228e34269a65f0564ba956bd7','72'),
 ('91766cc228e34269a65f0564ba956bd7','73'),
 ('91766cc228e34269a65f0564ba956bd7','74'),
 ('91766cc228e34269a65f0564ba956bd7','75'),
 ('91766cc228e34269a65f0564ba956bd7','79'),
 ('91766cc228e34269a65f0564ba956bd7','79f0ffa47dbe43ffa8824d97612d344f'),
 ('91766cc228e34269a65f0564ba956bd7','79fca849d3da4a82a4ade3f6b9f45126'),
 ('91766cc228e34269a65f0564ba956bd7','7bd4484bd13c441395e44ab86772da00'),
 ('91766cc228e34269a65f0564ba956bd7','7ec930fe50fb41d0a9c7aeaa01804d16'),
 ('91766cc228e34269a65f0564ba956bd7','8'),
 ('91766cc228e34269a65f0564ba956bd7','80'),
 ('91766cc228e34269a65f0564ba956bd7','81'),
 ('91766cc228e34269a65f0564ba956bd7','82'),
 ('91766cc228e34269a65f0564ba956bd7','83'),
 ('91766cc228e34269a65f0564ba956bd7','84'),
 ('91766cc228e34269a65f0564ba956bd7','86'),
 ('91766cc228e34269a65f0564ba956bd7','87'),
 ('91766cc228e34269a65f0564ba956bd7','88'),
 ('91766cc228e34269a65f0564ba956bd7','89'),
 ('91766cc228e34269a65f0564ba956bd7','8930e4aad1ba4a1c958d303968d8c442'),
 ('91766cc228e34269a65f0564ba956bd7','9'),
 ('91766cc228e34269a65f0564ba956bd7','90'),
 ('91766cc228e34269a65f0564ba956bd7','95a6a82dc5fc4d07b46e5df57a0606a3'),
 ('91766cc228e34269a65f0564ba956bd7','a4c3dcee6cbc4fc6a0bf617d8619edf3'),
 ('91766cc228e34269a65f0564ba956bd7','a4cfc713c3c04c32a274fb59c71e34ed'),
 ('91766cc228e34269a65f0564ba956bd7','af0a174b4f424bc09a8cc0db83a64105'),
 ('91766cc228e34269a65f0564ba956bd7','afab2db430e2457f9cf3a11feaa8b869'),
 ('91766cc228e34269a65f0564ba956bd7','b1f6d1b86ba24365bae7fd86c5082317'),
 ('91766cc228e34269a65f0564ba956bd7','b9a776f5d7194406bb466388e3af9d08'),
 ('91766cc228e34269a65f0564ba956bd7','ba8092291b40482db8fe7fc006ea3d76'),
 ('91766cc228e34269a65f0564ba956bd7','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('91766cc228e34269a65f0564ba956bd7','c99753f4ad0a4a458337b255c3b49095'),
 ('91766cc228e34269a65f0564ba956bd7','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('91766cc228e34269a65f0564ba956bd7','df7ce823c5b24ff9bada43d992f373e2'),
 ('91766cc228e34269a65f0564ba956bd7','e2565667b9a745eb870debfd0830c46f'),
 ('91766cc228e34269a65f0564ba956bd7','e3e131bb489f43dd865280e4f5932b6d'),
 ('91766cc228e34269a65f0564ba956bd7','e4e64e24aa134deaa9d69c3b9495c997'),
 ('91766cc228e34269a65f0564ba956bd7','ec7cf7a144a440cab217aabd4ffb7788'),
 ('91766cc228e34269a65f0564ba956bd7','f34887a78fa245c1977603ca7dc98e11'),
 ('91766cc228e34269a65f0564ba956bd7','f93f9a3a2226461dace3b8992cf055ba'),
 ('91766cc228e34269a65f0564ba956bd7','f9fe62186f0a4d7eada6c6827de79b26'),
 ('a74b7da6e0e0458298316798e89e70ea','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('a74b7da6e0e0458298316798e89e70ea','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('a74b7da6e0e0458298316798e89e70ea','0fde32c6c8204f92a6846714821491f7'),
 ('a74b7da6e0e0458298316798e89e70ea','1'),
 ('a74b7da6e0e0458298316798e89e70ea','10'),
 ('a74b7da6e0e0458298316798e89e70ea','11'),
 ('a74b7da6e0e0458298316798e89e70ea','12'),
 ('a74b7da6e0e0458298316798e89e70ea','13'),
 ('a74b7da6e0e0458298316798e89e70ea','14'),
 ('a74b7da6e0e0458298316798e89e70ea','15'),
 ('a74b7da6e0e0458298316798e89e70ea','16'),
 ('a74b7da6e0e0458298316798e89e70ea','17'),
 ('a74b7da6e0e0458298316798e89e70ea','18'),
 ('a74b7da6e0e0458298316798e89e70ea','19'),
 ('a74b7da6e0e0458298316798e89e70ea','1dc794e30998444489db19eec02915c3'),
 ('a74b7da6e0e0458298316798e89e70ea','20'),
 ('a74b7da6e0e0458298316798e89e70ea','21'),
 ('a74b7da6e0e0458298316798e89e70ea','22'),
 ('a74b7da6e0e0458298316798e89e70ea','27'),
 ('a74b7da6e0e0458298316798e89e70ea','29'),
 ('a74b7da6e0e0458298316798e89e70ea','3'),
 ('a74b7da6e0e0458298316798e89e70ea','30'),
 ('a74b7da6e0e0458298316798e89e70ea','31'),
 ('a74b7da6e0e0458298316798e89e70ea','32'),
 ('a74b7da6e0e0458298316798e89e70ea','33'),
 ('a74b7da6e0e0458298316798e89e70ea','34'),
 ('a74b7da6e0e0458298316798e89e70ea','35'),
 ('a74b7da6e0e0458298316798e89e70ea','36'),
 ('a74b7da6e0e0458298316798e89e70ea','37'),
 ('a74b7da6e0e0458298316798e89e70ea','38'),
 ('a74b7da6e0e0458298316798e89e70ea','39'),
 ('a74b7da6e0e0458298316798e89e70ea','3c92c17886944d0687e73e286cada573'),
 ('a74b7da6e0e0458298316798e89e70ea','4'),
 ('a74b7da6e0e0458298316798e89e70ea','40'),
 ('a74b7da6e0e0458298316798e89e70ea','41'),
 ('a74b7da6e0e0458298316798e89e70ea','42'),
 ('a74b7da6e0e0458298316798e89e70ea','43'),
 ('a74b7da6e0e0458298316798e89e70ea','44'),
 ('a74b7da6e0e0458298316798e89e70ea','45'),
 ('a74b7da6e0e0458298316798e89e70ea','46'),
 ('a74b7da6e0e0458298316798e89e70ea','47'),
 ('a74b7da6e0e0458298316798e89e70ea','48'),
 ('a74b7da6e0e0458298316798e89e70ea','4855cf3b25c244fb8500a380db189d97'),
 ('a74b7da6e0e0458298316798e89e70ea','49'),
 ('a74b7da6e0e0458298316798e89e70ea','4d463414bc974236941a6a14dc53c73a'),
 ('a74b7da6e0e0458298316798e89e70ea','5'),
 ('a74b7da6e0e0458298316798e89e70ea','50'),
 ('a74b7da6e0e0458298316798e89e70ea','51'),
 ('a74b7da6e0e0458298316798e89e70ea','52'),
 ('a74b7da6e0e0458298316798e89e70ea','53'),
 ('a74b7da6e0e0458298316798e89e70ea','54'),
 ('a74b7da6e0e0458298316798e89e70ea','55'),
 ('a74b7da6e0e0458298316798e89e70ea','56'),
 ('a74b7da6e0e0458298316798e89e70ea','57'),
 ('a74b7da6e0e0458298316798e89e70ea','58'),
 ('a74b7da6e0e0458298316798e89e70ea','59'),
 ('a74b7da6e0e0458298316798e89e70ea','5e72ae5a7d56478c8db2a7975883f367'),
 ('a74b7da6e0e0458298316798e89e70ea','6'),
 ('a74b7da6e0e0458298316798e89e70ea','60'),
 ('a74b7da6e0e0458298316798e89e70ea','61'),
 ('a74b7da6e0e0458298316798e89e70ea','62'),
 ('a74b7da6e0e0458298316798e89e70ea','63'),
 ('a74b7da6e0e0458298316798e89e70ea','64'),
 ('a74b7da6e0e0458298316798e89e70ea','65'),
 ('a74b7da6e0e0458298316798e89e70ea','66'),
 ('a74b7da6e0e0458298316798e89e70ea','67'),
 ('a74b7da6e0e0458298316798e89e70ea','68'),
 ('a74b7da6e0e0458298316798e89e70ea','69'),
 ('a74b7da6e0e0458298316798e89e70ea','6d7e99b2edf44c96b8bbb9c1ef6dfe66'),
 ('a74b7da6e0e0458298316798e89e70ea','7'),
 ('a74b7da6e0e0458298316798e89e70ea','70'),
 ('a74b7da6e0e0458298316798e89e70ea','70de7eac2f3e4632b1b7aa3cd536b35a'),
 ('a74b7da6e0e0458298316798e89e70ea','72'),
 ('a74b7da6e0e0458298316798e89e70ea','73'),
 ('a74b7da6e0e0458298316798e89e70ea','74'),
 ('a74b7da6e0e0458298316798e89e70ea','79'),
 ('a74b7da6e0e0458298316798e89e70ea','7ec930fe50fb41d0a9c7aeaa01804d16'),
 ('a74b7da6e0e0458298316798e89e70ea','8'),
 ('a74b7da6e0e0458298316798e89e70ea','80'),
 ('a74b7da6e0e0458298316798e89e70ea','81'),
 ('a74b7da6e0e0458298316798e89e70ea','82'),
 ('a74b7da6e0e0458298316798e89e70ea','84'),
 ('a74b7da6e0e0458298316798e89e70ea','88'),
 ('a74b7da6e0e0458298316798e89e70ea','89'),
 ('a74b7da6e0e0458298316798e89e70ea','9'),
 ('a74b7da6e0e0458298316798e89e70ea','90'),
 ('a74b7da6e0e0458298316798e89e70ea','95a6a82dc5fc4d07b46e5df57a0606a3'),
 ('a74b7da6e0e0458298316798e89e70ea','a4cfc713c3c04c32a274fb59c71e34ed'),
 ('a74b7da6e0e0458298316798e89e70ea','af0a174b4f424bc09a8cc0db83a64105'),
 ('a74b7da6e0e0458298316798e89e70ea','afab2db430e2457f9cf3a11feaa8b869'),
 ('a74b7da6e0e0458298316798e89e70ea','b1f6d1b86ba24365bae7fd86c5082317'),
 ('a74b7da6e0e0458298316798e89e70ea','ba8092291b40482db8fe7fc006ea3d76'),
 ('a74b7da6e0e0458298316798e89e70ea','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('a74b7da6e0e0458298316798e89e70ea','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('a74b7da6e0e0458298316798e89e70ea','dcea8b88d08c4723878d372d2139448d'),
 ('a74b7da6e0e0458298316798e89e70ea','df7ce823c5b24ff9bada43d992f373e2'),
 ('a74b7da6e0e0458298316798e89e70ea','f9fe62186f0a4d7eada6c6827de79b26'),
 ('f6d2f215ed734cc09273928acab6e136','0b2ebd4d639e4c2b83c2dd0764522f24'),
 ('f6d2f215ed734cc09273928acab6e136','0ca004d6b1bf4bcab9670a5060d82a55'),
 ('f6d2f215ed734cc09273928acab6e136','0fde32c6c8204f92a6846714821491f7'),
 ('f6d2f215ed734cc09273928acab6e136','1'),
 ('f6d2f215ed734cc09273928acab6e136','10'),
 ('f6d2f215ed734cc09273928acab6e136','11'),
 ('f6d2f215ed734cc09273928acab6e136','12'),
 ('f6d2f215ed734cc09273928acab6e136','13'),
 ('f6d2f215ed734cc09273928acab6e136','14'),
 ('f6d2f215ed734cc09273928acab6e136','15'),
 ('f6d2f215ed734cc09273928acab6e136','16'),
 ('f6d2f215ed734cc09273928acab6e136','17'),
 ('f6d2f215ed734cc09273928acab6e136','18'),
 ('f6d2f215ed734cc09273928acab6e136','19'),
 ('f6d2f215ed734cc09273928acab6e136','1dc794e30998444489db19eec02915c3'),
 ('f6d2f215ed734cc09273928acab6e136','20'),
 ('f6d2f215ed734cc09273928acab6e136','21'),
 ('f6d2f215ed734cc09273928acab6e136','22'),
 ('f6d2f215ed734cc09273928acab6e136','27'),
 ('f6d2f215ed734cc09273928acab6e136','29'),
 ('f6d2f215ed734cc09273928acab6e136','3'),
 ('f6d2f215ed734cc09273928acab6e136','30'),
 ('f6d2f215ed734cc09273928acab6e136','31'),
 ('f6d2f215ed734cc09273928acab6e136','32'),
 ('f6d2f215ed734cc09273928acab6e136','33'),
 ('f6d2f215ed734cc09273928acab6e136','34'),
 ('f6d2f215ed734cc09273928acab6e136','35'),
 ('f6d2f215ed734cc09273928acab6e136','36'),
 ('f6d2f215ed734cc09273928acab6e136','37'),
 ('f6d2f215ed734cc09273928acab6e136','38'),
 ('f6d2f215ed734cc09273928acab6e136','39'),
 ('f6d2f215ed734cc09273928acab6e136','3c92c17886944d0687e73e286cada573'),
 ('f6d2f215ed734cc09273928acab6e136','4'),
 ('f6d2f215ed734cc09273928acab6e136','40'),
 ('f6d2f215ed734cc09273928acab6e136','41'),
 ('f6d2f215ed734cc09273928acab6e136','42'),
 ('f6d2f215ed734cc09273928acab6e136','43'),
 ('f6d2f215ed734cc09273928acab6e136','44'),
 ('f6d2f215ed734cc09273928acab6e136','45'),
 ('f6d2f215ed734cc09273928acab6e136','46'),
 ('f6d2f215ed734cc09273928acab6e136','47'),
 ('f6d2f215ed734cc09273928acab6e136','48'),
 ('f6d2f215ed734cc09273928acab6e136','4855cf3b25c244fb8500a380db189d97'),
 ('f6d2f215ed734cc09273928acab6e136','49'),
 ('f6d2f215ed734cc09273928acab6e136','4d463414bc974236941a6a14dc53c73a'),
 ('f6d2f215ed734cc09273928acab6e136','5'),
 ('f6d2f215ed734cc09273928acab6e136','50'),
 ('f6d2f215ed734cc09273928acab6e136','51'),
 ('f6d2f215ed734cc09273928acab6e136','52'),
 ('f6d2f215ed734cc09273928acab6e136','53'),
 ('f6d2f215ed734cc09273928acab6e136','54'),
 ('f6d2f215ed734cc09273928acab6e136','55'),
 ('f6d2f215ed734cc09273928acab6e136','56'),
 ('f6d2f215ed734cc09273928acab6e136','57'),
 ('f6d2f215ed734cc09273928acab6e136','58'),
 ('f6d2f215ed734cc09273928acab6e136','59'),
 ('f6d2f215ed734cc09273928acab6e136','6'),
 ('f6d2f215ed734cc09273928acab6e136','60'),
 ('f6d2f215ed734cc09273928acab6e136','61'),
 ('f6d2f215ed734cc09273928acab6e136','62'),
 ('f6d2f215ed734cc09273928acab6e136','63'),
 ('f6d2f215ed734cc09273928acab6e136','64'),
 ('f6d2f215ed734cc09273928acab6e136','65'),
 ('f6d2f215ed734cc09273928acab6e136','66'),
 ('f6d2f215ed734cc09273928acab6e136','67'),
 ('f6d2f215ed734cc09273928acab6e136','68'),
 ('f6d2f215ed734cc09273928acab6e136','69'),
 ('f6d2f215ed734cc09273928acab6e136','6d7e99b2edf44c96b8bbb9c1ef6dfe66'),
 ('f6d2f215ed734cc09273928acab6e136','7'),
 ('f6d2f215ed734cc09273928acab6e136','70'),
 ('f6d2f215ed734cc09273928acab6e136','72'),
 ('f6d2f215ed734cc09273928acab6e136','73'),
 ('f6d2f215ed734cc09273928acab6e136','74'),
 ('f6d2f215ed734cc09273928acab6e136','79'),
 ('f6d2f215ed734cc09273928acab6e136','8'),
 ('f6d2f215ed734cc09273928acab6e136','80'),
 ('f6d2f215ed734cc09273928acab6e136','81'),
 ('f6d2f215ed734cc09273928acab6e136','82'),
 ('f6d2f215ed734cc09273928acab6e136','84'),
 ('f6d2f215ed734cc09273928acab6e136','88'),
 ('f6d2f215ed734cc09273928acab6e136','89'),
 ('f6d2f215ed734cc09273928acab6e136','9'),
 ('f6d2f215ed734cc09273928acab6e136','90'),
 ('f6d2f215ed734cc09273928acab6e136','af0a174b4f424bc09a8cc0db83a64105'),
 ('f6d2f215ed734cc09273928acab6e136','afab2db430e2457f9cf3a11feaa8b869'),
 ('f6d2f215ed734cc09273928acab6e136','b1f6d1b86ba24365bae7fd86c5082317'),
 ('f6d2f215ed734cc09273928acab6e136','ba8092291b40482db8fe7fc006ea3d76'),
 ('f6d2f215ed734cc09273928acab6e136','c2e4d9082a0b4386884a0b203afe2c5c'),
 ('f6d2f215ed734cc09273928acab6e136','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),
 ('f6d2f215ed734cc09273928acab6e136','dcea8b88d08c4723878d372d2139448d'),
 ('f6d2f215ed734cc09273928acab6e136','df7ce823c5b24ff9bada43d992f373e2');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;


--
-- Definition of table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY  (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

--
-- Dumping data for table `sys_role_office`
--

/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
INSERT INTO `sys_role_office` (`role_id`,`office_id`) VALUES 
 ('7','10'),
 ('7','11'),
 ('7','12'),
 ('7','13'),
 ('7','14'),
 ('7','15'),
 ('7','16'),
 ('7','17'),
 ('7','18'),
 ('7','19'),
 ('7','20'),
 ('7','21'),
 ('7','22'),
 ('7','23'),
 ('7','24'),
 ('7','25'),
 ('7','26'),
 ('7','7'),
 ('7','8'),
 ('7','9');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;


--
-- Definition of table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) default NULL COMMENT '归属公司',
  `office_id` varchar(64) default NULL COMMENT '归属部门',
  `login_name` varchar(100) default NULL COMMENT '登录名',
  `password` varchar(100) default NULL COMMENT '密码',
  `no` varchar(100) default NULL COMMENT '工号',
  `name` varchar(100) default NULL COMMENT '姓名',
  `email` varchar(200) default NULL COMMENT '邮箱',
  `phone` varchar(200) default NULL COMMENT '电话',
  `mobile` varchar(200) default NULL COMMENT '手机',
  `user_type` char(1) default NULL COMMENT '用户类型',
  `photo` varchar(1000) default NULL COMMENT '用户头像',
  `login_ip` varchar(100) default NULL COMMENT '最后登陆IP',
  `login_date` datetime default NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) default NULL COMMENT '是否可登录',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) default '0' COMMENT '删除标记',
  `qrcode` varchar(1000) default NULL COMMENT '二维码',
  PRIMARY KEY  (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Dumping data for table `sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`qrcode`) VALUES 
 ('0fb8ebbff20a46029596806aa077d3c2','1','5','fbb','b079bd73139e94813a98e05bf48c42b86d0dcddd20ff9f10175255e4','003','范冰冰','','','','1','/jeeplus/userfiles/1/images/photo/2016/04/u%3D1783243281%2C2583995645%26fm%3D58.jpg','0:0:0:0:0:0:0:1','2016-03-19 21:53:52','1','1','2016-02-24 23:25:41','1','2016-04-21 22:42:31','','0','/jeeplus/userfiles/0fb8ebbff20a46029596806aa077d3c2/qrcode/0fb8ebbff20a46029596806aa077d3c2.png'),
 ('1','1','5','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','13815874603','admin','','','rr','','/jeeplus/userfiles/1/images/刘高峰320321198701102835.jpg','0:0:0:0:0:0:0:1','2016-06-22 01:27:04','1','1','2013-05-27 08:00:00','1','2016-05-29 01:46:04','test','0','/jeeplus/userfiles/1/qrcode/test.png'),
 ('13','22','23','gx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','济南高新领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1',NULL),
 ('1e8149b33e774daa9a250f5a1a0ad23f','1','4','dzq','8bb66a13cffc3a080c7946ef9949bfd3f6efd7729e2fb29cbcb5b877','006','邓紫棋','','','','','/jeeplus/userfiles/1/images/photo/2016/04/u%3D679139770%2C2133253210%26fm%3D23%26gp%3D0.jpg',NULL,NULL,'1','1','2016-02-24 23:27:47','1','2016-04-21 22:41:52','','0','/jeeplus/userfiles/1e8149b33e774daa9a250f5a1a0ad23f/qrcode/1e8149b33e774daa9a250f5a1a0ad23f.png'),
 ('7374fe91d19a4b739ae649334c0cc273','1','5','lxr','c9f28950ad9fd72b41589b1a70cd4eb7c9774aed4e6fae6c0086264a','004','林心如','','','','','/jeeplus/userfiles/1/images/photo/2016/04/xin_03305061618075782724119.jpg',NULL,NULL,'1','1','2016-02-24 23:26:20','1','2016-04-21 22:42:15','','0','/jeeplus/userfiles/7374fe91d19a4b739ae649334c0cc273/qrcode/7374fe91d19a4b739ae649334c0cc273.png'),
 ('f7cc1c7e6f494818adffe1de5f2282fb','1','5','zw','2bc28ed674f9fd7480fcdb97337ea831b97aa2b9e134b1b4ffc2e266','002','赵薇','','','','','/jeeplus/userfiles/1/images/photo/2016/04/4e25ab18972bd40732bd72aa7b899e510fb3096b.jpg','0:0:0:0:0:0:0:1','2016-02-24 23:33:51','1','1','2016-02-24 23:24:58','1','2016-04-21 22:42:45','','0','/jeeplus/userfiles/f7cc1c7e6f494818adffe1de5f2282fb/qrcode/f7cc1c7e6f494818adffe1de5f2282fb.png');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


--
-- Definition of table `sys_user_friend`
--

DROP TABLE IF EXISTS `sys_user_friend`;
CREATE TABLE `sys_user_friend` (
  `id` varchar(64) NOT NULL,
  `userId` varchar(64) NOT NULL,
  `friendId` varchar(64) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_user_friend`
--

/*!40000 ALTER TABLE `sys_user_friend` DISABLE KEYS */;
INSERT INTO `sys_user_friend` (`id`,`userId`,`friendId`) VALUES 
 ('0725eea71b504a188e24a66e58f65cf9','8b454376c0434e2792a1dc57edf80dbd','cb359e3089224f97adae46cf03c0ed94'),
 ('0ed41b44291c487c925e58fa5a504664','8b454376c0434e2792a1dc57edf80dbd','42f5435f943a4e8cbcd86ec07b1d922a'),
 ('1005559436d043c8a2209a746ac53bca','8b454376c0434e2792a1dc57edf80dbd','5ad0d1f9efdc44b481b02c26b67e832e'),
 ('1cdeea5042bb4a0cbba8902d9c0732c4','8b454376c0434e2792a1dc57edf80dbd','d355e9e6b4ad48a59fa0a983e8b7b583'),
 ('1cf35e13c27a4750803f73098b886553','8b454376c0434e2792a1dc57edf80dbd','95b3b09fa0b34ac6b95907237c744c55'),
 ('2186c3bc23db4a009bdbd65b50bb8ef3','8b454376c0434e2792a1dc57edf80dbd','3f7ef2d4761f445e946413ab9bea23db'),
 ('2a1eb5760e4548ecaee92f378a43fdce','8b454376c0434e2792a1dc57edf80dbd','6'),
 ('2cbf8cc396044ca7a95282c6c9684516','8b454376c0434e2792a1dc57edf80dbd','4639f877ec7149258cadcf145b4182a7'),
 ('410e5a8c33f4499faaf6c55674fb295b','8b454376c0434e2792a1dc57edf80dbd','8'),
 ('598950c23ae147b7b360fb5b4311120a','8b454376c0434e2792a1dc57edf80dbd','19e655ebcd844747aa0e46efe9870169'),
 ('6493d5c972934bb38fef91cc54e969d1','8b454376c0434e2792a1dc57edf80dbd','f12330474f634e2897878e8f56a910ae'),
 ('6df3fc9c46724da4a56c72ffb85b67b3','8b454376c0434e2792a1dc57edf80dbd','dc9663e71aaa42f0a2634770896ec74c'),
 ('734946756a6340aaad71cfa621d1a493','8b454376c0434e2792a1dc57edf80dbd','7'),
 ('83f29f5ff3aa4fc2be00bfd45212fb2a','8b454376c0434e2792a1dc57edf80dbd','13'),
 ('8a1b8abb1f134bd687b3368166546d6b','8b454376c0434e2792a1dc57edf80dbd','3'),
 ('8c0edfb9670a426d9bfa9a951bda919f','8b454376c0434e2792a1dc57edf80dbd','6474fda3f35c4d1580b646a42f190cf7'),
 ('8c2c5518bc1d4033a6090305d6fc3b16','8b454376c0434e2792a1dc57edf80dbd','eca1a51b803449d59ce4e2a3b0f4f787'),
 ('b40660a8b3ac49d9a46b424ad64ba264','8b454376c0434e2792a1dc57edf80dbd','bb81a0c098a444e69028380e80852d91'),
 ('b73b147471c24ae8865b924d877b5512','8b454376c0434e2792a1dc57edf80dbd','5b61eb41f80f43c5b8e485866178f63d'),
 ('ba870cd0d5d443c9a9e239c06d13b0d5','8b454376c0434e2792a1dc57edf80dbd','1'),
 ('ba8f1dc4433d4c5b9259922f25b1234b','8b454376c0434e2792a1dc57edf80dbd','9'),
 ('c84a1d30344f4833811356d9b2c3c50e','8b454376c0434e2792a1dc57edf80dbd','da60c61cf2aa4cb2810c629c7045c538'),
 ('ce37fa05072e45fcb82590420965f918','8b454376c0434e2792a1dc57edf80dbd','d8de25a1f872404e82f669c04091685e'),
 ('d45d0c14f1c8473d8ff9687784851519','8b454376c0434e2792a1dc57edf80dbd','5091ca619fbf49209bce020859103ba5'),
 ('d96b32e6663a4d25b2de7496c4d7b6b8','8b454376c0434e2792a1dc57edf80dbd','4'),
 ('dbaf20aefb9b45a2bafd91c0eeb43d8f','8b454376c0434e2792a1dc57edf80dbd','8b454376c0434e2792a1dc57edf80dbd'),
 ('de1377ca4cf04963a35bbbc8662c5247','1','1'),
 ('e8d118adbca24591bcee16a11b87c125','8b454376c0434e2792a1dc57edf80dbd','d42378c9621b4551a0c4c63c82f0aa33'),
 ('ed45cb60c47040ae8ad4b703cd282f4c','1','dc9663e71aaa42f0a2634770896ec74c');
/*!40000 ALTER TABLE `sys_user_friend` ENABLE KEYS */;


--
-- Definition of table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

--
-- Dumping data for table `sys_user_role`
--

/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`user_id`,`role_id`) VALUES 
 ('0f7017853ec24648872e01fe9c930969','caacf61017114120bcf7bf1049b6d4c3'),
 ('0fb8ebbff20a46029596806aa077d3c2','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('1','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('1','caacf61017114120bcf7bf1049b6d4c3'),
 ('10','f6d2f215ed734cc09273928acab6e136'),
 ('11','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('12','f6d2f215ed734cc09273928acab6e136'),
 ('13','5'),
 ('14','6'),
 ('19e655ebcd844747aa0e46efe9870169','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('19e655ebcd844747aa0e46efe9870169','5'),
 ('19e655ebcd844747aa0e46efe9870169','91766cc228e34269a65f0564ba956bd7'),
 ('19e655ebcd844747aa0e46efe9870169','caacf61017114120bcf7bf1049b6d4c3'),
 ('1e8149b33e774daa9a250f5a1a0ad23f','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('2','f6d2f215ed734cc09273928acab6e136'),
 ('3','caacf61017114120bcf7bf1049b6d4c3'),
 ('3','f6d2f215ed734cc09273928acab6e136'),
 ('3f7ef2d4761f445e946413ab9bea23db','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('4','caacf61017114120bcf7bf1049b6d4c3'),
 ('42f5435f943a4e8cbcd86ec07b1d922a','caacf61017114120bcf7bf1049b6d4c3'),
 ('4639f877ec7149258cadcf145b4182a7','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('4639f877ec7149258cadcf145b4182a7','caacf61017114120bcf7bf1049b6d4c3'),
 ('5','f6d2f215ed734cc09273928acab6e136'),
 ('5091ca619fbf49209bce020859103ba5','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('5091ca619fbf49209bce020859103ba5','caacf61017114120bcf7bf1049b6d4c3'),
 ('51938e17b432476bbe489a2c523183a4','caacf61017114120bcf7bf1049b6d4c3'),
 ('5ad0d1f9efdc44b481b02c26b67e832e','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('5ad0d1f9efdc44b481b02c26b67e832e','caacf61017114120bcf7bf1049b6d4c3'),
 ('5b61eb41f80f43c5b8e485866178f63d','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('6','f6d2f215ed734cc09273928acab6e136'),
 ('6474fda3f35c4d1580b646a42f190cf7','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('6d69972a880f4228b88f28254c3e417e','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('7','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('7','caacf61017114120bcf7bf1049b6d4c3'),
 ('7374fe91d19a4b739ae649334c0cc273','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('8','caacf61017114120bcf7bf1049b6d4c3'),
 ('8b454376c0434e2792a1dc57edf80dbd','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('9','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('9','caacf61017114120bcf7bf1049b6d4c3'),
 ('95b3b09fa0b34ac6b95907237c744c55','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('a68dfe143da9485b9b6c0335c3a70618','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('a68dfe143da9485b9b6c0335c3a70618','caacf61017114120bcf7bf1049b6d4c3'),
 ('a91be50880744e4787a77e0f97f8dbb5','03fcd9c5c28948eb827fcd3b852494a6'),
 ('a91be50880744e4787a77e0f97f8dbb5','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('a91be50880744e4787a77e0f97f8dbb5','caacf61017114120bcf7bf1049b6d4c3'),
 ('a91be50880744e4787a77e0f97f8dbb5','f6d2f215ed734cc09273928acab6e136'),
 ('bb81a0c098a444e69028380e80852d91','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('bb81a0c098a444e69028380e80852d91','caacf61017114120bcf7bf1049b6d4c3'),
 ('cb359e3089224f97adae46cf03c0ed94','caacf61017114120bcf7bf1049b6d4c3'),
 ('d355e9e6b4ad48a59fa0a983e8b7b583','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('d42378c9621b4551a0c4c63c82f0aa33','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('d42378c9621b4551a0c4c63c82f0aa33','91766cc228e34269a65f0564ba956bd7'),
 ('d42378c9621b4551a0c4c63c82f0aa33','caacf61017114120bcf7bf1049b6d4c3'),
 ('d8de25a1f872404e82f669c04091685e','caacf61017114120bcf7bf1049b6d4c3'),
 ('da60c61cf2aa4cb2810c629c7045c538','91766cc228e34269a65f0564ba956bd7'),
 ('dc9663e71aaa42f0a2634770896ec74c','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('dc9663e71aaa42f0a2634770896ec74c','caacf61017114120bcf7bf1049b6d4c3'),
 ('eca1a51b803449d59ce4e2a3b0f4f787','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('eca1a51b803449d59ce4e2a3b0f4f787','caacf61017114120bcf7bf1049b6d4c3'),
 ('f12330474f634e2897878e8f56a910ae','1c54e003c1fc4dcd9b087ef8d48abac3'),
 ('f7cc1c7e6f494818adffe1de5f2282fb','1c54e003c1fc4dcd9b087ef8d48abac3');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;


--
-- Definition of table `systemconfig`
--

DROP TABLE IF EXISTS `systemconfig`;
CREATE TABLE `systemconfig` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `smtp` varchar(64) default NULL COMMENT '邮箱服务器地址',
  `port` varchar(64) default NULL COMMENT '邮箱服务器端口',
  `mailname` varchar(64) default NULL COMMENT '系统邮箱地址',
  `mailpassword` varchar(64) default NULL COMMENT '系统邮箱密码',
  `smsname` varchar(64) default NULL COMMENT '短信用户名',
  `smspassword` varchar(64) default NULL COMMENT '短信密码',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='系统配置';

--
-- Dumping data for table `systemconfig`
--

/*!40000 ALTER TABLE `systemconfig` DISABLE KEYS */;
INSERT INTO `systemconfig` (`id`,`smtp`,`port`,`mailname`,`mailpassword`,`smsname`,`smspassword`) VALUES 
 ('1','smtp.qq.com','25','xxxx1@qq.com','xxxxxxx','110931','xxxxxx');
/*!40000 ALTER TABLE `systemconfig` ENABLE KEYS */;


--
-- Definition of table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) default NULL COMMENT '归属用户',
  `office_id` varchar(64) default NULL COMMENT '归属部门',
  `area_id` varchar(64) default NULL COMMENT '归属区域',
  `name` varchar(100) default NULL COMMENT '名称',
  `sex` char(1) default NULL COMMENT '性别',
  `in_date` date default NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) default NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

--
-- Dumping data for table `test_data`
--

/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;


--
-- Definition of table `test_data_child`
--

DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL default '' COMMENT '编号',
  `startarea` varchar(64) default NULL COMMENT '出发地',
  `endarea` varchar(64) default NULL COMMENT '目的地',
  `price` double default NULL COMMENT '代理价格',
  `test_data_main_id` varchar(64) default NULL COMMENT '业务主表ID',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` char(1) default NULL COMMENT '删除标记',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='火车票';

--
-- Dumping data for table `test_data_child`
--

/*!40000 ALTER TABLE `test_data_child` DISABLE KEYS */;
INSERT INTO `test_data_child` (`id`,`startarea`,`endarea`,`price`,`test_data_main_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('2d6e3e4238b441719dfa180035909b7a','90ecd439eb3845db97a627d9242145e8','ee38f91df4444529b00f093be5a07b7a',232,'9b878f5f166b4f999dc7cb928d2ece71','1','2016-05-06 23:27:22','1','2016-05-06 23:27:22','3232','0'),
 ('6599dcb620054350aa14fa299e9fe25b','19298dc65ecd45cc803a6da294d1ff60','90ecd439eb3845db97a627d9242145e8',12,'b1e492c6309c4016873b8c6e0864e4d6','1','2016-05-06 23:30:17','1','2016-05-06 23:30:17','试试','0'),
 ('d07b857ac99744ed819b35fd85ea5258','ee38f91df4444529b00f093be5a07b7a','90ecd439eb3845db97a627d9242145e8',123,'667ed87879184ebfac27873151479a60','1','2016-06-22 01:27:49','1','2016-06-22 01:27:49','sfs','0');
/*!40000 ALTER TABLE `test_data_child` ENABLE KEYS */;


--
-- Definition of table `test_data_child2`
--

DROP TABLE IF EXISTS `test_data_child2`;
CREATE TABLE `test_data_child2` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `startarea` varchar(64) default NULL COMMENT '出发地',
  `endarea` varchar(64) default NULL COMMENT '目的地',
  `price` double default NULL COMMENT '代理价格',
  `test_data_main` varchar(64) default NULL COMMENT '外键',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='飞机票';

--
-- Dumping data for table `test_data_child2`
--

/*!40000 ALTER TABLE `test_data_child2` DISABLE KEYS */;
INSERT INTO `test_data_child2` (`id`,`startarea`,`endarea`,`price`,`test_data_main`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('','19298dc65ecd45cc803a6da294d1ff60','90ecd439eb3845db97a627d9242145e8',12,'b1e492c6309c4016873b8c6e0864e4d6','1','2016-05-06 23:30:17','1','2016-05-06 23:30:17','是','0');
/*!40000 ALTER TABLE `test_data_child2` ENABLE KEYS */;


--
-- Definition of table `test_data_child3`
--

DROP TABLE IF EXISTS `test_data_child3`;
CREATE TABLE `test_data_child3` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `startarea` varchar(64) default NULL COMMENT '出发地',
  `endarea` varchar(64) default NULL COMMENT '目的地',
  `price` double default NULL COMMENT '代理价格',
  `test_data_main` varchar(64) default NULL COMMENT '外键',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='汽车票';

--
-- Dumping data for table `test_data_child3`
--

/*!40000 ALTER TABLE `test_data_child3` DISABLE KEYS */;
INSERT INTO `test_data_child3` (`id`,`startarea`,`endarea`,`price`,`test_data_main`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('44bfaf92e2994fc99793f8d715147491','19298dc65ecd45cc803a6da294d1ff60','90ecd439eb3845db97a627d9242145e8',12,'b1e492c6309c4016873b8c6e0864e4d6','1','2016-05-06 23:30:17','1','2016-05-06 23:30:17','说','0'),
 ('4de7fa086d734b53a8d77674e8be3e36','ee38f91df4444529b00f093be5a07b7a','19298dc65ecd45cc803a6da294d1ff60',121,'9b878f5f166b4f999dc7cb928d2ece71','1','2016-05-06 23:27:22','1','2016-05-06 23:27:22','212121','0');
/*!40000 ALTER TABLE `test_data_child3` ENABLE KEYS */;


--
-- Definition of table `test_data_main`
--

DROP TABLE IF EXISTS `test_data_main`;
CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL default '' COMMENT '编号',
  `user_id` varchar(64) default NULL COMMENT '归属用户',
  `office_id` varchar(64) default NULL COMMENT '归属部门',
  `area_id` varchar(64) default NULL COMMENT '归属区域',
  `name` varchar(100) default NULL COMMENT '名称',
  `sex` char(1) default NULL COMMENT '性别',
  `in_date` date default NULL COMMENT '加入日期',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` char(1) default NULL COMMENT '删除标记',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='票务代理';

--
-- Dumping data for table `test_data_main`
--

/*!40000 ALTER TABLE `test_data_main` DISABLE KEYS */;
INSERT INTO `test_data_main` (`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('667ed87879184ebfac27873151479a60','7374fe91d19a4b739ae649334c0cc273','5','90ecd439eb3845db97a627d9242145e8','tes','1','2016-06-22','1','2016-06-22 01:27:49','1','2016-06-22 01:27:49','test','0'),
 ('b1e492c6309c4016873b8c6e0864e4d6','1e8149b33e774daa9a250f5a1a0ad23f','5','ee38f91df4444529b00f093be5a07b7a','testnote','1','2016-05-06','1','2016-05-06 23:30:17','1','2016-05-06 23:30:17','这种','0');
/*!40000 ALTER TABLE `test_data_main` ENABLE KEYS */;


--
-- Definition of table `test_interface`
--

DROP TABLE IF EXISTS `test_interface`;
CREATE TABLE `test_interface` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `type` varchar(16) default NULL COMMENT '接口类型',
  `url` varchar(256) default NULL COMMENT '请求URL',
  `body` varchar(2048) default NULL COMMENT '请求body',
  `successmsg` varchar(512) default NULL COMMENT '成功时返回消息',
  `errormsg` varchar(512) default NULL COMMENT '失败时返回消息',
  `remarks` varchar(512) default NULL COMMENT '备注',
  `del_flag` char(1) character set latin1 default '0' COMMENT '删除标记',
  `name` varchar(1024) default NULL COMMENT '接口名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口列表';

--
-- Dumping data for table `test_interface`
--

/*!40000 ALTER TABLE `test_interface` DISABLE KEYS */;
INSERT INTO `test_interface` (`id`,`type`,`url`,`body`,`successmsg`,`errormsg`,`remarks`,`del_flag`,`name`) VALUES 
 ('02c5ad21ab604baba5aaa9795815d769','post','http://localhost:8080/jeeplus/a/sys/user/infoEdit;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax=true&amp;mobileLogin=true','name=lily&amp;email=117575171@qq.com&amp;phone=025-83191633&amp;mobile=18951655371&amp;remarks=备注信息','','','调用该接口请先登录','0','完善用户信息'),
 ('0bd7170af4b94464ad3dbfa4d8d2dd5d','post','http://localhost:8080/jeeplus/a/iim/contact/addFriend;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax','friendName=用户登录名','','','','0','添加常用联系人'),
 ('35a8a587b68a4996b935ab7feefdcb13','post','http://localhost:8080/jeeplus/a/sys/register/registerUser','mobileLogin=true&amp;loginName=thinkgem1&amp;roleName=system&amp;password=fnst1234&amp;mobile=18951655371&amp;randomCode=1234','{&quot;success&quot;:false,&quot;msg&quot;:&quot;手机验证码不正确!&quot;}','','roleName 参数值请使用英文的角色名，注册用户即拥有该角色。调用该接口请先获取手机验证码','0','用户注册'),
 ('45fa62a43e0f4570890d701c59258217','post','http://localhost:8080/jeeplus/a/iim/contact/deleteFriend;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax','friendName=用户登录名','','','','0','删除常用联系人'),
 ('48418888f8d7469c8460e7ff48e33673','post','http://localhost:8080/jeeplus/a/login?__ajax','username=admin&amp;password=admin&amp;mobileLogin=true','{&quot;username&quot;:&quot;thinkgem&quot;,&quot;name&quot;:&quot;admin&quot;,&quot;mobileLogin&quot;:true,&quot;JSESSIONID&quot;:&quot;bc2587ecbc9c454c923232cbdb69da2a&quot;,&quot;success&quot;:true,&quot;msg&quot;:&quot;登录成功!&quot;}','','','0','登录'),
 ('54cdba711dec4aadb80e8ecf7f450f4c','get','http://192.168.1.100:8080/HeartCare/a/sys/user/validateLoginName?loginName=thinkgem','','true','false','用户名在数据库中已存在，返回false','1','用户名是否已经被注册'),
 ('5ed6916a54b94acd899373f7d5ec2912','post','http://localhost:8080/jeeplus/a/sys/user/imageUpload;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax','file','','','请使用multipart类型','0','上传头像'),
 ('629eb4adb4ba4eadbdc7f3682ec598e1','get','www','ww','ww','ww','www','0','test'),
 ('64b77cbdf2044070ae6f6c09785754a4','get','http://192.168.1.100:8080/HeartCare/a/sys/user/validateMobile?mobile=18951655371','','true','false','手机号已被注册时，返回false，可用返回true.','1','手机号是否已被注册'),
 ('9a8a0b374df24714a485d3b18c9ebc56','post','http://localhost:8080/HeartCare/a/login?__ajax','username=thinkgem&amp;password=admin&amp;clientLogin=true','','','','1','C#客户端登录'),
 ('a9d14c5d30be405fb34d64eb0c2c0818','get','http://localhost:8080/jeeplus/a/sys/user/resetPassword?mobile=18951655371','','','','参数是手机号，手机会收到新的密码。','0','重置密码'),
 ('af79dec2a3134632a8b6f1b363c9aba9','get','http://localhost:8080/jeeplus/a/sys/user/infoData;JSESSIONID=21a65e45a78f415c9c21f9376df9c1d3?__ajax=true&amp;mobileLogin=true','','','{&quot;error&quot;:&quot;0&quot;,&quot;msg&quot;:&quot;没有登录&quot;}','JSESSIONID是登录成功后返回的JSESSIONID','0','获取登录用户信息'),
 ('e94c27c961a44212b584dd04c6352adf','get','http://localhost:8080/jeeplus/a/sys/register/getRegisterCode?mobile=18951655371','','','{&quot;success&quot;:false,&quot;msg&quot;:&quot;因未知原因导致短信发送失败，请联系管理员。&quot;}','','0','短信接口'),
 ('fcd8bddd2f2c4f5d9e333cb014f1938b','get','http://192.168.1.100:8080/HeartCare/a/logout;JSESSIONID=b6b486a8919e4fc196358e10b6a82a2b?__ajax=true','','1  {&quot;success&quot;:&quot;1&quot;,&quot;msg&quot;:&quot;退出成功&quot;}','','','0','退出');
/*!40000 ALTER TABLE `test_interface` ENABLE KEYS */;


--
-- Definition of table `test_line_weather_main_city`
--

DROP TABLE IF EXISTS `test_line_weather_main_city`;
CREATE TABLE `test_line_weather_main_city` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `datestr` datetime default NULL COMMENT '日期',
  `beijing_maxtemp` double default NULL COMMENT '北京最高气温',
  `beijing_mintemp` double default NULL COMMENT '北京最低气温',
  `changchun_maxtemp` double default NULL COMMENT '长春最高气温',
  `changchun_mintemp` double default NULL COMMENT '长春最低气温',
  `shenyang_maxtemp` double default NULL COMMENT '沈阳最高气温',
  `shenyang_mintemp` double default NULL COMMENT '沈阳最低气温',
  `haerbin_maxtemp` double default NULL COMMENT '哈尔滨最高气温',
  `haerbin_mintemp` double default NULL COMMENT '哈尔滨最低气温',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='城市气温';

--
-- Dumping data for table `test_line_weather_main_city`
--

/*!40000 ALTER TABLE `test_line_weather_main_city` DISABLE KEYS */;
INSERT INTO `test_line_weather_main_city` (`id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`datestr`,`beijing_maxtemp`,`beijing_mintemp`,`changchun_maxtemp`,`changchun_mintemp`,`shenyang_maxtemp`,`shenyang_mintemp`,`haerbin_maxtemp`,`haerbin_mintemp`) VALUES 
 ('a96a31b3648c4be297d0f00ff5599a9f','1','2016-06-02 21:17:18','1','2016-06-22 00:52:34',NULL,'0','2016-06-22 00:00:00',36,18,36,20,16,20,10,8),
 ('ba1a98106bd44a9ebbfd0b90dd3f89e5','1','2016-06-02 21:21:56','1','2016-06-02 21:21:56',NULL,'0','2016-06-30 00:00:00',24,12,36,18,25,24,12,8),
 ('fa1d274c07b744ee870518e79f817ba6','1','2016-06-02 21:16:54','1','2016-06-02 21:16:54',NULL,'0','2016-06-28 00:00:00',32,12,23,10,60,25,10,2);
/*!40000 ALTER TABLE `test_line_weather_main_city` ENABLE KEYS */;


--
-- Definition of table `test_pie_class`
--

DROP TABLE IF EXISTS `test_pie_class`;
CREATE TABLE `test_pie_class` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `class_name` varchar(64) character set utf8 default NULL COMMENT '班级',
  `num` int(11) default NULL COMMENT '人数',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='班级';

--
-- Dumping data for table `test_pie_class`
--

/*!40000 ALTER TABLE `test_pie_class` DISABLE KEYS */;
INSERT INTO `test_pie_class` (`id`,`create_by`,`create_date`,`update_by`,`update_date`,`del_flag`,`class_name`,`num`,`remarks`) VALUES 
 ('19141118ea9e46c6b35d8baeb7f3fe94','1','2016-05-26 21:29:26','1','2016-05-26 21:35:06','0','2班',22,'11'),
 ('42b3824ef5dc455e917a3b1f6a8c1108','1','2016-05-26 21:35:26','1','2016-06-02 21:00:10','0','3班',123,''),
 ('49812602ff9445e99219b0d02719dbc1','1','2016-05-26 21:29:33','1','2016-05-26 21:35:00','0','1班',44,'44'),
 ('f5344164632149e199c9c221428f2774','1','2016-06-22 00:52:16','1','2016-06-22 00:52:16','0','4班',4,'4');
/*!40000 ALTER TABLE `test_pie_class` ENABLE KEYS */;


--
-- Definition of table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `name` varchar(100) character set utf8 default NULL COMMENT '名称',
  `sort` decimal(10,0) default NULL COMMENT '排序',
  `parent_id` varchar(64) default NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) default NULL COMMENT '所有父级编号',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='组织机构';

--
-- Dumping data for table `test_tree`
--

/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
INSERT INTO `test_tree` (`id`,`name`,`sort`,`parent_id`,`parent_ids`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) VALUES 
 ('0fff5b8cddfe4066846f3742d303aa97','北京','30','6fdac754355e45ee952ccda0c7f23a6e','0,6fdac754355e45ee952ccda0c7f23a6e,','1','2016-05-06 23:30:48','1','2016-05-06 23:30:48','北京','0'),
 ('6fdac754355e45ee952ccda0c7f23a6e','中国','30','0','0,','1','2016-05-06 23:30:37','1','2016-05-06 23:30:37','中华人民共和国','0');
/*!40000 ALTER TABLE `test_tree` ENABLE KEYS */;


--
-- Definition of table `testnote`
--

DROP TABLE IF EXISTS `testnote`;
CREATE TABLE `testnote` (
  `id` varchar(64) NOT NULL default '' COMMENT '主键',
  `create_by` varchar(64) default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) character set utf8 default NULL COMMENT '备注信息',
  `del_flag` varchar(64) default NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `title` varchar(64) character set utf8 default NULL COMMENT '标题',
  `contents` longblob COMMENT '内容',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='富文本测试';

--
-- Dumping data for table `testnote`
--

/*!40000 ALTER TABLE `testnote` DISABLE KEYS */;
INSERT INTO `testnote` (`id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`title`,`contents`) VALUES 
 ('43aed780c19744948143c25698516d65','1','2016-05-07 15:35:48','1','2016-05-07 15:35:48',NULL,'0','test',0x266C743B7370616E207374796C653D2671756F743B666F6E742D7765696768743A20626F6C643B2671756F743B2667743BE697A9E4B88AE5A5BD266C743B2F7370616E2667743B266C743B6469762667743B266C743B7370616E207374796C653D2671756F743B6261636B67726F756E642D636F6C6F723A20726762283235352C20302C2030293B2671756F743B2667743BE4BDA0E5A5BD266C743B2F7370616E2667743B266C743B2F6469762667743B266C743B6469762667743B266C743B696D67207372633D2671756F743B646174613A696D6167652F6A7065673B6261736536342C2F396A2F34514177525868705A67414153556B714141674141414142414445424167414F414141414767414141414141414142336433637562575670644855755932397441502F6241454D4141514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662F6241454D4241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662F4141424549414D674179414D4245514143455145444551482F7841416641414142425145424151454241514141414141414141414141514944424155474277674A4367762F784143314541414341514D444167514442515545424141414158304241674D4142424546456945785151595455574548496E45554D6F47526F51676A5172484246564C523843517A596E4B4343516F574678675A4769556D4A7967704B6A51314E6A63344F547044524556475230684A536C4E5556565A5857466C615932526C5A6D646F6157707A6448563264336835656F4F456859614869496D4B6B704F556C5A61586D4A6D616F714F6B7061616E714B6D7173724F3074626133754C6D367773504578636248794D6E4B3074505531646258324E6E6134654C6A354F586D352B6A7036764879382F5431397666342B66722F7841416641514144415145424151454241514542414141414141414141514944424155474277674A4367762F78414331455141434151494542414D454277554542414142416E6341415149444551514649544547456B4652423246784579497967516755517047687363454A497A4E53384256696374454B46695130345358784678675A4769596E4B436B714E5459334F446B3651305246526B644953557054564656575631685A576D4E6B5A575A6E61476C7163335231646E64346558714367345346686F6549695971536B3553566C7065596D5A71696F36536C7071656F71617179733753317472653475627243773854467873664979637253303954563174665932647269342B546C3575666F36657279382F5431397666342B66722F3267414D41774541416845444551412F41506B70775365415478366631785838486E2B4956477331652F6464332F77332F442B534B303638666435773355666E30352F2B7633725745326E465731545333387856354B53545333322F72666F2B6E58314D7034694D4D4D6B6B6B5949786A504F633539526A4855357A6A46642F4F2B7933372F313935796B5A4248582F41422F6C523754792F482F6746526C793330754D596B4B7855344F4467344235504851385670475672507630377265326754716536394C6562666D4E675463574C6B45357A6E706E48734F426A6A2F47726C506D57316D3366382F752B5A76676F776A4C6E6C32545361766656616558626235324B4F715447514A734A324C6B624F6E4F4D48356A6735504A347A3078774D3532773937366258313174305458354635726A62783546467868474D644C377936765336736C626F74485A4C54586C6E6A66507A4865505848586E676444794F6D5458633361336D37664E6E79315370576E5A7875724E39395636704E32332B563739794E597058334861715271706435586B436F69494E7A4F35664378784B4F586B597146414A7A304E435850556853555A796E566155497769354E796273724A5054585276625A6137473943684F57497732487030366C624759716673384A5370526E4F56536F33792B7A685469706338707A6153317430756D6A346C2B4F6E37625077362B4530317A6F6E685733693864654D30595273316C4B50374430365953655849743765355A705A6F52766B53316A495351444C7575612F554F4766446E4D63796F72465A2B33684D436E7A59656E486C6C576E5336776C4A536734796B2B366B34747252704F3339692B467630584D397A3646484F6645577657797A4C5A517031364F51546C79346D7254667752784456534C7730716C746162685553684B4C335A2B6166785A2B5076375148786175336A75504674335A36457433693073644A31534853644C6B302B2B68575331382B336A75674A4E6D3252435A437971774F34446976316E4B2B47386B79656E474F4179366D717276617269464774566A4461334E5A4A33537630747436663342777634646348634B59576E68386834637747582B797074665758526855784D334B334E4631707764343662785632396D6A68664476677A782F42706258646A724E31464C4465766576453131486371593251784E4A424D743062647A754F5742414441344A507A43766F36654571766C6D7174534B55646F4B4E4F4F7439456C2F6C30736B74476654346E44595770446B717874474B736F303271646C6F356136326C62657A3564724C633973306634782F466677373450314B79384C2B50623377704263576431613363756D337030356275385542464D3678624956455A52326279306A4C53486476494272444635546C2B4F635A343343304D524F6D6C79546E53693552617437334D7665626261642F785858785039586342696131477069737677324D6A4353644F654B6F77715649707032554A76336F387136387262313944774B322B4F587846384933695357766932356D3852747150396F617071567537334D397A634A49474479336B63696951547862444D73622F414C786874646763357972596642314B45734C5777394F74536B6E54635847334C54536155593332375461316174612B724F3272777A6C4F49673646544C364D71507350594F6B306E54644F37616879386A74474C7539456D303757325239626546662B436D6E785230323346703468304C544E645239752B397634355338426941542F4145654F494D466A49355A486C4942353364362B4B786E683377706959745177754B777A62626270346C754376713752644E4E4F2B7573306D7236624835526E2F7742487667334F347A6E5679756A434E527961396A4432535633665A614A363679546265396A37472B477637622F6858786A46466365492F4351537A4D573637314477706447347537466977563375644B754A3263784C314C77534935354155674148356A472B457A72716639685A7255625356714F5039796A6458397962565276585252664C61397444384134732B69706B73484F5751343274675A70786A476A6A356332456E556B374E564B72714A525676346135572B61317248327434553166776238524E4D47712B416645316834676952504D6E302B4F54797458736C4742494C6E545A57467775306B7130694B7942736B6B415A50354E6E57545A317735586E687333793345554770754D4B796A4B7051725254584E5570316263764C4854575864705873667A527868345038414650426465723964774E5774686C7A4E3472445533586F757A6649303774326B72586253616273723373586A5A46485A4A4235624B5742563259454653636A4441633942774D647877525846477047566E48565353656D7276313033613231746261352B58636C534D705271526E424A74527666567072654E6D6B2F6574766539394C414C58484979506637333663652B633950546B5666332F632F362F7A3662437155317972336D727652704B533076665336743832525357357A7753634475704872376E316F4D56546C4834616A322F6C74702F32374C62385049694D4A4150556B5A7A30352F444E424464613631646C72717062397457312B432F7A6A4D62416664786A6F507A7A2F414A48725155716C6237546156745058547A474433786E322F77412B2F4E427047764F4B3162743131747032656E39614569676C53426A722F7744452F774366796F4F326E69344F6A4B363173727479763158523232373948636136415979577A7942744F4F5039726A72302F6C6E745366547966364D49316F537572705774727A4A7258303031302B34397661454470302B6F412F444A502B52587858504C762B434F2B53555862792F72622B752F63724F6D3437656D63674567392B4D3952302F583272614C546358307569394846633279583361505837763830557059674356595A4150586B63382B68376975726D6B32306E7276625336387675365736584D6C4A4A7033582F44722F497174424578374448756666315076527A79372F677638686379643272664C5333793645557473696F7A626D344763415A357A2B645847704F36764A3966506F784E7271755A614E394E4F727638416F746578566B554172735967675A49392F77424F344A2F2B743132684E7976647133545333723036613732304650454F6D6C794A704F39744838506437765835573639444B756F7932787535494A4A774F6E587542375A3536487058645138727476613275743162524A2F307A7A7362556334336B3379744E705761557263727674757439764C62556F74484149707275376D53307372574A37693775376952594C6532743477576C754C6956325655685252755A696541506C42504664635062565A5170304B617231717A396E68366254635A315A506C696E7965396F3337795637666156726E566C47417A544F6358684D74797644537875507874574F48776D486846796E566D377155494E6152714B4F716C4C33495057656C7A386E763274663275583172547455384666444734596547624F34657A316E5749626961337566454B5176356430625A6F2F4C63616641784D6B45434F526642576B5A746937442B2B6343384330636F7030633034686A4635744F446C44425454396C52357459714E6B724E757A753030746275796150394D6641337746774841564B6A6E7645304D4E6A754C635652702F374E4F68484559584A6E4B4636644C4471664E546C696F335478465A703271526A374E78572F3548367464785865705454764C63336C3035336D3638364B4F496C67536869534E5652787359426D777033626733504A2F52334B556F754D707633704E75455837716165695556377579533054667A3150366977394762536C4F4B636E43386E4A52714E367458546131305374316A6179566B65692B4537445550452F687655644F735A31673154523374622F53703568735335736F354439717331664A387957497476684C4E79704B6274707858565368506B6879527455765A58746452316433327572626172585471644D33436E542B474F7254367479313361336972624A61487676676E5674653844577638417857795344544C596350466257636745556F383046334B2B5969737844623435636B6E44647858703070796F785653704B4D6F702F427064325731724C33563030743676627961735934784F454938726434387A3053666E5A39485A5736767030504176464772542B5076474C61583458456A324F75616E6257396E61704635492B30504F492F6D534562597735594233424162493341354F504E784F4A6262744670546B354A33745A64626250532F6C31505177394B664C474D7063337334786776574D64644F756E6C71592F78552B484F7566444858313048574C474F797558684570676A6E46775977646F32797647634279506D387641595A424A4F4B382B576A356B337266586252666F756E59374664536130577176617A617675326E6F2F7A614F4B73376D57496C326853514F794B2F6B594841427A2B3662496C34413363446B354A4F654E492F436E62702B48526132335676314C5376437A31696D32745A4B7A3031535736335457337952365A346567754A3537625566434E394C6F6D75576D32575361334D715233454F37356A6432702F647643474253574C6151554C4D7538444658546C79796932724C586D6A716B3974306D767633576E55354B7546772B493932725270564E4C2B2F434D313775747553563132733934765661325A396D66426A34716168632B496257485437312F4258784C30764D3657746F7A516166726B6146437437707371764574305A73466E746748345A3265475A56774D38666873446D4F476E6773787738612B4571776C4731534D366A707A6D75564F456E373846727448336236766F65426D66432B417A6A44346A4134716C43564776546B7055357856534D374C6C697279767957546475535564757253742B735077712B5038416F6E78446E54777A34352B7965476648437A7661326C363854513658726B367346534761514B496257386C77576775454974377469646F52387258383963583841593749314C47354C503841744841516C4C32744B62744C44776B6D3347436A37306C424A796B37744A62397A2B48764744364E45384C52716352384A304931714E5032315847354F31566A5754584E4B7056776B704E715647436A7A74536C4B58753257365439777674506E734A35495A6F6D52314A335A7756782F435179674B5177484278676E6B45357238386F31334E4F4F6E4E445361642B75717462526456725A7457646A2B484D316F59764C73564B6A5870386B59327572576C47545335564B4C5875743674755354752F57314C4834663539732F3841316A3172626E6C354C2B764F35356E3172565776666652782F54386D527447703363416B39386E723250742B56587A615836325739307650563258346D3678552B58394F2F72352F496A4D415058474F3241443239786E36355058384B687962585A3336664F2F58304B39747A4A65306A6F6D6E5A336972727A545639487464646655684E727A38704148346A6E7565684870782F4F726A70465866332F6C2F5835462F757072534D5664645A79533066626E337635765150737039522B5A2F482B47714847464F2F4B6C4730743070536431322B4E726449696B746E474D41487279547750664F423648394D696764536A666C396C61476A556C64757A3662796C3037624A394C752F7544495279344B6E307944774F2F2F7743722B6466446E744C33623830643972722F4144455A56594461632F4B42375A2F4C714B46757237645238796B704A3253745A4A582F414B3764696A50614D772B58446335504F4D3965526B3537395072783639456173497537625639453750665854612F54662F4D7872555679766B7532724F336C747674667262523964544F654E563342766C4B6E6E6B6E2F414246627070366F344A566E53664A7974332F3448587273694E6C4F306B636A4249376E48626A465844346C382F795A30757661487537386953577439664E4C2B75396A4F4A424C676B6A716F3979655142312B764F507A72586676723872666B7A4F4E6157696B724A4A3632753764644671744E4E744675394E59545A6937614B4A647859736344614D63666533453765416F4C4E79434544486F435230307173714C707153567172616847573832744C4A664864793054535865375255634D386655772B486A546C55646176546F55614D49766E6E566B3179513056307074705836506476722B535037625037576D6E513347712F4337775664746365474E456C4674346F31477A6B6448385436794E776E73495A463268394774577A4158526A62766452375A424975612F6F6E7736344B6867614839745A766872597A4553637348684B6B6D33676C764A7733316E467137312B4B79616250394E666F38654365573844354C48694C4F73463962346E7A4B4558476A69456F55386D776253765370797332385456693137576F6B6E4F4C354C4E4F352B6358686A776272666A393564626775446161444D584D734D796D50554C534B4E384B31736A7371534941536B6B6B49594D7049436A762B7279773871726C5571545570545556374F2B6C4F4D58396C7474757953576E4C62567136305036616A794F7255634534776A4B4B6A5453535562525630724F3753616254627533642B5A36337033775A38435277514750534465794A4558652F774254764A33686263574965534B32614E6D47572B53464967793435596D752B6A5277366A54546F7875727053757574724E374F363066572F6F545664534C6C4E565A4B4C62393162705730562F5870644C794E4B2B3841703456686A314379385636486F4E6B74764B6B6D6C614A6F4832715735514B533653797A6D356D69655A5742383635654A5659594551786B627A6A476A467A684A53657A30364E5731394F6D33627949685871536E464B454B6C373830616E4E464A646665307337505261332B646A353754543964385661374A6F64706658456B516C6A455433456C3252634B5732514A4A4841476769444667736F5641694B537A4E6854586A3138524B4D576E5A4F306B6D3762396D7236707531723962625750576A546879705270786733465363493361365761647572643937392B782B6F5077392B4250676234482B41644D2B4A76696A51724B583468366A49732F683630314B38686653744A5032646F70645775736874306B6D556577684B684A5A6B457850796E506A314D544F724E4A744F4B616A646138746E647032623948302F4139534F4570554B626C4B3857347871525456373879305862644A5836396448702B5666786576626E5676463274616E714E2F4A63584E37667A584D6B6F75704C337A4A4A70576152316D2F31526A63674D71786855692F315941433132306B31464C705A576274643331642F6D2F5037376E436B2B65665A36744F313132746F30393965337A5235395A33576C52757363317264435847504E2B3071735A474F4130596A5A7948366B4751347A786A72577072313637664C2F414966582B724855325631354E3161586D6C32735670655242576A64705A6D69765956497A4738684F3153765167676C4777536F584E5842326C36707258613761742F772F5378456F33576956372B586D665458686533747648646862584E7130656C2B4C4E4E50326E546453456355636C686378754138456A714152444953466C69527738516B467847504B63697472765858625454532B335662726266743349745A726D53666C3174665658586533667432507162775071482F41416C756C7A7A5845594F762B48393976726D6C786A7937324737732F77446D4A57456B595755704B4D53694D4B594A4172624372454D4F57745155314B536847556D7275456B6B707665555A575458764B38573964477A65706836574E7079553757634A526847567448797954693373347A62745065385731362F665077492B4E432B495574666878342B3141533667685379384C2B497035516A334A326757756B366D3877444D4A56776C70644E49784567386D3477536A4838463439344A654639766E6D53526E54685A316377774550655373704E314B532B306F6375695353744A393266772F38415345384261575955635878547737536F66574B4E46314D79793268536447646554556E4F7252555661725570387139784B306F536B2F734F33306665615A4A597A535730775A47695A6C4B5A417756504F656F4A7A31494F4432474D562B534C4571725470564950535557334636564939477078646C4233752B585639624A4D2F7741344B32585477316156446B6355705354556C79326B704E4F466E79714D6F4F366E725A50314B68744E77344A353748672F546B597A2F6E3371343472704C6D53543357366536542F71356D38484B396B375061366164765052743238396D4D2F73386A6E7078324B2B332B7A322B7635317338545176764C2F414D42742B533965672F7174614F3954326E6C6179587A66586F2B724958744733454B2F41396364652B4F5035303156684A586970577631742B57676E6836712B79726554542F5839506D49625A674D6B3950636339765372353457382B2B763357736178684B466E4B4C736C6252664C7A66396452766B2F5838785575704262763841422F354852546162646B31367070656D71562F582B6E375138666D4861573579514165702B6E62382B5057766A666150737638414C31312F553935556F796372743661612F77424E3733376649684E76745A68676B676A2B3663343963456A3875744E546261566C712F502F41444D70553552625672712B6A365038763636434E45534F6D4D633547503841505372746436394870353666352F6B556E626D646B30316F3374746132757A30306532706E53326F4A5A697564326363642F376F7878675A47656E6642504E624B6161536274623774302F6C6658666F7258324F577053546161536C6461374F31746439764E3258545570766273713443636B642B6E547363483875316252727739314B577430765737533333383366546658715A7A77386F744A645666706F756E5835642F757555767378333748546C6D48754D5A414A4A427942676A48636E7431726F6A566A4B2B75747561454C744F566E5A725664647456364764434E52315846786A4B463072375331667570627138747474557A34752F62632F61426A2B4358676D66776A3461755950384168506646566C4F73726D64595A6644476854784E4739354A744A61472B314145773234334A4B73515A384449782B702B462F42717A3348504F4D7A7053654279315777384A57396A696138706338627556704F45477666747474317366326239476E775A715A706E46626A66695043542F73584B3674476556344845786A624834785866504E4E6330384C47566E4B554570786B756A5035313762564C375739626D7572394531713661557461764979745A32737066655A4668637039706A586C696B6D3551647A74754A4A50394D71756B326D314F55567951584B306F5232664C707048524B2B2B6E61352F6F5079564B312B61547077636E4F6170704B2B6C6F773130555957536A79752F757234726E723167336A5855726933754C47355958396D78654D3263306232317248474F6B567642694B3256423935416F353635365655616B707075334B6C626179667070767466712B3533716C53705169334A586D6B337A3871642F54716B6B37364C7475625639727572616338553832754E72476F54794B7435595763463078624241503267687845574A47446744626A4B6745477448566A4652764A702B6161375861746676642F71597A67716A566C486C61306434712B7539373261642B7A2B39704873506876542F47336A5037505A364434656C654337554365312B774D627479696A49442B5736546B687549325863794B53584234726E7847595536576C30307447396258323164743739505237706D39484B6139575364424A786275354B316B727136656D6E6B31667A3648323338442F7742672F77434A7431346D302F784F2F686C70624D5846713131466470505A77543230325A5857346A55517A774E6271576452475372497262577A312B65787561555730334F4B6B764F373339335458585862793037483075447944467872303556495870387169323137726153746656762F414476625530662B4369747072586871653230534F43577973744A30573038504A4444627331724B6B55496B6A4B626F764D755958596E7951747848495647575351674770797970437047752F6A6452747075396C653175572B6C336662547263337A3668556A4B6C42302B57454646536158325574486261373672585A5071666835714C5856784B4A42483545774A69614A59334551644363784973704D67336A6C6F6D49414A34596356374E4B3653687679704B2B33792F7238656E7A39536D71646B7276707262736D6C6462364F374D694C53486E337A71696B7745764E45685947446B626E5A4267694D483777487A4A337A6B59314D6C71337071744E562B5437485365465A32303355467337714A7A464E746151456E4555636A59533774474A366A4941322F367853566C484F5255456E4A583956362F3163556D3945743239753653312F4E4831643464384F333267366C61612F704332387472634971366E61442F41493839517430554554326F5254355771517873776C7A75387949474C4B6C5672716A464E4E7665397638416772762F414638386D3233646E305A61526E777A72646A346E306456575532305A6B6C56486A5361796B416C69687551564A6C2B7A6E656A712B396A4348556E706975534E2B712B656E35584B707A6C43555772623273396E66646672703276304F79312F6E374A347830722F523947314F574E5A59496D5A483048584A385434522F762F595A6D4350444B436F5257556F527349506D34326A436235476C4B453752717863655A4F6E4B2F50477A2F4141626476767364474A6F307356435654324B71306F776C43736C474D6C546B303932302F633558506D765A326474376E365466412F346B44347365434931314A6950462F686D4A4C5056506C426C76624F4445467466796B594D6B354B684C6C67443567327A452F4F612F6C4C6A72687957513574577856464F475734367135516C4A4A4F6E556C4B53635957325575574C7430627374442F4D4C36536E684D2B477334706352355668565379504F716C5A536A536A7978776D4C55366B707769303949535670336B32354F54745A487078746943414747374F64703635794351546852782B6D526E714D2F4775566E70377953736D766C75374E4E2F6C6533702F493859797679586A7A5275704E336176467462705066702F775544775341444B357A6E6F516365394F4D6D2B6C6C332F7046756E4F79317079763262663570454269323848495048474F42394D44766E75543339367537377637796B3578584B3663576C5A336230383956723875793639577443434438704A347A6B5942352B672F6E6D693876356E393475654C54584A432F6C4A332F4C516761323364426A41366A6233342F7A2B6F6F6A4A7036336671312B6E2B5348434D5A75566C474E6E306C76354F2F712B742F6E6339666B30384B6543335071514F3535786A6A48485156387248455235552B57337A30376454366E3671755A32646B2B7476363133387677484379514A754A593448554B546B3977447447656E706A3873696C585432302F7658566B752F7075447730552B5679766450567133667A74304932745979506C4A4C446B726A42783035774D3954327A2B5648316852756E4E536638416A312B35363666356B537773557664616258363238396574764C586579474779552F4D65647641555A504950706763347830394F744C367770624A3737742F3166542F674630384A43556665736D374A61643761333258355776717A4E65335A70447347634D772B3575364867593539426A722B5146646B4775574C535570535631465056365861303175757A74723252797A6F54546B315375344E714C6B766461585737545672505236712B70383566744B2F74442B4650326150413833696258664A767646476F3238362B4476446D2B507A4C3236554D73642F64497838784C4B336D32377A73437534326F53547A3976774E776C692B4D38633430354C4435586735786C6A3856473639364D7639336F316476614A704F5549336254666D667566676E344C343778467A6D4F5078375747345879334555663754786B6165754A727038306376776C5779684B707336764C64306F4F3763644C2F7741785878422B4A506A2F414F50506A545766455869572F613776645775707451766A755932646A62744B374A474378623933416845554B7351774141566554583965596168684D71792B6A6C3241705270345444786A474549526A446D6E707A315A526A614C6C50535462626264316461572F77424E6376793742355A684D4C6C2B5834654747776D4270724459616A536843436A4261576D6F70526C4F54536C4F65395358764E743646433167302F547357576D78504D7949766E335442664D6D347958615673726278486C516948734F436369726A4A4B58504B4F6D726162745A4F2B743946707672366454364444345A79756D2B7A6C4732756D72615476645253766679766F666F542B796C2B777A386150326E37797A68384E78532B45664230356A572B313832386C7664616847787938567438674B4B77334B5A565667366B48634E3350426A733370345271554842744A766C356C665239597037702F64383748305755384E34724E71735A77692F71305A4B4B713149766B31302B4A32567237704A2F6D66306F6673366638454F2F684E344C305332762F4142414C72784866414931774C3042466E6B5A4E306A45375330674C5A7947427A6A4F656356386A694F4A63626935535546374E5262732F68756B37615873375865337273726E36566765423874776C2F725470346D5368647052553664372F4147556B306E31333366526E36632F446A2F676D7A38496643396E432B6C2B46644C67614D6953463434794A556B494142563052577A325A64334B67676A6F4B3879655A343271704B6452327664326E7A6250523254547472333064744E5431345A526C464272324F486A5433584C476E7974765457367330744E4E4C4C30332B6F74442F5A4F307130437374726157386B554F794B34677432676563416252484B7534495555664B686443635A35786D7376724D70576376614F377332377465756A36656A6432766D366D4777455A572F655236706278562B6C744C3962646A38302F3233762B4362656D2B4C2F42327633703041582F414E736B6B76476E6A6B656157465930507A68475A6C6B6D6A2F35594D63434D484334365631594C4E4D5467366B597A355A5535533936306C70423353307534365056374F2F52644F5447354A674D7A705370387A7054396D34516D306F367458545462307331627472392F3869763751483746657266447257722B30744972715347336D5A6C6A6B686B743779494D666B442B5A3873736749364A68776F444D647646666334584D6F56595175344B32696B33626D5457376632745776546532702B585A6E772F58774E6555625661314A4E78556C6478566C724B363376732B6D2B6D353863616838503771796E6151724A466632655937694B5143453345613842326A4F306B494F466D514567676954356331367171516D3161556274624A713931626F6D3750303955654850437136546D303958795057533565746E323636365876735433506741617A46464A62655A6233735347347455696A553464534E37787873436B7245672B646171336C33435A614146717139724F396E3076332F344855355A7463756D746E627A3076663841727166536E776D686C763841514A3944764C4B4633736E73324D4B534D386C7464526B43473967676B416C6E73626955464A5939346C7458597754726743752B445468467070364A4E4C6F3766696E3357686E3075653436656B43786E7A4C5954326356306F6C5247595059763567526C686955454642635A444A49422B374A6A59594F6174623264757576526631303133314E59387153756B6E3537337675722B6836546F2B6E57756D54367234593161792B31365A724D4C2F32617934614659623650656241706869727842354462534D4346423873454B7169765078504E4B6D31486D75354C5262765633303672725A62364864674B7A6F565A77566C5372516E477248654D30306C373057745830364A58315A5338432B4939612B4133784B3075655336754A4E4638324B326B6D6E5543445666446435355545717A2F4B464D326E423038312B533063615335786D76694F4C63686F3851354E6A4D767277687A526F757467366A70707A7034716D6D31797976644B657174766630506A50455867664C2B4D75474D77794448556C4746664359724559477336555A7877754D68547654354A4F2F4C4B745A52533679646B7A3959377133746D2B7A585671367A576C3962513331764F7055724C42634A35734C6F777943724B7741494F535151612F6B5A7872304B3962433135535665685671555A776430347970766C6C4670325376625636326137732F7861346B79577077396E474E797646557030717545784F4977553664616B3664534665693753684F4D724E5463557038764C384C547471696D59593241326B6E6A6B48317A782F44365A2F7965616A4B6530572B2B2F38416D654A436E48564A4B5065797438744C502B7262455A744D6E4F43636A6A41482B4874303436302B6172336B4E7078756B372B72307632667A37334976737552686C47447878312B76423952376331536333385464764F322F77445677354B6C37796A5474665A5763744E756C37644772752B6E71566D745175342F4D4D6E6A64332F336541547A6A49343938646131636D7258536B7262585464394E65766E3233366C78707058316A4739724E7065656D322F706662513966614C666773702F4C3049507638412F582F4376696F315964723637757A58546F6E2F414D452B75555A576654756E31362F4C3532333745526A41444C2B3879546741594148584F4231343734376671303550564F435630746275392F4A7257322F545A4D4F574358765162665632767236585364396C377974356A4245764A414F356543536F7765704948494F4E3334645456754E6B39495833622B313036763841723739534B67335A526B7576537938394733662F4144394248792B4D49414641587343652B546A36392B61754D347857756C37712B6D6D6D37763558337574483243535364742F646233756B6B3757666264575431663538463851764847676644507766722F6A72784E4F73656D6146625353693179466B31532B3245326D6C51456C5338747A4B455677764D55524D6D63437665794C4B4D5A78486D5747796A43786E43654A6E5470596D716B375953684E336C576E4B4362697051756C31546B6D376450734F414F447377342B34717933686E4C3664536363524A564D77723873335479374C314B3162473158474D6E654B66377461747A63627132702F4B5038417453664862784A38655069547158696A584C2F3752756E614732746F476B4E6C70566E475857485337424332316265336A3270497855504E4A75655442362F32356B57545A6477396B2B4379764B3850436A68384A536A536C556B6B735669717156355673544C56536B336531756958566F2F3152345A345A796268484973743465794F684768684D756F71696F754E73525871717A72597645744B303674656F3355636C4A386C2B525769724C7A445468486F326872444E4E396B53363233463036343836346467516B454B5A387956516843714468415353546E72365532354E4E4F7958547636362B762B52396251704B4670545339354C533630617672354E364E62503050304E2F59702F5A4531663432362F6F2B763631706C7862654755764C65342B7979526D52727849354632476249444F784F4D7153414D2B674E65666A73584444307036707974613666643261546670382B6C394436764B7371655956494F616C546F7156357458556E474E6D347037363955374A70753774762F634C2B78372B7A376F76676E7735704F6D32656A78323856765A77496768676A68695152716E47456A44444B6A6B38354A78363138426A4B7A71546C4B65716C384F695574587470736C5A4A725475725850317A41303657486F526F30615873364D49714D56653070627075584C37756D336537653358395876442F68614B477A67574F325255414149324467675A7A376B6E5055443871344C4E70613879536474485A4C746579753332582B5A31797176564A714B53736F783030657239572F6B3764323776766450304B33685A4D786E61435277427754307941434F70366639386E4E615534506C356D374A374C5830752F3074667A50506C5571536B32704A7033746466312F57353038476E7842516D56424249774577505A69534D624D647542363172474C746539722B6A30362B6A2F702B574D70704F7A547532725831562F5874322F545567765041792B49374F3474626D3153534F5657415178724B7543507648494B59596A4F44774D5676484471554837756C6E7A4F3354767062667635397257354B6D4D396A4B376B3234747057615454364C56374C587958546F6A38645032325032456642336A6253504558324C53493439566C53357549336769514F4C6D5250336A787569726863386853546A42435A4846464776566F3146467955616362636E6D6D3732732F6C7035397A7456504459334479356C6561585676347462725337746256506F39577A2B517A397176396C627842385062325276734732387358665A504C6273424E484249796C5A585A647935584F3871567A31414E66573448472B30566D2B3269736B3166547266377276357254344C4F636F396C46756E422B307337506C756E323936322B33585657364E6E773534546C30653831534C51396159616264334677797757397745527864784D463332456A6C566D4448356C74355751534B436F594E744A2B696857684C747A4C6F6D6D3166653276332B5458792B5771554576646C5435585A586C793275396232387539392B68367A6566446E78423464754966452B68435A704D5353334D6C716A4D6C78426B43347534774D667645776F7534434D46522B385865694F3273616A562B533930746D306E642F4F39744E4E476B752F586E7155556C656D744971386B7455723975716575742F4F78363770627736766152362F624733517A4732307256374971435A33755643584677345567784A6344624930345252464D712B59554E64384A63304975367662336C3237657658743649346E463675317437712F332F7742666F646E4C70303133706B5A6A647A66365A4D31724C496D34794A61706B773363386237535A624E654D6F53705568386B5A78684F53696E756B37703930742F76566A616C476332704A754C6A7539727273756D756C2F38414938323854366B2F69627735714F6B3667444A346A384C54744A61536951744C6532455949797353485979583173787A674D6D563362754161386A45637361745032716270546D6F364F507574327537536132543036766F7454313456614F4C7756576C4B44397053626C6556763369736B6C4731337A4C577A363333577150757A396B4C346A7434342B486478344A3157372B3165492F414C5738455454484D393734627668356D6D53737A6379665A474C326A6E47305352374E7A4776356B3857636957565A35517A4C427753774F4F68566E566D6B3179596D36626452723346375674744A58625473396A2F4E503657766837444A382B792F6A484259645177664645595563647978356F34584E6348486C5661536A486B707778744A4B4D2F65356E4B7A30545239564E70546738786B44505657485876303639656837697679794F4B6231556C5A575866565876352B6571765A71352F48797755315A4E4A32566D7665646D766B32394E322F7741686E396D6E6E676A48474D344A48344C672F696166316839583979742B61592F715531396C523137533153333643507079413558495867594F51666D78774D2B2F3136652F4173512B6B6E364F7A7638412B537266707162724274704C6C5366567954536666586C617631745A614B31373773476E4B374B64704952686E4C446B4472674831774F2F616A3678505732725853332B563944574F5877556D35536A4C2F774C585856664372507A766139744E7A307834315541444A363954395051663072354B4532727254587A75395056742F6666386A3647644F4E31756C356664383074503049576A494A49414F52786744493953636E6E333665344171377474617638644F396B76304A555630533266546F6C642F67566D6843673974783637514344676B632B77796348746E5046644D5A7954756D335A65756A362B6E6D4C32546B3752736E7636726579577634624B3736454A743169686E754A706F4C654343476134755A37686C687437653368517A54334E784B2B456A67676952336C6B5A6C4337516F2B5A6747326F5272346D765477384B667461745A754E436C46506D71796C70794C6C557665623354563758665531772B57347A4756615745776548654D78754B72304D4E676348535837797655717A6C4763473758625361664E64705838724C2B646A2F41494B492F74653266784F38544A385066683771633033675077755A72654361324A51654B74624C7648714F724255797730364C614C6254354A4175344235554F47342F736A7775344B6E77726C4538666A374C4F4D7970523973354B4D6F303646574371776F77696F7555616C4F4D6C427A63722B3779744B7A50394850412F77414C352B4858446C65706A61584A784E6E646146584D3637616C5777324661552F374F7065366E53707866755634336B357A6733644E7048355871625854794C6E55493075645162353472454D567434436362444B344A473445376941446E765836544B546C4A7653336F31727072306276627266795A2B2B30594F464E53646D317042746538315A74715575743339722F414963376634566546372F346E66455052644A6D33542F614C36466D6752535934346F6D44504767353252714D664B754D2B70724F744E553475313553555830336576795474322B523234474654463469436E626C6B3165433931726C30566E353231372F6566327366734C66417132384B654766447363646A45676874496D646843467937425343774B394178363863446B64712B467A4445796E506B757457322F65752B36566B2F782B356E37546B3243703061456252736B6C75374F2B397264552F4C5A61506F7A2B676634546161396C5A524B71464248476F3271506C2B5A6637326676666536644150553865464C3335537537572B473665717630762F77507750626C4C6C745A4C395077372F31356656576A584C523234584F4E6F79696B6E4F543079655749787830394D656C584730593274306176613172722B7651354A747554627635613657387636386E73645061584D6A526B4D452B5A766D77324D685430556E7563392F773470704A523562744B7A30317370644C36583832723943545A745A347A4E4848494D726E49416249493534662F414776633439735656503472644C4E2F647231762B57763559317270586A76732B32326C2F6E2F5768374470456C744C703777434A41386162316B58676E48515A556A71446E6F66544236313639436F765A5470746645724A3273374E62587430576C76545A4879324A705650624B556E704B626173396C3165727374753776653939557A35322B4A2F68372B306C757759466C4D704B723875346E676A6B6A4A365935344A376356354F49664E5553576B59374E575637507276743362317632567A364441795650563374707936373957394F6D75332B522B4C2F414F31312B795470336A58546453656177696C6C6E74356A3570746C594A35696E66435341337A6338456B4545394233716A6970553672536B303474587374476C6F313632303650376E6232712B45705A68545556485652313153653364325639623658386A2B5333397237396B725550416571587A57746F304C57445358566E4D6B62527568694F414564564471364E686C64572B567348706D76734D7578734B6953656B7430335A505331392F4F39744E647276552F506339796174686E4B4E4A5769742B617A6B764B2F71394F6C6B742B7679313846763268326731653238412B504C754F4239384D476B3678657359555765467A47317271495079713069417174326F386D3456764B75564B6E492B6A70536730334637744E2F6B6E3676627A7366477A627065347258576B74393130376133752F75643933396E5833686D4B4B655478523452747253473875494A5A6456384D4B55466C72396B345662696652354E356A52314465596B436B42473444464E7256756E6131323072323066662F672F6D637371635A4F375772337470667A5A4E61694A724732317931563274316A46746443526731374A456D494C7932753464366F7437597157696B6A507A534B776B4149593430715470744B4D62387931386D7455322F4F2F3457737570644E4B6E704736767064752B6A2F587A625043766946625236427173657632567773756E3663593753594B4853613438503667323230635074563265796D66794A6C7951735A5A647849497268786B506134643034723934703830485A4C745A383354572B2F5A5830304852712F564B384A4A2B35556E79545456303479667657626173395069643761706173367634462B4D54384C7669666F6D764A756E30713476453044564653586D58773172307359745A4A564A32794C70642B7A454871686379626A754F507A766A504A31784A77356D5758564979685777304869634E4A7974556C6A634C46756D347A6162564B546A7A53704C5353336174722B63654D584274506937684850636C64435666367A6736324E797975337A4F6A6A4D4A546C57777361636E4657664E46383635663369584C644837552B53685934495A447A473434334B526B486F564F554B6E3565787A6B35722B4E34797178696E4F796E4A7A5572637954644F54707961546638414D6E72706635482B51736661516A4346546C56574B6E4772614B5364576C576E54714E4B375555355154356431665674375250434D734233413559354F6366792F774431552F617A372F692F3879755A2B58334C2F68694E6F4D6A41414A794D636E2B74564372506D5858582B74332F41462B445637397675532F4A454C51455934492B684135427A2F6878375675717954664D6E727276613739644F2B332B516A30495743734231794D35794D64515058487478376D766E48566B3765376F2B6E4C4665766D74647456632B6F6A67335A7032766F30335A3639566F4962474D5A416242504743414D6E303549714857752B577A5637363232747664332F3450344365467465386F4C543065756C6C6F3966383051437A444F4543713774393165437A46666D436F5363355033636A4A32354148584769646B354F5455556D354F396C61373157767658745A5274377A656D364D493049612F384150794B745362757565656955643164752B6B65746E5A732F487A2F676F352B3174626148706C313844506878666D357672706D2F34547A563747344D466F4A504D2F6365473437794D6B79785175717936684647796D567759446B426858395065436E414C6F722F4146797A7A447A68376A575234537443376E7A4A50363979537679526B323478684E61386963656A50376338412F43716E6B3849635A63513070564D32723030386D553663477346536359756549715570526C47395A4F5370506C35344F504D724E6F2F6E3276347232485637395A3566744F6F49512B6F33675861746F7855794E61517030526F31776D7759435A5A4735794B2F6F6564527A6B6E4E36796C4A373650726531306F32643161326D6958512F717244336C55756E7A536C4B563775376C6539323561766D326C7A61583257727363684E49733753456C6E4C73436A7563384B573345386E4C4848584148746A696D6B32394666522F6C76384149375A754C535732716130364A322F4F316A37792F774343646D6851362F3841484F434F345257687362654B544C6A6B504E4F4555644F4D6748422F6C58466D4E527877366A7972586D3175757670765A587435364873384F556C567A47435354396D7456706470326433665232366458716D6633776673762B416F6C3066536B69695459746D47552F6679753142673763344A4A4B3867636B347869767A79752B655461546262623658736D302F3032364C62742B31553551396D6F786B72704A573674705761746670613766667661352B6D66672F52567345574A6B387444483875414E79756567645432362F545046636C314B365431586652372F7235617263707955565A32764B7A576C3945326D2B2B2F774374747A317254724A6468435A666552674138634435674D6B4848556E727A58556B306F2F6833302F344A78547254316A79747064644E3964724C702B486D6231745A7A716D302F366C447547514D7170354949787A6A49787A394F4B556C644E4A332F4472352F6630666C755A30707935766554536439587435582F533232742B3576615870356C6D554674755779705968666B494F30416E382B65683978785549614C5476657A5637727139392F772F4F4D545635624A61392F4C2F414966542F68742F56644F74356F496D574B546A61456A55675A444B4D386B5A79414F633977654F6C64644B4D6F4C33302F6554355672612B6D726654564F2B6E646E67346970486D697274747557367374626464463076665935545859417979695145794B437864564A56694353416543426E6F4D636A484663474969354E3257743235585672613950782B572F633954445649766B616C7A4A74644E756C37644F56395876644F39745477547876346273396530693858374F6973562B5A584142334C77537749787A6A714F6F7A5847724C6D6C64755474623561656D326D763336732B697731534D5A78744A38336C64624C61363637335077472F62772B41656E6174596168634379695A674C6B686C693362636F516371526B727751515777652F6176557757496C4763484B546A72743061307431617471757633455A7468595933447A714A326E424A613658657276766137317337363664626E38532F37583377376B3844654D4C7157797A61426278376D43534C50436C3241447151416844676B7267676A48593472377A4256564B6D6D332F4B764E36717A303253666E317566692B59596455735255536432354F3765695676573731747238373265726A2B434837564E376F4D56683457385954335635704E75344E6865724E494C2F414569344448644E5A7A736347337839367A6B4A516F706A4842436A31615656776372326C7A61523671323131392B3974547A564A4E3254317662707664725237663166302B2B3946386657317976397557733970714E74714258376670397356432B4B4E50534A492F7439707A6E532F464E727558796F2F6C68314F4E664B632B59564E644D6F7477556B6C5A7931736C644E332B3639756D6E63705355624F54736B2F7741583566354234734F6C367034656A3144544A5074756A535433646C61766441527A745A336764627654622B4E766E686E734A69306E6C7674654B594D4F6D4B35355274756C64725456623632312F4A4C5734716E76306E475076797537704B37386D6D2B7262586E5938743046466D302B353074336B382F53694C4533424A383634734A56387A54377058504B6F41453279627478614E75647747506E635A47706873627A786837534E543357704A63736E4A326E47306B2F7374753752314C2F41476E41657A717633364672517664757A7337725674744E786B726170745761756A397666674A346F506A763453654464616E6C456C2F6261614E44315962675A5271656B45576A764F6D537979545178704F724F6376484972444F63312F4766482B55787958696E4D36464A7434584656507275457157616A556F7A2F694B6E4675305647627479704C573774646E2B53486A66776C4C6844784D346F793744306B73466A3859733577453452556156536E6A6F653078436F78566F78703071376C446C696F705376614B572F727074756F436B3839634438523039654D2B31664679724F44356272524B31377436397266726531766B666B37707A54747975362F7239666D4E4E7332447455676A484F46343548502B632F536A32366A61536C37326D6D722B5430324255354A713858613633497673636A456B344A4848494866754F6735774366547036317048464C565335643771392F505872722F77583131336A526C4F366A4337573653582F417576507A505146683237686B6B48474D674538636E7678794D31387A7A74364C527472564F3275326D3174376239624832484A4C5454665333573730532B6232743837444874437A5A32733342495642793252776F35414A6230394D396878724445523065396E723366577957376274797254567450794A565056747032316273727579306C79706175585657393636305A38562F74692F744D364E2B7A2F7743444C6E54394A314B442F68592B75326B73576D5738514537364661537138557570334B6F33793367775573725A7473753869557074546E396E384A76447A466362356C537A504D4D48576A77336C395A564D5455724A77654978464B70463036435474616D74616E4D755A795562614F522B322B436668545634767A4F6C784C6E3248713075464D7272383657496734547A544655366B5A59656E686C4B3350683148326B367457316F7A6971646E7A706E3831766A36572F5856727A786634336B6853577A38506E786870336875346C5A356456316A78426579326E687966554A45596D57376D6C613631326531637136325675727972695A5366375456576C4F4C772B47396E374768503245485370716C434D4B4D56474549512F75786162657A62643776622B384B4E614E655468476E547055364B56476B714D59786736644E4A5531474332664B34786C4B327269396B664E555A6C2B785443356C6C6C764C36576138767074784A5A70574C794E492B66395A4953533542475354676334724B7046796D6D6D6B6F364A622B756E34394E396232642F6F4D4A683478584E4C53556274704C537A76317433586E657936484B504942496471674B7679714F4E6F476543634144507177363436567444642B6E39667159536B756556746F7038767A64312B6175742B6D6E543958662B43566677692B4958784D2B497669616677506270474E5069732F3752314F5A316768746B6A3353527878534D72457A73784443494145717563644B38724E71314F6A52687A613632732B6C336139335A583131573650704F4773486A4D5469616B384E543979484C3757767A575361577A5639453975392F57352F555634482B4A2F375576374E567A5A50656543395A316677785A46466E314B4B326B314B4B3674776F797176444875676A6B5546325971416742723571554D4869492F75366B656437644C65577664366437374C512F526C484D4D4F2F666F4B564F3735704B5462546B724A387474566656752B6C6E627566716E3842503238766876385649724C54745A6B50687278424D414A37655465496A63644743704C6959664D765172676438644B3875766858536C30664E46754E72653874597539746D6D317662543050517738315553536D35506433766F374F3862746670306258632F513777743472733954574D517A4334525877736B625A51786B416F2B52777077633449505938317A71656954577164756D2B312B372F47794E4A302B57556E652F61793736763841532B39724F3268366C42656859777743465734366A4142504F343436726A6E394F74614A5876354B357A7A6E79704E4B36666E74626536733274502B474D69373861614E6F55706255722B3073516863356D6B5559524F636B6B68527744786B5A2F537269306B31645831387678656E707036726374776C4F463477356B3274624A2F4A76646448387532707A6C2F2B32763841427277437062566459302B38654C633671474743754E72596663666C504F7867707A6A6E486276776D49707769314F693672732B575464744C3762575674656D393750533535574979617456546B7075476A743774374C75726164644C62664D35612F2F414733666848346E7430754E4C6A5A6261664C693469635378536559536F4B596237696E356E494F5548555647496C54714F3861584932377674337432665A753277384A6C746244387A6C5862693451566E486C616358713137326C372F433172743569365638532F44666A534334693076554C55586D334A73684F705A6F32492F6678676B376B786A6431493759727961314671546E465769753756752B322F53793875703764446E703872747A72524F5337766F332B4776356E79442B306634517466457567616F7074304945456975344145676C415A7730597763726B63385A494A465A777161332B477976767635645077317662725939696D344E65796E464F4E5457547665306D724C3774467031766F33592F68742F344B682F4465547735347A31434B537A566261525A6A47775167764732535844597743704F37466662354C582B7355595071307665566E657A74615339466235616E355078586831684D524F54685A4C62613037375338326C612F6D31652B702B457339724A627A4F464F35562F69364843454257484977334139383963636976704A4A4A753233512B4E6A53646C55356D7236796931613231755637507072625939382B46587869314C77757261646558447A325A5A6342327A7441326A7A45666771397547444A7477537733416769744B64546C306B306F363962612F4E32762F776535704B50744936536A477A74643931666531393956632B312F4266784D73566561357535497237514E59694336764249752F376376796B617043454A454770326F514E6375696F3131486D5238746B6E614E614476616D70367063334D6C623074663158636863394F79685435306E756D2B336C6664766273766B627437665265486464306A557261384F706548645A4D2B6B764A43504D387947342F6636574A39755651515337347875495949794B546E4665666D6442566F536E64516B6F4F5562725253696E613933752B74394C39433848586E5172586B2B5A4F643570364B4B61616B6E70666C732B2B39744E44395476324966455951654A66436B6B694744557042716C72477A625A56314379743455754556656469546165304A4B484C4F39737A354F546A2B5876476A4C70547732555A72527070546F30315378456D2B6639334F6255656154745A4A2B39466448335034392B6C6A777653634D6B7A6D6C682B537267364C39744F4D65644C4C3673704B4D4A5656724F53724E7A3276485332682B68445777596B684D4144363967547A6B644D3434485776352B6A4C3472796A4A526B3470795431537437326D6975322F75576C72483851716A4675536C5453355A4E4A707138316F314E397270374E746F694E73414D374F6E5837783739732B2B50777A54356F33306C422B584C2F6C712F6D5032454646326A6476705A4A57303839787068485A6366384141536635394B4A63713076466565757635332B396A554846747061766433746638557A76526171753749584A47655354674C796338414848584873636B43766D6E566B7447347231616474557237747256706570396F384E5A4E74785564704E4A614A3254312B66545671397454776A34326646434834652B445045657678586F73724C514E4B6C3148574E55695550636F6F6C57433230625139784D54613771747A4B6C725A4F2B556756707069753143612F5165426546316E5762355852786444463136324F72795745776C4E786A547130616372346A47596C4E4B63616543697565377447626A6137362F66634238487250633979334231366164584675743953776B3031537151707A58744D62696557307155634670555850793035754B54356B326E2F414437614E3450316234372B4D76452F78632B4A41756248774670552B75654A74555738314B65372B30365A34597332316255624E4C393359725062576B537753546E6245326F7A4A616F535A465566334A6938797776434F553454682F424E52782B496851775748644345556F3138572B576A4E776A47306D3774747954636F637A766F327637587A6A4630736879624C38686F5455635A4F47487933444F6A536842346645596C71454B31536E526971546E4E7864576D3663625367704F65306D767A722B4B666A7050482B7574714E704235466E71326F3347753669556A32524D35524C505239457467536474703466304B477A30314554677A74647946695A69523944546F2B7768436C4B536E4F6D6C546E4A572F6556495255616C6153696B7561744F4D366C2B6E4E4A4A5850724D737763715559555A4B30714D4B644E747257553477554B31546D3176375770476372374A4F793330383631674A5936657476765558452F6C7A5449506C5A524A2F71346954393362476F596A31624A72552B706C616E44522F5A53563947336461752F56363637573057687865437863416A504C6655416C54376443546B5A7A376E7070445A2B57763961656E39622B5333373033657A74752F58753162572F586F3774732F652F2F676E662B306434612F595A2F5A70762F6A483469384E5848697A7842342F3861793233673377725A79434736312B396A564C437752706676513263556B63386B7A37534D5941444E675638356D754671593746526F4B616A5463577052356B724A527664767675306B3937573150304C686A4855736F7971654B6E546C562B7334326E423031647A715164725755646C4A754B636E5A572B4A7058742B73766A442F6772312F77554A2F5A7738446542666A422B306E2B7970384C4E432B4458784F762F736E6848773159366E4650343775744A45427570623654543579364E6132396B774E784E6443474E705A456A444B43613461664375426C4432634D66556453636F786A4663796C6479537464614B336D33667933505258484F4E6F346A45314B32545536644367354F56354F6255483776764F2F4B6B6C6139395865535362617638416F623846666A4C2B782F3841747036572F6A48775A6F722F41416F2B4C756A32747266654976434E395A4E34633179326B76724B472F7459376A535A764C754C4B57367470346275314F3172612F747055754C4F57534E7A6A7A63646C3250796D764C43596C54634932644F633475386F32326C4C546C364F7A66764C7950714D6E7A54415A35522B75344E51546372564B4D6448546C625263756A3775396C6F7445666F7A2B7A2F727A5739794E46677670722B4F3241696B6557512B65434346416B795341344F4F41534741424665645A617964727063313933742B74313130505472525335326C7062652F3262705357753765336674305030462B78586E396D504E43726F67673362354D6853635A49487938456E706E763134716E7053636E38576C6C76333662333661644C486A314B6B484F4D594A52584E6478585858572B743774582B2B39744E666A72346D654464583857366A4F7A367130454578454457344A4145536B686E494A436A6734354942726D6A573354577658736C667954305674576535546A79776A7961637954656C32335A644F75746E7632335047462F5A792B44707559313863367A62334B78346B6C612F75306A55454F663361495A5556597476446F3744414932385674437455656C4E533174377969326F2B62664C5A4C7A66653631314E4F53626A7A614B4C576A6253626133303176727675724C54552B6F50683738492F325A39446769693069487774505A334B6A79596D6D52345177417A48475463537749376B354B656170596B48484E5535564B656C57557669737564577464585361736D723939744F783431574F4D715435614548507236783262566C61533173725853667A4F6E38566673392F444F397430316277354E6665457458686C5637432F38414474353544524D57797953572B53737473793438784E725A79514F6D61506171576954643772713761763374746C7636577356527159326E4A3070553475306B6B727252377476732F4B326E667435527266682F587266533951306E784C4C48716A777179326D7277526D4672714E65423972747A77733277637A44434F65716A50504C4B4D50614F4B5364314C6D62646B6D2B3358354B7A52366C42755555354E33765A3330733176713361312F4A72667166796C6638466C50686A623265686E784A46414861423767416C5146797A4654437A6469363477446735343434466654384E5659303851364C74374F305A5257377574315A37623236725A712B35386A7878516A56775561736C6555584A4F566D74396D6D3172717232374A4C71667961654A7450574F3446355A4E2F6F7A5069654E3845323130546C684B716A6D467551702F484666624E4B64355761766532757253306A7030743032743237666C4B6C5554696E4A543173333236616133646E663841493563434A535A597873634B664D67626B664E7757526A77465A636C4F2F4C4467675669306E613675722B6D3139663876386A71566E644C567061786236372B37623037617271646E34553862336D68335556735A3544706337787063573566477A626B5279786E70477962696A344957534C355344696E464F4E306E766258533674305474732B6F345361647239394C6172352B65763348313934453864517A57623655576A7559626D496C5561525174774759474738737477327854573768524D6755534B6F4A584F6331724E4F70547476654C58533062363676564C6C327672756331656E4630617A356665635A4B2B7231617461323931653636644E7A394676325576694446702F6958534C38794E61586B586B583135624D474C5479615A634733763757324C6665463570632B6F4B5333496547456A35647072386E3851636B2F74504A385467374B4D4A304B39486D656B616235485577737565326E4A58676F722F414B2B747432566A382F38414576683963583849564D6D6E4339614E4F7052397055336F77713035526F562F614F7962772B4A396D34786261616E61536250335757306A6C524A346A76676E6A696E6759452F4E444C476B6B5A556764315945486E6A476338562F432F746173584B436D344E536E4755576C38554B6B6F53306574347A6A4A586472717A325038774B75416C516C4C445634754E65684B6447756E46707574546E4F4D316579566F32736B6C6F6E6252457A5755514445627A304144595A652B636A6A6A2B5A352B6B6338376179626633503064762B4746484363746E7976617954533333573939666C734D2B79707964696B6475477831366A41362B334F656D4B506179567274752F652B6E6D2F5475397236466656586579697237364A4C65336D7450583537615666474D757136684C5A65447644514547706135756B314856434366374730574E2F4C6E76466454387478646E666232366E6D516E354D6B6271364D6868676F5171357A6D366A4C425947504E546F79664E50485670707547486C545633436B70326C375353664B306B7A394B794F68673848537235316D6C43645443594B4E734C684A3032336A4D584C6D35453450616854763753645A2B35486C53366F2F48483975507854713378612B4C2F677A396B7234564E667470576736335A32766965614A544B766944786C7145534E635333636B4C664F756832627572626D386D306C3879534A5273342F7250775A796644634F634A357A346E6353526973626A614E624559576E566650504B736F692F5A30614F476A37726B38776255765A5156354F7973376E395565467552302B464F464D78342B7A336D6A6D6561594F706A36634A586C50415A5454356F59584C4B6162556E484E70754D6E485252546A6458506D7239742F77415236623848506874612F425834656164617670397A6F4D4867335537354A6774786677327479756F2B4A622F5649764E565666557451697343467A746B4B33634D6A466C4172375467434F4A7A3347596E696E5049757656725A6738565377395233574568374770547936464C523838614F486B374E4A53683752337330372F5238463465766D395358456561703161754D785573646873464E4E55737362684B686861564B55727162773943553146786A2F79396B756B6D666A7270646C63584637484E654B6856415A35496D784A73686A624B51724443524769794F53323153647944676E6D7631437A3031577432306C625674365862626359717A563365375A2B77594B6C4A5961454936386A6C467475313235536B33717236637A31653972626F7850454579506558387A6D575A576C416A49565569563279547358444568507541486B4B4D486B56635979756E627A3662663841424E4D564E4A7876653930744537575772745A37327466547974314D53787332764A51675868776F5646494A5A6D62596F413634336B426A6E49485041364F637052684E5153753166563264303235506657792B2F7742444F6E525656586174427A67704F365439365337394C37766F6E6F6632492F426A3968625164542F5A332B4145657365466F373232306277353461316D357472797A4D376566665152366A64334B48615A593574382B4661496F42744150424F666873566A707576556139364C646C7A4A70336A6F395861396E6F74744E54396F797A4A61537775416E464A5270726E6E64705361664B34336A613970576276316A62613539742F74622F73522B49763230666854384F664139763479306253707668375933576A365265617973317A5A542B473955744937573930712B6A672F30713375497846473845305345376B77334279466873306443446A5555704F4E3551554861536D6E654575666F3476562B576836474B34626F3171746176683354707A785559777255616B48556F5367743234375364745670652B327533492F73356638457139512F5A6B38542B412F695A34592B49476E2F456A782B757557476B66474F3275745A31617A7374582B464E6E70673076544E48384D5236704A6333632F696A773363655871746E66335577696B6767585334493437636852746973346A6A614370316E694A564A4A71704F724E5647315A3874704A75334C666C38392F49387641384E346A4A386439616F566153707769345536564F6D366172516C3858745531765453555933747074644E582F612F396C2F3463793248786A385561636C3363616E6F30486B7978547949773877794864415A5342784F565946347634583359474161384746506D6C374F43756B31464E2B3765392B6A3158727262613174765A786549554D4F323031376B76377A54336C3156302F76374E6148363861316F747459614E4870384B424A7673796F584933435232544A795034536F50427A676E4F666674786168443263466438736253696C72657939473958386E6271664C3073517056564E75587337323576744A374B3062336137766F6D66694E2B324C38582F697238494E4C31715034652B42745538642B4F39613143545166426D6A516872585246314F644A504B3144784A716D3072706D686166466D3675376B426E6B4D6632614E43377161344B464B6E4B724E31326F553274622F453037665A33743365683978682B65746859787779557132796376646A5A38747279656E6D75396A2B624C2F6770782B79742B3072462B7A4234472B4F58697A396F7234672F46763470654E76466C2B504865692F4436393176777A38505068585A473038335176432B6C2B47744C4358393362334E32577472765874534D736B68514D753045563968684D526761536837474643724275485043636E486D536176766670666F3365316A38337A72433853564D7A784745784F4978564F6C436C4F7068616D4563715561633958446D714B326C6E712B3365374F522F59672F5A752B4E7678636E2B4F2F78582B4266696234746673756162384F666868344C316277563446752F476E6976346D2F447A58666968445A52325869547736497647506C7961334634756B74354E57764C4F4B4E4A4E426C75764A744C6E434A586F5A6C694D74784C717A2B6F306F3036733730706537475374424B56347537756D724A587531743257475259484E734A56774643686D57506C69354B554B37725648566F30317A4F643453617461556D30322F5058526E376D2F734E6674672F7456366870756866442F774461432B43506A447739346D67692B7A4C3468746C476F2B4737316F543563303045704C335668444F464569327432576B67446D4C7A47436976684D626749787658777465533537523546705A4C533356712B757930736D666F6D47786454454B574478754768517230703149314D544271637171535635525331393532765A366272736673764B737574364974786657306B4530384C6C34396E7A4232584B67723641597966384F504E63584358763739556E643670703975713132394E546F67314B396D704B4C74646439456E3657587965396D667A6A6638466E50424E712F774F31374D524A6E756736664964353241353874774D78444977587831417A3172322B485576375367396B3474617673303362524C74703150453475546E6B38327265376F3033617A744C3754394861337930522F44543475736272546236354C7469462F4D52302B3447525877725A4F63796B6748646A6B4267635A72394C3548474D5A573932562B58564E39395630386A3854676D6B6E723732727630386C33333337574F4D6A692B32754C64436933415439303734565A6B4A2B534535345232592F75386E6B385A424E524E4E704A4C72354773476F7954643765563335395054666535516C6A2B7979474B34696243485A4A6B4D6B7347306E6447796E487A664D434D67687367357879636D6D742F7A2F5038417133594F5A4B72476262355574664C757264553976586F747A304C777272543658634F3846794C69326A2F65414F47533573704858617336702F486851466B4338454B577752533736322F587976303733386A706C3730576F744A74506458545464395830586E6664365730507637396E72346C5361706557634E314E42623670707372745A58596C32537A524652357147624155536D496D57336467797A6349774234727738366F5371594B7243564E314B63354A5370327570303774795466617958586253367561537077784E47654771552F62527251616C546B306C4F45453558696D745A716361626A472B757661782F546838432F46467234302B4732697A754A5271576777782B48745261594569374E6769323970714D4C5A506D515873486C7971773444466C50436A502B66384134685A565049754A3862476E7976445936645447305A4A71584C7A2B2F55684B4B566F6369567462374F32352F6E423473634B543462347A7830493831584235704B6559345363745A5256644F70576F3155306E536C527163384646373276362B75477959416C59324A48626E5035456E2B587658785372546B766561555774343254746F3771316D2F31756E32507A52306F2F7932327537505A70505456627068396B6C35486C766E384F6E35667936666A576B4B746C644E752B36665331375762756E663841727A68305974614C38576C316654572F546670366B577153522B4764442B49486A614F4A70377A544E4F313636554548357266773159794C5A577041775934786377534F2F4F4E356C664841714D4E425A686A7548736D71586F30635A6973716A556C542B4A78784E564F6F74644838504B303030303266716D447969726D6D655A426B73717A574472347A41596555707150504747497171705753576B4A633846374A7436716D32303954384C7632524E486A547848385666326D764656334C72302B68576E694744544C57476153613975664533694F497A33392B6D35306151574E766643796764543569764C47564F426B663344346F56766159546872773779326C4B68567A47726C56664578705263594C4C4D7564576E436A424C525258735931704B57376254566A2B732B506145386251795867326853564E343346344845346C3065614D4B6557355A4F72547775466A6252786B735047704F396D35644F3334362F74646645472B386566465856376138766F546F2B6753663250625061526948375A4A624F37366A634D6864336B553372796F4378496B5962324A4A7750316E49384644413562686F51676F79396C526A4A526A797862684678352F4B54573637337462512B34797A4155384467384C6846446C35594B54625354646C62587A3032745A5730627459384C74786232576C4F384555356D7564724D386B6F52495537486A356C3278676E59506C4A59486E72587266312B582F4141443665696F77696C626F6E3839586F756C2B6D767A314F43766D382B51486177526D32784269526D4D4861726C5467626D783878794F546A6A494E61526B3230744572507076707036666763574B5639317066317372577574665031387A7550687670555770654F2F426D6B53455044662B4B6644646864484943474735316530696C697A6A4F575679434432794B4B6A61684E364F305A4E644C615037374B3530594B6E4755384C536437567354537053542F6C6E4F4F6E717650384143352F714B66416A774E6F477266443377765A515738617832576A366270316D717871306355566C5952517247465562534E7142526E6E48497238316E4E7A715657372F414D5364762F416E702B742B763566305734516F557155595239324E4B454C57747043504C357137747470397837375A664244546B6D53553658426A4F346C45324B5735773532675A2B683744676B3963576C464F3357792F72317337322B36786938645A585575563333535361767572583964653365772F77415165444E4D384C575678644C6251784E47724E6849303379416A6B5A2B38475541454F704278776657733737655839655A6E557850744975565371366C6D6C66546D536C706133332F4149507A50627632526643735457757065495A4C51787A36747172584D4C74313869337A456D346E35747171704B38344A4A375636574370796D334B79377131765856612F66766266653538726D754D35494B454A4B7A356F713756374E323154613153665854353350736A575162783563714D656578446B344956636A4765526A414147656D652F4E4C4657565466716B336262524A656433722B58545479364D75534E34326672736D3330665732396C6258706F654F654F2F686E34593855574D69616C706B624C4D514A5A554A53594D4F53566D5146315938456B6A42794D3446524F685261585047386E46744E5853327433383766384D6574674D5A69614C6359563237766D61746F7676646E74382B68347A622F737A65474A67304D57704F6C6F37497A3274355A57756F77757148636979527A52534A4B715A4243794978586E6163696F7034656E4353354F614C64374F4C32302B3754387446305055725A7A6970553343724746623366656C4E653834667974327572765250614B31386A307254763266764474747073646B303175736342445151366470566E595736716557627934456A547A574F634F5561524439317363447665486C55707854723148793361756B724E37703761626462506338796C6D6A70546371644B6C4356572F767862764272336D6C6664613262336156747931423850764433682B466F7254547256515747397A4447306A4548676D566F39323459354B347A6B353669764F6C526548622F41486B3533763773374E4A7932532F707275397A304B65496C6947704E326C62576F744A506C307330374A5836767131765935507841734541613354796B563871464241794F7077516339674F4D486E424A7268784555354A66433758767664765479367254386A7477393478626335533062664D2F75666E70736B72507372362F684C2F7741466966433856782B7A2F7164334248356B73544E4B4141707751704C4D6F4979784337766C4A493437633133354E50324F4F70754E6D323348572B696472376464466231395467346753784F5659696E4F386239567230647474666C612F646E384366786A38505170714538397557434F375333466D777736794F7A443752412F41644777566C6849426A4A425849424E66714874484B4D593873456C46617265373161386C74356475352B4B63764C4B4D4F5A754D57306E76645833666E642B642B3538387857356556465A77733638776C756B694D324655347753557757487074786E49427166362F72302F7255756346477A556D2B6A54566C6433365058746258387A7249744E506947307534376A4131367A587979426B5333746F6F4A554665444A4F41415969506D5A4179747974524B504E35664B2F70767070755A795630312F57357934676E746F34376D32647A4A62535451546D4E536A6C5542625A4943435353755677526C57446463564C6861377532756973766C2F774148384C4851727769704B396C46744C2B5A4A664337503031316672646E752F776931575A745A7335494A3972772B544D69686C554E4235716C356C58414C6D43546B6735637164754D4159786C4A38384975306F79556F4F6C4C61616B6D7553586B39336139724B786A4B74506D6F53697552786D6E476F6D3234717A54545374652B337074336639502F374158784367385261426436464E714D4C616D4C4B7A4D566A4B372F6144646155687435646B544C7357336E3033793252677833545146354D4D545838612B50475353792F4659584852773152596566746F564A52576C4F4E57556C506B377146374A587331716A2B622F7046354536754677476659656A4757467034694E444759684B33737165496A724F4C365457496C374C58335646744A4E6E3655474E537633677879523875446A424756794D44657652386473486F52583830704F7A555A796355306C65585A4A4B3975756A32307676726133386D796F537074703034754361355730395534364E4E36624A63316C626D747271376F495163387342786E4F446B386A6A734F2F486672546970522B303366706472353964656E5A373662446A52353956546976564C7930586631364B33637A2F697A70456A2F41416E2B4B566C5A7850484A66654376476A7774457065647271363069396B6261464F533073306A5A365A3374304234376545635854664676436B71386F5368547A7A4B494F6337636B4B4D4D51727864394F534D58643373392B702B71634D4F482B7458443157764B4D59787A4C43747A6E614D59714D306F79636E6F755661613670712B6A315838396C68347267384166734F6549704C4B4B356D31575834717A364F4C3051717046394A34663047357437646E6A4B79474E4A4C433756566B3433415A795154583938597243347248654C6D427856577253564C44634A4F65486F5647756155316D6464564B314F4F33504B685553636C61314A32366F2F71364F426C697645584634796453636350684D6777546F30704F30495676623158566E474E6D755A71667657657650364834506177376135346B75354352636F743038747863636F58534F527437627A6B356E6C2B5953456E50423536312B7577546A536A485A522B4664556E307436707656362F677630434D484F634F5A58554976336D723256727839362B766279746230647165704C6373746C46355A534A3353356D41415753595933424176496A6A41574E516570516B6E4A3475504C5A33652F7743432F77413739756E7A4E33625332756D7672722F77446937746E4E77504E4F51777769722F414171724841415033512B304D4F6543617A313174767232302B586B6E393270783130334F4D556D334A71326D6C373758394564703445757870586A44775A7142636F74723474384D333073764837754744574C526D4F435479754E784F656F7053357253733770776B72503030532F7966794F326B765A7244755075796A586F79693766432F614C6C64764B2F58753266366C6E3749477357372B426444754178614F6531737034392B4D65584E615253492F6637366E494F6634712F4F703255366C6B312B386C7031333839752B2B316D667638704F56476C6474793968537670724B54676B35656C372B652F592F51574C567253437A4D7A6A43716D342F643432726B642B6850366331452F685A35556F63366355724F36642B72744C5665537675333657506A6A7833343775764650696D32384B365171374A645174374C554C386E4D5561334C452F5A34567A6C353352533246427750666F71564E7A61656E4C657A76627466546635465636634B64463275705353642B753776726252644C7061706170364836642F4258777A626146345A5332736F6467746250374D6F434D5147594B7A794539514F7055734D354C657554373244696C47615562326A4B2F57326D2F665857393336613766453576566A7A516A4C6C69314F4B636D335A58612B4A32326579666E5933745175704C4A3369614C7A58566D5A67464C4E74626F78554573523150547467395144352B496A4A796C614C6261547448657933625779576C72656C74624852685965316A6F326F76615354355861326C394E644E72622B687A453369625362642F736C784F456E5946664B64646749596B6E68735A49794165526E6B656D6562327A6972536654723033316132333757312B39656A54776C564A754B6E36786A6131394E587172615030382B6D6E5A47326464384C4B755633444251456A504A58483136484F65335374384F314B53626B6E315776644A7066507435397771516B34744E5862584C3779303964656A3131567465695230747664323856737763686D414764724C6E62334A48743048765873527371625474665779656C2F5072332B35507A4F5259644E77397851635A75377337527674766F302F54743030504C66466570784262686F31436742747263444444506248504F6659343478586A597963484C52783135565A62366157656D6D36576C39394C3331393742595A7546746447395733747072625A74363373664D6E69585635476C624462694A4D416C6832474D4B426B6A7279652F485876356C5671557272564A613930723636397533613730305062705549526733647579744A5031657658384F766F7A386D662B436B6A50346C2B452B7236517A5A4A735A7A436A486469526B4563655636355A7A6A4F6634756E5775724C366970346D6D32724A792B4A70744C79623964766E72314F484E71616C684B6C4F4D66695331743553567465753239764F37736678506674512F42756277656C6A65586A70444A716F6B6B744C544B50634B30594F2B5152722B38454A624F313541417836456E722B67304D53704A326B704C6C57713937306173767533522B4F59374C58685A4B53626C3732715633797554623937302F424F2F592F4D335637473830335542627A525377547135386B76477959473450454D4D716B423377776648336367634774314A7071306C647458626536652B6C392B746E70667A4F4F657358477A756F743374397273322B2F665A76585A48702B69526632747039747163494D642F6275495A626D3358456953506C4753584F4133373151384D6F4F5932486C734173674E64795547744C5373746250587633306634394469686458756D7465756A39652F626638376F70617270516B31527055746B74563159433376593478497932657432364E5048637167417862367445465A414268586556543049724A71562F6864752F6E305674312B7232326438377A552F69626A657A543761332B5857332B567A70664157677961567145576F32364F4C573942756254652F6C5332747A45797065575570416261595A44356A5977736C75385A414F445842573576613253355770586933705A326533625276385256336145506565764E5A78646D39623238766561763150314D2F59732B4E2F774477727A3470615046725578746E306656625A7457754C4F4D7444716D6758354B587254573745355A4C575A35743052424E784363714E2B4B2F502F4576686572785277766D46476D364C6C48413166594F705A314B65495557314B6D7447354E75792F49386269544A6F6355384B5A7A77334B436E694D5A67362F7358586A656C4845526C375844756C5A66784954616E4278326B75795A2F542F6232566A4B735633594F6B326E366C464866326B715343534A34376D4E5A59706F6D5849483269466F334A444562393243434B2F7A657165316F56616D4678454A30713143637156536E556A79564B636F75334C4F4C2B486D61636C665637396A2B444D526C30714536754778455A66574D4E4B564774437064565953707478635A702F4337786B3758375874646C763741696E6F6F506346663663594A39616C5456335A75363374652F54737476772B347757456A4737354E3272653966612F564F3130372F66366E5933656A785839766336664B686B743951746269786D52736C4A49727543534234792B4D4175726B452B2F504E65486838524C44566350696F4F333150463450454A63334B6D34316F4B6574397556757A65375854526E31734B6361654970317659742F56355965733436763359316F6331726275796174392B6C7A2B4F3739704458764648773438492F466E344C366F306B4E6C704878533144564C575A32574A39396C5958326A4733695256544B79785469564A5759792B6444776334722F5666682B686C326266367663585263485678664472776548714E726D69352B7A7176336C7370526A793658764A70656E39755A5068384E6970566335556C7A59764C4D4E683655392B576471636D7076564F384C713858704C5236704A2F6C766253473030365739534353533057367437587A536A47475357574F526F37557A4162544B5934355A3251735468564F414F54395770707A354F7156372B61646E2F772F716A32465668474B6A7A637A6153626A716B7650747266547A4D5330582F536E6455556D554F4979636C51504D4A6B6B555A79306779656F36437444546C656E6D6C6235762F4E362B706B5872716274747079424D47336B626546415254374537647A444F30456E696A623866757471637453536A5769326E614D30355056617270465856316533653564686D387662636F784274576A6C34366C6F62694F6341656F594C315036646E477A356C61393474656D6C2F7958366E524B566F71634E4C3873337264786A54626D377039306D74393266365250374476785954557667663841437255306D545A7158772F3847366847566B2B5A68636146597332386E7179534751487554314F545835316948793136796C2F7A386E7464706538394E64757472666B6A392F776453465842594F6261626E68614D6B3962326C54736C356372613065316E61396A39414E582B4B384E6E6F4E784C504F724B74757A41492B585967664B4F4F6D54307A776534394D486158753672533630327337664C742B46787A6F7867335A4C5871766B2F77444B397258507A597550326B6A34643855616A7163734E3262697A3858572B70576F746B33663650487469615358504F3249452F4B674C6253784134716F5869724A3958382F4F7A32597078707A696C4E586C5A712F524C572F79585473376454396A76684C2B334E34575477736458754E643075797435644E6A653561573868614F3358792F6E615A6D49614E695133794D766D72794E765375764459757252356C4B376A4A4E4A58753032726276703136373657315234574E34656F347955616B56565670526C712F646359725A4B7A7666356164477850427638417755482F4147632F4575733346692F6A36332F74615635496B4E35593668615730344446465732753549504B6E4259454955796345484849465976454E564A546357303752696B37623736646C2B726531676551562F5A3873473451692F615370776B2B654D5530756266524A61745736325A7666454C7844712F6A33545A2F456E68665437694853724C7970744E76436A777A616B38587A503555624153506275674C4B7A41427341635A72437047556F4F5330585A335475322F533974757437766336384C484434576F73504F7136744E74546D755A4B56396E42752F33323076324E6E346366457A2B324E4C6A5353342F66524E355571757845735575647278794B53446C634850547436316447716F4E4E7264573156306E74646439572F78323639654B776C472F4E44333770535362316A47576C6E736B3162532B6A38726E75384869434E37556F3067666A47374F446B6A493541354766586E703656317A727974704E4E79547635616171392B7162576E5831504F68673563376E4A717A643074302B3137664B3758612B35357A346E3142357959777556474E337A6B41676E746B3548556E3954586C316D6D37587530372B6176662F675836364C59394B6E545546704A5056752F613674325358523266336E7A6A3473756D6A6D77716D4D5933626732547642423447514D4D416576412B68724B4D65643258566157322B65377439374F75556C4743636C6457562F512F4C7A3972332B302F45533257673664456232652B756F72667951537A48664B7533675A2B556C695A48786845516E31726F70326871323361316C644A33625771394871373374612B6C6B6339626C715535526A47386D6B6F726F322F4F797339642F6C6F7A3862763270503256374C77377056313476316949654C76454E3549317A66337433614C426F2B69324E6F6A655A595732637044593263514D6A5348627641615A32347A58745A646D437153396A65644E78664B6F79566E4E4A61755064625766572F332B426D57535656526A566E68377863484F636B6B6C425762764E5875374A4E3657646C7470702F4C74386339563058585069467230506875627A4C4853626B5773463034444E654643535A72566C346B7359334478774F4D6B6F416334497A396453767978664B39553774753975746D74316670667A737A3871784653447855364E4C6D6A436D326C66616F6B3763384C3330585A337576506268664266696E2B777457617731414B4E4B315355527A466A6C4C616554393339714148534A38425A7742386F564A467779313255707868653862387A73756E3432383956364844586C616F7571636236577671394E507633732F58552B67745A38507A33466C5064324B46377133574E3455624C47575333416C6852337875596C5238732F526F704D413963394B64306E334D3237614A5862394F326C2F774166784E6E77514C472F3073335449593949316B7461366841692F77436C6146716B653646622B49344C357470737064527674453842436B634C586E34756D2F6A623063765674326230587065372F54553561314E7452566D3962744C66713739743171645270326F366C345338596155756F5776325857744A657A61473973325957757561585074564E51474330647A6233444B7373544173466C4C52507462495050434D4D5251713465642B57533933523276716E644B377374625731767230732B7643566553705171754D6D364D7456485353536437704F2F764B4B6665797666552F724C2F59352B49656D2F45443452654749494C686D754C6652526632467449584C7861644464505A332B6D415341737738503674484C4172732B38326433593768686B4E6635792B4D484431584A4F4C4D78784559525748713134303532356B3531616C4E5636574B5332564376423149556D3774546F31453930667954347135437371346E7A5045306154574878654F64525455625868566F7872557172646C654F49764E553375705571696C3050725A4C5865674C416C675344387048475146504744786B6A32432F537679563148653057347531326E706462573154757537333169316F7A38336A51636E4A4A71504C612F4E726136756C5A377676726F394F75766F49303934774742355571793841414F6879474139546741416B2F544854795A31616334754F747070633231374A707132756A56723374706F33716A363265466C464F4C73314F446A4E36793062357430753272323250354B2F2B43314F67576D6966482F56744D30505478444A346D30765174597534593435466A4633714671773157397877686C754A494A5A53324371757859446E4666364F2F527878303878384E737371593662725043593348594B6B356171474877303143696F7075366E474C61622B3072506F7A2B6F2B4136395758414754516B34536458475975684B6256366B71654471526A54744B37753758356D3763316B6C726F666A663477747248522F6831384E3753326E6D533931326678543469314F424D4E5A2F364C66782B4864494543413773724661617049397A4B4E7A4E494175417072397370546C5046343958546F304B744F6853745A75303465306370744A4C56704A664A585A394C68314F574F786447707254777A70386936336E466645765258313057336B6562526C726144375577447145614F33596456494C4153416738354A4979657055313148707971526A654D7239456B6C7233536653372B373557767A73755449574A425A77535165684C444A394F2F4F65754D384767354B76767474333772587472303057312F5056506F7A5268525874384435524975786D48494462436D5341434F6835372B337170506C546C32542F48633634785536617531797A686162646B3470364A337671373375764C72592F75552F344A682B4B35504750374958774B3151546C626931384C48772F4F454A794A2F4439355070336B6B672F4D336C4342694F4D4B77427741545877476177554D64576A48613857327472795633622B76387A396C34637275726B2B446B70633049526C54546176654E4B584B7274766531767A374E2F7068346C314A4C6130746F5A4C6B7865656F57586378777750486334414A4A7A774F41613459664576362F72585431506171564A53744A323058545A7039623939506C667365422B4C66672F7058696D35696D737463736253365A476B6B5558456173322F42494F334C6C674D34485534794F6C61373762642F507476312F5272726F6F556175496D6C53684F70474C744C32643034742F447232367676736A36592B4376374776672F56744C68764E5931797931615757534B57533157355037786C485357314D69426C4134494D5A42366B6A4E462B327638415674664B2B35317A7034756846552F5A56577164766435396D316658533931756C625462644836632F4433396D7A3451616470566F592F446E6874745273585479764F74724F61514F67475A62637942326A4A774D376563446F534D6A6F77394B54616C4A58533276717572587075376271393757506C637978654F703135386E316943714A786E6161543558756F3930317036644E54366275644B73313059616246426177517751434B464930554C475658436A436742565049797647446A484662565735576A794A4A726D305375316F76564B37303639623733386A44707871387A3970435462626A556E666D7671724A4C64583276617931737A38322F69684672487732385A50726D6D51764A6F46375075314B4730624B574D3748696341645970584942394736386D764C6E654D37522B4676644F37747466537930315239726C6C534E61465345307664696F7039563031646E716C317632364C583248774E342F6D315333696C626571547141706438456B4B446B72327A6A714F6E4874676B6E5A703765585336765A50394C2F6561313663594E52696E79725854572B7258333658767231387A734C2F41464E376E7A584C5A6261434E7042783668694F7037645071656D4D5A717A566E646258643775335858314D374B3174625774352F77426668323050452F474D6B68696D6D47434657514E6E503351707941514341656E50313961555A4B4D6B32374B396E3057756C6D31736E3374596D745561393158617374724E32747133756E627232507A64385266452F7743414F763841784738512F43507864386676686638414376346D3668483466303633506A62784E702B69532B46744A31715A376D54784463472F654552517A32304174444C484A35734564783567436E46656C684D486971754F77463646537268713164516E4F466B36554A4B37556E716E4F566B302F4A333031504D78754F6F5573767A4B6548782B452B7534664454725966445371777031716C574B566C44564E2F456C4A4C5434643954386150384167754E2B32422B7A76384850414A2F5A5A2F5A6A2B4C656E2F452F346D654D74525758346D654C50422F69622F684D7641336858346474703057644E304458766D333639346A767A4973736345306874744C7973705233417237542B7938457138613670766E7071564744356B31614D6D377974764C733761586132507974635635394C413163485871716E3961693531366266744B6B484A4F4E6F5655373273335A6157323648386969334B7663326B75306F6F4C4C7633456259424874326E4F54744746493634475458656D306B6B75565864317664394733667030762F414A486B552F65564B62316C43507330396D34793335763533644A715474325630696C71747162613742514459376E797977354B4E6875764F526B6B5A3667394D696E735A316C3730666431535362643362394F6D69582B6158315A38496647455774614846706D70596C3162545932746F7048795A4E5330364E766C5448575337733135513873305368446E4664564B626B724F326E2F41414E455A333174312F5475646A3443676178386236686F4D705344542F4549767452302B3550797772713859336D336B5437714C65524E4449696B594C492F48424E5A59744A30342B756D6C3957724B2F6266563941396E4B627447312B5632767470386E3338765536432F764E4F30335657384F654A30754C62523537643952304C784E5A4672715877786479506D376A742B70665430755556645230786A354F3043367478484B687A77307661335377316C563161356C65375435744976653657313948354850566C5677383337525256463257697332395672507064365072797437376E37692F38457A66485773614E71622B454E647530314750564E4D6738612B464C7A535A576D30375733566F6443385A61647074774D7843307562493666346F6C734A475334676C7370474B4D554C312F4C763067387070597641304D32673656436F6E5579724D597A53356147446453574E7937485646713475552B66423070744A4B465A552F5838363855386F715A6A6C4F427837396C5368687138387578645770464F4E5444387272554D58472B71645046632B48707A2B78436168716A39317673653074744F386B676E61666C41326A6F4735412F503638562F457A714A587532317A53696C62566372736E6265306F3261394C644C4C2B5A4A555A527646576B6F7A6B766152566F5646643263477233533154382F6D656F54516A47436A6B34794D6A6F51526734786B34504F6542375634314B5548644E785739322B6C30316257332B623648334B673432556F7862656E7772625464644C37507072627166796B663846744C667976326A64526B5A704959312B476E68647A4D52756133427462307A76486B35796F6A5541726A6C6A6E71632F77436958305A56375477326F636A356B732B7A4A3650525255627679617679766C627476747166304E7750464C676244793559786A39657862696C396C7972782B464C574439337033376E383839327A33333266456335613269677455696C5A69734C6D5761554A41724D635174352F6D6B446147646E626B6B6B2F7742464B79756C5A4B5475374A4A79646E647965376175725074706F665859657A55717569633763303272796C614B53546537533356322B6A304736724969704461784142597769496F794351636B2B3248666551435341765041706D7266703979303661655833503841472F4F797759592F4D4D626970474F354A42414A48626F53447A7A7944514B66764B795362745A5753766472582F67394C46335455637854512F63565A5175352B5172484A516B64514E774134474D636E76684E4A364E4A70744A336474394C3338742F4D6D68467053556C614C737665387462646539765332702F564C2F77516A2B4D317434672B466E78472B444E35654A2F62507739385577654C644B745A4A564262772F346B6A573276567434326263593766553764586B614D46554D36416B62736E3437694F6A374F72683679764B64583365565261752F68563974456D72656539726E36647752695979772B4D77565353546737306F76764A716235452B6A367261373136322F656234782B46646138522F447A5757384C61672B6E36364E4D6B5453395168623935613372524551584B4B6338775346587777493435424752586730556E5669717962687264586175375753756D6B72766638414A3350724B7A765361684A6379576A76707A4A70657437374A3276716D72364835442F737157503753756C664572786834482F616D2B495776782B485266324D766754346A57756E714C6679424A634C71566A7274785977466F345A466B676C68764A3056597A4330624D4133503031436C67613845714E6F53684638796B6E4B3774705A3266646458387A7A3357343377644B7658777970313848464B6168526A446E5546485653315462746F765058632F6F4638462F73592F4550552F4450676E784434562F614B69765A74566E736B612F576132654F34737451566D51524C424B6976694C797765705971636A63534B326E6C464F53685A78543633566B7257336661362F386C656C6B66503066464C694443546E44463446314B6347345536627737556F746174565A3872756E644F55723374666C617472394E332F414F79482B304234553033586453692F615530533074394638507761764846714668615259654B4B523769612F6437685A42613755784835592B595A494A4A7A5738386F6E474362785642526474495775746C7175766D33323636574B6E69726D65497178692B487344555570637359516F7965736C5A535455484C713232744C2F6838482F483339705839706E396E36773079772B472F78413033396F507868725768325770614C344E384B2B46745238513666716431647A704450627071396F5259324B77526B764D6C3165785352443567705042387246355A4A564932786C4E707853764739374A4E75396C6131746E31765A3350646F5A76697332672F61634B78637271456E474653484C64614A4E714F6A746F377254513637396C6D503841344B4666477A51745A38586674652F445034632F434C772F7241387277723451384F616E65366A3477617A3878392B6F2B4A72615A354C5054677743655242437A53416E35694D5A506A59364E4B676F787031593170645A4B39755A65646B3950505839656A423136735A4F46664259584C33546B34714E47704B55354A5773707476346C317664707672716663326B2B46662B4565744972534A6D44326B636137327A6C74767959396551637365636E6E4A727A56556632727539372B396630364B397679646C6178366B4B73616E4D3230375070722B6C33665838546447377948336E35755431415050545054723739735A70637A625462623158562F723561666D4F566D3362622F67487A62386466482B692B4150436D762B4A396531434F7A306A77356F326F613171553753424674724C54626153387570472F685A764B685A567A6E4C6C51657464564B4D707A696F78757053697668356C377A3765576A757A67784D315468557250344B564F633561325355597475543376477931586F6635695037563378753158396F37396F6634732F474C5758653466786C347631572B30714F65517A745A65486F4C683758524C4B4A2F6C5A59494E506A695A5547465573534F7466706D466F72445957686834766D6A4346334B7975354F334E7A4E395539497257327666543850786549574C786D497856576E42653261396B6D6C5A30396556786536556D6D354C537974666258353264576A625947324B787A6A4277647850516B6E49776344424A795072572F6B2F4A373974766E38764A6E4A4A652B6C486C356272662B38377458535856394F335A47684A4A35554B52634E49674C42675278754F4E7244474F2B446738394F4F615A31586362575374625452643948627936583037473371554573756E576C79777A4C4662516B73526A473341494F526748333645354E41756E7A58366C377774717435706433466632784D55396E6378334B465732594F38435656783667413773597765654361714C744B4C765A4A70767A537630362B533767317A52615354646E5A5736726137742F566C3150717162575471756C3658346E30316F45754937714171596B5658676D686C4C53784D716B6C6D51764B4779422B376B473368526A65724B4D7449326C612B6D6B743946355070667975633373366C34614E572B4A2B576E33704F3133725A6432565045327543574E6454534D3346787073366134316947337758756D33622F41475856624734684A47364D504C486378395468386746633538324E366453387277532B31727070612B6D37333336393376574B744F4B74377A5558654D6B7052766462725A4E7271313253567A37312F59672B4B5670344F3150526462384E3631714565693248692F5264626C73594C78594C6E544E44314734476A654B4E4E74307574366D4F4F3276593537654643724E62527978746E49723462784A34637038515A4E5777324B67716B735A6B6D4A6F5536314F45464357496F786E566F55716B4E484F626349786735702B7A6B32303031646355634E484D4D737A504B3530566971566243313479684A4B616934776C556A474B6C653337324D65567861744B37395036387447744C6D35306A545A72756543356E65316A6C2B31514B504B6E686B7739745045464A775A72646F3570416541376E62786A482B58474D6E474F4D7855495835614E616547627462337350656E4E624B306C4E4E61575772375866386934724230714F4B7255714E4B6349555A546F546A4A713061744B636C4B4B54656A6A644B566C6137736D30726E737073674148637674427831376B656D4F667736667A38534D584739374E58765A375754587A6174665464765A6132507248547074365537743947372F6931383739487262512F6B762F344C3149306678746E6B746261346B6B302F346565435074647972704462524337764E5356594C6C7777615933555A45515542736453437552582B69483057336277366847565330355A396D6268543175344F473974456B6B76507066512F5A2B4559553666434F48676E4B532B7634757A357449383152564C4E613678636556643039394C48383979717947536558506D704242466B706B6D645968474F526B5967686A56755143547A6E4A722B6B2B75327A2B37542B6C362B683972686B2F594A7252616164316F6C2F5833704E61303572654E32636B42484966664A79794B57436E6366567476796C523930386A76544E3432543174613356584F63754756626D4F465742696A423550664753574A7A6B394D446A3865615058532B31394C2F77425775764954616932393072364A7464394C2F7744446D6C614B4A724F396D41414B38522B70525747344E77506D4B6B454E6B344249787853667066742F58542F4D6A327175724B32795633644A363636726F746C7036392F7158396948397079382F5A4F2F614D38482F452F45307668655334486872783770385A59747148673357326A68314E6B544F78376E544643616C614D79376C6C74384C6774787835686859343344546F4E714E543471645355564C6B74625A4E377537576A33577A756B65706C475A724B7330703469634F656A446C68566970387271516B374E743261676F33626C765A58642B6A2F7742414434512B4D64412B4966682F52377A51395273395930547842706C6E724F6A6178624D4A6258564E48314B465A3747367432354478797775504D556B6D4E77385A78496846666E3755366461725371553551644B33583433746471326961392F665456577366736361744B616857684C32314353546A5575724E7656787576572B747456733365336F732F77337439496C5735476B5258326E3342667A7846476B30694C4E755631614B525853534E6C4A334B774B676A6763636446444631734E4A5470533031646D33666F6C65313175337675764D394C4B383272345046786C79786E526164366330743166666D7647317432317174466270366E34577476446C6E61574F6D526F3846704379736B477936736B73326979596A6143335A566863466A79674148384946656F73356E4A4C326B484A58546B314E4C532F525730652F54756C305070703472682F474C6D725948445371315533566936554A4B5570587672464C52704B2F7A535070763466654876686C72567A6633586A5379317A78446476594C6157427474587533575A597733326531766E755A47453174446B6E5956347951666671705A70675A4F616547717A62684A4A4F7247463361366265765879313657657138444D4D517348476A2F5A57477958434B6E56684A382B41565772374A723334303538336654572B313072614C3350776438506643326D54517A3654345430765337474A6A355563646843686A79434D526B5271527964785A546779445050627961324C55334E55344F43767335387A533130625672376239566251384C4D4D39782B4970314950467A6F7070387977334C536A653937723362712B71333031313052336D75576473694E67375330515574334B6F4D67535A4279522F43464148714F4B3865764B55755A50374C394E6E726F3237333354332B52354E486E6B34796B2F615853626C4A617A36755570645A50346E31636C6255384538513749726E6735566778594D7777463534366441526E50364375512B676F367769394C4E61575674453272767A2F72716561617272634670627A454D675350632B343450412F68427A7A36392B2B4F516154646D757A64723976502F414959747953646E66612F2B58336E346466384142566E3468366A2F414D4D6E2F7445582B6C764B6D6E616634417639506D754157564875745775494C4C7939366B664C73636F51443832534F6C65376C644E4C4655494E364E70752B757175306D2B6C767933585138624F716E73387178382B586D3573504F6D723330645263764E32626A652B76573357782F6E35573173785A4664517A4A41506C794D6B4541506873664D5758355144307838766576306556705648464C6C35597776625A797337763733725A612F6966683858556359717A6E7932704C7963485A7966666D56744E4C4F322B724365457558675A534A59686D317767496B68587157595977562B3665704F536661706161647444654D47724F53733031707032587233743664536F30586C474B5351446E6B676B6E495567392B33667436556A542B76362F723772486257307776316C737056796A6F304D4B67635A534A47444D77375A626A6A676A42376D67503676304F6630686848635357386A62474C6D4A58366B6B4E73436B6E414B676A4A3767643642725239562B4631756C382F2B43657865454E52466A6633656C54464A4E4F317931743534515379437A314656654A4A3457336256456B7174444D76527570786E6871584B372F4B3366356C6333564E71793176615373726157646C71374E2B6E6D7A7664476C56645662544E525247466B6B735452794B534C6A54353431747270733442667944494A6F6C4F53465658482B7246633165376C4B616731736C72703074667066523664724F313975565772564C5735565A3652613157692B666E70397776775A3851335867543468336E68315A52457133627778326A73306355396C636743475A53355A53384A595376493347464F4D45416A62455561654C77373970446D564E5163564A704C573374457571356B32744F363057714F66417965477A534B753154646545616B472F69684B664C4E63327154555A4E367072523354315037722F414E6B72785846385250326350684E347457356B6D754C33777861615A71556744686A7133682B4E644776673238737859765A712B636C574442675363312F6C44346E35542F7139346738545A5837506C705573593674434B6A374E536869484B7570704A4B337838725674576E4C795077486A664C36654334747A6D68526771644364614F49707835622F414D5737356B306B746265386C733166573539714E476D4475417A323238396662766A3965684F612B46354939722F6A70313030576D2B75766D6350496C5A712B6C76507276384131703548345866384653763265495047397A38542F474E2F706B46324E552B4733687937384F586C343861326B576F2B4772715748566261596277384452574C78336C6C4D2B56653557594D753067562F595830664F4C56684D72797649345435616C4C4F4D664B76666B58744B4749536868345735655A38736E6F317132374E746150394D34527871723566683844446C584A6938556E44724B584C6479585270757A76707339647A2B506A5839506579314336694C2B5A4C35684E775649565937722B4A47566633616851454B46506B6464334147612F744B6855397054556E666D62313030563033386C6F6B762B43666F324656534D5770536B345730556B3031726252583276316657336D635A71726C4972495A587A4C69514E4A6A4371436A4B4E7A414442387A6B5A4F414176765772322F793066794F70656C3761746558582F6745766876516454317256626D625437567271545272622B3137347752785350426178544B686B6974705851334B497A4A756A5257647478495534357A7154644B304A4B546C4E506C61584D34757964323164525771753233703561475749714B4E6F32747A4B7962535775362B6273374A702F4C6372615443437432372F4E484C65584554715474336959466C49424735656D53506C786B6A4143303454356E356371653174623266394C75525454636F7155627656336130317662382F53396A50764E505A4C4E4A524276513341695A7A6B67444C66497747526B34357A7A6739367179543574627274366450506F644E576C47705A4E615735644A4E5856745533765A395572335639542B69332F67694A2B337766446D7661582B797038546461387146376D65352B432B73366C63455270504B544A662B414A626964696F536337377A772B724E68626E7A724A51466B515638396E754174624730746D7231306C6438307445326B723276655637322B6533322F435766636B586B654B62717870336545636D6B6F32584E4F504E6F35535730623375724A61335A2F624A384C7454306A785659787063655351564346536D316B5944444B33584C687751364D4D71774949365A2B52693365587935576D6E367252335461313132576E552B346E47644F6C7532716D7355306E4A4C644E5330305374652B3972616466656B2B46756733336B7974625273536F4D6234555949354C6256786734376E36453176473174457474646E3670392F36735254717A70303161555539656233646E5A62507A3762577537614871486844774670576C44644862783966764263456A4F526B67486E74376A32354C31372F4D382B74695A7A6B306D37614E3376653666523356744F6E65795055355A344C43467943713756495542526A4750624F4D44365A357A555773374A37327672625A32737656337676627465312B54326271744A3361626437364F545430302F345A5830317472355A346F38533279704B664D5546454A4A37376943446E322B693536396338636C56704F70625657647261396E392F2B657036654668764678626A6F724A4A744A647462333174763266632B5A2F475869753174346D6472704449516373447A744A3950396E6E6A417A78307A584E32382B3536394F4C73306B3752365732373662395639397A357775745831667864637936506F734D766C4D7A724E65755346564351537934794D673577416534394F4E4978546972726470582B6233374C75313544717078686654565873392B2B33722B4639756E776A2F7756672B466B6C6C2F7754672F615073744D676B754C365077584471317A735165624B6D6E616E5A7A336B68593868646D35383534476139584C4A763637517531626D61335366613766563632394E2B6C2F6E7337637035566934644842616158617635614E64372F4144765A492F7A754C4F525875566B62357649534B665A6B6858686A56642B44314F324D6873444A4A4763487258365A37716E4B326E75517639316E2B6E58552F4971625559766C57383557666C657A562B71372F6663304E51746F354757534E6E57556B73696E4256654E2B2B4C627736464D4267656E553834724F547532553558577156394E6575686D3374713178624C50456F334435752B4559376B6C697750546235696B396334464968786C4A4E52646E71372F414E656469625337706F496F304C59756265636B6334506C4F716E6357344C444B6C6366515A363072372B583966312B4A5354696D6E4B377674727470313266665870356A4E5A74536B38562F62484D4E31746B55723931474A797935414743546E75656D61596A726243575339734E4E756F636A37464E4A42637370775330724752636A71466A4956386E3349786D6B2B6D6C396675382F6B56487270653661743376622B744E543646737A5A5844614E716B696D53306D52594C6C7A6A664532784962394E3449642F4C33666155584A506B79526E6F70464E74744A577572725474352B6E64646676764D6163495376434C6A4A71313331546175726663394E7262476E34672B4765746164346A306E786E704E3231337039785A694F3461326A5361622F527A746565574E666D4D666C2B57306D336771534F7552555536333775644E78752B57555772704B79576A562F35643166527465614F5845595045786C567259644E3148475469374E7032584E753757656D6E6E644C7A2F71762F3449316647473238652F414C7852384C376D65476257666866346B66556249466D6976722F772F77434A7A4A4D786B7458415A5270577357313362536C4F504C6E67376E4666774A394B37686970674F4C4D7634707731563163507842684652784D6F3037517739664C34306F747474323970576A583068647478704E3930666C33694C677164584734484E346638786543686836734C667736324535597A356E726156567A556F7076586C6B3174646674713861354A4B343548636E676E486242347A2B49722B5A624E7032646E5A322F7976305436766F7276795068353033666F72365831333737507957322F54552F50622F67714E346A303377542B784C38592F4656333545576F4453593947306557534B42377153383161654F324672626C766D4D5470356B6C7873334F6B534F7841417239753841634A69636278376C31474D35796F595A7A7864537976434C557663555831546474394E2B79523964774A546D382F7739474D5A2B7870304D546961737557584C46796A4A78616261767372376572646A2B41762B304C6E566A654E4849466C754A3265514E6C3344413566445A42494B6E39336B3451634541746976394B493034777672377A6276707971316C70464A74614E64656D7A33762B7A526C4764306D334E2F45756C6B335A2B585333585672317A645174764E617A5A3477676B4951416E437571786952537049774356775431474D674867302B3137785737646B374C657A572F33443562505671313372364B2B6E356570364E384C4E4E6A45506A37784A493569625176436D72586C6931327477746866616938517446303050456F41767A4C637754574375336C4B304264304935726C7846537052686736634E616D4B784D715657484C6F715462744F396E4C54533174573932374842696E4F7050443059714C6E37573872742F413955723233642F75647A7972545A555632675633665A655A38782B7274744B794F2B506C79472B36635A5A5779613368446C636E6133326258756B6B332F5839584F39714F6C6E6F6C7975792B3147334D72614C722B42657679797869474B526C52574E784A47477A47367A7141704B484837784364797344786E6E4661505A2F68367256666A61346B3172652B316C39317636372F6E7A554635714769366A5A367470463764615871656D58554F6F57462F5A33456C7665324639615343653175725734694D636B4678424D697978537873727136384535775574506956314F304A703670526B2F65533333576D6E33457A352B56537054644B72546171516E4853664E44564A4F7A333156746E647131726E397A6E2F414152612F623338626674442F42573675506965366E787A38507462745042742F77434A544956745046386161636B326E3674655134325775744E416E6B6167343278586B6F2B314844753966435A7867614758596E6C6F71314F7570565972716D333779746439586635376E367877766D31584F63763538565469712B476B73504F61326E4B4B6C61566D39485A4B36313136732F704A384866465731754C64546458556362624577504E47446B6773567A6853707A3144666E586E526C466158657233647675303636572B382B6971345653535769566E6F3164614C723076726F7572386C5939743076346832486B4B7A585549544847317753435277634135374872304E4E3159705831387474622F4D344B6D426B3558696C31752B5A626165576E6F722F414F5847654C766A467046686275583143486141774B724D4E7A45354149436E6E6E6E48485076584E4B70467461387472763841725864367258752B6930306F59475557704F4E316F6D334A72667073392F503139666C6A785038414679393171346B6830314A4A564A4371593932434F696B6B487165767631787A6765644F76464F62546C7A7139704E614F322F5872397A31313050616F3452515432696D377470362B6E524B33627A73744763785A2B4739623853544C63587A5475476C583930432B64704F4D6265465946654F325054465A70314B746D394F56715774303964665058723557566E30593552703879684A74722B626139764C747472644A376E305634543843326D6A514B3864734E344375354D5A5673746A4F547478786A48515A48667658664353555665313162302F7A66352B7231504B72313553646B31706F326D726564752B71326539394F6835562B3148384B37623476384177612B4A6E77787662637662654F6642586954777551714268356D7136625062327857504133534A644E42496E50336B424A484650447A396E5870535461537152656E5456666473722F356D4D71634B314B7253714B38616C476F757139376C76485475327630366E2B5664343738413633385050476E69337764724E7650593674344E3851367A345731433275597A48504863365071467859797854527341556B6B696956697042474842424F63562B70304B76746F7161664D6E474E6E30656C6E364F2F54665474592F4635304B6C4770576F7A584B34565A38716638414B3366736E3832753974444B75494A6B30354A6B4A62374273654E38386C474F444565426B376378734D5A3267453961334D326D742F7A2F414B2F4575785145572F326D4251304573534E63525A7A735A796F33494144674B53466247434D6A71656745585A333874503841676E4E61725A6D4B34573469795969775239702B554D435351334F4E7259777554387848484E416D373673304C4F3974355958737278314B7A4B52487741493362694E674430566565654F485048513041624868614E6F4A372F5435574C4C4A454A6B7A6B4B7A57376244494F4F56574D726E3141796142725270396D6A324C772F49742F5A586569506469336553524A6450756A31744E5152635174754277734E7966394875484949324F704F6475434679616C46704A74744F335457337272763539656D70364C6F486A6E574C66536F6B3147796E6B2F736566793734433561306E67746E6B65326D43534B436B38594341756A6F5662656B674F4342584E4A55303758643775396D746232736E5A374B2B76706F7478653071776F553475796C4678357432756B597854306261303356374A3366552F5A6E2F41494A4666474C5464412F617A304C77557478496F2B4B4F6861766F63734E33613231764777653066564C41523363544B4A626A2B3062435079304933743572715076477635382B6B706B557333384D7331786B49633954682B746873336F705757744F616F316E644B3766737173766454696E726656492B653478793344347A687A487545584C46557051784E4F4E6B72756B6D755A757A562F6664335A4B31727032522F57723545687A6E445A48714230796544322F586E317A69763841504E4F4D766862612F472F3966316F6669556F565A586253763030622B646D6B723974644F682B4B332F4263533775496632535A744E6B736B6C2F744C78666F396A6F7376326B6777334477584E7A713136305149685879724B46346F6850764C6D575230565732477636642B692F54623479784E6155334A303874784C6C446C696F78555A5268536137747539394574643361352B676342556173612B4C72516E4B6336644B635A4B5774716155755A4B79765A33746652507931742F457270656C79714E5275706C58374F39344C53456F78614E3379574145696B593365586B6A7156446A30722B39366239704F4556716B3779657569696E7A5874306632652F65396A394267314A79752F5A7547716B743364725473306E726458732B32373658787670723243614A716B6C737470486536667145746B42634C4B6B71574E7A2F41475730734D436C764B746D6D676B574E35483347534B62614E71696854685564546B616C46565854613130736B3962644C623273395861316A6F6F766D6737506D546D30323937707256612B61312F5466734E433033784B767761314B393036656534737461312B3030323874424B375278694730754C70456868636555586D53497976645A4C71304B51786C647833544B555072734B56314F6F7348557843676B72553354646F797072347457375076713159354B726A396469314A4E77555A5833356D746B2F6B7262666A632B6639432B65363246697171786B4B742F4877636E6A7078676B486F654363357A7272654E33756E652F567072627675372B766B64564F626D355274464A53766F39584A765736394E57376236626C765572687051714C77424979786E6E4C4971694D37797651416F4741586B6B6E50464D3074333037587672364652724F53384D6A526C4235634C7A50356A716756494979306F55734D6C7A774558717A634450576D724E704F2B7274703567725853626155326F5858546E39322F7976325A2F564A2F775152306C7266396E76346758383041386E5776695A4F6B546B4D504F476E366244417A353444434E3553705559476565435458786645376631796A4636716E52615456724E7477622B36326D2F34612F6F33416C4B55637372314A6638766358556A47323136664D705331367539746237655A2F517A5A4455394F5A58302F557271336A3442684D6A76486B4E77753173686344474F41414D636D766C5A7A3562757A39314E7462644C39482F773372742B675264306D306E3550626533396635485A522B49764639786272624C724E78476879443552555363416A627537416A30774D6D754B574A6E5A76524C74712F7A64726670356D6C506C636D70553432365732733736745736582F774348576859744E4631433959506458467A64757047476D6C6438466A6735357867486E41774F337658504B764F5457723332765A64764B316A53704E556B3147432F4E646C2B53646E2B4A3737344C384478736B5479573465516C574C5941354247527832427A39422B4661776770636A64375333576A2B5462313136762B6E7779784D377537635572337431733947396462725665625070485176444D6344527647672B52674F6F4147463547652B443639415469753552536A5A4A3661336133546274627031322F79504E6E694F5A796A4757365474354A7061726258723154736A757A624552674A4732454A38776A6B4B416535366B5A344744394F74584743617666356250386E66384172756A4339746532707833694854486C5351704743526C6C593535596A493977516470343659505775615656776D3477536C654D6C625336306262563761706266697454656C4A74526D6C64786E485272654C61636B3170303073394F352F6E7566384142667A396C53342B4148375831393854394B3032533238466674423268385A5154775273397062654F4C517061654B6242354655525154334569706677776E425A4A475A51527A58364877336A6F56737470555A792F65555A6646316C7A7661546638414C382B6D2B352B653856594B644C4E61754B6F776631664652356F58326936643031464C64617433573358566E345A324679743359336B5A596C5A55486C5A354B4F6843754267444B6B3845456B6B45383541723646633356572B61362F4F2F7A58344879736D704E4E507976302B2F797672324C31714A49394D6C6145446643344B7172384E4766767132376C5763426B436E4F4F4477526D6D53303175516E374C714D4D72777559336C6A78496D315435626F792B57796F654765492F4C49464756527435357A51493553534266506547574E55653347313355376C4C4571466447556A63766334474F684177434B414E765364516C74372B326B75343359514B735175492B68696C7A43775A5239347570334565674134356F41397A307177696D565A6B4368684B49706E427876696456387155625279684F474248516A42354A714A7935493356742B6F3170317470702F585431505759664471333168714555696D533962545855786D5178773331744968554F387056674A34537179534F5267694E64324B354A566C4A7153747A583073374E32615462643733577536337372393946546457457552747A57735539627457646C33326474726E542F7375664579392B473378732B4550784B68744C364A7641336A6651722B64486D777232656C366E434E513279717A4B3465324E7A6A4C59594D56343541383369764B614F63384D38515A4C4F4B71724D3873784F48676B6B327131616855396B7557536676653155556C627A3661756A546C6A5953773153504D38565371345370614B3571547136715555306F75667538746E3162743150394642346941666C79543241352F6C2F77447236562F6B44546C424A32615476653137626133563761727036644C4834447970665A7432307474325078412F344C4F746F75726541664433686A554C743062773734442B4A66784C6D74456345584530566E62654650447A54514F6F5153485764645732733558496379475479537A6F5350366C2B6A5248453073797A4848304B555A52786550797A682B46536D6E7A52355A31737778504B3172643465687956644E4B616365682B6E63415962324F427A44464B446272347830655A4F38556C52616E54546531704E4F53656C3375746A2B4F5670644A7364453061644A624E5A372F414D5379324E74704D30526C476E4E705676486353366E502B37334D6B583268465733416B696D33534356537972583934306E7A565A78392B6B6C46326345314679326970374B32386C71374E58615A37306B6F56366B5A614C32556E545779767A4C3464644C72626671687678797574436D6E3845706F562B7433625166446E5145765847444244724E376436767157725764704330614E44626D3576444E424377626248496F423237514F584C6F566F30385447763773355979733457584C4B564E716D6F70704A33576B7233745A4E65693077555A4B6A7246713953576B744534744C5662647237646D746A7372434478664238473779776A3047656277785A747065714E725273484F6D32756F61356158634D5544583672474C5055622B775365574A33615753583749766B694B4D4F5272553967735A476361744E5975706835785355347575364647555658696B6E65644F6C4B556564704E51636B6E5A326938557163735331655074484E71796275315A72585470354F79732F4A487A6D397246616D356E56554779777438655567544A61494D2F6D6F426B53664F71796B6A4D6A7075504F61364B546B37743363626158326A7A53543062336439486276386A766A485232696C644A6165746C39316E32746439444375595A494C47326B5A41586B43474D4A676B787649537A7431795352674534344464383171615464317072647061617579657476542B747976615454537264326B5563544E4E43322B566C446552435A504D6B6B6A364463754E7139666B7942796161664C37334B326C763558307638766E364F786B3147587538796A4F7A6C466661636F336365573356374A4E71386A2B7A7A2F676B44384F377677422B7944384F594E527478626168346A757462385953527575325A726257727366596E63454273795731756B67556A4B7177504F612F5073387265327839577A636F77745A723462743670363736666676352F7266436C46304D6E7738576E47557561556F744E506D62316B302B723632767166736862376D684179666D7875474D656D574A4978786E747A3172775A32356E66613336656A50716F7463713158394D36485337643535424769346263414D6A7267354A36594A49347A3237385A72676E47504C74762F414D50312F774341615536695575612F53576938316F377532336C6132393944326A77356F383035554746675764534E6F78676A736576796E7144787A2B4E5A714B6569696E3557752B6D72394671376D64616F7079356B374A4A4C5861367666726279756655586848524448464557473379736F56417748596A41776568506F52314F613661644F55584354656C3738727636363664487375783575496C6136693137326A7339644C627271744672356E724E6870384B425656647A726C797849597163594B3441774344787A3237385A72746864707432745A522B3756622F6D6A6C64756956374B3736332F79666E397876655445555A5365514D712F477A6E474132654F4F32665538566569567449717A6153767233336633767945633366324C534B7968786C6C774F4E3265636767656E62504936593656684A52357275436254646D6E30656A7539656E54546178555731644A32767537322B562F2B41666B702F7756612F59493066384162663841326276456677374174624478356F44792B4B50686C34696E6A42476B2B4C3761334B787758557167792F326272554366325A666841786A56306E414C526E485A6C6D4C6C6C324A6857696B384B704A5636617535586B394A78533355557276565738306D6332595A64547A544131634F704F6E5867373465643179704F4C353433656B564E32303937706437482B624E3855666850385366674634393851664448346F2B4539563849654C66446C334E5A36687065717776486C556D594A6536644F71694B2F3032364D666D576C3562504A464C453673577A6B44394F6F3171574B6A477451626E477072463732303266617A56747539376248354C57776C66423133684D52443264654D706534315A533638304C70637961563770575856376E4552366B3469754935454245736244594D6A626E4A77754D456B5A4A48635A4F42576C39655670786C3261732F5037763130464F4D724B366175374B2F6B7464723758312B376379494A6E7435344C694B566F385A38734B35425861533231756541342B5267636B3548504F4B5A693950362F7A4E32354D556B493144627733795362766C506D6E6B4B654F4175634C794D67594761427058646B5A7374306937746962646F42424462674D5A55674B4D396978626A707A36554463576C643250552F416D744E632B585A764F706C6A64625535344D73653764435542494F36496457414A34794F514B546A7A4B3172332B2F5A7136306574684C562B66542B763658665335396E65437275337437714B44553764327467426233495A562B3057786B77486B6744717763535A42645A67424967594442326B655869734D3347584A654458767155582F4C4A53657975315A6170726679757A6642312B53532F7653634C32765A4E327635575475335A32642B6D707A6261512F773738623674706B7957302B6C36726457336944534C7143507A62433973372B5257496D68596C374757473642523474717873475A6C4A555A47744F765578314F46576B2F5A4F4E576D707A53533558432F4C4B543074716B3964564A7061646532692F71574F6E546C4738564B46576C586632704E4E38314B64374E783262563346766C6C612B6E2B6A75746F57364676764263496A4F53573441326B5A4A504F41755478582B4D71355772364A645730724B33653352622B53315077434E5033584F535473374B4C6572656957693165723839766D667A686638414255474650482F784A386561586153546174724F722F3841434A2F4233776E6F646B626A375A4A7130327661624D316F576942533674377534746232384E6C735A726370464C792B327637553842616A79624A6344694A55716547777444362F78426A735855536A546A436E6773525268694F627A68586A434C393175636E487662397334557774504363505965556F4F4643464C455A6869584A61703149536C472B2F767961736B374B396C644838715837516E777A38512F4344782F346D2B482B71585452654950414869375764446D67584554787A793374685954543731486D334433434F594461524B307353527449567943422F596D53356868387A77464848305A786C5278654868694B46564A4F4E53684F397070713656744C726F316F6357597071644774486C635A552F615173393463797372323364394631317330392F4576483131636E785064517A775132545741744C5272473353344676624E5A775132776A56626E4D344C425338697942575633645342586446717A616135584A3266644B327136725A7062583133326654526370556F4F5572756155764B4B61305376665650523274703050305A767642736667373968623466654F7455545672473638652B4C66474869464C787A6379615034677564446A307A77373451384B524C5A7977797853655263363371463763587979725A32336C6D32654E356744386854783374754D387877634A55564C415A5267614377384C764559565937323158473136316C614E4B72436868705261664D3538366C464A58666B3070632B614F796155585A3376644E58547572746270374F326C3758656E35315845326F6176654730747257547A645375704444627773383059616151796932747A736B6C754557575479342F4D4C74735842334D4E3166587853696D2B61366A644C643254613637575356374B39727272653375537679745263655A4C54567074712B326E5A4C6533587565672B4966672F77444543333137773134667576443270576D70616E5A5751302B306B3036574E37355A59316C38327956596B2B30526A7A59797A4B6F777A344A4242774B72423775795461636E613269752B763841544D4B45716C53436A47453553357058555933767030656C37377475326C30747248364F6673692F3845374E59757456735046767864745656486C696E7376434C6A6476565A664E696E316C676341794B506B736C335954496B5A5478586A592F4D35552B6147486C644E4F4C6D7571653674665861337274592B71796649716C53556352693653584C5A3633356E7A614A704F4E766C665A6457663166664254772F62615234653033543743326A74625379744962573274344931686874376533686A69696769696A587934306A5241465159786E753253666963545555716A6C4B2F4E71373256705864745865393176357657327950302F4355343071537077326A5A6257622F54617958703648314670646A4A4C77467943414231794D6E767766703178366D754F636C373074624A5838394632762F57353148702B6865486D694B41526C6E5968386B6A4133636741386E6764526A6A6A6E42726A6D306F326231646B752B2B2F34616B3879566D3771393171752B6D766D2B6839452B4564506A6A5749474D7449675863427436714D385A7A394D6B446B567251673662753272644572743261363374316663786D3072793375396C756B33625739747575763448752B6B784B694B5648336E4255414468687A6E5054504242786A327A57306D727432303358665866303166633548372B79363674372B6E5876334F6A74726951797579414444444947646F5847474C486C69575038416436647A304A6C5466324E483176312F72546368786133613374312F794E4B4B563558645A4D4B57346A586B626C36446B5A49344F6654324E557274586C7639363337765861776D7264552F532F38416C59744E62423177696B62446771446E4A506F54794F5479634159375545536B6F506C6C6F3758387462322B6273396B7A413162526F726931644A6F314C506748493344486367644F6850556338347833317074704F7A363948763872666E335970564F567051355A703733627436322F77434837396A386B503236762B43573377492F6252384E7A326E7841384E4C42346E30364F3566777A3432304B474B3038546548726956435665337678474875374C63456166544C34543230675568416D37634F7A423479766C315370577739576F314E70756C4B546349705056516A6470666C712F6E7A347A4334504E4D50374446553455712B717034704A79724B36736C7A50574B546530585A71795A2F462F2B32542F7752522F61742F5A6C764E5631337737346275766A46384F72563769614C784A344F73692B753256674E336C7A613534576A61533753355646784E50706F755947554239716B382F5A34486943686A4B61397679305A71793535717A6B3972615876643632537470652F512B45787644754F79397632536E69384B6E705769334B556272375373744679753776645076302F46713930792B30693575644E314F30754C5365336D5A4C693376494A4C613773356F6D62636B734571725043347746614F614E47446744486576626A6555564B4D5A53556C654E726172757276627A363330366E7A736E474D3551636C7A703678664D704E3761585354613032652F66556D5736644A54444956614639715349526A35573557554B63346B4142427941636478306F76766F37726457643162766654376D3258485233656C72616456653272365731313373455168387771636E4C664A794151435342796363746E6B6A492F4F715335746D766E64666F564A71535354586658352F6A35476E70306A6164654A64496A6F456B6A4C457674554D306D315842582B4654792F7279514451315A32663458656E5639374C726F516C5A745854646E61327A62305376592F52337848344E385765446448384265506645656A586C72346338653642593674623672736154544E53734E524D74706254323135474E6B6B734E33703979724D46585A35547848356777726B6A69734A69486A4B4747784E477458774F4B6C673858516932366C4F58734B574955354B33384B705272776C546C666D6C7237717472773461752F62546F7432635A506D54393236623369375762336571304976694A5A445676436D6E362B755A6454384E515070392B397534627A744575766D686C634B53485749716A435663684132423878726D70515643745768434C396A55634A386A3039364E314A4E4A32536437717A6261736D6C632B67714E56634D367A626E4C44387359776772796B716E78637174716B6F62766C763233542F3062356F55746C61355A6352326953586B6D4E33433230556B724D474A414241567476583567414F4F612F78656456336361646C4B7055705571664F74484F74506C696D6C643964656933623648346D735079314979536271536C5270303474717A6E557152687976612B6E4E5A527532374C795078542B455668462B30682B3254344F316E522F4452763841774E384750466E6A6234312B504E63754C6347336838592B494C6466436E7738384C77335269654739753941303354354E5A754C564A576533754C71346D592B6168722B6F3879722F77437076683356773249786C576A6D48457546774843325635564F6F31565744705649342F4D386534704B3863524B584A526D6B6C476A546A42624E6E362F7844684B76443252596A4B712B4C396C6A637A7034536868734D33474E5230634B6F31617267742B586C767A57566D6E3250352B502B43785877736E2B483337576E686656626579695336385A36744C38524E56387253465961655A66456C374E70317864683246784B3069744364564538692F6174797043565A51442F585868466D75487A44676A4C71537152684443344F6E6C366C4C52776A434B6C474B5430396F3932303757756E6251386644536C6973425264534D66636A436B6E4852386C72726D5856336A47396D37506532715079743050396E54342B664854346F33736677392B442F7741535048452F6944786A4F695832676543396276384153546358576F4E4C4835742F486274703056764948337447393870747261514C4C4A76556276302B6E556F3071644F4D6171727768465135497531535354357058615431745A703632665A485637565571555673344A4A5070763137376558346F2F713530582F67682F3841485434342F423334556641532B316E5350687A3466384E52576669725856314F33314F2F753744784C72476E4E7158693755394F74325347425944637861503461307654627165515151326D6F586B623762685550786D515A586D384D2B7A666950485A66527731544D36745443516C37524F764C4159522B797979724B467465656A4B764B71723235315369766435354C7836587556717453667531616A6B3031745A79657A75746C3564337166635077622F414F434766374E33374E4576687A556F2F43397034383865524730683162784E3471453273335976347A6D357539456A6D534C543948686E6B7942466157786C686A2F64656533577674717447756F526334746530367238624A4E714E74505076736A7670546C4F6676336170706375746E665457363657335858625337747A6E37566E374A486836782B4A2F77414F4E5869384C6166444C5A2B4850454E68615863646A627039677445764C51694B41434D45414534563177366F636268322B617A66455477797055497955564F392B6A73332F57765636732F512B4536464845553858567251357030624B484B72622B53543135576E76765A62327635396F4877772B7761676B4D5673717570436C42483871676457555947474F636B386B394478587A30366B6F55374A364A717A39587235374A66705A6148326E73597052744B664C706F326D74646B6C7670356139623648322F3446384D6D7A734946534971556A357A386F596B354A49354A476344324841394B345A726E6433767470322F7A382F76505170747767724F39374A72713333667066763330506F4C514E46496452734F4D4B65755279516541446B396672366B63316A4A577572616172572F2F414F684F3654376E304E7050672F7A34343559694658597062637047474948636A6A5049366478774F7459756C46327664322F723839546E6C5635616E4C50534B62653276564C5A333761395666617836566F656879774D6F614A5959383751592F6D6B4C6A414F3750497A676E50546B34353572585A642F7A5A6E5578464F54354C4A4A32664D6E64335476727464644C3661726276367A706D6E43574346555A5351546B4437344950544F4F472B765870365A7477546937767030617435666F6373716E496E4A617831646D376164577636747271627261624A4767654F504A4459787332626A6E42334B6543535277526A6F656334786B6F7854625465795774762B482F414261394349346C4F2F4D6B744C2B766B743032746E72723030485731704F7A794879537A6734424979426A4241584A4A77426B455A34394B7263695665504D30726157322F344330743331334E2B7A3036655253386B6252626A6B6B3441413975507A4830776575646C526D3275323733322F7237757879346A45523572337637713036364C56745876625866723252636C3055535248637A4441794273445A5071546A6A50313472654646785454546658722F774144376A434749567233387232562F75322B667063354F3730654E544F48424259374D6F75415230354F4F65774F5078716C434F74316254546666537874475639552F4A334F493172774670577352504663326B4A566B5A41536945344B6E4F634B63376753474A7A6E48726973593059536E6474336A6470624A5356724E6437505A4E5831756B6A656E586E4452796C4B445670516573664A3236744B2B6C74626E35466674692F38456866325676326D5972322B38612F444C517254784C50413861654E5043384565672B4B3765514576464E3975303852433763455956627947667A4D3450584E656A5378754D6F796A476A695A7A6D6C65507447355267727057355531612B757474506D6A6C7847585A586A31562B745571644252676D735243314E78657131646E725A7536563362625A4835636542662B44536A7739726D70617234733862664872786C6F506769373253654450426C68345A30357647757051686A356C7872657333586D57326E32425172396B4D4F6E53333037664F3668477750764D413854587753725975324771795630326D6F313758393643753761394E563365782B573579385067385450445948457778564E5262636F3262756D72637A543274307333657933506876396F372F6732472F6151384361363974384466476D6C6645714337752F732B6D2B482F41424E706431346438517878537A45516B58317444646164647877516C54635855304E6B7043733451666448527A564B613570753664724E637433337665317631386D7248695178452F747962737261642F4C565753312B382B47506A682F7751612F627A2B42326744576645656B2F446E553776374E39746E384C65482F465678653633436B614B30734437744B6873476D4849586464526F306843426751435939756D30354C7276644F335A36625731613947645648464C6D555865322B756D7A5856583131303636746E317A384F5068587266786C2F774343594F6D66446278484350446E786A2B43506976787A344666773734325361472F315077535A5A506946703876682F543559493734583168726362324F6E33396B62697A2B79582B6F77757971574B2F6B5749786454687A7853784E5370547855736A346A795441356855715573504E5573506E7545697342546A5872715849734C57776B6E47644678764C45516F79353179326644586A4B6E6A6C69505A5649557172744354656A6C79757A6237615070315871666968344F2B4B38576E544A6F6E69414B667359476E33734E77446D363047345A74704159375A6C7470416F615263676F65472B556C6631334530704B635A364C33497A547464576E467956393033626C3154767574625850714D7272306C566F6331354B6135576D3733563471547465397569656C6E6F6C31662B6A562B32543432317234632F417258463849794650472F6A2F5639472B476E672B474F326C764C35395638557A7662584D2B6E574E75706E754C757830706279374C7172725A52786D386C776B65442F414A452B4748432F2B73664665455653684F726863716F314D30787349705439726836667530366649377956543274704A536A46706173384867334B384A694D2B776B7362546462443454326D4A564E4A546A47705454396B35373356374E5854733764576A735032616667445966426234566148344E304C514568316939744C58557646317A624B46463134676D73316A6E53347532554E664E5942764A457A733779544E4E4D537859352F563830384B76452F6A2F4F6E6D65492B725A4E67714E61634D7371593345516B31673775464770526F4A56485261704A4A787648543362576C6339334835486E2F465762764D38624B4F456F305A314959503678474D32714D7063735A786676637135557456725A714C75585044332F424C66345466744C66746636503841484434335741385A2B482F4366684B7753443455616A625153654574586B304B614E744D62784A4B5174357131734E586B67316158546955747070374F465A6C6441565039552B44484265616349354E68736E7A484D495A704F6E4B7657723136643342564855696C46776B6B6C7072477930543356724757615A4A2F59655659476856724B72696C57712B306C464F507554356E467462576C5A6372337670317366744E34632F5A792B4750672B7A67745044486762777A345973376370396E30767735704E6C704E685A704754745330743753434B4B4651517A45784C6E4A32735749466676744F6A436E4B664C4343664E644E526A625A577470364A70624C356E7A5633316266713264444A344830364A376D56625341547944596B6D7A393873574D4D706C504C5A49556A50584134427742713165536C4B386D7262796569577953746F6B6D30724E62676E716D3962643966382F77416A77587858344247712B4A374454494C644E734D527535434679796865537849554847636E4F53543743707153556D6F7163706372646B39307462364C732F582F4143313574327063756A317661373061303166665A666F666D312B334438506A59654D664155554672356A796144724571626B506C416D38746C6345344242774E33792B67504E664338547A6A47745175374F2B6A375054312B375870646248366C7743723444484F54636E39647077543632354F5A712F5A57747670632B53664458777345747974315046755A6E794D4B636A474D354F446E74782B46664F4F724B546358626C62377253335A646E2F586C39767231364E2F636E7030583965756E752B6B2B432F4932526553704B7343426A6C557A3379414D64446A4F636E67636B30306D303330572F2F44622F41443238786E716D6965467468556D4A546A424850515A7A6E754D39514166586A6B56484E4854586652622F414939766D506D6B74655A3661372F317366542F414951384F724E62413764785A45557151447874474177344F52307A6A412B6E4E576F74364B312B3356333766716356664558636D726450653337614F2B7571765A6565687658766839374F64504C5859584F2F616D6565546B6E49475142776335474F4B697043536C47504C71316635587375752F6C307630324A6F316F5645314B555734744E4C57337A7473396D6E6239446F395030377951753163456E646B446F534D35474D5A357A36483248466251684B3676472B6933382B746C2F777937374378453461506D53736E653137576474394664766F744473725052705A6C784A7443794B4154493349774D354179534F343664754163437431526A4B36635633737257572F56376E6C313852474B536A4A58626B72577574506C364E66384130376654494C525A504D4933456A615649775237456E6366797A375A725432454970585559323775333961376E4B36303579546A47566D6B7272585658756E642B617461392F4B774E4C625248626C48625042596B4C6A766E497963444F654437564C6E465262566E61326B57723276767030363632302B34723256615476795362642B6E62663841344A69616E726C6C6171354534497A744952677171334741526E6E5062715363456A6E46597972396C6137363256766D33623557372B5A3055634C5675334B4456724C56717A76354C663737505938373162786A614D72496979534F413246526572416344474F6D37767A39547961355A346C58646E647136326B3037646232616439743136487177776C53584B306C797470505733585733562F356E4848784672393376466E706479774B4D5275696359774363715144794D42687752363961792B7334755376527058744C33704F4E3471433332665232365831305276395777305A77357138594A53546B704C6D764732717461797666663841702F555077452B44756F2B4972653238632F45437A4174524D5A50446D68536E6435367873517572616F72444A796433325731484879683234624666626350355133465A68696E65704A72326358464B4D7164723831726271584E75724E50652B692F4E2B4C732F704F725779374B314B6E54622F7742716E4B546B707A533558466472717A6253566E644B2B7039676638492F594C766B53326A65563132677677593863414B634861704147417034474F4F74665A53744A71365457396D6C37766C4662644F6E4B666E6B497868384B53623366326D37753763743336757A314F57752F43576E37354A6F37574D7A73476A2B304659326C5257345A465A687532354A794D6E4F636E4853706C434D302B62666F3964753370722B43314B504E64622F414766664133695A4A3758577644756C36696C39744E313972746F376C6D69492F694C2F41446266574D48413478774458424B684F4D6D6F7862547574722B6E6F7232732F6D7731364E70366257753956666470626136766F666C762B336A2B77423844664733686944774E3459384D36666F666962573757355639653075336A74722F414D4D36564A75696D764C4B35566430476F3378643074393637466A5A704144786E782B4973664B6A4368684B58736E587454764770434E546C554A4B63564A745033553433562B6258564F36757674754573736F356C57654B7A47685578474277716E476C54636E46596E6D673662684331337A5163727252617061376E3853582F4251332F67674A386666686E34573076785A2B7A6C6F6F2B4A6C74344F6258704E53733757344D666A6A553942767034377977302B477832725A366E4C6F6B6A586B567473644C6D3474727059333374416762697750455749654971304D316A656C4F4E474E444551696C43484B704B667446644E4C574C69306D316158523250704D3134476F3172597A686175343136616457575634696256626C6A7958564755725161566D70526C4F504E644A58746466334D6152344A68316255624C56746573375737764C435270644C5353474F654C52705A496D696D657865514D593775574B526F5A37754D724E734C4A4736497A4B6679486766772F34623850634650433544527031635A694B4D6165507A6575315778474C6B745A4F4C642B524A33555963375457397A30636F7958425A464230734C542F326D5670596D724B7A356E744F4B545439313330306A316570376670746A5A3273555551693873427432565253374D51527579512B336B6B3547534F414F4469767462757962744A704C724A4F556C31736D6F78756E625472364870704B5572526349586B74457449394531354A4E74704A5737757839492F4158546F3439643853616C35616859644E302F546C486C2F4A7675726D53664A5039384C437049474D6A50494F4D6659384D4C6D5665716F705876483372387975342F432B69736D6D746D7262616E357A786A694F64344F4E394A38375775337335536838314A36726F6D2B6D683954795767594F54676B4C6A68514163467335366E727A6E3034786E6B66584877356733476E784D354A55426551526A723746675165654F65783630416364622B4859355045657058555565304C70384D414A5545746C74354B746B6266516A427A317246556E7A536B3276653373756C372F6E366564772B5365742B7A2B5854612F77422B35384D2F746E6644716657746438413373412B356F757332754341634F6271435467357741526A67396551653166456356305A66574D496B6B2F617652744E3255644732746C3574505A66492F5565414D516C673864546153354D54547253366163746B6F765633615674556C625A72552B554E4A2B4774395949717A526F78423341524D4D35474E75636737636E6B395152774D5A7235785558435850666D30667538746B32317933757456625854725A7270703932716B57336558563674727670723666316651374F33384A5849614D5061674B52746B6446426B2B3967626D7A3039666C42497A307A6D7139367A584972323065767A31746630314B63344C3755666B312F6D64377048684234396E376C417241626A6B45675A476542744B74782F65504F4D5A373465786C364A4F2B6C31392B6D786B36384F613139466F394F742F4B2F3337644C3350615044656D4A5A79727352434777416553777836347754366334783179652F645267744A4F7A386C666274665458307635396A79635A4A776A4A776C7133305637586437613774667233323762557450746D525A6D6952797135423268534F4152313450766A492B6C6465497077546A4A52587578746275316658565754363354762B766B59657456684F54553364587666564F2F5858726630302B5675546C6D5333596251716D4D42734563665167446766515A796533553845366C6C4C537A7339657433354E326139642B7837304B6271527533653865612F665A333054323837624C585531374353347551475667674A7756334251423763456B6B3938636E7656552F6153573762736D3764657A3657394866726132724F4C457868465154684853556C747271756C39567672667930324575725353517972356A62735949444541456A4947345948346A4E4F7171736C793671377532306E363357393333436A4B6E476D6C5A4B7A6261765A576276763174625650716338326D54544E6E664C674568775734372F6462712F754F767031724832565664623931793275765733362F666178336531705270754C555539302B61317474743934333032742B4E6D3238497858542F764C5A5A5156344569735157794348595A36675A77414D34395257384D4E4F566B3474755731727179377536667073313266666C6E6A715562387276626657313761614F2B74316F7232765A6172646454592F442F546B5A5A4A6253495A5A6547526471487553574764754275783277527A585973736A5A637A5366564F4C3139476E2B6E33486E797A714D5A4F454B6C6E30577236323065757138757633485861503455734C76564C505337614B4E6D755A466A6152464145634B417463753230444778527448504A4947436139484359434536744F4B69354B4D6C4F6158574B747A4B3353376131742B5235654F7A577253772B4972546C2F79376C794E3657714E726C3131763139333757767176724F79746F724F3267745946574F4732686A6769526334574F4E514548703079633437343747767434516A546A474D456F7853536A424B31744E56352B72312B382F4E4A564A315A5371564735546D334B556D377474753933366C6C7A6847507366773436315A4A7A347930787A796F5A695431584870787A33775342787A3961412F72314C697A52576C7450637A7369525278504F3776774934496B4C4F54786B68555669527832485138524F664A476333384E4E586258667031566C72643374356467696E4F63595254637066436B6B2B652B6C6F39577A344D3179346C3857613372666947385971742F654D62614D2F4D56735944354E6F6945685352476742504256697A4D426E702B635932765045346974694776696C376B5A61325330767A623678386C2F6E2B78355A5170355A686350684937714D5A755376424A7953626A79766D73373354656E7072643831642B48626152464C32364F636E35764C5573514F334142474D63487143647835417835382B5A754B35466F7447323739336F315A336532756C2F4A487230385330354F4D32756E4E4753556F7466797955564B306C645331573633502F2F5A2671756F743B207374796C653D2671756F743B77696474683A2032303070783B2671756F743B2667743B266C743B62722667743B266C743B2F6469762667743B),
 ('f4d5850d687b4814a8d0c6e73e241707','1','2016-05-06 23:32:23','1','2016-05-06 23:32:23',NULL,'0','大家好',0x266C743B68332667743B266C743B7370616E207374796C653D2671756F743B6261636B67726F756E642D636F6C6F723A20726762283235352C20302C2030293B20666F6E742D7765696768743A20626F6C643B2671756F743B2667743BE5A4A7E5AEB6E5A5BD266C743B2F7370616E2667743B266C743B2F68332667743B266C743B6469762667743B266C743B7370616E207374796C653D2671756F743B6261636B67726F756E642D636F6C6F723A20726762283235352C20302C2030293B20666F6E742D7765696768743A20626F6C643B2671756F743B2667743B266C743B696D67207372633D2671756F743B646174613A696D6167652F6A7065673B6261736536342C2F396A2F34414151536B5A4A5267414241514541534142494141442F327742444141454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151482F327742444151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151482F7741415243414449414D67444152454141684542417845422F385141487741414167494441514542415145414141414141414141427767474351514643674D4C416745412F385141505241414167494341514D4441774D44416751464167634141514944424155524567595449514148496767554D516B795152556A55554A68466A4E7867516F584A454E536770456C55324A796F7248422F3851414841454141674944415145414141414141414141414141414241554442674543427741492F3851415452454141514D43424151444251554542776343424163414151495249514D78414151535151556955574579635945474535476873554A537764487746474B433451635649334B537376456B4A544E446F734C53564655494E455469466A564655354F6B772F2F61414177444151414345514D5241443841374E7671443670366A7750562B4F72346A71484D3471724E3074464E39726A4D72636F7876632F716D556A616273313555696C74797770445868446F386B704561426B455150704C784F7257527039316D4369436F70686865434F76723330766A324B2B50715A2B7144724C3259397265712B6F6E36373675725A4C47394C39555A7558494C31506C326A772B4C36667866336554766C354D68487875437555783354696B722F556570724664706A4A4536774B48773557637A57615368645433675370504D584C68544B76614C523244376A585271556D376778356C75306A342B654F48587237395358362F4D68316231444E562B746A36743846586B73584C4A782B4C2B7058336A7030364D64654A767534364E6172316842436C6142705944483259344F4862554F44493559644E792B526F73684B3875467130704A55704E37647568383737327346484C3050644931304174656B755764324A3366374944666830572B6C2B70482B6F783142316F55672B766E3632494D5856726D776364463956507673676E444967723170336A363537545476786D6C436D425861615741454869474A3958495A436E5441566C68725548484B5A4667626733422F7933644F4A7632584C2F3841706B2F41344C465439516E395171484C3236722F4146342F5758616A78394F5047534D3331512B39686A6D7A6D516D4D3830374350725251594D5A434C483238636B6E4A617466757478566D486F5935544C44542F736F59757873495977474A3632383933476632584B2F2B6E482B452F6E6A62346E395266362F3757574D4B2F585639593055497332374C724C395333764E61674E4376534B3149344A5836356B2F75535A4F5446435A4534724B4A624163744A4C7962555A544B6D5032555831585055787A416241695742766A33374E6C662F7742684E6E74743176624746316A2B70482B6F446A735A616B7066584639596A32724D79566162516655333731454B2F77414A476B68482F476F495A306C72316B4D65694A4C4950784143764A547947575770502B7973524C61524F304E7A627A472B496632664C36762F414A5A4A6763326B4348366B69513976506C78722B6D5031432F31444D726B334E6A363950724E4650433436756D526A503152653978533166645374676154725A424B2F33474E6D4D426B356167794D555A516D574A306B7A4753794E4E44444C6846526B737067574C7A36732F6B3468786A656E6C714255414D71533779316778376E35416654424236692F55592B7671704939477439626E316751793249684A4A4A572B7058336C64714B52415457465550317554495A554271724F4F334E33704A72424B75597771684F546F6C616C614E51527A45574241637352594268356764634F6148446367756D3673716E5541342B3834476F66643858663657623336586671322B7437727A71374434624E2F5735395632536A6C6B67743359626E314965386C736372456E77706754395A544354746F3652434E46545A6A5A6D2B546B42463752317632504A3146304B4970724B46365661534E4230485171474A596B4B44503464324C754F473846345856714156636B6C5473472B38355A6E37754466744F2F5578394F2F5633764A5A7731622B7565383375356E354F4A5A6D7A76754E316E6B356D564A4855683562755A6C6D597550787A6B2F477641346A3178724E636334776176396E6D3141487558387864352F6B2B6D48745832653447682F774464614833636551627733682F584434595471487254737847627244716D5A32344275665547576B33343253524A62592F6E666A66354F6766486B582B76654C2F2B36712B492F774448437170776A684E2F36735435747A58686E387570504E41784F4B6E556E55696C43656F4D3349534E6E65597948386B487A79737342782F32582F37446B505766363734332F77433548346A2F414D73444B3456776C76384138734857457A364D337750776E473554714C7154382F31374D4D437830477956787444387143424D474F7638372F6A2B4E613962552B4E635957572F724E633943507933334C7832634D496547384C42492F59776C69326C77476262773757786E77352F714D677363356D472F77427636686330646A77664D6A4D5166353052386835324E6A31502F57764630714C385458354F414C4F7763395475393757786F6546384D4A2F2B5654456459386E412B58777837783537504146704D356D47494462316C6267582B664A44532F352F4F754B2B42386655692B4D63584466377A71446C363958366E38413354624750367134652F4C6C4B624E39704A76366C683962342F5136687A6849427A4F5730667876493276414F2F774148756A2B64482B662F414F506E43654B3857576F41385457527534485548374A6775543963592F7172496638416F36662B465835342F582F45476457496E2B7435586C736C755752736A6B41546F3765512F6A2F73436638415634486F3558464F493655746E6C56535164556E6B3073316A59755A5664735950436369662F70554479542B62347858366D7A70386631764C442B50475273666E2F47316B472F2F41505038656F6A786269562F3270536534556678664868776E49432B5653664D48363477354F6F2B6F5153526E4D794166326B5A6249456B6A7876696242547A2B644161582F53422B426B6357346D376674617A324B6C66684F4E76367279502F6F36582B4445647A48572B6178745757577A314A6D593434313579794A6D7279534C784878554D624563616C69666D2F49425641506B6A78742F572F456848375770497671436C754436396265766E6A7734546B467141475551483343663545663841543634434D765848584855396A2B7354395939613454413153777839584864543572477A5A53525177617A4C4B6C6D4D78305151717270705A6244717756596A387651362B4C3853314566316B75354935376276634D416F503562595A307543634B704251586B77564B674168775362426A314A6A7143304534307565397765753549785A6936353676784E5A59312F755164565A7947615241764C61504C66594B717270544C596C6D5A2F4C74453763326B782F584846502F6446662F79482F7741386266314C77332F32326E2F67474651397766666E3355724E65725950334B3979345668456F6A735665742B70684D4A4855694F4F4F5A63747470474B6952593479654934736B6579553947302B4B38543076384174616E42735365614348326E7632416A6331504165446E2F4150536B586B45474846344268756D4B6B506666366A507177782B536B6E7733315066554E6931354F365330506562334C7832506A6957306556614A4B6E564E534F36596F4845316D574E6F597A32776B763253526870374E772F50316C7261706D6930524672514842315030323873464832653448376F2F7743374543357438626262586738333770367066714E673439665957304F4D3037394B31366C4F4A31514A5561544B5A68376D526C6C636B686139614A4E53626953764439317A6154377044576163554379716A37755436642F552B6D4F46315636414C53392B322F706A6C4A2F576F2B704D644D6532654739724F6E4D7444426C2F6436744631646E4F4D6747536839764D423146576B39756B5773496833592B714C2B4F795855563775434F3347325375304C504B4442774A433534446B716D704E616F6B3878637870484B464937697775776A5343414D54634F43712B626F71626C4853456E5356504A6B37676C774C50462B5137717A4B32714F4973586C444A5A7A30384545477A7638412F44366C715837746F6E5A4A484B54547658416B4952586B6B44494477324F685A5A4B5455314A564547447543786A722B6D36327453457570673463683533743451333138344F4D623277786A4C68737431484F786A7374666377544D6F414477786C486C5575726A6E58726D574A66476A4A497577574142307A684A724453326E514357505661756E5966422B325049547048536635626A647A336E45726F326D7833546B7338794135504E527A5354643850786A48554A6E67686C42554B574E5046554A3638436C6B4A6774794E4A2F375A496E764F337A2F6C6A6468332B4A2F5045756F4C4856783147343645585A6F6130554D52626942457A746C5A44786A41614D744F6C476F3763774F7A47714D443878366736655A2F7A70786853515235572F58363838446671726A4E6D4D50547252542F41506F6F62747957557938444A4C484138564F354D4A565A4757653538316A554C4772306F585858486B574E4D41462B69516669723867337A774B6C476C5A5631426A7A56636245523648425839767146544634754B2F4C71505369355A6C6C565A4E5049795155466B5478486F566B686D6A42416C57564979535347447238307633704F6D644A506374357463374D3051324A386D3553676431436575336F42694C3571624A354337566971516D53624C585A6532366335466878744B554C42487A5655504B35594D6973306B67376B634B73465A5A6E596A3638765451705369484343564F46665A5354352B495177772B6F5A4B7456306C4B5355527163466D355861327A3933646876697A5436584D5A6C756B722B5079754D727A775A6D434B4F78445038472F7552534D38784B7979685478566B6B524359555477653647444E366F48486333547A4255696D515143515335384C41646A5A4A6B627833785A614E5033464E4B534E7757682F457A51342B302F616637324F674C36632F724D71394E4C426A2B724A517969556362732F64724B364F374C7A6C61575051343930462B446C5356504A394E783963367A6E4436717176764B514A36736452674D6273474E3332456C7469545546542B797558597735627444616B322F48706348375566554230463178577274557A2B496B6D346F417346364E746C5A4F42485A4847524E46695837675544694474746B6853766831564D3141754E794539435045352B4C7468586D553145525342337341376254357734744A6E5A70735A617157493470497A484A794A434F48566C63426534537051756756677575614D366B48796554613944653539325446697A79573667377673786C2F4A4F416C316178476C5A55774142667334592F7234526955524B6E45766F73704B6B42394D796E514230757935486E775367326634483853557163366D677A764D394F6D3741744833565968786C714152734B4E45635273613376583433352F6E5A2F372F6A3053454F58627165782F413477464175416258483534386D5874636C4248486C6F614F3131736543323961424F6A34482B2F382B7046494F6C2F4E7A2F6865352B75357469545765672B6635342F714F6D744B504B364C61502B6557764B6E2F483863527238666A31756C4C4A42363739572F774266503559314B697135647366706A70572B4775577A7348583776386A66352F486A2F534E65665763597868502B342F3841622F38416F65744632486E2B42783747677A656270344B6E4C637654525178516F386E4B5278784D67566A47766A6E49724D775545784C4A49674A5A464C7142366A5357495054706952494B31424B586332646F61582F776A7A4A774279742F7179323253794B732B4E457279592F47764771523275452F474C495A4C6C794B566F6F315A71744A6A482F7A4661554E4E477361794B5734494A4A2B4E2F3562344A703152524A4A3855686D37455348636657537A746A317A74797654514E5A7352575A6445514C4D5247474363646C596C434C47696375416A3762544F7044524A4C79565055574A6376544B314B71433668452F5465345342655742774573745A794F6364346C2B346E6A4572565672514E4C46416F6A644752386E6B6F774769354D42494B6C61784463446C2B394B797A524A4837444B6A5443522F615154626147505737374362772B41423135694B6C61346C5357524A566D6951736951474F424969376E69596B6B59503258494B525353434B6157534E7A45306B6859744D735145714A366E2F74784D485350456F79526264742B7A395A39514145462B6F546F354D6E64786B7277724254564A494634526F5934337252325243563178376B676C73524E4B78556F3062794F3662414D627268395A4E4E562F46506D4A6133795A6D6B644D456538312F4D393930336B6457375778304C2F576C646C62725444596335527362694C76523157667243654E4B7A4F7652634F57366D6A7A7441574A7A7A6F793532422F3664587356552B3852306D6C686B5437597374347255666656615953574961336D337158627974754D664E2B645670706F4275706348744D664D64746E6E487A3366314466667178395133314A653450573062324C4E47356C7265447756626B6B396647644A64505763686A2B6E4D626A4A6F6F6130597256734749624A6D6769696A73585A37383870506665537862736A534E4A436152426341503546536A65376153507878614F463042546F7071615538773553776353515143323542555738524A7563564D39645835733331546A614F4F6D6B4D4279454F4D7862663832714B324E6E6A707853694D36614F4C4A5748373745782F756654794E2B532F704E53523779774B58444E49334936474C6A316937555739566655344C475678304E624777644D596B386F563761724B4A6D436D474F5A5A726C67375A69777357524977646E4C46593467354442423658363156464B55536F757469372B474444665A6E7248726A4F4E5031744B694E684D516B70614F2F49565972444D474B7A5636574367645A47514968686F56526B4652583158572B6547694249307550596D4E2B3661436D5365454B38574E5649305A754B7858703431587473414F3379456B6B734C4C34596B4B6A4B41427867534E64566D2B3070506E49492F48474657506B66706750346A4B79356E71544C7A486E4C6A55796B324470794B455A374F506F53312B375768472F41744645685777764B645A702B51473553774F724D6841416854677548424B575645537A7347314D2B326F596771706349594D7255485A33495A546A6C63735777664A62416A6F59764438704A7037544E614E614A4E534B524530656D42343870556A4C6256754954514A3046476C6932436C4F776B755568695075683765586B4859324F79644A366C4D4D476C3548335648316C672F664673663057665470682F63584A5971444B596D704E48586E727854797A31566C45527278544D65636E4A5A67706B566549546B446F685235436E6E5074507872396A39395353706C4B6F3141474C547049736C7A33486E7377783033686D53305A6449576C4C454777646E426653666B5248393178693633716A394F7A70584D59714B667061725378755957434854515175594C4D386342565A75306248616A5A324B4669304669456E6C4B73534F44766D4E4C6A31524E5972724653306B68504F6454676D494C2B547166794F4361755770674877454D44595152627347565A693430336A43452B3576306F6539507431632B3174644B545A4B7134574F4F316A7058645A4552305951744A48576C6A6D6566754F6E5A5A356F7057493774614B5571306A374C636179645761716B30355975795736454D33727675426744396B496D6D6B45395577702F4E67542B4749543031314237676531747941306E7932505270596D75593170725643656B2B787553506E39734A555A326552466A49696C516778477878504171702B785A696D4454724A58635364524D57643747627A757A4F3071636E56424B6968786551417A62394744575077786470394D5031615A7966483433485A753959796F6C456277797A75456C594F59304B715869695757524E385A515667636F47557873535739566A505A644E5055557142424A494575484B69317879777A326B5266455759344F617946566B6B4F5755704953557337456737426A4734462B754C6466627272756A3150536A735672444D586872615358634C5279504572794B59787348584C6A794C46534F4F7465644B36565170596C524962717A5030544E7252385A78584D7A515652495351413046756F6A3446726D63466C4A4F43677557585A59676E797A62486A78794A2F6772355034386B44657652314F6F6C545144304C416464324237454F656B48416841636B415073546679667031783773696E775150492F616648352F48382B474F2F3448482F4146666B6E5532336235642F7038735A78357379516B2B514E4B507A7441436678765930772F36416851662B2F72785551474E6859463438742F49546A324E5A5061564F62733534364C41714F512F3648616A6B515038416265392B6F437656416872682B76573354383862424C694F706B3743476638416C2B6549766D4F71385869616331322F5A6972515271326E6154626C7748507869545475326C6234614A596B4B464930665755795A6D4E3536646354496F4C5741454A6479796C4D4947356B75776952507A77424C4279765832556A7A75526D4E6270574B526636506A706738763366323672494D6E616A6A6A574679733364564B5453536369556B73325934596B724E4B4542524141446E734239622F4434344F496F5A4B6D556F43613155674D6F674B4B645241494A567155437A6D43527475636236316D6B597A3433475253765A6A4B4357574F454F6B424867535762447032444E6F386F34544933624F316A69614E4544614C704B536B6B374E3061375742363446546C7756652B716E71644B6E5A7A44335A354973506D32492B2B4E5235705A6244477A4B53455A35444959554A346C67737376475379574A2F6173645747492F74684A566E654C426C4E59544347303235576A7547735153644E7573346A755437464C646570434764675074345952784D684A43794B4F49437849692F4A6C38414A76534D4474734D65702B58355950527A424A567A4F412B71515961782B5554337776575A7771334C383258734D486C6B7652566C692B515372425863744B735942426B65463162556852564269506E69454C543036704832694A753537752F636435386D78735A4D7A356E5638384B7237333443376E38766738586A423972577272592B366D3441396D786B37394368556C566751776D69616E614549324752752F5A5970787273376A4B56303030456C6945784E7830623163764A5A37625A536F4A495062353368372F3634643739614C337367396A2B6A35733752374464565A376F694442644E564C4D537931376D563776586331493251736372696E556E63334C51344F48514B69675346683636786B3657764F49463036556B69584A3164645354304632766A35377255666631714B46637951783079484C6751514845517A744865666E6C65354F6572556276566B74477A4C4B484E366A557945776A334844686E3754334A30434F73787956387242493051565941626662377177494A4C5654534455495341474B556D6567415464704137732F69416646336F55536D6B696E73684941364146794A75594D4D43346E5A384C6E376155786C4F734A726272777134616849596D6C4A35476153456A757945386A75426A55676B55466F2F75424E4B72616930356D5A4B3055685442414357476D4C47626D596659336E62426161534567416A34715059394F37462F72596F514F626D5974316F346945746D477257355350796A4663314C424D704C717A50594531506945347166373434524B6E46524141684A30777865437054465444634B472F66316C382B3652393466482F37735154495331637A31684B7A372B33442F41476C5A55424137443778385964797763474B6863696E4D6F41643364516439734D7041516B5539546247574C75783878306778694B6F6B4A5A677A6B39646D362B6635347A38726565336A7072386B6834592F37757A356E34724A4A494A386B6A634369386C677433616F6E526E4A34777A52787545594F75744E41634B41645256655159544563795A66594D337967575741376B44366B66544874304469786A7362686538434A4D666759383564495A316154495A586B79764638554477744C5055686A535641334A43353837497A6D36724B51354D6C6734364474304C5836532B4D684F6F6E7A444475776433394C467654424578647574446D615538367A534E5A6437316F4D38624B30496A456A4C58374A5A6C4C33624B43586E6F694F6E4D6B4A327A416831554656456E724C4E626D48527576344F36734E7370544B564A4D38736D65796846374E73304A363476382B6848337339712F623770784A756F75704B6C544C336248646969614A357534736345374C73777876326E484E5A2B5473716C5858577743505845766176493579726D6C36454F695177497535385438316E3337786A707552716F713556413934414741496A644D744137702F4B434F6733326F2B7044326A3678474E7876543356324E794E326268484854416D696B5A674245565954784A784264475163354642503443386879352F5879655970486E5243566653584B682F642B79324D3171436C4A5755564C4A555143454B533444736C54545A753974697A4C5A4F7468756F7152725734496D6873786C47556A693343516E6D6848506D68477534724D364665516443756C506F536F676C335470695A50587031486B59445863454A4E577451467753375753504D514E37753351585959567A334F2B6D7A6F4C72614A577634384F3152336D676C55754A594A48586B654468314478636765617635596C5856646369643657637A575538437A6F33476C487864535359655A687873564D37792B5A545647696F4F546F2F6F384D594D637759697A697975772F544E62365079564F7830725964494D6463537844586C6C56342B4159536853534334496C55636765616A58784A545A4578346F7175447242666373323536455041754C38306A44536C6C4D75716D536736416F456B41724E78334A30754C32596248617A6E3249745434744568757071535977732B695745624E44475371374A476B5A4F4B7353416436506B2B74455677574274796A7A41376D337948633378532B4D384D43464B57464F366C46704735496A7975444A363277366447304A552B424A58782B35563250424A42446649622B52486A782F486F326A555341474445324F6F6C377675706F627A486B426971564B5A536F67774130674F4C412B63646576787874667541592B61747934363264482B4434486E77643731722F41414276382B6A68554C416C6A30444E486F42752F726945674734786F623258686844797953614132537048676158593134622B6550485149506A594948694F705741414369774D396241644235667038536F6F6B324539504A2B383939384454714C725743684138387A70744748594241495A6A7342537141756551495566456A6B514642325149676F50794455354F70576F7830673933743237594F6F5A52616C424B7031547550346E335059666E6858382F7742637739613956574D4B4C7178342F45734779555664534C44546C6773754E5330375270464A774C4233574863526D564F3848727530784E4D4B5643494E6965312F4C342F4559612B36475751374D6F70306B75547971414A484D54304541366E46357757635A6B577A6170586A73515634493459717952566F773631366C5255534F72445A6C52466B574A474158634C6B4B5748634C386A364D70556C426C475474593248514E386E38772B455651705256674D524E796269386C6E505342486B444C6F714E5372416C617556454B38326A696A4C534D52344C2F33447157582F41434449554F74734542306F6D4E4D6B45456375306A385664664C347A6946645A64546C4B677A6773776A7641422F566A6A583545503357695646456F484B56574A555252365651374D653948345972385551752B396B6142494471495A78594747374543444F72395158784E52713641787354467A322F6C365778423878424846586D64574A4C42677841305A76394D7156332F77424A347673534E7830705573414234444B5344732B30322B527676614777326F5641514855374F327A6A54356258453966753467567A45423671566F3145566252686562544E4E4A2B385364766B43414E73796C2F6B783448657953446F437049645A414276352B592B56374152696464514A44752F6476462B364732746634584746333676774B35484C353348526C516D4C784E41796C563139766B574756757771737173726C544248572F4B2F4C346B6A7574786A627056544B4B624356724156426D33657A6E5A6C4E474D56696C534377684C3962782B51766631776D6E2F41496C33334775394865363374666A59775A307948744867496358484F354D4E4F376C7573766336766B37315776484C4449316C594D566931735770444B49497A58726F714A666E3776626547705076696F58594A6673565076454154353434726B714B61745A4A4966543569354232374177664B4D634E667564314C437A324B46574D76586A6C69524447794637714954637447566B3253743279426152574D6E477A6B4C63616E6A444836746C476B6C4B31714975784E37366233306E55664B44624677414242594D774174304148385868477733394A6E30586834734430722F5547506479585548616F6F58727841483756374E7A494E484957324962566B3356675A547A6550374653726E3469444D5646564B7130457734594F495A496375422B37356E625A74676F45616947593376363278675538783273666D37465733436A304B4C43764C4D67305A736A6370346F57524D47546E59724E627433616B6646516F34516C3361737A65765530714B696D724959454A6B62754C4D72374F3837584A4F4E542F792F54384D616641734F3363366C745274496263626D454F7A684553575475787047534341596F5A4F324745683767693553494F796858645A30386965554B4B3463454D78486D4C373276675A797051426B4651665A33505564667A6248686D76733236637765416A696D612F6E73684B7A784363686B77386132596E71724247444B397178646975496E4751716C5776554155683952455555424964556A5246784C7439424D4872595948714A31564E4D61556E574230596B5776387A385A452B78646436744B2B386B6B6B6B2B52744357764A776B4B4E527150426A3854575452506964355A736F67582B3030554D54516B6A3542626D4356314569365370684259542B5437756532356C4A49514E5254716A6434446656535166346262734875704F70507473394C693636686B6A455653725853374A424879682B35745856744A472F4E5761315A5357534A64756B7370423438354F62656E6C36616157746261534136584A634B6754716869645141323641506A663972574F536D6B676B4669774C466D66776B576775373778647A5070587848314E6537636D477858735A37665773726378396F4273686A38466679634556794979736F794168696B4257476F316A7552456B74576E32364D4172424A78484935436B564B72696C555374437439476B4566756B5744654A2B594E3156686B4F4A35724A5A576C56714B554170513163715279366734384950686947447558674442626B2B753336747670753633367739722B744F6C4F6B65734C6D4E366F75596E4A6C38526C386C593666797545764343306D4D65753961576E5378312B465775514C444B6F755670476D72393075705635723251344C6D7443774B61453145616D46536F62693550764C372B6A5964304F4A5A704B30566C356A546C6C4A436967707038365742594B4B6452316238786662595975522B6A7239582F70767262715048394339557A76375964537A327A586F5139535A794B54327A797643716B3570775A4C495259334B394E58724D736C5770566C69707A59372B70585A6C7374596355714E6D6E38612F6F32574B597235476E37366E626C46556958335356417A644C374D7A6879526C2B4F55554772373959726C544768542F414C4E4A485755424F75624F3972677A6A6F5A39737664504865343245572F47717879724939613957457461646F626357763751614F535150586E7250587534367A795662324A745563676F684E7153725734396E637376493569726B7131486D626C5551734D34694651516B7466647833772F706F4E594653464D6B5062384348356D4C447075446956583656646A4A49654B4145426552326F6279654A5266414774685143447279434E6E6165714E4B534E2F43746F6375416F785A35413076317667366A555854616E71553469356C67434F68334C44793642705A3053576976774E436E454542754366445A4F675351415276524A30534E487834472F5136567151734A426A6C5950713743444F772B4F497339534B6B456C795275482B6E58374E6F66634E687363484B387345556A387471427A4466363939774865674E6B4469646E79506A2F6B3761306951416B6E6C3153504E79313775506A3836567841455643504C59666441487859642F686A4C7965542B32695978494E4B5034594B75775279354E784941312B4353442B4E6E577652565261566771533841443750585A6E4F343759445253557461556A6341737A75585066733170506E68652F63443348786D41786C793965734C32717064774A4A595167347153455243366A2F414847794E6A7950472F55414A57644C735378477A64544639764F4F324875577942557049435A55313954577630336A344235785654313737353962653664362F42697368663665365A707650572B3770736131764A464A3243787758497A49596F564C56336D6E675A57574D4152465A436A687A6C61564B6B6B6971517258705A79595A7966744268494F397056697855636C546F683667436C77554752706137415158314239593238384C706E2F414862366B39765757766A6865456139372F3173526637713547736A75396D7A61614E374D7953694E584479536F575971386A5079552B6D64436E54714B59456157654F614152764D536645586A6F4D4235756C3777714B674742324C57653442446D35306D2F6E6A38394F6671453962644F57594937463247785457787859794D76397154595553625670456161496F44496F4553794573727551327938526B715A70717356456A6332634D382B6D77654D566A4D5A513633534E496333314E75652B7A7757734476683066626A3638342B7049716B57587077566779534E486B61316D4B3157747952537142586C57526F42536B5A663761534361564A41474D6354796F42494B724A6B4B767937696477646E4A5378497676316867616C476F6C4A614F6876754148673363584858654D4E35306C372F7744513357764A4F3746685444735330373175434358752B447A6C32597844444B47627379385433416B30624D56484C31445579676B624E31504E3966582F41464742663759534641744C4D7A744C654865505879784A4C655670356C332B3375567A55674D63646C6F354935476C4D6B30764747764A472B316A6B3452785475714E4A354168575358342B6C74664A6B4561523952332B487767395A4C484C35744B414E615334376B4758366B4E45642F447069636947645A613333414D44563861306B55554B45673979496C705A3358754D464C514D775A564245636866356C56313657564B4374656B6867465741756470444E3470483066423156657432325347326B6A724D673276746853714E703767397738353978484D7555366A7A676843757252783161466568516F55596E534C544A43744F646E6344636B6B374274735054596F5270536C49634A555345704A553353484A556E7A63786645314A494C45694E585139757848364E735642662B4B3636755445665662374C342F376756326F6654466863795756464D78463733513932716F4D5A63674C4B68785957486A7859764B584262744D52335068434E616C466A436F597475337A754C616D673435527768424B71685A773445763142626F30377A45646363633730357368657871396B7573454E624A326C4B747961316C662F5530556A41446335554451794342313752555271716950776251705930454A61782B4D627A36623473774149504D5337443837326679775965724D374E6A4D58616934764763626A494D5251524A57416B6E7677713746553776463269686B615A776A43546B79794D4F54656C3949453169386F42456B39534430754432734C5144694D61797651773077786E55493575386E7147623077475A38744C4830677632624A49755679553779522F3232696170583459744A416A794269304F514C5856565357477A4F71684E6A3061454A4E5547334B3052596B73666A4C797A53324A696C4C63756F456665377A463459442F714E6E474A706D47474F78707256705A425767735159314B2F4F4E6738314F6C454C6F4549346C4657574F5773736B5A55756262634E4E4B72656F46616C566947476C4F6C694C387967533746694963464C476344707070436953546346444E3133686A316A763559776B737A663864774366737756656C656B6733654237636B65636E704A426A325170785635706378616157566C30364A6B586B5435424751756F722B79414A534641683264795A3338326E717778443773727245706367767674716A36774F3765484255784E57356B3172314B5563786532304555614944754F4B5048753851514B534546546C574255416F694D71783635664A5A72536D6F354959544F7A4D457133337348384D336644564E416C435152754378365765312B67733768585444522F53373946744C335636366C75356645795A57705572747A51797A4A335A6743444E4F466A444D48734B52744E7134565435623979446A50744A54795239306C61515145776F4B69513870554E74726C546B774D5750682F435556715876436775434C4D784676754634367A766A6F4E2B6B5841395966526C314E597539415947493063736A7A5A6A7031616B74367264717851574B5379787871763336547778545354706268737832493337534D35694970574B53766A5A7A4A7171566D48424378705554704149506837637A33646D776478546731504F5A5155464A565449704C464D6F495336694943795572355170695759733464324F4B3337574F2B6F76365776717736792B71376F6232507776755243765850754A316A6A7344316C6935757163466B4F6E757173706C374B3173396973666B615762696E6F347A4E44684C425058374F54686A747776505861543732353550696E443878517979612B62536861416A536D696F4A43366A6A6C57463669704B34424353444D464D59433474776C46536C6C3869613552537030464253715652436177554B66684B6943677571434E4E7473562F48717A334139322B6E6664503230366939717569756C30363639777344376C345471656C307174667233707A4F595045304F6E3747447733574F537965557A474F3653664877356553484478576263707435657A6B5A4A576D6B4D6B643448474B4E54687779744A614B61584C71706871686D4A4A556B66345A3278543872374C35724C6355703851566D56314D7654425345564B6F55685474436B68435372747A674D65347866682B6D2F692F71532B6E664B394265336E76694D76583646397A2B695A4D76374F3363325A4264743163666D576644554A44596A724B7351784D306C7A483149342B374C6A63713055496168566F7054347237665A544C4643383154516B31467055366B6B4D494D706357444F584A3259744F4F682B7A6D636F56786D714B4B7772436941556D6B584A644A38627538787967452F337364443250466935693165534945795246793668646544726B48556B6132436F346E35416A52386E3178566141614955544F6C34617A50504B7867457132746244704A53717054584956704261774A496367686A4C475A75414E5470784C2B694B5A65366D6C6367613845734F4F7975786F6E5941506A35622F783550706254555631536C56716167417737714539764A72344D7A612F37425A554179516476764A636549753332766764384E686A553747505233437838523857495062357332775152736B6D4E744E726567673436346B6C794C442B4C2F4F724850732F5731316C674158512F4B2F32416B372F57366E6241683977757234386255736D4F514F7971514A5143494F34374B493432596C5357596673574E4763735142733852366B42496446334C7A2F4436747976655774696649556C5661744D45416A6C73656D7437764C716A5A794736597256362F79642F7253646C6561315970505A496B6B6C5952567049753671434447777365374C484A476A77324C746C466A6441333239686B6B5A704D4252536F4B53376870552B2F3376315A743858656C5346416F4F6C6751574A617954506C4A4562744C792F7030313058534E574F464B5A534A4346454468754454635655694E4632524170486B7352795A6C30704B37584E537056714855464649533841744262632B55663659307236464C314C55726C666C424453626745457339764B626E4839366D396B4D523154564E6166465253744B72784169426E346C6B415659342B446F485165444E497577573248325366557448505663736453675642744930797135504D35744163515762413555696F436852594351514A686B67456C33764C44553465414D4B48314E2B6E764E4664735A6644317246367A4A495A343866504C484A5552774841534F704773534D355972457979464665506C75555038414C302F796E4851567051734B53433531464A59734378504D64774E75726E43797253533555472B374A6E7230646E37587647414C314E394D48756E305774323553365A7A4E537A4545525571515832714A3279306D6E75465A7145624979673143626B6A727837536754464E4F365846637071436C4B49765952302F4F483957754D75676C657A763238753370444D576245536F5866644F43423674716C6D714D2B4F69614B617A324C4D4F347053733651735A6B6A423345564C4C42353575306A4F55426B57633536685762335A42324C36584967544E783374316C735266737154634A39436F2F563845507054366F2B75756B706F717A3579367331485A6A6776446E48576A71704E4C45554E695874764130714D39714A67775963792F4A6E5072776F2F7445703074313639376658614C73634231736B584F6C413747506D2B6D486941574F30346133327A2B747A435A534733692B6F73724855753342646746566F46676D6152447441676D6E3576504E574D3863414266376C49364D6F35537953475347746B4341616A456D5135596875345A2B6B5045626A476961617866576572766530335957682F50427A624C317148535A7059795A727252666656343559304B69784F743237334A6D615873715775646C62736B7032372F4148426B31702B5070614B5A51704955377444737839557659704834693243715249586F4D416D7A543232657764323737346F672F77444635354F537A2B6F503741644D56362F4F537A394966515632615253776B4E65543378392F716F554D464B786753786548645A414449327834303365754174376D75706E2F414C55703033384B5763744F316D7459343574374F6F4875637A56767057704F6D7A6D5353543650413336786A6D67697356613264737A6C47696F3170652F456F42526E536C5571303470437266464176327A5049475966416C3475526B565130576853564B5431597679707541626851732F5331324747344F6B45454D326D57507166694A5070653850363479386D52537474476A6C6C7946792B3861636D455833636B6457416F53764B534C7445536F367072556E6241566F6E4872656E535542714B53482F41504A2F2B332B654E675470424348366E5547456D47625541664D59304332365751366977574F2F747856384E6A325761464957516836792F65534E77437942354A724E6D454D654B6B71674A484E303962464B6B5579566953707A444D4744374B424A642B33797875466368535573486433425A787641386A754A37596C4F61757839306F77447931736C6B356E5A5372685A326465394F326D5552687A424A4C477A65535656434E376231366B32344A4B703648653459584A75482F4F477143556C67355939503362656A6E7639666646494C73393235335865544B6455454E4F374A4A7A713436464D6447374A7948397435305356322B533931485A52796A5865746453516C7451544D51367245694836372B74385435576C414A452B5453574D326C50776D775944443766546C3766546461395755597130652B7A55573077455243666458576868697272794C4F4753457868316A57556F735A354B4E443158383357545153746451737A37744C4F4A745A6A732F5844334B5A6570575542547036374F656765396C4F7A67432F51456D63644F66304F2F53766B4F6C634B2B587456475757394168352F617078654A514848467A42765237752F376A4E35487943373472785032713470537235737070796F536B616F4B6B32654959422B6D32724635794F6A4B35623356514456554354634168755A794344306D324C4961587464576F563748504747564C425672706B6969615377384D6A474C76743255577A456F596F494E38466A61574E6C4D4D727874537165627270576453536C4C794E537559584D6741694133557365377A72397A5657684949484D674146515979474255624258566952646A706247707A6D4A7152524F6C696A474976757170454C4B75326A72797873345A7049335A6477704B6E4A5137426E643247323336625A66694B55676C314A556B46535437776B7049674B534E4963417A7065624F4C6B553842585546566676455648536F70384D5159456B6C302B55676E7468632B73666144323736777077314C66536446387846757857795A6F554A4D6C52794D637355744337576C6B72585A71373170613676586D6A6C6378544D4A66374452714A582F442B504C514F624D7256326459666C4837785A56336934505443367277624D55334244302F7532447664334A506B6572624A784C7248522F7742514858742F3254782F554F613662366B3655397375724F6E376B47587A636B746272535045304D68585A6B6C735430736857793971504870466A36316D712B4434785670556E67736D794C43543855397038726D386A3772336131715A544B315343556D343048725A78717671614D5A344A773349634A526D4B6C46716171365279734F51735963464F6F74396B4A487866466A6B745348475939617343615A4645636167496F30767856534551654171364774676646516748726E7456594E4E5368797671495430536F6C683035585937736B52474371437456636D3653705839705A79306E53357537674F47637063746955644359356A5A52394D705A6F31307734485A33736A59386A342F6B2F6E66386230566442424E576F544471554F7537374E76636449624250457136526C3167537964496C6E5A3255302B6A776D42327777325A7377346243697A5A6E6A6A72526B504A4B3552566A303231424C50353243674143374A304E48382B6E394767566F6B36577444377150555035783963632B4B563171716C4A44434F387341316D6477506766753451333347796551367179737371784E446961717A52307167566731674D46376C7156575A416833754E546F4C45344B6C2B536B676C4E417042477535365762613439665872466A794B50636F63754641774F326B44552B6F6439394E6D4A6359474565436C6B4A6951424A4A4171796351434B384A5037454F7979414A714E41306A52704847696B486A3531586C6C454F6B7533696A596B4E387750355959707A483971437452626F304E79673771484D4E34394D45377033426F6B614C4546524979676157586946354D71727845674B687A3843547833725A38667759436B6F4C46444258646E76312B6778367057425574695A6B584A335966514A3648796B7134796853716F444A4C45584A506465526F78477A4D774952586C3475496C2B524848346232574A4A424769564A6368494130707554467848532B302B4734445943724373704130704B55367268796F3870614F5574363658363762796A6436576566746E4C5971613247344C574669714A47325276554B39316D436E6B68444652794837782B546B72567130736B6A2B38376E7537702F5454474279697545676B56434E577755386B41513573652B4E744E51787557635671347079417179735A46466C55676269486D6B6954584A5175682B36546D53736136356E63724C41317141536E3752436E496E5A4C4235595875587845746457677050764B613076716255707742704E3267443078457335374A64455A47727249557737494A544A4D49613850654C7330726C7A484172616479447833344B364F6A3439545536704253456C77533351682F5657302B62532B4952784561394251524C427A633250324F5634623064694D4A4637722F512F37646454726D4C6D45692F704E367A79344B6C576E4E475A316E45714F7969764537767A42456758794153376E556E706C537A6C656C5A522B4A506D2F77416A352F4D675A76377964756F2F3751506F667970343935507070362B3971786B6264476E6273706A62647178546D6F776B494578386B6D516C696A6175797574614A6A5869516749497A4B694E78476D3957724A63515255435556437952645A5535466D63464E35676C51394D4549516D736E556B67486C4142447A30426858377741485830506630752B2B45765850542B5A772B626B65504D594B3139744B747070316B6C5062676C6A7338624C686D6B6B45696D773859654E6B7355336843704F344D5763793554565370776B416D424A4D7A4C33307433692B414B744B7168657053574855537A646D532F68656450707369502F697A635A65796636706E7354396B72434B6839445874786B387138664D5474693650763739546C756547416B694D794F6C575356553043375171586B5151707937487752656A4A356C59452F744330674F7A75345A324E2F497A62767A76326671436E6B73776F674B664D4B53512F68533137485A345A6D39636376463371475577794E596A3458637A59613865504256686F68494374534D4D476352324B6B394F4A484D714F586B73534F47456643522B55465A537052596B4A687A64683263644E6D7736713053705A556B4853514341782B366E7476306157784248765458636E3939645A3372706245537863775149714B4B4A6D6A58594A456C706F6E586E794347456B46316234374A4B6B684C4742334777314E34667A6B62596D7030686F477042655362395476456671324D76704B33596C7947527A6C324B4F597751516D78486F446C505A7379576B6A3471783270646F5234625153434A664A424A386F6853574E395476666C6B4D31766E6266456455424B74435145386F55524C79536E654E2F787873726D534D642B59425664586E6F777A4D366A535257685A7432475A6D626175715249794E6F4E77354571786A4739716151505435514739552F47373430556E6B473555566432435853504F4474706A456E77426C482F4430582F75795549624E67435477747139596E6C734B76414D5A5043524B6F344656554538535647784B674876534653414935575969537150756B5467326D6B49515242595245714C674165696638544E4F33526A2B6B7037456A334736796B7946714D5331363836744D726F784C515532685376496E4257304A726B6C68744869416B6141714F57687A483274346F7167394A425948555A564A444C425A6752444D7A644944506937384F796973766C45356D43564A41384D61536C4A5A334D784C2B654F7966327A39727364303530786A4B4E656E42323471386352415144356844733864416874674B534364364A4C456C683634725865765871316C6B6C514A59453363674E7331335964685959677A4F615770525662525A4E3079706F4A734337796D316A474352503050516B684B4E58534C666A55616543442B3473507A344A62586A795041333433437441714563675434515A426357506B336D507777494D3755424571484D4A31456C4A4738447039504C455079507444677267634E42457A6B2B50375732494F77676C4A3172656D386738767A76346765744655306771414F37523049654C6A742B57435538557A464D445257557A5343354A5052324675353365586D4E2F2B534854384D367439764757585846593430493467374B4B7A63523854702B4A56695353764D4268724B534575475053374E30666C32374E32787658347A6D4B744D493136536E2F414A6D6B48796A556E76633949784A4B2F742F67384C4479464B4656683079636F6F32327944614E38673778742F7368383632537034366C55734A5A493073712F4B4662624B336A70615777445471314B69744257516B3951664B7A777A6D666B62593057524562536B4C2B53797346504A564365415143447344383851473846695035394B38777371575149356D324C6C69624D57423647776B6E466779694E4E4D4568796B4141335630503637486438542F414B526174586E674A63454163776A614A5A2B32643857346B4142574C737A3630716B6C742B665739436B31516676463146512B7971484474384C6564734C2B4946595164503841616177705245703076744F7077495A6D66795959392B704D7A42316166365A53734378693667452B536D564A44513767594C576945696750616B56676B736B4B68595142433977794B746546374A51704243515866554F6E377A75506E33636259726945476951363355584A5345674D5135446E564D46374E4C54474638366C574B4B65564979376241456531494E676B676A75486A2F62515373785659312F7A786A5641692B736B4D644B59314438384F4B565230426C422B69523244586D5071646A7A59682B50684A73496B4959797638417549444C7930363744534C79334770327363536E69696B6A6B75774473517956416D47427439304238626C524C75664C75432F5554396B6A744D4763527A336D39327352374864483548713771556943706A5652454C525366617854536C45686D736D4B4F5A6E6837685173384B765A64456C4B5678784A415757796D637A6C5242545431553951536F75485349495A32764A625A67594A44475552714345696B354E316134537744487776312B6467446970487154363050666A336D54717A492B7A48516E754E376F59587036726C725634644573656A656D4D56485472765A4358637262733073726D306A67696E6A737877563745422B324B513137457242505630795873726C6132684F5972476D70624141556E4157534F562F65417332706B7738513834307A5045553548554B744F6D7A38684B39524B746B7470674D4351583737347237752F71353956594F47617850394F4F617066385054505636677949367A53327773343264496231654B656E6A59376B38733969554A584C534D3747574670564165577A44624B503948484479716B69706D716956564E576B6673326F713553542F7A77595A727A364E68586D4F5071706C4957616166654A314A706B43774255447159757844676273785A384D6637442F72592B302B6476594C44582B702B75506172714C4B50444A4C5A36724F527A2F546373377876396E536B5765444C6D76526B4573516A574A38624F776C56597035334A6B394438552F6F307A7554706D7252702B2B792F4B39516C4B4348576B412B3731726431455271444F38733241523751707A494A7155365761516B674661566D69716D355341516E3364514B6C6751474575576438577764492F715634436C5971592F334765684C684C53566B6F3958644E453263644C597950495571325478302B704D55746D614D7731373657722B4C4D7951783372654D7453787854556A694873336D7369556C70314F527059754F5A582F4D4947327A422F514D6B5563706E45436F676536576B3674506A4D4741374A5A3777434C6664597578533638782F55565357336A305676764F5455325552744566674A576D4C39386A67794F4352795062694338576B5078435A5353685254553541433132687634667165324A46554555553676473651574E774E6958426D4859656473434C4D5937703771644D72537A644F4F7A5775556249724A4E55526B3457596C7375475972705868617A6A332B636832594F512F5946566A53587048753068693369667145374D5072714E6E36787271716F71314968496373354C6B5265417A4D52477A646356303366596A4664445A664D6451644852436A5A7553564A3746434A325631544C4C486A34346E4B6F566B2B306E7079776F785670567051315A396D565654307A476171564B6D6D6F6459696264663731322F4862476F724771436D6F51356832443830512B38326432334F464C2F3841453034614F392B7063325A6D764E6A6B364C2F536869366E696C505A614735652F77445048366B4D5A6A38584A464C747076366B755179454C396F477A4549315745415479632B30634A5372396B717370412F326C523075536F6E5557596164393233683938637234577355386A56546F5753764F4641556B4170436A543936356B46744B6B6978356E686D4A346D38686D35374631694C41374D434D7161554C4541497746437278585367724832314149514B71413652543675424B437041484B516D6B475534626B535868376D647936757259734B6379553036657051425654704C3071625545314B61567063414734556C324A483353625938367552627564704A324B4A544D4B76746F3137746E53534C6F41676C326D594B77476B4B7157305057545438537552634F346E62794D4A5969626C72786A7963325657493867312B2B2F776638355A6A624D62596F5356705557624B355A7779434D6952366C424B564E4A506D43466A542B706977473850455949704641434F36774C53484C414267384539543951507031695455745A31457554793944636C32596646356E7A78343337426D5A6F554A496D7353537A75782B43534E454B71796F64425853476C596C694B386951376B623448786D6B585533326C75776A53574669336E764F4A6B674B3074396831657169346A3533472F54425277706B37324A734C47733071346D61574D714E4D6C735A484B6C65577464354241736459614159514F4542504562447A4A3932756F6F2F6458625A77537866544C6766426E3277665370653858535147356C70663934626A724F4F376E394658325048543374564231486B4B557957707147436F77794E4448356971346569564A4C48636A533268616C646741785942794273612B63766137694A7A504546303653697946566453564D4243314341436F626E70654C415936586E30707975516F70596150644A55416C4B5835554E75327A37765A386446654D6F4C464643536F58555371532B6D59446775674274574242506C6677503447767A5845674B5358454B6B6B48762B586937752B4B50584A556F4C425A4B795148564941487276734432746A615042476E785A4F59336F74702B584667434E2F74304476657953664A4A33767868644E415354504B43595957427577784551595A546D77657A3775515072304F4D6553754F5476354F7847666D434E4F716B4141507A5567622F414E494A2F4242337939414B4B53535242507759672F3662597750654F48304D38747142303774335A386179334C587270495A462B58466D484E6B4C46674E716F3866456B3867704739663448353961594946496D413847326B7676732F6241797A56783953446E79622B36475656626C734567666765422F42493172342F2F41456972575335646D6D35763256645858704949766876517961564C4A5941525A34306B53492B6A586563444F336469724D37533665646C3148455764566B594562557946754B7171686E65517146434937456864734253395662426E535A636273796E38515A7A313664496455304243436C6930794F6A783032764E2B6C38546A41596D54495171317957524B446776616A4B75456D54583971414A4533772B3530323130316B786F3679736748463346436B6665494E7751434F6D796A303232394F6F776A7A745A4355314750507255412F69456E7462637835752B4E37314A6272596E4772557256363049514C48485471784B694B32324F6F346C4338596F316154546341724E4D3462356A31595064464B5158476C6E4869336E703866394D562F4C2F32315A6453704B69423462466B6B52314C4141743537774272384D3253734250784E47326D49484A347849662B5570486243764965515A32553970666B344149593670414B673437506259512F2F54306E6F32476D68434B616948676E2B374145517272447874474A5667656C2B325A3575776F7363644A4C793767694363797644695669353641477743572F486A7A366C7A5364464E6B73435571307459474A4D54654C39414A77416E5070537370716B6B416A54595341584F327744644C2B53412F564C394D755139782B73756D2B7673726C625856315470594E396A37636456744A633976576D69744333567A43394F7833736651735A32496F364A61745158544B6E4776616A754E4A5861767677666A46506836565571775A616C4A4473686F4242596C514D4F66737335476D494E767947637979304A70556D3156514170533067615746775156454F44306542752B437A3046395733576E744E30524C37625676707336516B78454F49544677446F4B374A30714B733036576F34476E776B31624C4E4E4971737367466438644E4F64474F4B464A466B6B7356486A575871316164583334546F574667366B7534734348495944315A765046633433374B55387A584F622F627951705156376F565636556C695170676A5334376C354D464C593567666466716239517636662F702B392B767072773374626A70505A54337652616E56526E36476836687A6D4D614B366B31544B59664A304D6D69346C70493866696537647946444956354B394F7567735179714176554F4865304F51724B793152645A507630654548514574706E587A6169516B71326B73354C6C6B7565396E4D6C6D31556B31737A575361644A53464B51706A344670634D5271596C793967386E46662F75394A316A39554E62324B772F58667437306C3035376A394B394E312B674C3254364D364F786652335548584574374A4D2B4D79335746504531614E484A5A6D7245745448306E3347416A784C4E473573547947335A6A6A6C4C4D7070696C6D6B4A70705471585271454D6F424C68676E573553746C4378756341384B396C386A776C4759574D3157724253664170525537714372456A77754652396F53544C6D6633763841593733732F54653678365777566272622F6A546F54715070436C6D4F714D665474566A54776E55575168534849394C7A563657537977466D494C557331726659534331566E645A7135614A6F493039616C6B4F4C696F6E2B79465243464E72306A55644A59493036334A553544674239385355616D597969785653464B6F61674168447156634536675744582B3034365071786154394648316D342B72583662773950714B544A64443569534B4358484638676839764C646E37694F7A694761374C667962345A595A61396D4731614E4F74473541456778306337302B546530767338716C57556F495470592B454B6653346E537744754C2F4E38577A4B31714F626F68536C416C6D4B4943703249637461326F62474469383672314655765975624951576174694332396D5770597279526D765A683259495A497041575A34753271784D794D554B713362354B46335430556C7057784942456239757A667A3759697A435178505A673371543472377670324C64734476716E2B6D427037565A3433676B7133726C6773306F344F304561694B5357514B38635935336249426B6A4C32717A316B6A3532346C39485578495644414148724C2F4138302B703746545771715456546F634A64794F7A323752627548474A312B746C2B6D623035396276574E507171746B702B6B4F7648396D4D5437626E72436C4459767A79394F3462724C72727176475965396A4876564B46724831387A6E37396F5278793062746A376D78464A6B59344668693958544F2B3064666733464D7252545155724C71516861314253416B71314A4A3553437277764942424C6A7152542F5A723364544935674B4131707A366C4A4244756B5A644E4D4B63417336306B4D53432B6B776E48414E39577636555031672F53376C4D35657A507439633635364A705059752F38633941566257627838474F6A6E30725A6E4468487A3244454D6249396D57656A4C6959424B56544D58457279796A7058432F6244684F6649566D46307164576F7952545543384F6B4678543068776B65686B7671775A6D7367706B3177433671464642413256536F55365A5A69515343676C774F2B344A72425257674A53545935737A676B46764D424D724167382B50795469716C675A474156564A3046736F55697156436951515156414A556B70596A556C6C4136544F774C695151436B34547655703153464A57454F30705630657A413332375849784B38626B30684F4930326F36564B5257535656515279506279466C705272595A33536574477A483561534E584F6C414171304B424A6142796B695137616D636559734E2F54447A4C564B4A517931414C4A49615136574447496638414E2F50626B4C4C4B694B59777338306A517377424963326579696B6B6C74754B354F6D31474372747654636D3043776B4B503267594A42747A5038415A62344754597332446B7041446F5357506E50532F6E486E686D2F596A6F2B2F312F37673943644A34384E4C4E6C4F6F71654757426C4A6B4665652F564D4B6C56634D355A556D4C6748624A4F584C654733584F4D357335584A5A6E4D4B567053696D736B6B6D417970496B335A6D446A5A38574C676D5758587A7442435575596151785A535875525950654E6D66483031666F3439766F50626E32783659774E6547434C3766455966766D756E486E4E486A715555684C742F634A4437354D78472F42327832665879396D4B2F37546D387A584339515574656B75534367714A643461474579504A69627437534B516D6D6D6D6B6A6B6F4C53714443694761544E6A4B5848553264356F5A646F716F6461322F45374F6751646242567A2B504A4F7A70746A77665779464B415A3141483961756E39367A5069685645725653526F43695353453653427554636B667666686A38547A622B49415A787259326534506C7367615937444435664C69654A476C30415057564C4A68795247356378332F4C474B594A594B4C454E3363686F6357655A32366947314D38736952737A52764772667A7476322B64654E647454352F4162794350382B6F6941415470466A743277534B61584443584453664671595750515066317842637462554174493463414B655949456A45427449426F456B73564779644462614F687630425657304169643337513364796635374E4D7453466C7875565863656A77586263576C33595A5A624B70457A633546586957437158596C325656566C456967794575774C5078327759447876666F4E616C474248714F564A746479342F494F5352687A547070486742743868357462455078564B624F5A685A70672F77427645794667342B4D63635A58516B343867624E706A74592B334942437971774463517047585336674E39396954467576586C756650474B395930715A6357684E6E63694F7344792B707777744F4E6139634D5752455148536C53655478687453454C344D714F564C417472696B52444D786C4376386E544776537150447033466F484B6248717776696D5A3936716A7055376C3143774475536E3471454250694239426831566C65375A345539786367562B3666516B6D344B5478686A625943387A78646D5A66336248497153446C4651476B5746684550473737576B74474E3872545454446D374F6B376D5A753875493344513763324E684B4C507837696D46476B48776B58746C396679584150687A3869784B6B624A4941477A684C6A784F5337796572487048364E7362316C674955456E5346452B72454E316A38765042657030596A4769566F673069674E7847696D794730574A506155486B796B387554445A30522B63715770514955537958534845633352723266704745547356456F4B2B5A4C42774776463075396F4A74455349503154304C4E6B6F57597170514C2F79305A39527335354F4559474E677A6356566D5869796A6835495A744C71314B6D7653536A55557A4558612B7A4F5067426244664A38527055536B476C4D416E6B416977732B6E62386F77752B643647794F45747A53564B544C464E766C4D6B446D5851566C6465363537724C74565954527939347377596B4D67506F515668535879306A346D4D6B51354C70357278747669335A65746C6337544155704B5636515A65396D4C426935554E7A5A696B3430313770624564545637427543765A7951697256347046695859727854522F63526D747969426237636662466E534D37675264637A4A596C64354C69644B6B756D5173685131527A416541687454416247783657315956356E68465A525855514E534A4C6861486152414B77727230446B4E6755645A66544230703148676F344A3665456B796465535357746B66746E7179797949455475794A51627545584A34316D6A646B4669494D6A4D36534B7A4C5936504852545A53564B49467756414F547144546353586932393849615754724A72485553554455462B6F4948596A5645457362772B454939342F302F707573346264572F6B2F7638622F5549486D7257786173476648535974472B77736C4C4969734E465A6D5646622B7A4C4832577376625A37683754536A3754696A7A305663795642524C366643583354627937594B70304E4E455531494572424C715443527631506F783643324B62385A394448314366533537747262364D706A4B3468386856794F477944554A62454671434756302F704E6A767858367364777853785532723565536D32547354517A342B4C4A72656C6846705278334B635579794457576731536C6C4A5746447A6E51674F3352566A32474D304D6961465931715A314F70394F6B674A394663727A396B4E48726A6F68396F726555766441644E304D72304A637765546F346248303538612B5671785656574B7243466D687179746A6F6A576E4A63527951553267655859676B6B3176317A50504B54547A5A307148752B6F553433757A71324A322B304247707956446D304753646C457650393156767737594B5855394B314669726954593244487833554E556E767757456B4E4179616C614B4A43574E69593335455971465353744141784B784649716455547A573748344B682B786137775866416C576B6C617755684A454F66756D7A793233335274317866463773597547396D3672504757497845635A4F7872694C32525A515153504839787643364A35486C765131597661696C377A4E5553494B61535A444F2B31314472326231787A7A325A422F5A737A5A766672506C4B767245665443642B34487370694F7159724D5531594C335935684971426C5754756142354F43517A6345587462494D627143674A477A55416D71685876645253704A4263454750436E63334150587933786236645A4B51455645756761665173387633763674696772367A6630476670752B6F5733314231513244792F514875446D4C4A755364633946575868737A3350743434316B7A5744754C5030376D595A587256336E37644F726B5A4A466B614C4B56704A7070425A65482B32484675466D6D79685779364333756D477474525551464743354A4C75545A68396E45367147527A594B4843566B6664575A737A684C54415A4A3849383863786E31522F6F512F56783950633875533976716C4C333336546A4255324F6D3678776656304371386273317A7044495837427477635271424F6E38786D73684F556D6D73592B684445432F5475452F306C634C7A67536E4E663747736B705568564F7255316C494A4231556153306E572B6B676C77454F6F53485771396E316F5561744E525541374A4446776D5A6339446144473059703776346E4D644B3576493950395459624D644F64515952326F5A6645357A473238546C73646B4B354D3031653552765251574B3073535472796A6E69696C557435586671373063316C633045316156524B3056474E4E5353512B706E634E725349756F4235413634675655725558517567704F67706E5A74374F3563526534386A626C2B6A6A376672376B2F574430504C4C555757723034637A31564B334A3237633247786B6B745A6B504D4B3653546C565A5448494378444C726C476A637A2F414B5363326372776E4D30454B415774535568424630717031697A6B5863423356646F78306E324D7971564C703534716441704C53384453725854666C4A3177782B794242337839475432776A61726871304230653344556A313868384669514567626259565658787468352F5049456E3532794E4E597075746A554B7641344D4D4153344A526344643548664258486B6C645373556C395955414833314539574550425A6F66426D72336F4946354F7949326D567043645073734F4A312B56414838674D4272796F2F50706970304A48564A6E31302F5038635655304B7675776E524B56462B5A4C423241462B7654317872376D6367694441754473386A493556515730465A392B4177346A795350494259445A3952367A31543846666C67796E6C5671446C4236334865594D4E4A6B434236596A6C6E7147736B636F37735338755361566932773278754D4F683052727741546F6E39332B6E3135532B552B52387244764733566D624736636D70776F4F64425372304538335330664363422F724872616855566C6A644864465A51786349685A674A46376A466A785941756E4652387549346A6B664B2B727A50732B6C2F52326234483559655A484B6C5A4159704E69592B5966726537627A674835627134324C4137556863366155324367586D45415A7059596A2F414F7A4633565646416157647051366B635436484A5A6C4335652F386F5071547430772F6F634D4154377852355A6B6A536C6F4E722F4B2F6D485076747669374278315357574E346C647535484672566D5573716F736C6B6C576A69556F46545159536A514449506B6654444B424A556B37615833355945365A7335356539327457754D4B536861716153436B4C5A7841456B4344306665372B6544426B4A49715647575352564843456F7355624B533541516B6C6E5A5067703436626B47632B464C48344777307741437832455342382F46492F5178554B6D7056597041644A57706C644F5936666A7647385942316D65573765373752727948494A345A41696132517173456B596B374C426B556A5A436C74446571316B714A6379335863447038384771547035573073525038414354743037596C574C72753663582B54466C597536364B614F324B6F476258785A503344592F6737424A31537431674F3544506637586E5939764B2B496171536F445148594B65772B37313664786733594D4463664653716C554A553731386950787638674651535234332F414A382B7036364E41706E3732723561667A776A576C53564B42444679386A71307A33784A354B63633434736F3473666C38643738454165542B4E2F365631722F70354935414938336A70353951516630324D4D7742646952332B52412B574E426B2B6B36396F53454972416F366C6650674D415346424A4A4838654176353253504871425642426B582F516A2B622B652B4A364F5A7255694E4B3243656F66792B6254486E67525A5832676F326D6161425871574332784D72507064457342706B594435674E2B377966424A4249494B387655314F7A4A5A74546F50566951353742324978597372786F307741527268515943534343444A4855764730346930337472314642714B4B61477845336C573052776A4461334971686E4A6A4F676F432F494C79495A646B35436169474B566D506A4E6F6B7333546274676C5845637655436E5470314E7A736F6C78505466776B44633973612B3337643349346B6A73777045736F5A5635534D574D6963704151653241476B546D704A3241496F654A4450734530366C5170366B547335414D7630364E3473446D7546456537356B5049646D47393250795A7947774A4F7266612F465A534B61706B34495A45737A6F696946654D734C78704D444C4735484B4D474F7A4D436F57574B55636F7034706F5A4A454F347A4E64482F4471364A3850325A506D727A4D346E5458534C674276737353502F41424E764B30593332523666707734754B4758626659514F3845684338757844546B525472515539797377696D58697A794B7136614F5973776C54564B77366C616C733669782B5A4C434F6A74665447416C724A714F4134483268647536576671465031335959584C334F69686F5969576C5943315A71644578567244475178795352465961396B72492F4A58456C64586D72727A5A4A4A4A4247316D464250477A79514E52656D43584236514E55374173572F31784A70503643762F4846382F75466F356D754E416E2B6E52676765534F563236515350794E6864722F6E794236742F7447487A4E4A6A2F414D7049386F2F6B7A642B324F58657A4B6D6F5A6C4A634535685142326556424A376C4243322B365171306B6254776F796B6B66454862416A6B4473364941384466794A31727A76382F6E645930616B6E6C55534358385877505254655145746979717163314E445072594251735157596767534343432F526943584F49524B754E79393749593877787952304F437A6D5A55496157514352544678424F6F34316350792F4450453267704B6C6470525572314B5773636F735378384B535744767566676274687056797173765152575353564B6C6D485651484B5233487A6B5741773673397063426E613030567572424A47792B524E4372493378645279694B6471566B44664270456370794A586A794A4953303646387071705541344E4D4D44733967486B4B2B4278506C63336D454A4369557153536457712F325933697A4F30767669696A36382F30657670792B705238686E3835306648674F74706F6253564F76756C4968682B7136746F565A343645312B7A56715352357548484F5933783850554E664B317145556252554670642B57567242777A327634787764534B6E765656637654556E33744F7554594571476830674D79566170496254746178496F5A44694345697169676D707049636C43584B6D767A43594A2B38354935676355736670792F5452316839423331345A2F327638416338444B706B2B6B63332F35663962564B566E48596A7166435A6B3461436E61715662735A2B327A574C6E6F574B6D637863562F4952347939646A725157386C516B705A664B3250327834316C66616267347A4F5543686D53716D71716C4B67704A434B56564B394B554B55645770615335444141764F4C52374F634B2F5A4B5330425946505376536E5A79716D7848574157355442336A485A52304C3154424C6A717A784D6D355955476E5961567543747866583433794774445A32503550726B5642624A414A316143456C694F56554F43327151316C6330625967346C6B6C4B724B43645832692B6B6E6C636A776741542B6939706A5A366F4B68574448524A3542575536312B5730526F7153426F4D41522B516438537333764666705977737038505548314F3068744E396D647676523466494E61475A44715765566C3349774C6869686372496A4B53664A4241506A2F4150662F414E543638567159327548752F5A33623957784F4D75696D4E4D42684956636E6F7A447963733839336875517A396B4E4A455A66784D714B64685172666E6947596C3131763849334C5A58356231366A57746B48555643444A6832425938326B78732B313845306153464E794B4B657954456D374D775A7A477A47577841656F4B746E4A4D556A6B68377A534B764F306A57496F6F7847466559774756544F3861747451785543526B3232325830445571616D306B4873376A66784D383944385A5A33475770553653664270447471495A35612B7A54443750695839412B326C6578612B2F77416E4E4A6B4C5536777A38625162737831576343476C5768557242574E6D52576D4C716E63634D2F636558745274484A5254726B754F567063647274313366792B37694C69664578535437704143584261574C54627366776A594B6154485678564B77566B4A5246494370346A696A2F652B704555456E6943417A6A6D4E7238742B6654544B557559426C64427938734E667143542B4A62464A7A3159454B714C576B6B6B713071494372755152355832766A77367152346359334A756242744653764B546B484F796558344361305979725261302F486B716E3035514342494964694842442B542F6C363247454642667661716C4B476B4B55564A6541515441467532352B65416F6276626B585951744A382B5374723438694143515662594B6E384537476A72314665424A65776B2F792F6C355959536F6B67456C30797836424A5058592F5845363666754B78585A326F6B2F63336E6D704C6550777532587A2F506E512F6E5A39527068537A49446A745A4B57623447327A656D764B6C334244515846753536756677454442787772636C557279626A6F68663543727657767954342F4F76776F2F7743766F685651724351667367676572666C332F4843584D495561684953534F7246724A46342B72346D6B414445447873656436332B51332F622F41482F50354A38654272435545395232612B2F366A4172486F6667635A725262556B6B623134495967723866774E2F7A2F7742663837395A39324E7A2B483534786A587977684E75363867664841386D3266493541442F4C6550384141596762333866556136656F464C466E36627632752F6F35785054567041597A3276667A647250322B474E6530412B59614D42333468674542325041436748666A6A343844657A344F39656F30305571554158494C2B4C79416C676C763052676C4B7453536B4B5A55627338374D36724269322F6245563667724B616F726F4A576B4879527A7931464B724231655277523230494846776F2B534952343078626330744C6743476C70396458312B654463754E4C465651637167344A414B674A416C2F556C376D304172726E316C735A4F4A442F41477466637A74782B665A64616841565449364B53736B6A6739794A6C4C42436F413250576E75783935582F41452F2B4F485368544641564148636265593364336E773336506645637A45547055574635444C484D3050486274477978647749366268434B564D617633416438766B5069507873684145424A2B70382F77424E6744585336712B4838734A31372F5430715054575176334A574443745A37686B597341676B57775A766B3447304D4A43736E4C7935554653322F547668314D69754F556776414B546631503465654E66664B362F39492F387358732B37325A5447395631595A474B4C4C67614D796B494742635A444B786B73547653674B4F5774487872662B587674526D44537A6D58413370426A2F475932763576365069692B794753546D4D76585751375A30366E4C663841306955673276742B417542546C4F714934715669517A4E78526551614D622F4441674C6F2B57627878422F4A49554479505662586D5254705641447A41456B735942484B58477A4B3737445A7357664B5A44566D4D6F6C514767553871326F394B564E394D4E422B4D58384F423130426C35374F4A735A695A695A4C3971356166656A79694E78316830514F4A48596A69494849364C4D43515048704C6B63774374533138797A714269536F465141744D52316276497466477372525172396D516B4F6B556E387A527071762F48734847774A62452B715A654C494C4B5A4751425278554D6F432B442B4F524A477A7361304631352F6E66715535696D74536C66764D59564A5947343839747A30776772354B7052516B5343734655585353732B73737A503963524C71796C424E576C357047374E46497835426A72614D4E676B3756767873715235312B64445779545271425775615938514936677474496776384F6D4D555656556C41424D743848446D49486C5976414E3855722F585030566A3748536C767243725469485576746A6C635637685943394530634E6D436270703537655572315A64526B793562703173786767676B55474C4946747179643543736F57714246502F3561716C564A4B646E556B4754483241583365324F6D384472464B6158764A5355732F636C4A2F69674545504458337850765944336E716451644F3434783541324339536F7852434F513142413269456B494934614247326A6669437637642B6B65617967796C61716C4930757656745A6C50486E39634F6337535174657049547161344C50396F377749623452687363646D47794B686B634E6F4167634562514A586A794769415370326678736B2B66343942595231774B5A506D48653363717350435038586563537574576B6C53574F5255484A74786B71414E2F6A6B41522B51646551422F743632564C4672704250362B48797775576B714C7848537A7344312B4E3536766A5235756974576F62556947517049586B4D5965513657546B646B666C517649374867482F6348304E6D316E3359414A424D4132334145764635506F4268706B36576F4A53444B6D4276396F7347377941543545594743395A5959355357453371582F6F6532746C5A4A675233586A6164396F6F5976484243736338796C44345144795741394B2F643165682F784438384F6A7736723775337A542B4634487837346233327237475A705179534F6F5732334F777A4659574B534E7544533756596774627473465A5249485A6A7856573058475449714431463467694C2F414D4A6630474B4A37525531304B6A757A6746757352485A6875345464375959332B6E55596771566F346B6A546B794650416C5A54353844397735666E6E766B522B5350487178554E4E5053576C6B6B76756F742F4F323232786F46617457557065705467715577625A31523267572F4C4162362F7370567253426A7763674C7831386A3839425473613264456A513861492F674554314B6D7432646A763232412B4266614C594E79513934744C374E3336747631496D7A345876376578646E435237507A2F436738754F2F6B4E6A6C774132782F486B37504C382B6F6152645A4E6735612F3341573958627977375075364B4134446E2B36706934366E6F71573341356F4C627A476664554A6F6F334A414C626A5A664A56755242557343464F796679564444666B6762395A495941766433374E362F7231774E554E4D5351475A7A7933636B416D5A76755A44744C366D4D36587944537871424B30717248785941686D587A7762584674375865322F4A49556B61382B677A6D4E4B7673732F77436E68356B694747726D66414654537177735A35514C75316D6D447448584243707A616B30572F613861362F7A7A5944577677437732442F4A32667750486F7446597142596D4476367875377666364F634C3679516B513868526D2F362F317849452F6170646965577942727A343845452F36646550392F3362482B4A554C5554666238682B76394D43592F547473674B5037595A644D514E475454416857476D327058786F3853642B54732B7372384A3950714D624A4C4F6533346A4768763251684C534F593475596A3563693073306D2F68476B514C7973435332316A694C507269704A39526F385139666F63465567464D726F4A363669344733785A73443771444D474B4178313656703341566F424A3236366F7A42696A754A4E32544747626C49567148696F507A3568556556566A354836596135616946445552414C7432456B627A2B6B3734574471477A6D597338786B6248317137717A397A74574A69476B53614F51633553734C79492F4352424E43554C6C536962325055474C44707066736F6A59395763676D66345A2B505534486D657432356F757A466C4C6C6834336430614F7456454D5A696B6D68444C4C425730786A49307971782B62426736466D4C4755715975626546393148743044666C354C564A70496872544D6264423538333133776758316264514E5336497A5479744C594D64537755617A596D6A494346355A69674E6B77664B4A484C4E4A477859685147423066566734556A336C644A613562634F546433364E39374376336E62352F7978304166556E6B477165344F4C6A583562365478386E4165643863786E6B326445655478482B3549312B50532F323855555A334C576E496B2F384139327151373937396868662F414564556665634D3468704D6E6A75542F68503958677663656D3439634C6C6E656F3748394E744D495A56483231744645524A504B4F4973704732423566343373456B6A594C483154366D6149565865787231694F6B3146764F78632F76625845446F2F446548702F72444C4B555A586F7543304A5A7757436C4749394A4F4D7A326E7A693265694D5A58614E684D7464344A46346B734A425A6E68646D5067654A592F33494848793545676A31706C366956556179456D474D3939526637526869782F6E6A66326E79433665654E64482F4456567073316F6F30777841466E43686663644D454B764F7A584757434F515131647849434169324A57414D736869444E78534D48676A457154746D49483879307870436567706B6E7A556F6A386A326E7978574D796C535831584C4545765A6B6B4D5837644E2B2B503931444C49744B57517132316766664C652F4D544838362F2F53503438666E78365955453671596C6D663571502B766C68565457416F4942385A6B646757502B5939766C696A3339516E7241394C65317675666B577346544630394D7362664C74392B37334D6442444D68654D6D4A3746714A48484E5642634D374B69733462634C792F7663396C30765A62394E694C7633363236674E6A6F75515075736F6A734372796744374C655543415466435366534A317A485177654872787A2B596F366B54417649334A5254724C782B54716549342B50352F7A2F7552782F49714652616937774F6B6771327442755038414C687A51722B2B704539475062304851543138747358472B3376564661656C45375471474B4935444E78517155483532783266786F4838622F472F78526C553946525173785038416536787664397638754D4B534864646D4C2B4871586656462F72686973566357574B4352485631593731725930336E59506A59477A763841366550554E54774B38734B73783776576F677A7465384D33725A324851753762764C515279342B666C70554D55302F4A536937346F7741346B4D463873664C4167412B5166476F736130387A7057674E4A714A45574A314132334938384974316E375359334F64617231486A2B396A70384B7835577365466A53786B4A51624C4B653347367950436A52422F6B2B75306967397845434431767A2F2F414D38644A34546E364B736F616455736F6D7A43302F42783972717A34616A3279367374593344317366616B4A65716B4D4D6B764D674271784B49773879757666586A49796E356377354C48666A584A724343596B6E386A31467A2B756C4A396F386A727A6466335577336578473654744564577467377A65374F4C783157577A4E65514A476D6D57526E3145465948576E41336F62486766795276776654756E6D6C776751435944334250587854595038526246435877744A57454B68616743515875527A425544634835434A77746657503145644D5A504B567131724931616D33374B47613958694C677478355151764B72794E73372B4F394165416678366230614E576F682F63456C4B527A4669537736396F4D4235746773634A58534143494B516C494C65464969573338356E76676B394A5A624635412F6531724555306249644B727079594D4F504D6F7059445A4779532F453738456B6A314570656B6C4A5355454355387269624E426343626A7668666D36475951514B69494253444D737748715A2B4E385A5765796461734A58376E494243644B56484573526F62326F586A76666E2F5936414F2F5736464A584938702F577A33786E4C306B5643436F3653474233366E7341774B72664A58696C6E5165566C73563673766B636F306B4374795979426A73364731513856383644486C734859506F484E66613966384175784B75676831615333587A6C6E5A6F593752315A337777754979537A703449457171756B47674478305733732B536465516552386541666B33724E476F61535536742F7741615A4F2F51523177717A4758644B314272543930752F652F577A39426958775855654A69376132674B4666697279662F6C674D5278596B65442B4141547831364F7031515377555177314E503448763146384A315A5A306C56394A314637772F3841685638642F77434C4676355037566F3646666850616C554E2F643259495941784457374F6D413761685142474737727A743231556F4F365A45716B4F3548527A3950313863656F5A6356456C5A384B62757745667A627A66597A6A446B6C72567138746D615874526F6A764E62746B5275696F435A4372533844444769676C444C3268785643546F382F55744F6F674C47713033416D44352B6F2B725932704A7156316535514C6C4D2B5265575A70535775667267535A6E49574D6C4A4E4A69345A457271424639395A65534343517379466A576A645937466A53786F6E33444A586837684B704B2F6C6871756F53534541684B67784778654F30667A76682F527069696849715174777A544C78666F6538763377434F75635162556478354C456932346F5A486875495557574766625371386534724255497677353664674F45682B556365747164496D7A665272774F3532395A7667366E5566792B4C7661647965384E674157737443594C6471795561594B746152475A356D522B624F41776B447567307962526D44526C764F787861526854527059615435483031457A626362586E374F416139526766736B644F7045664A3074456E7A7854482B6F58377A3454706270444A56433956354A367431417639714F5475744B56556773484252553873514477694D6A6379463858443264794661745646526F535266747377486342324231546373564B316C4163646D38793976672B2F6C6A724C2B703965313767347130796B702F776A5167354B437A712F774457656F58556C522B4977435358386B666771643739553732354463526F6C322F334E6E4353653345464B667076482B6D4D6630614C706A687645454B4D6E6A6D542B42794B5233326E733042734132616C4464773978475866474B525A6B4F77574B37343853436441614A3264373865415739555931456D6B747647445631522B38706863456770743178664556686C4D3152596B677170715432644965386D444C764E2F452B496C304B70775543316D62555661584B72434133496C5265745338646B65654C7547472F334666506736494F5658553849534C6D504E524A6A78573962415068397868597A494A4A45707048313932674B74334469316F36594B2B426E794E69434F5A6F6A70684A3832492B52356B37344162552B522F4A2B4F7678353950714A577053554552384347504E70632F7743594E45596F3345526C36656C31665A306E6D366C5150583733626F774F4D48712F4F79314B453863694E6F7879714E6A5A30596D332B464F7638666B3749386A3035525353684353474876424A5A6D4B62656437397A68566C71464E565A42706B6E33686D54634543544C76724D4D47635971502B7248322B673932766272335077637147576C6B656E376B48494D3062497A53704A72594B6B4D41474D624145712F416C5730554444687458334F62525536662B5363585646515571534B635379523844313741372F6E696C3736655A737A30664C6B4F6E387646752F77424D5A437868726336415352547A5934525274615255636866756F3145334168654B4D7531526979423778565837557046595343436D372B4A694E756736474E6F773170454A527A7779523845693037395A3944697858704C3669384667354B574C765856727A794D45456270494E6A69474C4D6F55677158516B4B7A6F6557794366432B71706E4F425671744E655951535347492F6949532B3977623266764F4D70714956565368454B4C744473644A42737A4668492F7933785A5037572B354654503436745A56675136516E69417032725271515642663838552F6273364F6766395771765570725370644E5930725144754C503950692F544532647964644355314763424F735264724F482B7634344D575A7A726947745170694E7275577552564B37534B37517753397072566D61554A746D6A71592B766175536F5376634E5A4967775A31444461476C32554F6131334C624B322F572B4675586F31615A585855474B454C576B583530676E625A7831336C34624F73644B3172474F58483049325A4F4D736E656B49376B6B6B7750656D6B566558796D317659313232594B714D492B54362B374B78454E6234434433667A764E3853304F4A716F315255714249737A5230373950793378416276536551775A6E6C72735744526B7972795A7948553741484C695376464E614C45676E384E7659317030366C32356638415471714C78307432773450453665656F68436F4963517A797A6D7A6573432B4168317A4E314A6B38566278574C6B69703237433855767977476471764A682F6557426B4563686A444B79704B7A49584369554D6D77582F446B6F706C4B6A6467344558414A36396D4853316A685574464B695174314D6E544D3752596959365038384B78612B67506F48334C7948396339795A387A314E64574D52545474646C696C50475476364832373165444E4A4A4B7857434B4E534356554B67342B72536E6931524645303070676A536B7834514141536F576341546133373249616E476B30796B494570686A594173505337454865342B36316E7466374A723750597170677662374939537A34534A6E576E694D764F6C744B33466E6B6B617661757A6664567476493445666537624251536A427447745A7046624E4C64516C3335657A624F30416644316231586931504E6F4B4B724A495A7747473862644750724F4753786E5166574766614F66714353766A714D72523979736B6B4D396977553475556C6542684645535247537971516466454B53665239444C72514146615155687073777439365A3336347274544F557152576D6C4B584A4A4C2B4B30452B5175474237526731346670784D5573636361686A42784C614F2F6B674C72726635486A2F71505038416E354235692F3841692F7A4A774963346C5A366B2B4B5A6A71316B6E6274384D533244492F6138576C4567614D386E55613072487753644879414F53676F4377386641386750533553394A534C4D3651657044522B596E4567704B71416C496479504D4F36757264656E6D636255645A556F527A4B7A4F6C534D574737634D3449654A51596D4C6D506935314737736E6869416A61337442736C5959627A62384F747045767357774F6368564B314B57437A4557686E64376A313233474D724435793162515772743276586973794C646C7178563535555A54464439705635794B714969562B314A497A56325A355974534E7032346C6F71387274716B6232376545574D69507444454E544B30366153535356774C682B59365431324B6E6635623447593669784E3664345A72635061707A524B786C6D695353315A32586A4C786F79684949696A546D4E5931356B4A38746544755636676F4D383266627034522B726E474B564256494656796F4F3233694F2F784D4866307847736A314C696C724743422B2F47753262736F7832306E4F526D61527847674A5975527367446172736865586F716D4471506638574834484774656A5557515A5A7A424F335675742B706E7532467239774F7346672B36454C7749306B544B51306E492F49694E794246464B4470437850475163546F6C5153574C624B2B42506D50387973545571656849447351443844313951307465324546397A5064437669614F556E697569535A5A4E53515636307A43594C58574A5473787A434F654E5634704F7178524D705A4C4448345349787958764631513462344836654A6A7A647A6670686456385A3966716363754831332B39396E72484B54514A484C4F2F334F51677055353542437A79515775554D556978467A32353762304B736E5A44536C4C4439715643757A3137674F5452517056433672697A62686F366457364D656D4657597168536664514E56376B50327439517A644A78394A7A36677167746455316B37556273656D716E4A6A6F45702F5573794F4F2B514931736B6554726245446672696E74756A5878436938747758504434353554396555472F7069482B6A395875386C6D314177654F5A4F4E69526B6B3744763161786E437956616A774E63676B59713042375A56694E6475574C6C424D3345385758523472793266674762354537357761617855576B4A4C4252356F63756F32764C467A59694978307464536C563977745153474347557750683331464D53774C657655613370664354324C714C62717943424A624571752B2B4D2F4F5A6D4132535041556C755A4C62317843375965694D766C617071674D516B2F6A31647751534E74734563597A39476E6C536164586E3070444A55725A4161334D303939764468676F6F716C614171697867706F674C344F2F4149386132414E44384879542B4E6B2B7256527971554941687A4C6B416B4A4C513857755231567666484D61316174584A565555746E3551564651495A336E7A4F7A5137345833335279645350485A4137496B433241705752644D56676B3134566541506C6650376876782B547566334D676135477A47504B666F32482F426B72475A79344353744A484E7936672B7042414133647A332F757668516356692F3674306A6D345A34684939364F386A466B44735978795245342F77416C4E41672F6B6B66343865732B37304A575170316151556B6370444B547A4F5366352F533038535A475A704D6449433045705443524376736C39336544396D4A78524E4A5169786E7648376834643431694D65656A6156476949627553557167575952676A6B386F6A334A4A3874667459674565724D416B35584C6B683349575833594B754E342B6B5862426C63714E424E524B6C6243355A796C536771435A4448753333526459667170396C73376B4D376865744F6D63393142694C2B4C447A30546A725573554457575546705A4B537A70446358745353517951536F514933615163575173726A4C56737361426F4C5254356777566F476F4D417148466E44426A7564745247764436696B31304C556C31416D36545930314176424C755439594748482B6B33366D65726A303752705A4B7839706D4D4F5256793142724C4B6C4F7A584C616D34794A333536566E516C7147756B69414F617232476E696E4330626933436B2F744B71694B514955703253684242533465774470594D64693578314F6B696C6E4D74533149706C5A51575A4B533549674677657245753054345A744539766666385A444A3038686D4C4F4E6D636953444773556E6130334668446B4A464364333769535A6D45554D554553716C654F6446535954547A536F63786B47646B424C505A414175377835682B7657526A4F63396E51764B6C6145424374424943616155685444777751434349596A534C4F486244343943395759507157724C4C6966764C467175734476484A5374527376646C6C524545317974586A6C4C663268456B5A5A354A6A7855504A7451416371756E635836445632363934787A4C6975517A6D53724F614B4649596371304A4B427353786631757A376E4737796C7870705A6F4C565138347A496F594A4747556A5A30344C71794D4F616E6A4B412B674E6A342B764D744D65376679492F464A2F54594256546B4E55556739556B705071336B47507A6A477372346A48537A6D647365722F4E744D4D644A784A63447567794341784D44796464704A6F676C6533352B4D69456C7A63536F695A424F776676362B4C65304F5A725A6B55394B564F6B4941596C7970674755707A4A3355715353324A785477644A41576171784449464B43704B6F4C4B4F51416B614E53536E4D6C57424B41456C546F37394E45714F6B416B7745695354706259547362742B45562B7258554E554171446774444546675932447344444350737A7571314B434A564356424767517344335945592B654C4B533767363561332B4E676E787054364954554B573030775377357063754F76713241315A70594A55564D393355707A445358446A7A6D57463862487675497974656D726B454B49684F3552396B667464496E554B4353463078477756556E38487971395175576147337439543863526F72705543775351447A4D476E6655346D483659386D6D744D7352655776434A476B357870477A6E5367364A6B5A304466744B6C4541636230514E63665146643142374D372F5A4D7435585A76556944676B564B59494B554A483779513176534F6A71752B492F636B6B48463062384F456255524F7944385750634D6F5478767746386876506E795646524A4B673669475A7452634B69392F4C77396562466979645A50753230704A58704471476F686758626F30416B397A4750354A4A75756B5A6E655635704931477046424C736F58686F496A71414F49436374416A7750386551556773345547735A367A3138724D2F62425A555344414C413764663135396354754F3552782B4D655270675A447A5A524A596C5A7A796A326B70676D6C5A58334371742F626A3871784147746A3063685149454152647273473679596A5666624665574647735270314279354942613762505A746F654E73526C4D6C445871517658727953797838355159345771704930703563784D365278797247764D465979334A4A6D2B4C434D715A51484A43644C4831503136326B4E6A59685A4C4455487465503138656B34485856485566614839367A445741434F574255447743705569556475526B59676E56596A6A344A5A5436595545794744674B534A6C2B6F4C6D33797432474A30776B366D4C6733596C4D397A33396278684966644C72614D79324C496C4536786F34523570704632564B73536E64485941627954323457513631323967636E6C4B6E7141594D37514330332F586E63744D4B314145735055787634722B66583676542F415056563734706A4D426E4B64572B706D4D63753436307A6361364B30364D387270484B73656B5269764A6F5863446C476844414734634634616F6C4B6C703147584C427A61516238766B4736374246587176554B42347258306E354B61384A394362547A723957316333317865366B7A397858717879546D74516B4D546C362B4F6D75666557627350636C526C6852714E595236685635464C4B437A46523636545171553661436749516C3467415045474A6535595777747255464A554B6958556B434330575069364F565873656D507174652F77424F7466724367354A3574303554534E564A327A484A35636C51422F384149654F52476752722F4F754665324E4E58375A52574C2F734656424E2B53706E36705547617868797A68697845617450594D4258444D363464754F5A5471502F414B4144592F6E76306241627159324B334F5A376A526F58574A4447763537635437525A4F50454879784F32322F6E354567654B306A68366857714B4143552B397168494C36575455556B5463514E2F5553347432627A53716449556B494B7443417A464A6B7053727A332B466D746951324A73586A61736851514B3859554172327746304E6A5A4242627A6F374868642B6678723057716B6C4369485334412B396467656848774E2B6C734944557A4761576D6D756D73676D7A4B455030446633747643487332467636713932496356636B5362494A4841506C77655243764667522B437261303458573232322F43363376644E56464961566378647755757A644C4476752F6C697770344C5671306B464F585655572B6E6C436B73417873497554444F664B366A645A2B384B64595A51346E43542F65714A434C447853636F346C6E5977384831476F44727252307A4D77382B42736E6233314D704C61677A43586A304B6D6E762F434978642B45657931624A306B5A6D756B4A317355704A556C615064797033564D6C4D533552423377662F627A7057785936656A496A307A493745374A4F69797535494231784A4A4F76494A304E61395247732B6F41387241454F4652487264724E354E61756364724A703574546C6D714A424944787056755A6C6E2F6859336D696A36337568372F74503954474A366D5742344D44376734463475634D5945454F6336647955357647796461453251787563786A315551677951346D394D764D7873777332557169746C416E5535535536586867456D48336E655A674F4A446A4B4C526D4D6D6E6368535835723871706933692F693759307772567571756E6F314D6363387178784776795632494952306C4842464D7264774F53705A646876322B464A4564516D6D34494F72374D487249635158412B3662447A456952376C594B644B557734677357695650755949506243357765336935544C4A546A714C414C46735634637047347254304A69786A2B39714A454F374A4D596F514935444A4648464C4433316D65566C56646B35674B706B56412B6B4553373256476F6331797736517A5778662B4356554B46417257773936687950736A57356747517A6C6C4357414D50687A2F627A705072376F65335574525252645A3472485647684D555478304D3956717161386B4D5563724B77797330554E64674F2F4E484A722F414E357437524C5771495756737742436978767968376B3263645364727563644E566C614F596F553030367755567342547356714C415577515931454A44676768344C3463626F7A336E78636330654B7258386A30746B4D7A484A534F4C7938646A47535749367371586D4F35434B7436716B73454D79434757654D794C494534414E7958564B5A575A547146376650623474614D564869587374557A434B7453766C3056776C744E4D563167706A71696F4644732F575975782B483936656F4D594F336B726B6656464A53416875535279397445494B6F6C78344A5A497771767756566B3471724B34554B42725A47567536414C3353626569582F414178534D7A374F5556493165364F544C4736716C5377683964525148636455694C6A4253785031423948507035756C38736F2B31346778573462466557545A2F756F30367878756759474D4A477A6F79715759374A4872645753435A516D587536787352494A5939354A665937317576374B3569704B4D3056494C7142306B4F6D574C4F4C677744636A76695631666476706E497A4D59336D6F4B6542455A626D3671464F6764723843435238536A2F7430514274687037706633506B7643724D657A65596F702B2B7862557863744C73384F4F626455395A784B73663152694A55354A6C4B3169526C4264336B54764F6552436E74546C6550424355326A3749586679487839533036705279454F523144647839624E354846627A6E4463776745653656714E7A334D673743493734794C6E56454769697A4C4978426937635535356251364149566734436B4B53534143667757436876573957716C69794C692F715733565064376952594546484461394D4652707145426E42454D49416C376239497354694E5364527876495757302F646259636C6C4C496558677944397A7170384B41536D746A774738675648554641426933517358486B495055414D2B4A7156464B69517442355765564D6649757A644F6C735A4A6C7946684A43743845664667476855485A4B6E7438524D4E67416E6A342F50384162507044584A554661396E5965487152497659583849423734665556553651536B4A35535143354B6A4856796F792B33344D4E446B622B5172766A4837384B6B35616B704A69557569764D497632795753472F754D476669436F346A59493251485253583141736F67704F384F4E72624275556158364444326B764C7170466B4E5539325A4A56764975577670325A324B5A784B712B5775726A36306F797646757A5842534B70414A4A6B6446546A334C416D56476B4F31425A6553622B5044514B74614B53534471424578334D50313376316A46657141696F7655484A4A5932683332323362615050455173356D4E4B43706179566A6E42585375356B7443496B313478473534527245764B5552383038426972456746673232464A4B575370675337512B355A75747576574E735136694A596A7853335145333236754E5444433839646458565569654F4F5764764337496B6344584948356D52346F354E4C736A6B336B482F54736E3037796C454C535643484969532F6C2F655961766C6946533138764E7631466F326564766733624664767650312F7769794556475671376467695359454B3858487A4B436A71727A5367636759315234363538797A65537364687957584241425261306B5152384C7A664174616F456B7A49324C53626458506E3347324F6233363976664263466738683031696239682B7138334F74616A44465A4453316D75577245596D454D67537658446853444F386B66477744457A68326B5A65712B7A76443156456F55744C4A4C334A44474471444B753353482F76484654346A6E305A65716F68543152704C687237777841386D666352684C656D66664661665331724835355A70372F596769725456684C624C562B3132466B6C2F736370666D79793734626B696433582B314A45306A717477717253724A56796C494F784C5833665646787A6650456448697145307968647A626F374E42444E3044763579782B7331372F77766136347856574A36384573765474556D784C49736642467975594447506B7967736E4D4F784C714164416C43797436347237535A644E5850355A4C6B617373454751374C7272713872432B6F6B42396A4C6D5362374363764373387355366C542F666554424341372F774377475043622B666272685376645072626F373230702F62576571494D686C3571676E4D646539464A465573615178787A50785A574C6C6D355278536339416C6E58596630465779534B564F6F75705561617134497655555671456F4D41714A436468636B38324F6C2B7A3341754B3863726C565049564B4E4161414B2B5953725351456378454A73704A5431424872685A7076652F4F6451514A426A4D58627479326C554938617A43442B346E4A586B6D646F6F565252765A45724168543538452B714E6D6334704E656F6B424A41556E544E77777578615044445975792F59796C6C716E764B2B5A70476D36516B557447734B4144334377414337713067734777712F764D65716C4E614F2B786137623042557279504B69676C6874704157453555635766743865434562333459776A4F79784139484D645A492B50704E38585067664273746C3372705076554A31423165375A7742423542704938546477434332434637466532383656363876596D73325A70495A4A41304B6135797949584C544D43474B6E514F3232434234506B6D555A6F4B4C4A543575537272334854395068543751635254545656535453706F5346696D6B46677A4D714158634D6D7A583670785A763033685A4D62673436636C5A6F354934654C4F55486746534842436F6F4F6C30323138412B70364B314C5555684F6C306E7558635075664B526A6776467337547A475A717031427975564A2F69426D514C3949337354696B72395658443170756863486E33506173644A646234584978534541744D4D6A6B4C58533830544F666B71437431424C4E7751786C6A56724B57574D4F4774504351765561514149434E5A667370496D57495979776537393754774D7047564C4B6656704C72496A6C766234583879474F4B2F5061374C6E4A3436765641666E4E457A7A4D4A4E5452785246455A6C6373554530306A6345426B3049524B783064416C352B6B516F4C4C516B6D4C523033412F68414A4670777972464A44487358426C584F4444794738703576504255624176446B354C38565A6543434A59646F6A4956646453496A717167415174323948674642504C58494E36557255554455474C676D5430356E73436576562B7244442F684F667030676E575179464950326E356570692F6638414C55797674766C5A2B39414A6554396D74437363306E49704C4645465468624337667577784D775352476B4D6D7976624B6B4A36555656703171556F73536F774946396E2B416D4E397364547947617932626F4943616870715961567049535170327450684D674D4F74735037682B6E2F5A7272766F576852367179465048645A304A7063636A32596F7256504F34396973715A477A4D394757424C395A5846595354583373633631636157756C4F52794B46564738514A4777485233374F5A6670346D6F65667A33744E77766A465257577939625035476F6C4A556456557242615146436F4573537A485241473774674264576653725347556D756449645A357248775563684E45793062616A457A563533643435347363456C69454C5741554562575176464642622B34766F354E576D664449445844754C7A75327A6C78363465557661756D716A5454784468776F7157795346307964394964334E755A6E2F6E70727673373736552F7437644C4D346E714D316138663274537A567356326449316852653661566D52344A796B514C4C4A4643775A6E6667424A4754494665385745734756594D656E2B6A7339794D5231654A3841314C577173764C42536C4B4271366443536F6B736B4A516B684932424A4B514C6C324D427A66562F76563763622F3478397563746D42504E4C334C2B46796B393451524275614C42577945474F5378476971306A4931745A4E4265304A575A6652427949634855707A615137477A52463347336E734F4B5043732F72586C654949726B7031615561556958564159774841414A7351503373516D37395958546C4B627458494D7268704947524A7165617865567279734852517A6631474F41343649497A4754732F635376784B365A6D38657052776D735646715A4D4D56676A37726443523073666C68566D65444541715A425338536B7155304777336C724F4F752B7770665631695A4A6932507A324F6E557A796349707339694351565A692F41535A4F436143456E6B564D6A51797346423446644F323162684E526E5567302B5837544F30794F5835332B47453261346454493056644B43456261584D6B753542364D376562577755735639552B4873525672452F656D597A52686C7830333962685235582F414C5137754865386C65435567647470354E4459424A62612B6B2B61796961464E523153483641467649537A2B6859597078345455566D464A51744F6746546B6D656F6B4D42647248615462447A3943395548715041313868485774495A6F456C4D636F416D5A4A55696B6A637876776C5646586646684777626567527361705759714F745359594579586559634D5A6E35656352717979714339424E4D67454D5366753364376739684532474A64597839713752734A46494957614632727A546F556B686E436479745948656B685A33696B435071414D2B6778514D32765177535579434474492F4934495455535074497333692F46332F58776A566A49506152745453782B5A4359306E5A44424C747A4A573761787132344A544A4353723974684358566A477964772B6B6F704B5A3633395162452F727663656F77554673434141355A30756F71446B2F426A35504459437656505541704C636A516C48694D68694263524C596A6C4F356C4D6962626E484D5146425657355368754D305863416635536E714B4470634176494679354174764A5964656D49467151517039504D434177495A2B6A704C433170733059564C334236366A375539644F2B746752675356305A5970304C7270486B6E646D72786B452F32325670324A3057565238445938745245476555677347416543414133684F6C2F7A6A4371765559704B55687451457A427553326B535936625972472B6F6E3347782F52335432637A4F6176513131677154574F306B7244534B7172485652662B5A4E2B30527258684567566A786D6B4D6A79636266776A4A314B374D474165513475464E4D6E34583747367A505A6C464541715A4A41743064765632463537376A484A70377664625A44723372377150334379384E693362765A4931656C756E37496E74515549497944516B73717979717430306C6C4D31616E78576C566B736D785968744D454859636E5247577932684135774E4D69775069454145624A38696650484F7331554E584D465475584557452B646E69596D3569595A4A567631736139487632546B73396B57544A5443552F654B744F4D574936456A71456A702F6479335865332F41485444484A3973714267683948425A5A6C4D52333148364B4836365930536F314B6A6D434274654664776573397037592B75563963575436316A39304D465236567964544752446F504854324A374C536B78765031443158417A7048434177586A416A534F7A694D385931626952732F4E6674666E5535544E55466B6A556E4A2B38446D436F5A68644D4453434351795A4476714D4859647A2F6F536F6350567766692B597A3145356B55754E3079696D366449397A77764B314134494A4C6D73734C59687870435755435458335239747166556A3572496466357A4B39533952347162377576464C596B71344B5373566156416D4F6A6B5757594A4A47517A537A73726B4953716A6B686F6D64342F6D637775705453704F6B564B6C4D73466C776D6F55547A6D5341484B594A736D775433664F38574F546F4C703849796D577975564A576841393272336F43464B516F6C536169515646595551644C61564E4977795856474C783056584831656D63585570796953487431386654676934777243305A535177526C784678622F414A6B7532567A38464C414E36536B4C576F7163756578336A377666796E7A78544D746D7179733356586E71716C557647454B4A43584B512F6967427934763166483736642B6E7548712B35577948557349737931316C46614F534F55434D6546307864644F6448354E3850774E2B6963766C6174547853416477577349357458563934746151654B653266374654586C6370575454533457774B574A567936762B4A706B4A416E5934617A7066327A3665365A725252564B56574949564F6F6B5A655048524A2F49324E71474950676232507A3464304F4849446D70726C6D67424C5343574B5276706B4D6232734F56635139704F4935797176337463714770576C695A43693564315444656E78784C63684C6A3069374D53774B7A71463562554C3533763841782F6A79502B34333659303874547348644961434F73686D45377A65324B3670536C4C4E517155564738784A642F5046487636745854746154324A36697656356C72745179335475516C5A41484569564F71735A596B5651437971485750674F5777784B727842627542397767492F6167676C67704A534944797444774F772B364D5837674E5A66374F5946684C486F6C2F5750794178544237455A53565669373868496D676764564A4B2B474D72384473664677696F5A564342655A506A7747394D2B49305146314B5A4241536B4D5965536C77374E44334679652B473636684A32674E59375033785935306E68594D6E6A36363249772F774277716D4E6542634B5A41484B364F6A385655736639694235487170357452704570456767334579776C7450314D594953394D493071553153344A666F496254316A36344A2F542F512B567730795477567A4E564D664A6F34343361565979564D7A6B4B752B3243796B494E41414138313465612F6D6C47345A3363337570323369776C3363433239723466784A564A43616676536C67475A5446356637576D3073536E7267323476486C6F517975706C49574E6C614C6849575675534D6579493361636158547330753156565A51426F6A6F7A69715135744C2B4C6D422F4E4F6D59364E757A505A615046387856706D6D697053595755704F71703131654967682B335537346C3162496452596B694F6E616E657561685A6F4935484D457336534E4E475A34355864414F545345794B686C504D676E346A5443686D306870416C336670396D2F5462796C4A495349466E4A5A7A5237386C58753541476741734C6C6B75307859576469324D2F432B3558564854743035464B3042566E6C466D432F44505043364E47497A754554715751616A59527A536737415257487849625A5374544B396143464B63466C4545616F4A674D496D306E455766344E77725030564A5670524351425471615441386C4D51465836694266413436783931633131486C626C7562457044424A4E4E4F616453745A576A444E4B36475234576E5A6D694C6A59696A5A705855757845756D5A57654A727055554B4A59705A776D7A70486437463262346C734A4B4F57795042366130356170554330676F4256554238444A42424C412B454778376937673350644A3433724D4C393330766A476D5A6C59634D66434C49416467652F4E48436B6A7132764A4A4338654B3854727978476430445571715570466B6F4B5759587649637A427565723472756334316E554B57455A797270446153564A494D4175474133506D6D424730753975506F3636467A4F51697635506F2F455A4176626963695446772B4E426938666357464F36327764462B5955636445364F6C4F643433436B366B6C576B684A555271416E53374B47344C6661744D595131754D5A756F2F764B784B75765A7A656559755444656F614C43756C507074397563445272306C365978454E534E497A4C44446A713846644669586A4447714A436A45524F51654C7945422F6D4E4541436C353350356D6F574B67456B71625471454F49762B50587268622B335A6B564E616168436E563135745141637937735076626E4269706449345768744B4653765669344B69714955415A49394645444141434D63527050384136767A3653715143706169534343656832422B362B2F70595977724E317168556F7163783165623768392F394D6557575343744141596F33436741456E34676C6552414232756834494947754F746A7A34776159504B4152384738684266305A6A6A4E4A536C42796F38796A44782B667A667068566576386E4269706265566F31704A6B4A696979454E6446564F4C386B4E79764A46475A7A4C576A43574A4B30414273566B6D5A5A444D68696B4C705579705352462F56572F5A4D5764783236676B315642436B61594A4B74777067783250623634577271363539784239364A3344546C6D696A4E6D554D7A4F6E497167447952562B522B62714A5A5A4935565665374771733632724A7043554F51644C4141744E32666F336F664A686859757656556C61556842364F6B79796E334A37624E714F45653932657338586971736B766669614F4B565365647952326C6C45624F775A354A566B346A525A704A662B55454F74787247567448443641726155704369564B536E5A704969412B6C50617A665A77505855696D6771575849424C52476B5034593653653358484C70396333315939512B35485732643644364B62375843344E576F58386F7470477151574C64794B4D7966644C465968593477517A5457486B4A5643474A6A32573564653442776D6C516F4A714C393571564C4B43644C48746F42337339774F6778522B4C353270565770434E4F6B6663424A636C4A6B4252424F6E634276506174764534395856383765793546624652545356344C4D7330636B2F4F654F483769537A4B6F7269336C4C4E676B4E736C3666334B784D6977717257743970626F2F362B6D4B38726C57534353524D336B50594553543862592F476579396E4634794F31586A6437325A682B3470326B732F667A4D4A707263742F4A424335676861306B4D525131362F6668684664593743777A635638766C314E5A4A6235743850394D6171716536464A53662B59725358324233444557493378396A44366E4F673866314C376D59724B3362425234756A73666A78437368514C46486D2B6F4A6A4B51442F4148413473717038416F5531733738664E6E746A6B6B5A7A4E35644B6C36414D714B5A3564582F5058564A4C7147354B514A47396D4136562F5278786D76777A6733464B6556704B714B71385A7036366D72534B5272634D6F553330614636676A334F72784A31616D5A4F6C314337452B314853796F3073644B475751677138737045705A56422B4C4F5562616B45686754387964456A5131547A6B737254556F68494A5855714C666F46725573433566532F5A3967484A786163393758385571534B2B684B7453674E4C5370576F704144417353784A385445744F6E457A723948644F59736834363961466B342F505551625132334657346C5150502B5032666E7A76316F4D72545175464253492B7942634F486E622F414C5873784B5372787269576144613669696F654D47374272615A5A6D7578496548497876344D746936415A497034564B7143506B6F41424A356B7277494F687278747650794A5067656D6D58516C43584352797165776D4241743578654D4B71394F7570594E5457745253484A634E4A687938432F712B497031483767564B7946594C43442F6D41507A304365424F2F6D774C6674413075396A386C53514362377A74382F35596A703553725556796F55644C752B336B2F6C35756252674139522B3573554D4D332F726833324F2F6B35554C4743555949466C432F6762413050352F506A314570576F4E70616568486B5859394A7433734D503874777853676B436B34553455444F6E375155575A7949444B4F386B5268472F7162784576766E37622B344854356A61375848532B624657586D34692F726F71797959615254796D4265746B5961317A5774663255354D4F5944455A4B734B4F616F4C5A2B63426E30775A7551667577514D50304A70354A4B4B4C4F7052452B4741434741356E4C397930346F5939707850537934787430634C645A35343868434749534F616D34676D6A31786934636254534B564553486D7042434265507133635441712B36714350656F424976705A4C387861624D3562354E677770553646414570556B6C2F547076494939586262467550744949376C53694748397A6343687741654A4B624C466D54514C673864443976354A62386571486E7A70585553354767452B62543657634E717666426F547251436558536B6C37757A50734F68394F3937467568756A4B746D7658633165636A782F4751414E477974766B414F49387078526A3845354D5033656541525650375854396C2F587736764C722F6F307163316D4630793656387A74477A324A6C76496555794269655A4432737831315A4A493643777A414F367977686C59536761556B7849702B493378585930533550497434685854534C6F3935396F6977614E325644394F7637754E6372786E4D306C4241716E7A4A6732744266752F704A624543732B3057554D705770505A566552597358594B7162487766555879596242456D6C344B434168356549394B68644A3951522B5748564C3267706F6C5347362F32757737653749374E66666438524B37375264584A4937527A52797073416C6D42585164655A593857486D4C6B783767346A5A424778763054513934437764496C797A6A737A61626A6F37396956414572342F6C31552B5545465142503975365A446773456551764F3559746A777065796566744F7633617079354946334747325357476765775179674D654F74412B4E65505239504E56556D5157454652496C683562325A4C5276474B376E4F4D437336457259704A533274335A795359376B4136684D784F44443076374356345A512B535553784C736D446B59342F6B6444694569422B4C446C35342F75313531356A72357173766C43696B4A65424F7962754E6E2F65383849612B6442555356535742424A477773543259695054444434627048473465434F4F7256565752554B6646564B72784373666878337477572B577A2F414A4C443842724F755430306B2B71694A744433386D7775566E45725743464D7142704B69583569354C41645435576647364C317130544D2B326C484D7376426444382F49626B2B512F623438654F572F77446352626C6A4A3073337966722B704F43365379564A634D49615873516D656E54623650433732646967456E79516B62634972416E5244664A742B416F30574B6C742F77416139514F704A496256714C69355952334C654C7666766739464D793575797264484D54363962594448567657696A6E45396B4B70444D6B4562684A4A464A5A424C7853565653413630476C6262456854467841356241694F56785A6E33366B74506C394D546F53454A752F4D374F78396275356E38634B37317231786A386642626D6B7478475A45594246647951644D4E43494E334555485A3738666B734E4B7145686C625A61695355715A7A4B744C54625A72626635756D4D46394A5A4C6D7A66336F6630763534723539335064502B68592B376B4B392B4C4875346E4D4E637247496847674A6C64496930555649547165354C4B6A724B48644A456A337A52376E777A4B71726145696B56474270733845734F773853574574666D6643374D4A4E464B31714A43534A55774A544965486B6D4575534C767470484F7039634831705A6A714E5A2F626E32687A464F3531487965544D746858624A7A30796949793979525A3073796F38545369315A564665434E596F3044423253587276733937503036464D56716948314548537048675A57703331456E747141384C4874534F4B38554B69756C5458425351344C6B77525942674850556867556A66464D4E69706B6F6F31584B57784938317131623668764C627075393665735248576F3053302F6C466E457363616D4B435132486D6B7469526C342B727870514B536161453657444F4474354D476A7552323656704B794668616A714C376C746D416639644D616A4D5848745130385A3336564F6D4A347262314F3430385A73526C346130784E564C456B3056436B544E7A6B444C4E44413035525A53306B68487550332F7744702F774475787255494A4A4D4464396F614A4C666F4E6A525A632F3165356871395950624658477752524A476F7278474F617A6458747877755773466734534A56504168536438575944314773416F5655646E4E74336432436E367A34656B58774F74436C71706746744B6E31454757374D6E544C6448394878396D2F36692B71666233432B356C4770316C616E67747630566A4C464A594E38326862503952526B6C684A45666C4C464971445A47347A72774E6A685847614E4F705770366D536663673830627168332F6941592F555936682F5231772F6A4763345278425844386F4B3946484736427146704270634E6F4C572B6C4A756D736C6E4D6B463232567A7033336E7843324C75506779486553473036787330714B7A77426D65446E353133424556446E6B7A427553735434396377346D735A616F704C694658444E4C4B642B5744714861573164622F785032547A31504B306A55797753745076425643516F463031536B2F5A45414E4C577539386176717A335767696A65543733697649384E7A42514141442B51757A2B4234386B2F774138664F68615759537253432B714A6E3439584933756344634F344A56317437674E7041536C6C41677A30683153306B6E72644F41766D50652F4259754E72655736697255554A4D616D786368683561436851716D5653352F477741582B514A58586E3078706C5146794A63547444665442612F5A374F31717255386F70676C6E494B516B6956434C2F41496E414F7A5031455364555776365A3042302F31523168615A754D63754A78374C6A31646D5A45355A473532713455794D6F4C77732F41624A477465747973674F567459454F707A2B6257503664706C765A4F726C67617566384163555548536165717170794575706346497479655432784A2B6D5059373376363774317368314E4E42303369374D6E656E773845306C793659532F64483347524D6464556B614F526D6C53757362466D4F6D5277535055717570624D7378466D385137336D35307937754C77357A696E733577366D716E51714C586D676443676843436B6F414C7142565744674B4350736A7A753567363836435051765239756D6B5563634A704F6B686A56696F6B534D714F62794679323356584F77423438447A723058495853556D57716964547446766873666A696F554D31547A3263316F5556494473464141767144516B6E77676B58456B6449356B652F397237782B34635561396B776534665773416937512F73714F6F386F2F6234654655496E424E6A386A5A32505071354C4A475879355558393554495352737953655932447357677552693470706B497075415561584A66567A61586834456E3863576E6577655453623742485A437274585231346A79544834473944346A58496E2B46506A663439556669486A726633462F7744646A31523943323165425436724D78652B2F6C74693576327970527453674A5545474256414238364A4A3251757A7259483541482F414D74656B69456C626B4152707650623064756E712B4B5678437579314A61704258304D674668632F49764F446F6D4A6A6667355643546F4E795674365656337261676772722B4344727A3433366D54544138544B50715973386D2F7948774955556135393458315133536469586933347444342F58394E714B65485969496478793242795A695273614F747557627764373135384478366D786C56525450564A4F6F6763736B585A7644743246757334793473505865496C315549527673756E77585442394F6F35427445663450492F4C66724C4A4144456B734151772B442F546C62412F3755704B6C417157456B6E533230687439686342353350697867726A717350497043675945734351712F5078734C3450676258524F75514F7A3544415A3068514C53776C2B765A76492F4C7A456971794C703136694A646D665965496C67664937377A2B5A703072786135496733746C58523565644B77384462416C7669515048342F486F657053556F6B75474F6E6374346637766B573362624174524B6C485570524F723843524F33326244746A5133733557724937764A2F7033794848536639664A504C65677136596B363848666F64554B303653444A665A6E554276327667716A6B335A54706345734353785941757A43642B6E6241657A2F57634D666345747373716B2F41504748346C5479562B50466F675642585A59624238416E774E425255784A4851672F486345442F7177777030616755484B5745675431424E3039742B305941505748755832343268702B4333494547525653496B6B69535138443347504869496D4C74766978626B427542644D71554141336E4E3568764C652F6E5A6F674D69344D424D584C45626647634C5631563178786165786476794B686A6B5A796B6751485345747A5961666967476C585156415730427344305A53797979553873516C67376878637831646F4C714C4845675356584D64352B474548393776716536483647786D556E7635714B7574644479515356355A486C314B3361534E566557615167673656574A346C746B6A3162754738487A565530796D6D4E4B6C532B6F41426A30535750663073706C4431387A536F4257745446496B42767452756F512B77394C34356D5072662B752F717233466979485366516C334A346A4732736A4E54733543477773636B325057736773524B59346C614D504A4B7354796956466A525A5A4F624946377661765A3767434D745152557130715A7161527049436F426433436743435157735839535451654E385758564B6B55314C393371596941495A514454397049425A75335446546C477A4E4738557254324C553136566F486D686A5A70356C6D6C49616E6A672F476564724D6755797978396C3334545276795241546553554A704A70307745365471565A694C6C7676645A624655484F7052556F7558596E7241443359623968474A64667A32587831675968377232714E4A5572746A627156386A584268557874476B4E2B4B77725354534234512F4654414E75684C7146506B30314B53464F41447175344E35315133707178717336482B3033334A367A744559307A35764358545A765A62706D6B686E497031727550795672484E4444583478324A4B2B4A54765934724C586A536A43596F3669686D6B696A506854364C774B7633696C46675A73365479336262352F4363476E3271365078756579754E7938324B733171574E2B38614C37325A7A4A636B6950334D74776950634D6C657044627373736A6C346A5049685562416B5258554F6C42426B6C7667776A3749647A312B4744365351554B494573574441773230475A45417A62766A365176367976536E3161645166556C3765542F543157365974644F6A3263776448507231424B3957574C4B4E317837685376505474516D52354248534E4E5A4B38734B434D79493855704C7971654838597A32577932636F303879697352556F7043545253685545795472714A6C6E467243316E2B6A763841346638416946484A2B7A7674456971744353726A4B796C4B30746667325173556B794149646E62752B4656396C505A5836327174474564514E3757565A4A58357A535132633961736773705079354347416B74734D497975674438673371696359705A4C4D316C436B6D756B674A6C6155684D705357634C567347744F4F70635339704F45684B30356C52494653754753684F7050397375434373507A45744A4A4461704C426E6133302F2B397556676A68366D7A47426C764D4744574D5848504458354573576B2B336E6B6C6D2F7478364152375569797343573471466A564E2B7970704B4767796C6D6564775450542B48355951662F41496B34525142566C30756F42306D6F6B4A3774797149674744487A664245364E2B686E7036573832523670753373336662387664746E684878487845635350326C413334436134714279594E7367756B6F6B4D71376B6870686E6D4539336A61324B3978582B6B437054517047566F556B6867366F665535754C486C43486B42316646374F69665A7670486F33485256636655696A3763536A6B4366394A42433759414571796B6E664C652F5035494A67797871537373316D385173375474485856396554385439724F4A635271464E544D56416D6D56704341684144725A7734552F3242332B3731784B736A6378324769636B68574337304133414B784A38374C485837746A592F4A346E7A35495451536C3249453777365845436669365A394D4B442F7441357731526336676F7573715A77517A7356423476477A3457503367366A7832617746364A6A32753744616931784C68784A45334A4E6C3968472F6B2B64623372386B5356416B4A5151515647716C7067424956362B48356B4E683177696C566F565568677253416F6C506843556B4F5A59376A7438786A6C4C39384D503146374A2F55333156443168576962706A3355793257363036427A3156476B68735648464E3831684C5561493031664D34533764725332456C4272334D666B636666715743306C756E54744E4A517135476C706453365357496953706B386A6B4F52637542792B466A6A7175524B4D7A6C454545505453684A42634679514A494368763238524858443465777655634B53597036376C31617770304332797972794F7649432F4571655034506A79526F6D6E3851703141717370514B556C4372736B387154314E2F50344D4269553559715170674730716375663376394269387232683671716D70584C62446D76433875396C547A52797A6B66494E6F4C785A78382F6A6F416A7A36514259524231536F414D332F55584778322B50536A385179616A565859676B376B32453254384E75724176686E4B75535353494F684A425038416249594D4758386C744D5170346A6B574249384C3432784139532B2F52305638422B654B387569716E564D58477A7A6159387047317064385A6B6C7864647869704D61687950414F39386A72743741346E38624A4F754F74667A4E694A61464B444454643566715430505836343958793853713443716A445A424C4E7862595034556B6B48386E6A2F742F7472313741797376554A4A314936585051443776544558765A70516A416E797A48524932414535507451775067485A472F492B523057337555414A5358494A55485333667137656D303377656D6C55306F596F734263765A4E75386E386351544B39544A57322F6D51767056556F344777546F6E524A506761446351422F7472666F554C656F704C45325967467A45367064353664695841783556416C74576C7748672F4B33723161524F462F3678397734716B307254794E794376754F4E536B59425A5531497A497A73374141426743593962556B74344B703064664E413263334D6457744C37734836535967414A54315336656B6B63776231663948433239512B347471365A5244754B46574C36586B6E4E6847783251514E48386B3864446C2B53646A31502B7A68694A314E3647323566366237546A5A432F656E6C314F50764272325A696F6245514C345858727A33506F594B6A5973574A4378565A483473516446574C467A765A5A675662774E6E5A487941386E54396855706147435A496D786C704C675031536650423949485374533242533168346A4E6F307730676B43586359724B393950716379737775566342457A6345735276616B566C695579785070514342795945636E4B6A7A784A332F41414C4E6B4F46365368533067676741414133644A424C6B51512B3754304434487135704B45756C33646A48325750655A54622F414578527239524875646B72375A6A4935693638784563306F566870496C597938486A6A56547375784A43735438755A4A4B685862712F41386968364B64416E556F6B36685A4A50384D705A322B4974552B4A56314C4E536F546F5347657A6D576A6153573236374D61727335647364517A5571784C7859364B5449334C525952696577303974374E6B744941506C4A494477356C6B6A556B48346773742B7070536C41704A44466743646F6E306E736D7A59706C537171745630665A4A494A496D4A44525A6B32424144656D5038415638744669705A656F3351392B434874596C4951706A686D6C3455354A34316D456E4B5469306969535654484349705A496F326B3467376969647947395239514D43566961515056694936735A6B624E6366686A7A78574B74326352657A316C2B4B365374456851684744636F343749632F6C6F476C6B745444584B5353474C53686D514C69725548757745755043474E704B75684F77486B336E694F695374444B6D664C6F57376636346B58516E526736737A564E5448496146634D3030674A6A68677055695A436F586B7373374F69764B476352695359386956316F784630372B62502B474357523935582B45662B65473671334B39664479665A755074593637534A54614D7246446A4B585A7051566F475A497959706D765252704F38737A7A786A497A5173576A6964527948767A6665693362707435664442714B59425470493079544A665A746838786A36796E314434484A5A6A72656D314F734A3434656D616173356A696B3762746C73307847704E386472723561316F456A5A4A39634E396F4D6E2B3035724C4B615530457358536C6D5764795A3856683366467339684D3553796E436549717131565564584653456152555671503955354B2F757772542F454150726747523176364A326C747A5535434A414A46676B6951774232304F3473627375697762356F5641386B2F37316D746B56556B6B365A6C546B7063795532642B2F685A76447078636334744F62565757716E565739536F516563453836324B5859757746336E79784D46753436765857554C4553793735466C6238374A634D56506C743631736A523865414436556D6D687936673777474A646F54614C6266684F4B7A56525546596F5437304A634454724A4E673465413378503452444A6535474B78457178744C42435A43516D33387377346B386449434F495067667A2B66776657555530696F4744387571796D626F3565306654422F77445646536F674B53463263676C4C504C6B7A6254704733794749336C6665474B4771576A74516F7045686A4B79615A314B48385268464A4932502F6B647350412F6B39616B306B4A4B79774D6452746467534162752F517868656A686946566967704F744A476F45626A562B5865664E384B6C317A37347A542F414845555678427370493537726A7478674D53646144615536486C74482F7552366A56575169486B683543764431594476453672792B4C5A6C505A784E543361744B6B7038524C6F555845474E6274304E33774638646D387A37675A61745253575159754F5A70376B364D7845634777685146687553615966326768354D6F6B5A70417971773965545539366B6B4D514334637449326D31397A48317370796D5634665357704E5055757454566C3551535568515372554938514B412F6D5259343150314A2F5444304C39516E74312F7776314A5373787A554A61742F702F4F593159307A665457526F5264696E6B4D4E4E59725472424F4B7A5430356B45664335547332594A696957354A4162517A31584C4C53583932684E7970514B524C42354A36414D6D4162744F4532537131737657714A70724B714B6953584C4E636867535442614259664448502F7743315831442F41506B583777353732413935736E563656362B364A366F2F6F3572357870614D5855654764336D3662366F77316D644971316A476454596237624D56596C6E6C6E6F7857704D506B745A544858346F3258452B45356E694753546E736F6F317161304B6D6E6F5A536748536B6853675576596B6741417553534D50715848456F496F564E4B645A4346466C386F58796C52644A6B4F5465336F6364465073723778347A4B564B453158493035456B71784D6868737179385A4F582B694E65512F44654759614373526F4B7A446E6D5A6F31637574534B7156495768334244734270496B4F44354A6565324E73316C3656616D6179475737714D695567463449453332653441773833543357734D7645705A6749594B57484E674E38523434386770636B625545485A304E622F41476A7072367955704C4749306A2F7559447241785763786C39424B7A5435514C6957767343443841622B4845746271313343685A6F6D433749484C53674858353245482F774274375034483533756169426346506F70766D6B66686863636D6B585133775038416C66476C756456742B4F5137784934734F5444577A34592F745879422B434341507A2B665569613549424155514732462B72464C37375778754B4357484D52466D45624E2B6D7846386E316D694C71577A4879565348434D5373657679386E687A2B64676853427238362F416C51367A7A4B5550335A6D3775384F4F3044626245507577564D7859453957567A666A356E433839666537315447524D6958346A496541416A6D4B6C6944386D3172696F4138447750493264624A39483061656C51425354334D6E734432446A306A6645536B6B516B46693836543933663958447A684F756F5063367A6D4C746D7A5A6E6A5771475A5551757055396F4B374E494F327A534537556379326A78346A3848303053674C306B4A35524551326E2F4333786A3459794170776B677533513338393939766E674A39552B3748486458447943396B5A4377534B422B51566D4155737A4A4750697173353473784149304F4A4F7657346F36564A4C576548505951366C626B646869644B516A6D336E65415936673976776243366456592F4F5A364A7266556471526C354E4B7453496D47756F59744B5249776369556E5A2B47783458536A7A6F4F636F6D6B68535853366C61575952486B4177553758754C524761746331454B706C6B4D47444239543873334C77576677763463495A3737324B47497158757738634B5152544D57386F714B595A6E4958774357586979726F456B6B66673641754F515272464D476B45704A44486C665546433355735459654C5631777557674A5156616E4A554E693576334D6275626A66464276766631546C65704D355068717A4E4E464A4F7061464378354F794D51474C4F43567251736F4F324158354877655139644A3464525454704935516C54466747366442494F6B51624F4273635648696931414C706B74714133647946416D7A37677059646A345777457036426C55342B724576394C78376C636A645972436C684A534A374D6A5373547868714E484C386738686B59704757444F716C6B6C53677078664664356B4A5844457379346534423375423035684966455A73523137614C4C78657A397A6359313477306E5957436F71695067713761626E59737A446B6A4C77577577486B6E5734717263616A44683453492B48363634684D2F6A333838544B31547947536D777654315A4F357A37734477417173532F634D4B3778426C416A4D6B4D4D4433305A7938684C78443547494577724255497356666F664D48306A4745674A384D66723952686949616C484155385A304E67696162576F617964525A6F6859706B72794C4E597431344A3541734B57624E5A43343762397747546C482B564268577063667A355A3658366E72766245696161316545417931782B654D5871504F524E59677738447831613971656C617453517177464442346D4B7A4A58714F5152776753753969784C455A46655578717048454F446F3564744965374F475A3238577133702B654471564634436C4633366C6D4F7A74462F736E2F7450314F5072713936637637592B38324478324C796D527877742B322B48794533326B6337787A47587166724F716F59787155326F724257583867464E2B42343474786E4F553657597042536B68714163457045426167533549454C644A4C67413668664859503647654163503476774C6A6C544F557770564C6A544456442F77433538695270634835626E75324542683938387A6E5A6D61724C6149457046695A346E69526D6A667570784479387A74697862555942647462304F5871725A3750495852556B31454A5541734D70615151536F67767A43595A68415A674878326D72775868644B6C5570496F5530684B713761676E55534B716A7541366E74364576637A692F373872696351577947576A695A492B54695538416E466932695449702F6151667943642B5077463956457255745A536C657452504B4B6139524C324143514E5870595764735571763750306A5855704642536B70554336454570444A5475456E63424C524D59513733692B766A32643643794B58757576637A44596970416B524656724C574C30706D346F68536C546C6D6D594F53684256504368646E35625A2F77414E344E78664E754B4F557A5151566B616A6C36326B387154424343444246396A4854454F634F5179564C5356556459533553566F31424A4A414A53564167426D735432594446647675722B74333757775A504530756938646E732F3034326478324F7A4756536C46516B6A7830746A733543786A4972647A767933457052323571527477523148745256316D5A6F704A413133706630663841464B69466D757061464A6F72576D6E56314955374254424A5148322B50393047733566692F434535756D4D78376B4A717235566C53416E6C4B516F616975447A4335506E4265325870533530703154306A672B764D4C6B597570756E65704D5053366B776D616A6E6178446B63506B366B4751783168594634527874627232454A6765464A6F46566F4A6B6A737857514F53356D706D3872577A47587A4B3042644F73756B4B6132465A6B754172515756703067735144744E694F7A384C7958444D33536F564D725453716E55482F455379715A46696B4C47744A496941596C6E6E42493973724855665546325374546B53686A594F32514B316445565967345641684D636E4755522B4A436F42425A535042473973766E564545425473774C47656B7448656634694D526530764473726B36494A516C4F6F6B4D6F4D644A5375512B6C7844504E6B39385054306C303345324E57726565577742454F547A7530686469702B4D686C5545624C61525658397138646543665445316B56615252574A5568515334534F5979436E54706C776F416E732F54484638395656527A4A4E4D4B30465230734358447557494C714944714C624A3164446A6E532F586A2B6A666F7633413970737439514743786B654D3931765A6248523547746C7145715532366836476B7A2B4E2F3473772B664D6344506B71324178732B55366D776F6C5A587839364C4B43475A50367A666A733354324734786D4D706D6C634E71454B795A71495345315271316F7145685355465A484D585A67353141415468666D36533669525551765372532F696747346472455842785164394B2F767A37772B3373754D587037727A7157685855524B744B53394A647863694D3868484F68646561766F727A356475464343376865504C78614F50384779655A4E53716D694B657255734F6E5143342B385263525953536434786E4938517A4E502B7A557453304A41635353577565397A7378485763644266734A39655875565753475072696E446D3659633975396971765976624C66457A3133765255336362666B7463526367736645623561356E6E4F425530316637506C4462533865557A3254356234735363364B314A31557944716155455475413743317A4878546837735239624853325268684E684D2F53486854444C6A5A4E4C76583732727A7A7150342B596C30667744344F314E54495A6B486D556C7777414367346D57426D4C593057554E714B584141447048683376414448643366317874705071743665746F7A31386979612F616B6C61796A4168536F317A4C636953666953447638686C33357A5434646D6C4676656F44695146704A443757696479356D6575426A575348476845525A7A38584432767474675439562F55686B4C304D6B4F4C747A73484D696E6858646D424A38456C354F4250672F7742736556506B71414470676A4B4A5141464D564144584D46546378476B4E7A4B617A3973527155676B6B68334C774261646D41663841572B46777A58754431626D5A64514B38307A2F4C755746344D7967446B537179397677436F545930663862477652564D4A51774B54455446324D48767537574E6A6A4230483749626F36667A475031692B6B65724F6F4F4D2B537332684335473459356A444746625930556A4259676B6564666B454254723051464A734341512F7742706A2F68447832485479474E534B514436522B7573344A4E666F5774673673627457726F7752673876486274344A38735274763841666D5730662B2F724B4C6E792F455946714C436E49634D5A374F522B7650766866506550717170694D65384D6330496B6A696D425A7A387834494768734A736C53704F6C486B36316F454F736A543934744D4571476C6D42674B643261485A2F693278774B7469512F77426F51525A6D48354D336E696A37366D2F63746E733349785A5A7776334C635977416E643762434F41734732355A6C4F6A79316F6675386A31306667325853536E6C4B6D537844453651365358672B5266597A7363445A70667536524A456C674154764A764266613969343361716A4F32566F5672562B776B636D58765479504E746766384130316A636B644B4274386D6B6C6D566D7446575949724D6E635669423636416849545243516769424A537A536D486547374F4C326E4850632F555655714C714654454B5A4B54473762397075306B74633445755173325A3634787A7338747130725157456849375A434D727242586848684971387178397851696E77515347553859384C697452476B6D4F6A443873547642394D783073723257534757576D49616C4F736242454E61566F3433643756714A57456371764A626C4564647062425A677A71546F4430433543664E782B474E4D47546F5843342B70486636766C6A682B324354317358597377686E65476D6A5153575955597639746A3570675671414F577568484D7A54463242792B7158487A2F414838386578436D6E62505457636F38386E42376469746A7847326E73416D523746684E717A74596C6D5A2B457749574F4E42424349782F7A4256324E395477335758742F70664452415973302B6B6441507A394D597552676D483345646846656249317056614B72794D715635704B385A484945364C4C4C4972764D55344E48323972334744654155616F55785A784C466D596565324467696D6964585A79523867782F4D58382F72672F57446863586D2F634C46313774614B65646569386159326C68696D4B78746D757056346E756248414D7A65422B43536635507235743974367171656379394F6D6564575166534663354A7A6C5573456962464B7577306E75622F7744305456733152344A786464496C464963614A57536F70535734546B643341647061383344545862314C374D59365353536176535348515A784A57696868336F65537252664A57423258356235624A384B7A65716A71714B4B796F36677174584A307364514E645A6354714D4548556B6B44794F4F2F5A626A644D38716B55314172714F53704C383152536A42675434657A64634B7437722B7945325270326C69466C773349634E4F774937616A69774134736A3648374A41412F774353543439626D6F7048755253536A56535746457249536F677131544C3773494A61486551397957637931645656433646503364576E705161656C5367644C46524532567144645762484B522B706A394A33552F73336D352F635046787A533944645454557175587177724A485636657A544E464856574B4D4D734D574D79386B4A6150595931386F306B636B67612F6A344A653865775048736E6E466E4B5A684B615657696772476F7043563259687A4A4D3674346A4842763655665A504F5A4A4134706B716D5A586C31614B645452547161615A317242314649415347556C33334D472B4B70626C6B7730476F797844556A5254524F2F494B364F4C426A614D6A6B70476E6B2B522B446E69475A4F4A356453716D6F764C36715A7070585671446D57704B644B4B546A5335555038416936776F416B50704A414F6D4F4B70566F464E534B687249537854555353716D5643567052554249575571594C30794E514A754D58486670612F714139613941395564442F535831546A7075717567506376716759336F6A4978575A483669364F3670367779474F7151307156653165687878364B75354B57336279654C68713072734753794E7271424C566D37446378575A34332F5350374B5563316C3837786E4C4A6F3054516F494B36615254465261306B685374494155734B6361565441766A7650394848745975706E636E777453467153716D73427455464B6B4855417A636F6661487549474F7A7A326878464C423049476E6E67696E6E4552614649576469775643584D5545624F554A5046574B6E65764138654F41354E4A70303041654E516D5968704F3779627A7675324C72375431387A6E4B745A3072397A5453744E4F435174314B414B54345642492B363444793247687035717658717954695246564545664B4A4856572F41476B6349346277515152344A346B443032704C55564A516F4D376B41387045456D4C714834546A6C75666F5654377451314570556F7144486C314F4C5331374B427433787A6C66726466556C682B6A2F61624D2B31645756704F70506437485A66703348566B4C4D69596437574C69366D7432534648626867772B516C7178717758376D3765696856654B54453946396A4F433163396E426E4134705561314E6570494A536664714B794E54454B734943726B6565462B6271706F5553685131725654553075584B53472B4C6657356A6D39396B4B6A5934306F38676A7244776A375479454F374F474A63466C556E6B646F79796B424E61504C513565756C63516F6861565533424964673463734C4A544A693741624E7467664A674E7264695148535341583662645A63523078626437563543722F614D5452756B673845485A5869447341735472656978506A65767966584F2B49556A537173516F64694756456B3362377A666F42366750524453366859504C6458334B6A4142773550544E656E6367444B6F6B5248574B52342B4C51695941503975534156576667512F5A594C495932562B494461434370534C6169475633677130673237482B59596857493131687156524367725154716153693871615264792F304C344B746270524A6F75554352385A644477454A4B6E52504A4346346A657679664834312F506F5951485963773934427536672F37326E3650494C526948556B796C5353424467705550694975666A6953592F3233765A47564168514C746446676F56575667655232516F54572B524A4878424A6252385247717A456C4942637554634B6877515A33596E732B4E6F5948564242494E775162454D384866426D365038415A5742534C64745932444B65455A53506C774863437365586C537A4D7A6B61387155494938373139346E553555586D413536335A396D7469437257534155674678754263584D3657355849506B316742676A32756D73526871374E4B5544784958414151634175763555456242316F2F6A2F37624F395055564A5A4B774F6134505255536C2B336B4D43426451366738665A62744C46376C354833734B6637752B346D49776C437976666A35524D2F7842494B376A4F6A76656A766B514472514A482B51665239476970616B58435575536C396E647A6577642B34367469576E6C3669314245674B3071426C79336E4438335958387355362B2B6E75624C6B3437736B63726F675761546C7A6B4143724B374563522B6552594B796A57787258686656303452527072717049554168495971634E49613469774F7A2B6D43616D563930456C5244414853593262555764783562574F4B6E50632F4D4E31466D4A6C424D69777A647830343849354A7970375944737A45684631763437484A746E3865722F414D4F70496F553669745166555463516C6E424E3145517856486E6974635171505539324A41554134485973374F483256336231566672544670695A336B757A724E504847724F4B78326944697A51312B3479635335594670744859476D4B71774A442F41436D614E5A476B75334D492F64446C76682F646C726B6E465234685230314471674B5978426B6B52347568654E37735267555972755A484C342B4641594B72576F456B4D62675454514C4B6F6B657A4C6F6D5A6E6956355A6779714F5A5945624139467075592B797365554552367838634B6C55676C4A55435963624270302F6F594E2F524F41756454584C416D5A6D574E5A545061413271576367776D61474C54446B3678386F6B386E67706B4C75564F6D677245414279413736583553585A6D383974686948457039774C5066524D4851593163446A6F6F61566951537878746261736B4E6546456A357176434A564D737365694A5A7035484C4B376B2B7471594A4B6F4B6931784F34663841583450676D6C54655151533230736237627631452B47306E51346248317366434D6C4F3674327357735664516F6A687273586B6A535979363065306F314371385343496D376831386F46704A4C4A5371772B71766A6365767A59492F3469664E482B59346A556F6C79453969644A35594B736A384C6E43514F475A7041346D574253306B3753424737556A63424746614C7738696A31696D6F754C6B624675316A334F31373378505644705351435A764A362F725966682F2F396B3D2671756F743B207374796C653D2671756F743B77696474683A2032303070783B2671756F743B2667743B266C743B62722667743B266C743B2F7370616E2667743B266C743B2F6469762667743B266C743B6469762667743B266C743B7370616E207374796C653D2671756F743B666F6E742D7765696768743A20626F6C643B206261636B67726F756E642D636F6C6F723A2072676228302C20302C2030293B2671756F743B2667743B266C743B62722667743B266C743B2F7370616E2667743B266C743B2F6469762667743B266C743B6469762667743BE8BF99E4B8AAE698AFE8B081E591A2EFBC9F266C743B2F6469762667743B266C743B6469762667743B26616D703B6E6273703B26616D703B6E6273703B26616D703B6E6273703B26616D703B6E6273703B26616D703B6E6273703B2026616D703B6E6273703B20E8B081E79FA5E98193E591A2266C743B62722667743B266C743B2F6469762667743B266C743B6469762667743B266C743B62722667743B266C743B2F6469762667743B);
/*!40000 ALTER TABLE `testnote` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
