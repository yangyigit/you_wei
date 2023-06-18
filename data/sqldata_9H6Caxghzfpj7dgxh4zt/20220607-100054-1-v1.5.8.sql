-- ----------------------------------------
-- EyouCms MySQL Data Transfer 
-- 
-- Server         : 127.0.0.1_3306
-- Server Version : 5.5.29
-- Host           : 127.0.0.1:3306
-- Database       : c37
-- 
-- Part : #1
-- Version : #v1.5.8
-- Date : 2022-06-07 10:00:54
-- -----------------------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `ey_ad`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ad`;
CREATE TABLE `ey_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置ID',
  `media_type` tinyint(1) DEFAULT '0' COMMENT '广告类型',
  `title` varchar(60) DEFAULT '' COMMENT '广告名称',
  `links` varchar(255) DEFAULT '' COMMENT '广告链接',
  `litpic` varchar(255) DEFAULT '' COMMENT '图片地址',
  `start_time` int(11) DEFAULT '0' COMMENT '投放时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `intro` text COMMENT '描述',
  `link_man` varchar(60) DEFAULT '' COMMENT '添加人',
  `link_email` varchar(60) DEFAULT '' COMMENT '添加人邮箱',
  `link_phone` varchar(60) DEFAULT '' COMMENT '添加人联系电话',
  `click` int(11) DEFAULT '0' COMMENT '点击量',
  `bgcolor` varchar(30) DEFAULT '' COMMENT '背景颜色',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=显示，0=屏蔽',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序',
  `target` varchar(50) DEFAULT '' COMMENT '是否开启浏览器新窗口',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '多语言',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `position_id` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- -----------------------------
-- Records of `ey_ad`
-- -----------------------------
INSERT INTO `ey_ad` VALUES ('1', '1', '1', '', '', '/uploads/allimg/180410/1-1P4101Z3530-L.jpg', '0', '0', '', '', '', '', '0', '', '1', '1', '0', '1', '0', 'cn', '1654005244', '1654005244');
INSERT INTO `ey_ad` VALUES ('2', '1', '1', '', '', '/uploads/allimg/180410/1-1P4101Z3420-L.jpg', '0', '0', '', '', '', '', '0', '', '1', '2', '0', '1', '0', 'cn', '1654005244', '1654005244');
INSERT INTO `ey_ad` VALUES ('3', '1', '1', '', '', '/uploads/allimg/180410/1-1P4101Z3290-L.jpg', '0', '0', '', '', '', '', '0', '', '1', '3', '0', '1', '0', 'cn', '1654005244', '1654005244');

-- -----------------------------
-- Table structure for `ey_ad_position`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ad_position`;
CREATE TABLE `ey_ad_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告展示类型，1图片类型，2媒体类型，3HTML代码',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位宽度',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告位高度',
  `intro` text NOT NULL COMMENT '广告描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0关闭1开启',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '多语言',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告位置表';

-- -----------------------------
-- Records of `ey_ad_position`
-- -----------------------------
INSERT INTO `ey_ad_position` VALUES ('1', '手机幻灯片', '1', '0', '0', '', '1', 'cn', '1', '0', '1654005244', '1654005244');

-- -----------------------------
-- Table structure for `ey_admin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin`;
CREATE TABLE `ey_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `pen_name` varchar(50) DEFAULT '' COMMENT '笔名（发布文章后显示责任编辑的名字）',
  `true_name` varchar(20) DEFAULT '' COMMENT '真实姓名',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `email` varchar(60) DEFAULT '' COMMENT 'email',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `head_pic` varchar(255) DEFAULT '' COMMENT '头像',
  `last_login` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `login_cnt` int(11) DEFAULT '0' COMMENT '登录次数',
  `session_id` varchar(50) DEFAULT '' COMMENT 'session_id',
  `parent_id` int(10) DEFAULT '0' COMMENT '父管理员ID',
  `role_id` int(10) NOT NULL DEFAULT '-1' COMMENT '角色组ID（-1表示超级管理员）',
  `mark_lang` varchar(50) DEFAULT 'cn' COMMENT '当前语言标识',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `syn_users_id` int(10) DEFAULT '0' COMMENT '同步注册到会员表',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`admin_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- -----------------------------
-- Records of `ey_admin`
-- -----------------------------
INSERT INTO `ey_admin` VALUES ('1', 'admin', '', 'admin', '', '', '$2y$11$8d9231996c510adfeff49uDGGCs5TrQj6Q33MrdoUcoLGma6dW3Lu', '', '1654562472', '127.0.0.1', '2', 'fdasithmuj6fm1pgpdhrkdt9j7', '0', '-1', 'cn', '1', '0', '1654562458', '0');

-- -----------------------------
-- Table structure for `ey_admin_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin_log`;
CREATE TABLE `ey_admin_log` (
  `log_id` bigint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `admin_id` int(10) NOT NULL DEFAULT '-1' COMMENT '管理员id',
  `log_info` text COMMENT '日志描述',
  `log_ip` varchar(30) DEFAULT '' COMMENT 'ip地址',
  `log_url` varchar(255) DEFAULT '' COMMENT 'url',
  `log_time` int(11) DEFAULT '0' COMMENT '日志时间',
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- -----------------------------
-- Records of `ey_admin_log`
-- -----------------------------
INSERT INTO `ey_admin_log` VALUES ('4', '-1', '访问后台', '127.0.0.1', '/login.php', '1653987065');
INSERT INTO `ey_admin_log` VALUES ('5', '1', '后台登录', '127.0.0.1', '/login.php', '1653987073');
INSERT INTO `ey_admin_log` VALUES ('6', '-1', '访问后台', '127.0.0.1', '/ey/login.php', '1653996627');
INSERT INTO `ey_admin_log` VALUES ('7', '1', '后台登录', '127.0.0.1', '/ey/login.php', '1653996634');
INSERT INTO `ey_admin_log` VALUES ('8', '1', '安装插件：织梦CMS转换易优CMS', '127.0.0.1', '/ey/login.php', '1653996647');
INSERT INTO `ey_admin_log` VALUES ('9', '1', '编辑织梦CMS转换易优CMS：插件配置', '127.0.0.1', '/ey/login.php', '1653996660');
INSERT INTO `ey_admin_log` VALUES ('10', '1', '编辑友情链接：百度', '127.0.0.1', '/ey/login.php', '1653999987');
INSERT INTO `ey_admin_log` VALUES ('11', '1', '编辑友情链接：淘宝', '127.0.0.1', '/ey/login.php', '1653999999');
INSERT INTO `ey_admin_log` VALUES ('12', '1', '编辑友情链接：天猫', '127.0.0.1', '/ey/login.php', '1654000009');
INSERT INTO `ey_admin_log` VALUES ('13', '1', '删除友情链接：建站素材,企业网站模板,掌柜子,微信小程序开发', '127.0.0.1', '/ey/login.php', '1654000015');
INSERT INTO `ey_admin_log` VALUES ('14', '1', '编辑栏目：网站建设', '127.0.0.1', '/ey/login.php', '1654002848');
INSERT INTO `ey_admin_log` VALUES ('15', '1', '编辑栏目：服务项目', '127.0.0.1', '/ey/login.php', '1654002911');
INSERT INTO `ey_admin_log` VALUES ('16', '1', '新增留言表单：姓名', '127.0.0.1', '/ey/login.php', '1654003195');
INSERT INTO `ey_admin_log` VALUES ('17', '1', '新增留言表单：手机号', '127.0.0.1', '/ey/login.php', '1654003202');
INSERT INTO `ey_admin_log` VALUES ('18', '1', '新增留言表单：内容', '127.0.0.1', '/ey/login.php', '1654003210');
INSERT INTO `ey_admin_log` VALUES ('19', '1', '新增留言表单：所属栏目', '127.0.0.1', '/ey/login.php', '1654003228');
INSERT INTO `ey_admin_log` VALUES ('20', '1', '卸载插件：织梦CMS转换易优CMS', '127.0.0.1', '/ey/login.php', '1654004768');
INSERT INTO `ey_admin_log` VALUES ('21', '-1', '访问后台', '127.0.0.1', '/login.php', '1654005034');
INSERT INTO `ey_admin_log` VALUES ('22', '1', '后台登录', '127.0.0.1', '/login.php', '1654005040');
INSERT INTO `ey_admin_log` VALUES ('23', '1', '新增广告：手机幻灯片', '127.0.0.1', '/login.php', '1654005244');
INSERT INTO `ey_admin_log` VALUES ('24', '1', '伪删除栏目：首页幻灯,手机端幻灯', '127.0.0.1', '/login.php', '1654005323');
INSERT INTO `ey_admin_log` VALUES ('25', '1', '保存自定义变量：电话,手机,地址,邮箱,QQ客服,微信二维码', '127.0.0.1', '/login.php', '1654005387');
INSERT INTO `ey_admin_log` VALUES ('26', '1', '删除留言-id：2', '127.0.0.1', '/login.php', '1654005541');
INSERT INTO `ey_admin_log` VALUES ('27', '1', '访问后台', '127.0.0.1', '/login.php', '1654015988');
INSERT INTO `ey_admin_log` VALUES ('28', '1', '后台登录', '127.0.0.1', '/login.php', '1654015995');
INSERT INTO `ey_admin_log` VALUES ('29', '-1', '访问后台', '127.0.0.1', '/login.php', '1654562460');
INSERT INTO `ey_admin_log` VALUES ('30', '1', '后台登录', '127.0.0.1', '/login.php', '1654562472');
INSERT INTO `ey_admin_log` VALUES ('31', '1', '删除文档：幻灯1|幻灯2|幻灯3|WAP幻灯1|WAP幻灯2|WAP幻灯3', '127.0.0.1', '/login.php', '1654562488');
INSERT INTO `ey_admin_log` VALUES ('32', '1', '删除栏目：首页幻灯,手机端幻灯', '127.0.0.1', '/login.php', '1654562493');
INSERT INTO `ey_admin_log` VALUES ('33', '1', '保存自定义变量：电话,手机,地址,邮箱,QQ客服,微信二维码', '127.0.0.1', '/login.php', '1654562578');
INSERT INTO `ey_admin_log` VALUES ('34', '1', '删除留言表单-id：4', '127.0.0.1', '/login.php', '1654563444');
INSERT INTO `ey_admin_log` VALUES ('35', '1', '删除留言-id：4,3,1', '127.0.0.1', '/login.php', '1654563462');
INSERT INTO `ey_admin_log` VALUES ('36', '1', '编辑栏目：关于我们', '127.0.0.1', '/login.php', '1654563517');
INSERT INTO `ey_admin_log` VALUES ('37', '1', '编辑栏目：如何选择', '127.0.0.1', '/login.php', '1654563533');
INSERT INTO `ey_admin_log` VALUES ('38', '1', '编辑栏目：服务项目', '127.0.0.1', '/login.php', '1654563929');
INSERT INTO `ey_admin_log` VALUES ('39', '1', '删除留言表单-id：1,2,3', '127.0.0.1', '/login.php', '1654563972');
INSERT INTO `ey_admin_log` VALUES ('40', '1', '编辑栏目：服务项目', '127.0.0.1', '/login.php', '1654563986');
INSERT INTO `ey_admin_log` VALUES ('41', '1', '新增栏目：留言内容', '127.0.0.1', '/login.php', '1654564006');
INSERT INTO `ey_admin_log` VALUES ('42', '1', '编辑栏目：留言内容', '127.0.0.1', '/login.php', '1654564027');
INSERT INTO `ey_admin_log` VALUES ('43', '1', '新增留言表单：姓名', '127.0.0.1', '/login.php', '1654564036');
INSERT INTO `ey_admin_log` VALUES ('44', '1', '新增留言表单：电话号码', '127.0.0.1', '/login.php', '1654564058');
INSERT INTO `ey_admin_log` VALUES ('45', '1', '新增留言表单：需求', '127.0.0.1', '/login.php', '1654564069');
INSERT INTO `ey_admin_log` VALUES ('46', '1', '删除留言-id：5', '127.0.0.1', '/login.php', '1654564286');
INSERT INTO `ey_admin_log` VALUES ('47', '1', '编辑栏目：新闻中心', '127.0.0.1', '/login.php', '1654564358');
INSERT INTO `ey_admin_log` VALUES ('48', '1', '编辑栏目：案例作品', '127.0.0.1', '/login.php', '1654564563');

-- -----------------------------
-- Table structure for `ey_admin_menu`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin_menu`;
CREATE TABLE `ey_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT '' COMMENT '导航名称',
  `controller_name` varchar(50) DEFAULT '' COMMENT '控制器',
  `action_name` varchar(50) DEFAULT '' COMMENT '方法名',
  `param` varchar(255) DEFAULT '' COMMENT '参数',
  `icon` varchar(50) DEFAULT 'iconfont e-lanmuguanli' COMMENT '图标',
  `is_menu` tinyint(1) DEFAULT '0' COMMENT '是否显示为左侧菜单',
  `is_switch` tinyint(1) DEFAULT '0' COMMENT '是否显示在switch_map页面中',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1=显示，0=隐藏',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='外挂功能地图菜单表';

-- -----------------------------
-- Records of `ey_admin_menu`
-- -----------------------------
INSERT INTO `ey_admin_menu` VALUES ('1', '1005', '欢迎页', 'Index', 'welcome', '', 'fa fa-user', '0', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('2', '1001', '栏目管理', 'Arctype', 'index', '|mt20|1', 'iconfont e-lanmuguanli', '1', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('3', '1002', '内容管理', 'Archives', 'index', '', 'iconfont e-neirongwendang', '1', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('4', '1004', '待审稿件', 'Archives', 'index_draft', '', 'iconfont e-tougao', '0', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('5', '1003', '广告管理', 'AdPosition', 'index', '', 'iconfont e-guanggao', '1', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('6', '2001', '基本信息', 'System', 'web', '', 'iconfont e-shezhi', '1', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('7', '2002', '可视编辑', 'Uiset', 'ui_index', '', 'iconfont e-keshihuabianji', '0', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('8', '2003', 'SEO模块', 'Seo', 'seo', '', 'iconfont e-seo', '1', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('9', '2004', '功能地图', 'Index', 'switch_map', '', 'iconfont e-caidangongneng', '1', '0', '10000', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('10', '2005', '插件应用', 'Weapp', 'index', '', 'iconfont e-chajian', '1', '1', '100', '1', 'cn', '1648864596', '1653996642');
INSERT INTO `ey_admin_menu` VALUES ('11', '2006', '会员中心', 'Member', 'users_index', '', 'iconfont e-gerenzhongxin', '0', '1', '100', '1', 'cn', '1648864596', '1648864596');
INSERT INTO `ey_admin_menu` VALUES ('12', '2008', '商城中心', 'Shop', 'home', '', 'iconfont e-shangcheng', '1', '1', '100', '1', 'cn', '1648864596', '1653987074');
INSERT INTO `ey_admin_menu` VALUES ('13', '2009', '可视化小程序', 'Diyminipro', 'page_edit', '', 'fa fa-code', '0', '1', '100', '1', 'cn', '1648864596', '1648864596');

-- -----------------------------
-- Table structure for `ey_admin_wxlogin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_admin_wxlogin`;
CREATE TABLE `ey_admin_wxlogin` (
  `wx_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1=官方公众号，2=微信应用',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `unionid` varchar(200) NOT NULL DEFAULT '' COMMENT 'unionid',
  `headimgurl` varchar(200) NOT NULL DEFAULT '' COMMENT '头像',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`wx_id`) USING BTREE,
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台微信登录记录表';


-- -----------------------------
-- Table structure for `ey_archives`
-- -----------------------------
DROP TABLE IF EXISTS `ey_archives`;
CREATE TABLE `ey_archives` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `typeid` int(10) NOT NULL DEFAULT '0' COMMENT '当前栏目',
  `stypeid` varchar(90) DEFAULT '' COMMENT '副栏目ID集合',
  `channel` int(10) NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_b` tinyint(1) DEFAULT '0' COMMENT '加粗',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `subtitle` varchar(200) DEFAULT '' COMMENT '副标题',
  `litpic` varchar(250) DEFAULT '' COMMENT '缩略图',
  `is_head` tinyint(1) DEFAULT '0' COMMENT '头条（0=否，1=是）',
  `is_special` tinyint(1) DEFAULT '0' COMMENT '特荐（0=否，1=是）',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '置顶（0=否，1=是）',
  `is_recom` tinyint(1) DEFAULT '0' COMMENT '推荐（0=否，1=是）',
  `is_jump` tinyint(1) DEFAULT '0' COMMENT '跳转链接（0=否，1=是）',
  `is_litpic` tinyint(1) DEFAULT '0' COMMENT '图片（0=否，1=是）',
  `is_roll` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '滚动（0=否，1=是）',
  `is_slide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '幻灯（0=否，1=是）',
  `is_diyattr` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自定义（0=否，1=是）',
  `origin` varchar(30) DEFAULT '' COMMENT '来源',
  `author` varchar(200) DEFAULT '' COMMENT '作者',
  `click` int(10) DEFAULT '0' COMMENT '浏览量',
  `arcrank` int(10) DEFAULT '0' COMMENT '阅读权限：0=开放浏览，-1=待审核稿件',
  `jumplinks` varchar(255) DEFAULT '' COMMENT '外链跳转',
  `ismake` tinyint(1) DEFAULT '0' COMMENT '是否静态页面（0=动态，1=静态）',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` text COMMENT 'SEO描述',
  `attrlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参数列表ID',
  `users_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员价',
  `users_free` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否会员免费，默认0不免费，1为免费',
  `old_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品旧价',
  `sales_num` int(10) NOT NULL DEFAULT '0' COMMENT '销售量',
  `stock_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存量',
  `stock_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '商品库存在产品详情页是否显示，1为显示，0为不显示',
  `prom_type` tinyint(1) unsigned DEFAULT '0' COMMENT '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘)，3=虚拟(自定义文本)',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0=屏蔽，1=正常)',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `users_id` int(10) DEFAULT '0' COMMENT '会员ID',
  `arc_level_id` int(10) DEFAULT '0' COMMENT '文档会员权限ID',
  `restric_type` tinyint(1) DEFAULT '0' COMMENT '限制模式，0=免费，1=付费，2=会员专享，3=会员付费',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `joinaid` int(10) DEFAULT '0' COMMENT '关联文档ID',
  `downcount` int(10) DEFAULT '0' COMMENT '下载次数',
  `appraise` int(10) DEFAULT '0' COMMENT '评价数',
  `collection` int(10) DEFAULT '0' COMMENT '收藏数',
  `htmlfilename` varchar(250) DEFAULT '' COMMENT '自定义文件名',
  `province_id` int(10) DEFAULT '0' COMMENT '省份',
  `city_id` int(10) DEFAULT '0' COMMENT '所在城市',
  `area_id` int(10) DEFAULT '0' COMMENT '所在区域',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`),
  KEY `aid` (`typeid`,`channel`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='文档主表';

-- -----------------------------
-- Records of `ey_archives`
-- -----------------------------
INSERT INTO `ey_archives` VALUES ('3', '12', '', '1', '0', '如何提高网站流量和访问量？', '', '/uploads/allimg/180410/1-1P4101353340-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '140', '0', '', '0', '', '如何,提高,网站,流量,和,访问量,针对,大多,', '针对大多客户提出的流量上不去，访问量很低的情况，最优工作室在此分享5种方法提高网站流量： 第一，网站的推广策略不佳；流量上不去，如果不是因为其他的原因，比如本文列到的', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523339624', '1523339602');
INSERT INTO `ey_archives` VALUES ('2', '12', '', '1', '0', '建设网站对企业有哪些好处？', '', '/uploads/allimg/180410/1-1P4101353090-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '66', '0', '', '0', '', '建设,网站,对,企业,有,哪些,好处,什么,是,', '什么是网站？ 网站就是在互联网上一块固定的面向全世界发布消息的地方。它由域名（也就是网站地址）和网站空间构成。衡量一个网站的性能通常从网站空间大小、网站位置、网站连', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523339595', '1523339578');
INSERT INTO `ey_archives` VALUES ('4', '12', '', '1', '0', '如何保护注册域名？保护域名不被别人抢注', '', '/uploads/allimg/180410/1-1P410135A70-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '176', '0', '', '0', '', '如何,保护,注册,域名,不被,别人,抢注,前,一阵,', '前一阵Google被迫以百万元巨资赎回未及时注册的Google.cn和Google.com.cn，我们也经常可以看到国内某知名企业域名被抢注的消息。国内企业的域名保护意识相对簿弱，造成这种现象的频繁发', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523339829', '1523339812');
INSERT INTO `ey_archives` VALUES ('5', '12', '', '1', '0', '移动端中的巅峰营销--微信营销', '', '/uploads/allimg/180410/1-1P410135Q30-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '155', '0', '', '0', '', '移动,端,中的,巅峰,营销,微信,微信,营销,', '微信营销不仅仅只是空穴来风。微信在二零一四年就已站在移动端的顶峰，现如今更是主宰了整个移动端。据资料显示截至二零一五年的一季度末就有高达进九百万的企业使用微信公众', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523339903', '1523339889');
INSERT INTO `ey_archives` VALUES ('6', '12', '', '1', '0', '网络公司搜索引擎优化:如何做好下篇', '', '/uploads/allimg/180410/1-1P410135S30-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '162', '0', '', '0', '', '网络公司,搜索引擎,优化,如何,做好,下篇,在,', '在网络推广中网站优化是必不可少的，而网站优化包括两大部分 第一部份：站内，另外一部份是站外。成都网络公司第一品牌今网科技的小编现在将站外优化的几点实际经验告诉大家。', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523339935', '1523339910');
INSERT INTO `ey_archives` VALUES ('7', '12', '', '1', '0', '成都做网站为你解析模版网站与定制网站有哪些', '', '/uploads/allimg/180410/1-1P4101359140-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '138', '0', '', '0', '', '成都,做,网站,为你,解析,模版,与,定制,有,', '很多客户不明白定制网站与模版网站有什么区别，成都做网站的公司就为你分析如下：模版建站有几种叫法：智能建站、自助建站、模版建站、智能CMS系统【模块建站】、速成网站等。', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523339964', '1523339950');
INSERT INTO `ey_archives` VALUES ('8', '4', '', '1', '0', '信誉集团', '', '/uploads/allimg/180410/1-1P4101400570-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '123', '0', '', '0', '', '信誉,集团,信誉,集团,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340067', '1533203384');
INSERT INTO `ey_archives` VALUES ('9', '4', '', '1', '0', 'KYM', '', '/uploads/allimg/180410/1-1P4101401120-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '77', '0', '', '0', '', 'KYM,KYM,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340080', '1533203372');
INSERT INTO `ey_archives` VALUES ('10', '4', '', '1', '0', 'STOM', '', '/uploads/allimg/180410/1-1P4101401250-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '104', '0', '', '0', '', 'STOM,STOM,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340095', '1533203347');
INSERT INTO `ey_archives` VALUES ('11', '4', '', '1', '0', '韩丽衣服', '', '/uploads/allimg/180410/1-1P4101401410-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '156', '0', '', '0', '', '韩丽,衣服,韩丽,衣服,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340117', '1533203329');
INSERT INTO `ey_archives` VALUES ('12', '4', '', '1', '0', '姚博士', '', '/uploads/allimg/180410/1-1P4101404430-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '166', '0', '', '0', '', '姚博士,姚,博士,姚博士,姚,博士,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340293', '1533203317');
INSERT INTO `ey_archives` VALUES ('13', '4', '', '1', '0', 'MMKOI', '', '/uploads/allimg/180410/1-1P4101405020-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '53', '0', '', '0', '', 'MMKOI,MMKOI,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340310', '1533203299');
INSERT INTO `ey_archives` VALUES ('14', '4', '', '1', '0', '盛威过滤', '', '/uploads/allimg/180410/1-1P4101405190-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '180', '0', '', '0', '', '盛威,过滤,盛威,过滤,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340331', '1533202958');
INSERT INTO `ey_archives` VALUES ('15', '4', '', '1', '0', '柏聪股份', '', '/uploads/allimg/180410/1-1P4101405360-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '171', '0', '', '0', '', '柏聪,股份,柏聪,股份,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340347', '1533202946');
INSERT INTO `ey_archives` VALUES ('17', '4', '', '1', '0', '利玛窦', '', '/uploads/allimg/180410/1-1P410140P00-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '71', '0', '', '0', '', '利玛窦,利玛窦,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340489', '1533202934');
INSERT INTO `ey_archives` VALUES ('18', '4', '', '1', '0', '晨光涂料', '', '/uploads/allimg/180410/1-1P410140R60-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '70', '0', '', '0', '', '晨光,涂料,晨光,涂料,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340516', '1533202924');
INSERT INTO `ey_archives` VALUES ('19', '4', '', '1', '0', '兆阳能源', '', '/uploads/allimg/180410/1-1P410140T10-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '128', '0', '', '0', '', '兆阳,能源,兆阳,能源,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340531', '1533202910');
INSERT INTO `ey_archives` VALUES ('20', '4', '', '1', '0', 'DFAM', '', '/uploads/allimg/180410/1-1P410140U80-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '151', '0', '', '0', '', 'DFAM,DFAM,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340547', '1533202899');
INSERT INTO `ey_archives` VALUES ('21', '4', '', '1', '0', 'DALWA', '', '/uploads/allimg/180410/1-1P4101409140-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '125', '0', '', '0', '', 'DALWA,DALWA,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340568', '1533202888');
INSERT INTO `ey_archives` VALUES ('22', '4', '', '1', '0', '新奥玛', '', '/uploads/allimg/180410/1-1P4101409340-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '50', '0', '', '0', '', '新奥玛,新奥玛,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340589', '1533202872');
INSERT INTO `ey_archives` VALUES ('23', '4', '', '1', '0', 'ARK', '', '/uploads/allimg/180410/1-1P4101409540-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '115', '0', '', '0', '', 'ARK,ARK,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523340603', '1533202856');
INSERT INTO `ey_archives` VALUES ('25', '6', '', '1', '0', '信息咨询有限公司', '', '/uploads/allimg/180410/1-1P4101604460-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '87', '0', '', '0', '', '信息,咨询,有限公司,', '信息咨询有限公司，位于广州市新北区太湖东路58号，创意园B座9楼，占地面积达1000平方米，是集早教、少儿英语、学科辅导及体艺培训为一体的综合性培训中心。自成立以来，我们秉承', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523347596', '1523347479');
INSERT INTO `ey_archives` VALUES ('26', '13', '', '1', '0', '一份靠谱的PRD文档，需要注重哪些细节？', '', '/uploads/allimg/180410/1-1P410161S10-L.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '65', '0', '', '0', '', '一份,靠,谱,的,PRD,文档,需要,注重,哪些,细节,', 'PRD文档很见产品经理的基本功。好的PRD文档开发人员阅读起来如沐清风，手脚麻利，干活利索。延期？不存在的！ 一份考虑不够周全的PRD文档，让开发人员二丈摸不到头脑，在需求评审', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348315', '1523348293');
INSERT INTO `ey_archives` VALUES ('27', '13', '', '1', '0', '不是百度，不是谷歌', '', '/uploads/allimg/180410/1-1P410161U90-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '92', '0', '', '0', '', '不是,百度,谷歌,4月,9日,一飞,智控,天津,科技,', '4月9日，一飞智控（天津）科技有限公司（简称一飞）宣布完成近亿元A＋轮融资，本次融资由中航信托控股有限公司领投。 此前，一飞已得到国内数家知名资本的投资看好，此次得到中', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348353', '1523348335');
INSERT INTO `ey_archives` VALUES ('28', '13', '', '1', '0', '从四大层面看水滴筹合并轻松筹的可能性', '', '/uploads/allimg/180410/1-1P4101619240-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '82', '0', '', '0', '', '从,四大,层面,看,水滴,筹,合并,轻松,的,日前,', '日前，有这样一则传言：IDG资本和轻松筹高管，与水滴筹公司进行了多次接触，力促两家企业合并，合并后新公司的比例为水滴筹公司占比65%，轻松筹占比35%。轻松筹和水滴筹公司商谈', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348374', '1523348361');
INSERT INTO `ey_archives` VALUES ('29', '6', '', '1', '0', '房地产开发有限公司', '', '/uploads/allimg/180410/1-1P4101623590-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '99', '0', '', '0', '', '房地产,开发,有限公司,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348698', '1523348635');
INSERT INTO `ey_archives` VALUES ('30', '6', '', '1', '0', '能源科技有限公司', '', '/uploads/allimg/180410/1-1P4101625480-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '60', '0', '', '0', '', '能源,科技,有限公司,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348799', '1523348743');
INSERT INTO `ey_archives` VALUES ('31', '6', '', '1', '0', '光阳发动机有限公司', '', '/uploads/allimg/180410/1-1P410162F90-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '168', '0', '', '0', '', '光阳,发动机,有限公司,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348869', '1523348826');
INSERT INTO `ey_archives` VALUES ('32', '6', '', '1', '0', '农机集团有限公司', '', '/uploads/allimg/180410/1-1P410162Q10-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '150', '0', '', '0', '', '农机,集团,有限公司,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523348951', '1523348886');
INSERT INTO `ey_archives` VALUES ('33', '6', '', '1', '0', '车业有限公司', '', '/uploads/allimg/180410/1-1P4101629400-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '158', '0', '', '0', '', '车业,有限公司,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523349024', '1523348975');
INSERT INTO `ey_archives` VALUES ('34', '7', '', '1', '0', '新西兰手工冰棍', '', '/uploads/allimg/180410/1-1P4101632320-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '200', '0', '', '0', '', '新西兰,手工,冰棍,', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523349193', '1523349149');
INSERT INTO `ey_archives` VALUES ('35', '7', '', '1', '0', '蒂薇雅', '', '/uploads/allimg/180410/1-1P4101633370-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '142', '0', '', '0', '', '蒂薇,雅,', '生物科技发展有限公司位于广州番禺区，是一家致力于女性用品的设计、开发、销售的高科技公司，公司以女性需求为导向，为广大女性朋友创造更舒适的体验为目标。 ', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1523349268', '1523349212');
INSERT INTO `ey_archives` VALUES ('41', '29', '', '1', '0', '湖南红网新媒体集团', '湖南最具影响力的媒体之一', '/uploads/allimg/180802/1-1PP21FU50-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '179', '0', '', '0', '', '湖南,红网,新媒体,新,媒体,集团,湖南,红网,', '随着业务的发展特别是新媒体时代，我们的网站结构也越来越复杂，模块越来越多；偶然的机会接触到微构网络团队发现他们不仅对技术擅长而且可以提出很多针对性的解决方案，这些', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533200939', '1533200919');
INSERT INTO `ey_archives` VALUES ('42', '29', '', '1', '0', '国防科技大学', '国内最顶级军事院校之一', '/uploads/allimg/180802/1-1PP21F9170-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '190', '0', '', '0', '', '国防科技,大学,国防科技,大学,', '在我们科研部需要开发部门网站项目的时候，了解到我们单位三院参与共建的北斗仿真实验室的网站是微构网络团队开发的，因此微构网络成为我们的候选服务商之一；截至目前，微构', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533200961', '1533200945');
INSERT INTO `ey_archives` VALUES ('43', '29', '', '1', '0', '北京中益农信息科技股份有限公司', '农业部农村信息入户工程指定', '/uploads/allimg/180802/1-1PP21F9440-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '159', '0', '', '0', '', '北京,中益,农,信息,科技,股份有限公司,北京,', '我们公司负责农业部北京地区的信息入户工程建设，公司在湖南长沙建立自己的信息化支撑团队，微构网络团队给了我们团队很多帮助，包括系统的架构设计、开发建议，并跟我们自己', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533200988', '1533200968');
INSERT INTO `ey_archives` VALUES ('44', '29', '', '1', '0', '人人聚财', '国内领先的P2P平台，行业第一', '/uploads/allimg/180802/1-1PP21G0060-L.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '122', '0', '', '0', '', '人人,聚财,人人,聚财,', '虽然我们自己拥有一支完备的互联网研发团队，但对于社区部分一直都由微构网络团队做支持；我们团队的老大黄工两年前在Discuz开放平台找到微构网络团队。在后续服务过过程中我们', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533201010', '1533200996');
INSERT INTO `ey_archives` VALUES ('45', '13', '', '1', '0', '微信小程序内测广告组件与新增快速创建能力等', '', '/uploads/180802/1-1PP21P504925.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '81', '0', '', '0', '', '微信,小,程序,内测,广告,组件,与,新增,快速,', '微信小程序现在一般每周都会推送一次更新通知，上次主要是推送了微信小程序支持插件等相关信息，就在昨天晚上又推送了新的更新通知（微信团队真敬业，一般都是晚上进行推送的', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203494', '1533204300');
INSERT INTO `ey_archives` VALUES ('46', '13', '', '1', '0', '咳咳，百度悄悄上线了跟微信一样的小程序', '', '/uploads/180802/1-1PP21P44Q61.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '104', '0', '', '0', '', '咳咳,百度,悄悄,上线,了,跟微,信,一样,的,小,', '还记得几年前百度推出的轻应用么？应该不是记得与否，而是可能很多人都没听过这玩意。 不知道是不是眼红腾讯还是什么鬼，突然发现百度竟然跟着腾讯、阿里的节奏推出了百度小程', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203517', '1533204284');
INSERT INTO `ey_archives` VALUES ('47', '13', '', '1', '0', '微信小程序将逐步取消通过wx.getUserInfo方式获取用', '', '/uploads/180802/1-1PP21P432326.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '189', '0', '', '0', '', '微信,小,程序,将,逐步,取消,通过,wx.getUserI', '近日，微信公众平台发布通知称微信小程序与小游戏将逐步取消通过wx.getUserInfo方式获取用户信息，提醒开发者逐步使用其他方式代替wx.getUserInfo方式。 微信官方通知称：小程序与小游', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203536', '1533204269');
INSERT INTO `ey_archives` VALUES ('48', '14', '', '1', '0', '微信订阅号消息列表改版：变成信息流了！', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', 'admin', '68', '0', '', '0', '', '微信,订阅,号,消息,列表,改版,变成,信息,流了,', '就在今天晚上早些时候，微构网络了解到，腾讯通过多个公众号（微信公众平台和微信派等）推送消息： 为提升阅读效率，我们对订阅号消息列表改版，用户可直接浏览订阅号消息。', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203605', '1533203597');
INSERT INTO `ey_archives` VALUES ('49', '14', '', '1', '0', '一个神奇的“bug”挽回了整台服务器的数据', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', 'admin', '190', '0', '', '0', '', '一个,神奇,的,“,bug,”,挽,回了,整台,服务器,', '今天中午大概1-2点的时候，刚好在午睡养精蓄锐，不然下午怎么写bug改bug呢？突然微信语音和手机同时响了，结果一看都是同一家单位的客户，只是是两个不同的人而已。 这时候心里开', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203621', '1533203613');
INSERT INTO `ey_archives` VALUES ('50', '14', '', '1', '0', '微信支付官方紧急推送关于修复XXE漏洞提示，附', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', 'admin', '156', '0', '', '0', '', '微信,支付,官方,紧急,推送,关于,修复,XXE,漏洞,', '昨天有一条关于微信支付0元购的消息在开发圈里炸开了锅，所谓0元购并不是用户抽奖，而是恶意攻击者利用漏洞实现0元支付。 正常的支付基本流程是这样的：用户发起支付-调起微信', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203697', '1533203678');
INSERT INTO `ey_archives` VALUES ('51', '14', '', '1', '0', 'Discuz用户分表后怎么通过uid获取用户信息的方法', '', '/uploads/180802/1-1PP21P543628.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '104', '0', '', '0', '', 'Discuz,用户,分表,后,怎么,通过,uid,获取,信息', '在前段时间湖南红网有一个需求，大概就是调用用户被置顶的帖子数排名的top10，测试的基本效果就是首先查询到top10的uid集合（由于功能模块原来的的数据结构中仅在置顶表中查询得到', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203723', '1533204340');
INSERT INTO `ey_archives` VALUES ('52', '14', '', '1', '0', 'krpano上传多张大图时切图过程无响应分析', '', '/uploads/180802/1-1PP21P522c2.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '146', '0', '', '0', '', 'krpano,上传,多,张大,图时,切图,过程,无,响应,', '随着互联网技术及基础设施的发展，很多以前想想都觉得奢侈的场景应用现在都变得非常日常了，比如视频直播、短视频、VR全景等等。就VR全景而已，最近今年在国内的应用非常火，比', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203742', '1533204318');
INSERT INTO `ey_archives` VALUES ('53', '14', '', '1', '0', '网站制作及设计开发加上传，域名申请这些大概', '', '/uploads/180802/1-1PP21P40E19.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '155', '0', '', '0', '', '网站制作,及,设计开发,加,上传,域名申请,、,', '1、您说的这些费用主要是网站设计开发的费用，开发费用根据需求而定，比如我们这里普通企业网站PC版3000为参考，PC+手机版（数据同步，同步更新，支持微信访问）是5000为参考，具', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203756', '1533204242');
INSERT INTO `ey_archives` VALUES ('54', '30', '', '1', '0', '项目已经开发了app客户端，还有必要开发小程序', '', '/uploads/180802/1-1PP21P155196.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '128', '0', '', '0', '', '项目,已经,开发,了,app,客户端,还有,必要,小,', '最近收到一些咨询，问自己的项目（小型项目，用户量并不大）已经有ios和安卓客户端，还有网页版，是否有必要再开发小程序。 我们的建议是，是有必要开发小程序的，理由如下：', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203948', '1533204110');
INSERT INTO `ey_archives` VALUES ('55', '30', '', '1', '0', '怎么让网站支持https访问，让浏览器标记为安全', '', '/uploads/180802/1-1PP21P210951.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '98', '0', '', '0', '', '怎么,让,网站,支持,https,访问,浏览器,标记,为,', '现在https是趋势，很多地方需要强制使用https，比如微信小程序的网络请求、web-view等都需要目标url是支持https访问的。那么怎么才能让网站支持https访问呢？你只需要做两个事情就够了：', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203968', '1533204127');
INSERT INTO `ey_archives` VALUES ('56', '30', '', '1', '0', '微信小程序是名称是否要有商标？可以改名么？', '', '/uploads/180802/1-1PP21P22K29.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '98', '0', '', '0', '', '微信,小,程序,是,名称,是否,要有,商标,可以,', '今天早上有正在做的小程序项目的客户在讨论组中问到，问是微信小程序是名称是否要有商标。我可以肯定的告诉大家是不需要的。 同时需要注意的是：第一，小程序的名称是没有一定', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533203988', '1533204143');
INSERT INTO `ey_archives` VALUES ('57', '30', '', '1', '0', '域名和服务器空间不在一个服务商可以备案么？', '', '/uploads/180802/1-1PP21P243C9.jpg', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '171', '0', '', '0', '', '域名,和,服务器,空间,不在,一个,服务商,可以,', '不少客户在要做网站的时候都有一个问题就是：我的域名早就有了，在万网买的，而我现在想用腾讯云的服务器，这样可以备案么？这样的问题除了面对面跟客户沟通的时候出现，最近', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533204004', '1533204158');
INSERT INTO `ey_archives` VALUES ('58', '30', '', '1', '0', '怎么添加到附近的小程序？需要收费么？', '', '/uploads/180802/1-1PP21P25c03.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '83', '0', '', '0', '', '怎么,添,加到,附,近的,小,程序,需要,收费,么,', '大家都知道现在微信小程序成了一款非常火的产品，又成了一个巨大的流量入口，有流量的地方就意味着交易。而附近的小程序基于位置信息向用户曝光自己的小程序，是一个非常好的', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533204026', '1533204175');
INSERT INTO `ey_archives` VALUES ('59', '30', '', '1', '0', '微信小程序wx.setStorage保存时间多久失效？', '', '/uploads/180802/1-1PP21P315916.png', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', 'admin', '68', '0', '', '0', '', '微信,小,程序,wx.setStorage,保存,时间,多久', '目前微信小程序wx.setStorage获得的缓存数据是持久保存的，不是永久，获得后就存在客户端，除非主动销毁或者从客户端删除该小程序。就是你在微信发现小程序列表里删除这个小程序。', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1533204047', '1533204191');
INSERT INTO `ey_archives` VALUES ('60', '1', '', '6', '0', '关于我们', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('61', '10', '', '6', '0', '服务项目', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1654563986');
INSERT INTO `ey_archives` VALUES ('62', '17', '', '6', '0', '选择我们的理由', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('63', '2', '', '6', '0', '如何选择', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('64', '3', '', '6', '0', '选择理由', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('65', '25', '', '6', '0', '网站建设', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1654002848');
INSERT INTO `ey_archives` VALUES ('66', '26', '', '6', '0', '移动端/APP', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('67', '27', '', '6', '0', '微信/小程序', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('68', '28', '', '6', '0', '技术支持', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('69', '18', '', '6', '0', '专注', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('70', '19', '', '6', '0', '原创', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('71', '20', '', '6', '0', '专业', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');
INSERT INTO `ey_archives` VALUES ('72', '21', '', '6', '0', '效率', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '', '0', '', '', '', '0', '0.00', '0', '0.00', '0', '0', '1', '0', '', '1', '100', 'cn', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '1653996665', '1653996665');

-- -----------------------------
-- Table structure for `ey_archives_flag`
-- -----------------------------
DROP TABLE IF EXISTS `ey_archives_flag`;
CREATE TABLE `ey_archives_flag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文档属性名称',
  `flag_attr` varchar(10) NOT NULL DEFAULT '' COMMENT '属性值',
  `flag_fieldname` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态， 1---显示， 0---隐藏',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag_attr` (`flag_attr`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='文档属性配置表';

-- -----------------------------
-- Records of `ey_archives_flag`
-- -----------------------------
INSERT INTO `ey_archives_flag` VALUES ('1', '头条', 'h', 'is_head', '1', '1', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('2', '推荐', 'c', 'is_recom', '1', '2', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('3', '特荐', 'a', 'is_special', '1', '3', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('4', '加粗', 'b', 'is_b', '1', '4', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('5', '图片', 'p', 'is_litpic', '1', '5', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('6', '跳转', 'j', 'is_jump', '1', '6', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('7', '幻灯', 's', 'is_slide', '0', '7', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('8', '滚动', 'r', 'is_roll', '0', '8', 'cn', '1606272350', '1606272350');
INSERT INTO `ey_archives_flag` VALUES ('9', '最热', 'd', 'is_diyattr', '0', '9', 'cn', '1606272350', '1606272350');

-- -----------------------------
-- Table structure for `ey_arcmulti`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arcmulti`;
CREATE TABLE `ey_arcmulti` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tagid` varchar(60) NOT NULL DEFAULT '' COMMENT '标签ID',
  `tagname` varchar(60) NOT NULL DEFAULT '' COMMENT '标签名',
  `innertext` text NOT NULL COMMENT '标签模板代码',
  `pagesize` int(10) NOT NULL DEFAULT '0' COMMENT '分页列表',
  `querysql` text NOT NULL COMMENT '完整SQL',
  `ordersql` varchar(200) DEFAULT '' COMMENT '排序SQL',
  `addfieldsSql` varchar(255) DEFAULT '' COMMENT '附加字段SQL',
  `addtableName` varchar(50) DEFAULT '' COMMENT '附加字段的数据表，不包含表前缀',
  `attstr` text COMMENT '属性字符串',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多页标记存储数据表';


-- -----------------------------
-- Table structure for `ey_arcrank`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arcrank`;
CREATE TABLE `ey_arcrank` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `rank` smallint(6) DEFAULT '0' COMMENT '权限值',
  `name` char(20) DEFAULT '' COMMENT '会员名称',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文档阅读权限表';

-- -----------------------------
-- Records of `ey_arcrank`
-- -----------------------------
INSERT INTO `ey_arcrank` VALUES ('1', '0', '开放浏览', 'cn', '0', '1552376880');
INSERT INTO `ey_arcrank` VALUES ('2', '-1', '待审核稿件', 'cn', '0', '1552376880');

-- -----------------------------
-- Table structure for `ey_arctype`
-- -----------------------------
DROP TABLE IF EXISTS `ey_arctype`;
CREATE TABLE `ey_arctype` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `channeltype` int(10) DEFAULT '0' COMMENT '栏目顶级模型ID',
  `current_channel` int(10) DEFAULT '0' COMMENT '栏目当前模型ID',
  `parent_id` int(10) DEFAULT '0' COMMENT '栏目上级ID',
  `topid` int(10) DEFAULT '0' COMMENT '顶级栏目ID',
  `typename` varchar(200) DEFAULT '' COMMENT '栏目名称',
  `dirname` varchar(200) DEFAULT '' COMMENT '目录英文名',
  `dirpath` varchar(200) DEFAULT '' COMMENT '目录存放HTML路径',
  `diy_dirpath` varchar(200) DEFAULT '' COMMENT '列表静态文件存放规则',
  `rulelist` varchar(200) DEFAULT '' COMMENT '列表静态文件存放规则',
  `ruleview` varchar(200) DEFAULT '' COMMENT '文档静态文件存放规则',
  `englist_name` varchar(200) DEFAULT '' COMMENT '栏目英文名',
  `grade` tinyint(1) DEFAULT '0' COMMENT '栏目等级',
  `typelink` varchar(200) DEFAULT '' COMMENT '栏目链接',
  `litpic` varchar(250) DEFAULT '' COMMENT '栏目图片',
  `templist` varchar(200) DEFAULT '' COMMENT '列表模板文件名',
  `tempview` varchar(200) DEFAULT '' COMMENT '文档模板文件名',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` text COMMENT 'seo描述',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏栏目：0=显示，1=隐藏',
  `is_part` tinyint(1) DEFAULT '0' COMMENT '栏目属性：0=内容栏目，1=外部链接',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `del_method` tinyint(1) DEFAULT '0' COMMENT '伪删除状态，1为主动删除，2为跟随上级栏目被动删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '启用 (1=正常，0=屏蔽)',
  `is_release` tinyint(1) DEFAULT '0' COMMENT '栏目是否应用于会员投稿发布，1是，0否',
  `weapp_code` varchar(50) DEFAULT '' COMMENT '插件栏目唯一标识',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `target` tinyint(1) DEFAULT '0' COMMENT '新窗口打开',
  `nofollow` tinyint(1) DEFAULT '0' COMMENT '防抓取',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`,`lang`) USING BTREE,
  KEY `parent_id` (`channeltype`,`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='文档栏目表';

-- -----------------------------
-- Records of `ey_arctype`
-- -----------------------------
INSERT INTO `ey_arctype` VALUES ('1', '6', '6', '0', '0', '关于我们', 'guanyuwomen', '/guanyuwomen', '/guanyuwomen', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_single.htm', '', '关于我们', '', '某某网络，专注互联网信息化服务', '1', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('4', '1', '1', '0', '0', '知名客户', 'zhimingkehu', '/zhimingkehu', '/zhimingkehu', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_article.htm', 'view_article.htm', '知名客户', '', '虽然不都是500强，但我可以给您讲我们与任何一个伙伴的故事', '9', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('5', '1', '1', '0', '0', '案例作品', 'anlizuopin', '/anlizuopin', '/anlizuopin', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', 'OUR CASE', '0', '', '', 'lists_article_image.htm', 'view_article_image.htm', '', '', '用技术与专注，将作品通过艺术和技术的结合，打造精品案例。', '2', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564563', '0', '0');
INSERT INTO `ey_arctype` VALUES ('10', '6', '6', '0', '0', '服务项目', 'fuwuxiangmu', '/fuwuxiangmu', '/fuwuxiangmu', '{栏目目录}/index.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_single_service.htm', '', '', '', '用我们的专业和诚信赢得您的信赖，从PC到移动互联网均有您想要的服务！', '3', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654563986', '0', '0');
INSERT INTO `ey_arctype` VALUES ('11', '1', '1', '0', '0', '新闻中心', 'xinwenzhongxin', '/xinwenzhongxin', '/xinwenzhongxin', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_article.htm', 'view_article.htm', '新闻中心', '', '记录团队成长点滴以及对技术、理念的探索，同时我们乐于分享！', '4', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564358', '0', '0');
INSERT INTO `ey_arctype` VALUES ('15', '1', '1', '0', '0', '知识在线', 'zhishi', '/zhishi', '/zhishi', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '5', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('17', '6', '6', '0', '0', '选择我们的理由', 'liyou', '/liyou', '/liyou', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_single.htm', '', '', '', '', '6', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('33', '1', '8', '0', '0', '留言内容', 'liuyannarong', '/liuyannarong', '/liuyannarong', '{栏目目录}/index.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_guestbook.htm', '', '', '', '', '10', '1', '0', '1', '0', '0', '1', '0', '', 'cn', '1654564006', '1654564027', '0', '0');
INSERT INTO `ey_arctype` VALUES ('29', '1', '1', '0', '0', '对于结果，您所熟悉的他们这样说', 'jieguo', '/jieguo', '/jieguo', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '0', '', '', 'lists_article.htm', 'view_article.htm', '', '', '微构网络感恩众多知名伙伴对微构网络的信赖与认可', '7', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('2', '6', '6', '1', '1', '如何选择', 'ruhexuanze', '/guanyuwomen/ruhexuanze', '/guanyuwomen/ruhexuanze', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single.htm', '', '如何选择', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('3', '6', '6', '1', '1', '选择理由', 'xuanzeliyou', '/guanyuwomen/xuanzeliyou', '/guanyuwomen/xuanzeliyou', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single.htm', '', '选择理由', '', '', '1', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('6', '1', '1', '5', '5', '网站建设', 'wangzhanjianshe', '/anlizuopin/wangzhanjianshe', '/anlizuopin/wangzhanjianshe', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article_image.htm', 'view_article_image.htm', '', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564563', '0', '0');
INSERT INTO `ey_arctype` VALUES ('7', '1', '1', '5', '5', '营销传播', 'yingxiaochuanbo', '/anlizuopin/yingxiaochuanbo', '/anlizuopin/yingxiaochuanbo', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article_image.htm', 'view_article_image.htm', '', '', '', '1', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564563', '0', '0');
INSERT INTO `ey_arctype` VALUES ('8', '1', '1', '5', '5', '形象策略', 'xingxiangcelue', '/anlizuopin/xingxiangcelue', '/anlizuopin/xingxiangcelue', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article_image.htm', 'view_article_image.htm', '', '', '', '2', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564563', '0', '0');
INSERT INTO `ey_arctype` VALUES ('9', '1', '1', '5', '5', '影像大片', 'yingxiangdapian', '/anlizuopin/yingxiangdapian', '/anlizuopin/yingxiangdapian', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article_image.htm', 'view_article_image.htm', '', '', '', '3', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564563', '0', '0');
INSERT INTO `ey_arctype` VALUES ('25', '6', '6', '10', '10', '网站建设', 'wzjs', '/fuwuxiangmu/wzjs', '/fuwuxiangmu/wangzhanjianshe571', '{栏目目录}/index.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single_wangzhan.htm', '', '', '', '企业网站、购物商城、行业门户、社区论坛、政府/事业单位等网站定制开发！', '0', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654563986', '0', '0');
INSERT INTO `ey_arctype` VALUES ('26', '6', '6', '10', '10', '移动端/APP', 'yidongduanapp', '/fuwuxiangmu/yidongduanapp', '/fuwuxiangmu/yidongduanapp', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single_app.htm', '', '', '', '手机网站、原生APP、API开发、H5单页等移动终端产品定制开发！', '1', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654563986', '0', '0');
INSERT INTO `ey_arctype` VALUES ('27', '6', '6', '10', '10', '微信/小程序', 'weixin', '/fuwuxiangmu/weixin', '/fuwuxiangmu/weixin', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single_weixin.htm', '', '', '', '基于微信/小程序模板消息、微信支付等开放组件及接口开发各类微信场景应用！', '2', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654563986', '0', '0');
INSERT INTO `ey_arctype` VALUES ('28', '6', '6', '10', '10', '技术支持', 'jishuzhichi', '/fuwuxiangmu/jishuzhichi', '/fuwuxiangmu/jishuzhichi', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single_jishu.htm', '', '', '', '技术支援、安全防护、模板定制、插件定制、技术方案等技术支持服务', '3', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654563986', '0', '0');
INSERT INTO `ey_arctype` VALUES ('12', '1', '1', '11', '11', '公司新闻', 'gongsixinwen', '/xinwenzhongxin/gongsixinwen', '/xinwenzhongxin/gongsixinwen', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '公司新闻', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564358', '0', '0');
INSERT INTO `ey_arctype` VALUES ('13', '1', '1', '11', '11', '行业动态', 'xingyedongtai', '/xinwenzhongxin/xingyedongtai', '/xinwenzhongxin/xingyedongtai', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '行业动态', '', '', '1', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564358', '0', '0');
INSERT INTO `ey_arctype` VALUES ('14', '1', '1', '11', '11', '技术学堂', 'jishuxuetang', '/xinwenzhongxin/jishuxuetang', '/xinwenzhongxin/jishuxuetang', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '技术学堂', '', '', '2', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654564358', '0', '0');
INSERT INTO `ey_arctype` VALUES ('30', '1', '1', '15', '15', '实用知识', 'shiyongzhishi', '/zhishi/shiyongzhishi', '/zhishi/shiyongzhishi', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '0', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('31', '1', '1', '15', '15', '常见问题', 'changjianwenti', '/zhishi/changjianwenti', '/zhishi/changjianwenti', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '1', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('32', '1', '1', '15', '15', '解决方案', 'jiejuefangan', '/zhishi/jiejuefangan', '/zhishi/jiejuefangan', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_article.htm', 'view_article.htm', '', '', '', '2', '0', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('18', '6', '6', '17', '17', '专注', 'zhuanzhu', '/liyou/zhuanzhu', '/liyou/zhuanzhu', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single.htm', '', '', '', '团队始于2012年，专注互联网信息化服务超过6年时间', '0', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('19', '6', '6', '17', '17', '原创', 'yuanchuang', '/liyou/yuanchuang', '/liyou/yuanchuang', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single.htm', '', '', '', '拥有自主软件著作版权，坚持项目定制开发。', '1', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('20', '6', '6', '17', '17', '专业', 'zhuanye', '/liyou/zhuanye', '/liyou/zhuanye', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single.htm', '', '', '', '团队成员平均从业经验超过8年，都是互联网&quot;老司机&quot;', '3', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');
INSERT INTO `ey_arctype` VALUES ('21', '6', '6', '17', '17', '效率', 'xiaolv', '/liyou/xiaolv', '/liyou/xiaolv', '{栏目目录}/list_{tid}_{page}.html', '{栏目目录}/{aid}.html', '', '1', '', '', 'lists_single.htm', '', '', '', '高效服务过包括湖南红网、国防科大在内的数百个合作伙伴。', '4', '1', '0', '1', '0', '0', '1', '1', '', 'cn', '1653996665', '1654004104', '0', '0');

-- -----------------------------
-- Table structure for `ey_article_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_article_content`;
CREATE TABLE `ey_article_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';

-- -----------------------------
-- Records of `ey_article_content`
-- -----------------------------
INSERT INTO `ey_article_content` VALUES ('2', '2', '什么是网站？\r\n&lt;p&gt;\r\n	　　网站就是在互联网上一块固定的面向全世界发布消息的地方。它由域名（也就是网站地址）和网站空间构成。衡量一个网站的性能通常从网站空间大小、网站位置、网站连接速度、网站软件配置、网站提供服务等几方面考虑。如果将一个网站类比为一栋房屋或许更容易理解一些。&lt;br /&gt;\r\n	当您的企业上了互联网，您就可以进入这一世界最大的市场当中了，不过这时您充其量只是一个看客罢了；而当您的企业建立了自己的网站，您就在这一市场当中有了自己的摊位，可以宣传自己的企业、展示自己的产品了。&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　建立网站可为企业带来什么&amp;ldquo;花最少的钱，做最多的事&amp;rdquo;，是网络的最基本的特征。&lt;br /&gt;\r\n	1．在网上发布企业信息，宣传企业形象。你可以花相当于广交会二分之一，三分之一，甚至更少的钱，在网上向全世界上亿客户365天每分每秒介绍你的企业。&lt;br /&gt;\r\n	2．在网上进行资料查询，寻找客户等活动。你可能花了几万元在广交会找不到一家满意的客户，却可能在网上仅花了几元电话费就找到了一家甚至多家有实力的对口客户。&lt;br /&gt;\r\n	3．用电子邮件，FAXSAV，互联网传真等手段与客户进行商务联络。一份需要花费几十元甚至上百元的传真，用电子邮件，仅需几秒钟就可以迅速准确地发送到您客户之中。另外，彩色图片，声音等信息，也可以发送。这是传真机所无法做到的。FAXSAV所省传真费大约80%。互联网传真也可以省约50%的费用。现在，还可以打网上语音电话、可视电话，费用也是每分钟3分钱。&lt;br /&gt;\r\n	4．在网上发展电子商务。目前，在网络的发源地美国，人们已经开始在网上购物，买书，在网上进行连锁店的进货安排等。在成都，已有了网上销售汽车。&lt;br /&gt;\r\n	历史已经反复证明，最先抓住机遇的人，收获最大。有人称，上网是本世纪末给企业提供的最后一次机遇。机不可失。早上网，多收益！&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　通常建网站的方式有三种：&lt;br /&gt;\r\n	一、是完全自己建，这要求公司有专业技术人员和专门的设备，同时公司网络业务量很大。这种方式投资极大，适合像Yahoo、IBM等国际大公司。&lt;br /&gt;\r\n	二、是自己租主机和线路来建立网站，这种方式投资比较大，也需要专业技术人员。&lt;br /&gt;\r\n	三、是采用虚拟主机技术建立网站。这种方式建立的网站与上面两种方式建立的网站没有本质区别，而投资很小，因此很受企业欢迎。在美国90%以上的企业采用虚拟主机的方式建立网站，在我国像中化总公司、青岛海尔、青岛啤酒、江西富源集团、江西赣南制药厂等这样的大企业的网站也是采用这种方式建立的。&lt;/p&gt;\r\n&lt;p&gt;\r\n	　　建立的网站是否超前？&lt;br /&gt;\r\n	我国现在的网络用户是2亿。且每年正飞速发展。抛开前景不说，就是在现在，上网的人们也是一个不小的市场。最近的统计数字表明，网民是由中青年、中高收入、受过良好教育的人组成。这些人现在是社会的中坚，未来一、二十年仍将是社会的中坚。这个市场能放弃吗？这就像北京广告价位最高的是长安街两侧，其次就是人少、商场少的机场路。这是为什么？因为商家认为路过这里的人素质高，有潜力。 退一步说，当网络普及了，别人把网络资源瓜分殆尽之时再建立自己的网站是不是太迟了。 况且，在欧美发达国家网络已经非常普及。网络是面对全世界上亿的客户，我们提供的是中英文互换的服务。你的市场已经拓宽到世界上网络覆盖的每一个角落。你上网越早，来自国内其他同行的竞争就越小。一言以蔽之：&amp;ldquo;早日上网，抢占市场。&amp;rdquo;&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('3', '3', '针对大多客户提出的流量上不去，访问量很低的情况，最优工作室在此分享5种方法提高网站流量：&lt;br /&gt;\r\n第一，网站的推广策略不佳；流量上不去，如果不是因为其他的原因，比如本文列到的上面几点，那应当是因为网站在推广的时候，采用了不当的推广策略;网站推广是门科学，更是一门艺术，需要站长朋友有着吃苦耐劳的学习精神和勇于创新，实践的勇气，努力探索找出适合自己网站推广的策略。适当的借鉴别人的办法是应当的，但是全盘照抄是不可取的。&lt;br /&gt;\r\n第二，网站的更新和维护；很多站长朋友刚开始做网站的时候，热情十足，宣传和推广也是效果巨好。可是，一旦放松下来，流量和pr就可以回落，究其原因十有八九是没有做好网站的更新和维护。&lt;br /&gt;\r\n第三，网站是否独特，是否标新立异;个人站要做好，做强，做大；就必须创新，否则是很难和已经在这个行业里立足脚跟的网站比拼的。&lt;br /&gt;\r\n第四，网站内容是否丰富，是否原创占大的比例；一个网站之所以受到网民的欢迎，是因为他的内容吸引人;有好的内容，加上好的宣传，那么这样的网站是肯定受欢迎的。她不仅收网民的欢迎，也是受百度和谷歌欢迎的。&lt;br /&gt;\r\n第五，网站网页的质量如何？如果你的网站制作的非常的粗糙，毫无疑问，访问量肯定好不到哪去，中国的网民可是非常挑剔的，特别是网页的打开速度，更为关键，希望各位站长要重视这一点。&lt;br /&gt;\r\n第六，网站内容或者业务的拓展；我们可以看看百度和谷歌这样的大网站，他们还不断的再拓展业务，更何况我们这些小站;当我们的网站做到一定时间，发现流量始终没有太多的变化，这样我们应当考虑是否要拓展业务，这样既可以带来流量的增加也可以带来丰厚的广告费。&lt;br /&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('4', '4', '前一阵Google被迫以百万元巨资赎回未及时注册的Google.cn和Google.com.cn，我们也经常可以看到国内某知名企业域名被抢注的消息。国内企业的域名保护意识相对簿弱，造成这种现象的频繁发生。&lt;br /&gt;\r\n　　现在，我们结合国外企业的一些做法，来简单地谈谈如何构筑企业域名保护系统：&lt;br /&gt;\r\n　　1、相关的、容易引起歧义的名称，及可能引起争议的域名不妨都注册一下，毕竟花极小的代价，可以防止别人钻空子。比如海尔不妨将haier、myhaier、haiergroup等都保护性注册一下。沃尔玛甚至注册了200多个由粗俗名称构成的域名，担心那些域名容易让人联想成是玷污其形象的名称。&lt;br /&gt;\r\n　　2、将.com、.net、.com.cn、.cn、.org、.cc、.us、.tw等可注册的域名和地方域名不妨都保护性注册一下，以防将来引发不必要的争端。&lt;br /&gt;\r\n　　3、对新开发的产品也要提前预注册，以防不测，对放旗下的子品牌更是如此。比如娃哈哈在wahaha.com被人抢注的教训下，居然后来的子品牌&amp;ldquo;乳娃娃&amp;rdquo;ruwawa.com又被人抢注，这种现象的发生实在太让人遗憾了。&lt;br /&gt;\r\n　　4、对已有的产品名称也不妨都保护性注册一下。&lt;br /&gt;\r\n　　5、最重要的一点，要把域名保护形成可执行的企业制度，落实到人，这样才能真正避免域名被抢注的悲剧。值得借鉴的例子是联想花巨资建设失败的FM365.com，后来竟然因为域名到期没续费而被人抢注，实在是让人哭笑不得。所以形成企业制度并将之落实到人是非常必要的。&lt;br /&gt;\r\n　　作为互联网的唯一性资源，新起点提醒各企业，要好好保护属于自己的互联网品牌标识，以免造成不必要的损失。&lt;br /&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('5', '5', '&amp;nbsp;微信营销不仅仅只是空穴来风。微信在二零一四年就已站在移动端的顶峰，现如今更是主宰了整个移动端。据资料显示截至二零一五年的一季度末就有高达进九百万的企业使用微信公众号，其中微信给各个企业带来的效益更是不可估算的，作为成都网络公司第一品牌的今网科技认为如今微信以是生活中不可缺少的一部分，更是企业营销不可缺少网络推广方式，赶快加入微信营销主战场！&lt;br /&gt;\r\n&lt;img src=&quot;file:///C:/DOCUME~1/ADMINI~1/LOCALS~1/Temp/TempPic/)_0T478]I(4DX]6M2FEN%7DTS.tmp&quot; /&gt;&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;微信：信息量高、流量大&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;年轻人一定知道这个：微信关注某个订阅号或是服务号之后时隔几天就会自动推送一篇文章到微信上，而且这样的文章又蛮有意思的，大家也喜欢，从此大家就不由自主的开始多多关注类似的订阅号或是服务号。这就是微信营销的一种，让你喜欢上微信订阅号或是服务号，而这就是正要说的。&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;：各企业入住微信后，都需要注册企业公众平台账号，从而可以每天推送一篇文章到粉丝的微信上，一篇好的软文可以高达10万+流量，想想，这其中的不存在销益吗？就没有潜在客户吗？这其中肯定有！通过微信朋友圈的转发分享，信息的一个传达，可以让更多的人知道你的品牌，能让增长企业粉丝，更多的人关注你，同时扩大了企业的知名度，这样的微信营销模式，谁的企业不需要？&lt;br /&gt;\r\n&lt;img src=&quot;file:///C:/DOCUME~1/ADMINI~1/LOCALS~1/Temp/TempPic/8AT3Z@%7B)J8~B%7B8[0ZM99RIN.tmp&quot; /&gt;&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;微信：企业注意事项&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;任何一个企业都要把自己的品牌定位准确，即使你已经在做微信推广，这同时要记住这一点不可只求粉丝数量就盲目加粉，这样会造成很多死粉，也就是没有价值的粉丝！例如：企业是高端品牌，你就没有必要去加一些根本不关注高端的群体，为什么这样做呢？一个从不关注高端产品的人，即使成为了企业产品的粉丝，也没有任何的用处！企业要注意的事项还有很多这上面就没有一一道来了。&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;终归：企业入住微信营销平台会带来三大好处，一、多条销路，二、可以瞬间扩大知名度，三、微信引领移动端，在这里所有有关微信营销的问题，欢迎咨询成都网络公司今网科技，我们都为您一一解答。', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('6', '6', '&lt;div&gt;\r\n	在网络推广中网站优化是必不可少的，而网站优化包括两大部分 第一部份：站内，另外一部份是站外。成都网络公司第一品牌今网科技的小编现在将站外优化的几点实际经验告诉大家。网站优化站外有那些方式和技巧&lt;br /&gt;\r\n	&lt;img alt=&quot;成都网站优化&quot; src=&quot;/uploads/allimg/180410/1-1P410135TQ15.jpg&quot; title=&quot;成都网站优化&quot; /&gt;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	Seo优化方法之：站外篇&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	软文&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;文章的长多最好在500字左右、标题要贴切内容、网站新闻动态需要频繁的更新，现在教你怎么写文章：比如你的网站是做网站建设开发定制的，那你就不能在咨询页面上写出&amp;ldquo;马云成中国首富了，或者小米投靠京东啦&amp;rdquo;等等类似这种的，这完全是驴头不对马嘴嘛，要站在客户的角度上去想，如果你是客户你想要什么？这才是最有价值的！&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	换链接&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;一个成功的网站上必须要有的就是链接，并且是要高质量的链接，这不仅仅可以带动的你排名同时还能带动的你权重，要知道权重对于一个网站来说是多么的重要！要想知道交换的链接有没有价值，我相信seoer们都该知道如何查询，站长工具里面就可以直接查询，注意：链接最好是换相同行业的，因为这样才有价值，而且尽可能的换比自己权重高的链接。&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	外链&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 可以的话就到各个论坛上发发文章，发些与网站相关的内容，&amp;ldquo;在SEO的世界里内容永远为王&amp;rdquo;，但是要避免加超链接，有些人为了排名尽快上升到处都放超链接，今网科技主笔小编提醒您，千万别这样做，这会毁了你的网站，这样的结果总是上去的匆匆，下来的也匆匆啊&amp;hellip;最好的是能让链接自然而然的生成这其中你可以加些相关的关键词，但是软文也要原创，不可直接在自己网站上复制在粘贴到别的论坛上。&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 把这几项做好了，同时也会使网站的排名比其他的网站稳定，那些忽高忽低的网站就是做了许多非自然的手段，才导致高低不定，踏踏实实做优化、认认真真写文章这才是最靠谱的事情。这样你的网站排名定会自然而然的上升，当然服务器网络的稳定性也是影响排名的关键要素。请大家注意！&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('7', '7', '很多客户不明白定制网站与模版网站有什么区别，成都做网站的公司就为你分析如下：模版建站有几种叫法：智能建站、自助建站、模版建站、智能CMS系统【模块建站】、速成网站等。定制网站是根据客户的需求进行页面布局设计以及功能程序开发，称之为设计型网站。&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　1、开发流程不同&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　定制网站正规化流程是：客户提出需求-首页设计方案-程序完善-功能测试-调试-验收-交接。模版建站的流程是：客户选中模版-开通使用。模版建站相比设计开发型的网站省去了不少步骤，这也是为什么模版建站要便宜的原因，总体说来模版建站只适合希望有个网址宣传下就行，不考虑客户体验和网络营销的客户使用。&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　2、开发时间不同&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　定制网站相比模版建站制作周期要长，需要专业的网页设计美工和程序员，而且客户提出任何功能都能去开发，模版建站或者自助建站就不可以，由于价格较便宜，属于挑选模版速成网站。&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　3、开发网站优缺：&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　a.优点：程序开发较自由，能够充分发挥网站开发人员的能力，使建成后的网站更具个性化，安全性、稳定性更好，同时，也使网站具有更强的扩展性。网站便于优化、推广。&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　b.缺点：由于采用手工开发，人力成本相对较高，比其他建站方式需要花费更多的资源。&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　4、模版建站优缺点：&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　a.优点：建站速度快，成就低，被众多提供企业网站建设服务的网络公司采用。&lt;br /&gt;\r\n&lt;br /&gt;\r\n　　b.缺点：所建网站缺乏个性且功能简单。', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('8', '8', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('9', '9', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('10', '10', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('11', '11', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('12', '12', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('13', '13', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('14', '14', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('15', '15', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('16', '41', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('17', '17', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('18', '18', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('19', '19', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('20', '20', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('21', '21', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('22', '22', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('23', '23', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('24', '42', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('25', '25', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P410160554555.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('26', '26', '&lt;p&gt;\r\n	PRD文档很见产品经理的基本功。好的PRD文档开发人员阅读起来如沐清风，手脚麻利，干活利索。延期？不存在的！&lt;/p&gt;\r\n&lt;p&gt;\r\n	一份考虑不够周全的PRD文档，让开发人员二丈摸不到头脑，在需求评审会上，悄然酝酿着撕逼大战。或者是，产品经理善于挖坑，需求评审会上居然过了，在实际开发过程中才发现问题，严重时候可能需要返工，浪费人力物力财力。&lt;/p&gt;\r\n&lt;p&gt;\r\n	细节考虑不清楚，测试同学也无法发现潜在的问题，可能导致产品缺陷。&lt;/p&gt;\r\n&lt;p&gt;\r\n	不靠谱！&lt;/p&gt;\r\n&lt;p&gt;\r\n	为了不翻车，在写完PRD的时候，对于每个用例，都应该仔细去考虑下面的细节内容。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('27', '27', '&lt;p&gt;\r\n	4月9日，一飞智控（天津）科技有限公司（简称一飞）宣布完成近亿元&amp;ldquo;A＋&amp;rdquo;轮融资，本次融资由中航信托控股有限公司领投。&lt;/p&gt;\r\n&lt;p&gt;\r\n	此前，一飞已得到国内数家知名资本的投资看好，此次得到中航资本战略融资，不仅标志着一飞正式晋升至国家队行列，也是国家层面首次参与、投资无人机领域的大事件，行业将被重新定义洗牌。&lt;/p&gt;\r\n&lt;p&gt;\r\n	一飞核心团队自2004年起在中科院进行核心技术的积累，在国内率先提出为无人机造&amp;ldquo;大脑&amp;rdquo;的概念。在成就了多个国内商用无人机的首次应用后，于2015年在天津开发区正式挂牌成立。&lt;/p&gt;\r\n&lt;p&gt;\r\n	成立不到3年，中航工业就主动站台做背书，一飞背后的商业逻辑是什？搭上超光速顺风车后，企业又将下一战场选择何方？&lt;/p&gt;\r\n&lt;p&gt;\r\n	消费级存量市场一片红海，马太效应明显&lt;/p&gt;\r\n&lt;p&gt;\r\n	按照应用领域，无人机可分为军用、商用和民用消费级三类。大疆的最先爆发，拉开了消费级市场厮杀的序幕。&lt;/p&gt;\r\n&lt;p&gt;\r\n	有两件&amp;ldquo;小&amp;rdquo;事能够管中窥豹：一是多家TMT巨头企业开始涉足无人机业务，比如高通、Intel、百度、小米、腾讯等企业都在近年投资或自身成立无人机研发中心；二是互联网精英、行业体制内团队离职创业，比如前联想高管陈文晖创办了飞马，前中科院出身的80后博导齐俊桐也在2015年正式跳出体制，成立一飞。&lt;/p&gt;\r\n&lt;p&gt;\r\n	下海创业者纷纷，但需要他们警惕的是，存量市场才是决定企业当下生存空间的重要指向标。随着消费级市场出现巨头垄断，创业企业首先要解决事关生死的头等大事&amp;mdash;&amp;mdash;融资。&lt;/p&gt;\r\n&lt;p&gt;\r\n	据前瞻产业研究院发布的最新统计，2017年1-8月，我国无人机行业融资企业共有16家共计17次，累计获得融资约5.2亿元，其中有8家公司并非第一次获得融资。&lt;/p&gt;\r\n&lt;p&gt;\r\n	换句话说，初创团队已经不再被资本方青睐，&amp;ldquo;一个好听的故事＋一个炫酷的PPT＋一个背景不错的团队&amp;rdquo;就能融到大把钱的时代已经过去了。&lt;/p&gt;\r\n&lt;p&gt;\r\n	事实上，不仅初创企业很难融到资，一些老牌企业也未能摆脱缺钱的黑洞。2016年的最后一个月，两家知名企业接连爆出百余人规模的裁员，让业界一片哗然。&lt;/p&gt;\r\n&lt;p&gt;\r\n	从2015年至今，资本力量对无人机创业项目全面收紧钱袋，消费级无人机已迎来资本和市场双重寒冬的压力。&lt;/p&gt;\r\n&lt;p&gt;\r\n	投资及行业专家普遍认为，继消费级市场被过度消费后，挤掉泡沫的市场增速已逐渐放慢，将长期呈现马太效应。&lt;/p&gt;\r\n&lt;p&gt;\r\n	商业级增量市场持续加速，催生行业独角兽&lt;/p&gt;\r\n&lt;p&gt;\r\n	3月14日，中国民航局飞标司副司长朱涛在北京召开的新闻发布会上披露，无人机正从传统的航空领域向社会各领域延伸，正从娱乐飞行设备逐渐转化为一种涉及各行业的新形态生产工具。&lt;/p&gt;\r\n&lt;p&gt;\r\n	从玩具，到工具，虽然一字之差，但市场前景几乎&amp;ldquo;一半海水，一半火焰&amp;rdquo;。与消费级市场不同，商业级产业链非常长。从企业分工角度来看，里面包括飞控系统、整机供应商、电调开发、大数据方案开发商等；从应用领域来说，又囊括农业植保、电力巡检、物流配送等，很多细分的领域市场前景就超过百亿元。&lt;/p&gt;\r\n&lt;p&gt;\r\n	以农业市场为例，全国植保无人机装机量达到近10000架，但我国农用飞机拥有量仅占世界农用飞机总数的0.13%左右；农业航空作业面积占耕地面积的1.70%，市场规模达到千亿元级别。&lt;/p&gt;\r\n&lt;p&gt;\r\n	一飞创始人齐俊桐坦言，虽然植保行业看上去很美，但无人机市场还有明显的木桶效应，&amp;ldquo;最短的一个木板决定了行业的整体水平。&amp;rdquo;&lt;/p&gt;\r\n&lt;p&gt;\r\n	以电池续航为例，电动多旋翼无人机一般只有十五分钟左右的飞行时间，如果用在植保上，还要携带重量不小的药剂和电池，实际飞到十分钟已经算是合格水平。&lt;/p&gt;\r\n&lt;p&gt;\r\n	地形的自动探测与匹配，障碍物的自动检测与分类，喷洒路径的实时重规划，厘米级精度的定位与控制，种种技术壁垒，导致了行业内众多企业只能聚集在产业链下游，依靠购买零件、攒机器夹缝生存，入局和出局现象几乎每天都在上演。只有为数不多能够研发、生产飞控系统、电调等核心硬件、处于产业链上游的企业才有发展壮大的可能。&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;ldquo;不差钱&amp;rdquo;的一飞显然处于后者。从2004年就开始，一飞核心团队便在国内开始研发无人机，并被机器人领域世界权威期刊《Journal of Field Robotics》评为&amp;ldquo;中国唯一、全球十大最有影响力的飞行机器人研发及应用团队&amp;rdquo;。2015年，一飞正式挂牌成立，齐俊桐选择将飞控大脑作为切入点。在植保领域站稳脚跟后，企业开始在商业无人机上下游链条全力布局。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('28', '28', '&lt;p&gt;\r\n	日前，有这样一则传言：IDG资本和轻松筹高管，与水滴筹公司进行了多次接触，力促两家企业合并，合并后新公司的比例为水滴筹公司占比65%，轻松筹占比35%。&amp;rdquo;轻松筹和水滴筹公司商谈合并的消息早前也传出过，在去年12月的合并传言中，合并比例为轻松筹3, 水滴筹公司2。&lt;/p&gt;\r\n&lt;p&gt;\r\n	传言究竟是真是假，眼下还不能确定，但是从以下四大层面来分析，刘旷认为两家合并的可能性较大。&lt;/p&gt;\r\n&lt;p&gt;\r\n	一、红利期接近尾声，互联网行业迎来并购潮&lt;/p&gt;\r\n&lt;p&gt;\r\n	互联网行业的商业逻辑与传统行业有所不同，互联网行业出售的是服务居多，不论用户规模如何，产品的成本大都相差无几。没有线下实体成本的平台模式，获取市场份额的边际成本趋近于0，因此发展到最后，行业格局往往会走向一超多强，或是排名最靠前的两家企业通过合并获得垄断地位。一如亚马逊创始人贝佐斯所言&amp;ldquo;互联网不存在中型企业，要么做大，要么出局&amp;rdquo;。&lt;/p&gt;\r\n&lt;p&gt;\r\n	一个领域中排名最靠前的两家企业，要么其中一家在竞争中被淘汰，要么走向合并，几乎成为了互联网行业的发展定律。回顾互联网行业的发展历程，不乏这样的例子，比如滴滴和快的、58与赶集、美团与大众点评、携程与去哪儿，都经历过从竞争到牵手合并的过程。&lt;/p&gt;\r\n&lt;p&gt;\r\n	水滴筹公司和轻松筹也是行业内排名最靠前的两家标杆企业，业务总体上比较相似，都是筹款+互助+保险，水滴筹公司旗下有水滴互助、水滴筹、水滴保三项业务，轻松筹旗下有轻松筹、轻松互助、轻松e保、轻松公益四项业务。水滴筹公司和轻松筹的品牌声量相当，在用户群体中有非常高的关注度，其中水滴筹公司的注册用户截止4月2日已达到3.6亿人，轻松筹的注册用户截止今年3月8日也达到了2.01亿人，稳居行业第一、第二。&lt;/p&gt;\r\n&lt;p&gt;\r\n	再加上移动互联网红利期已经接近尾声，各个行业已经从烧钱竞争走向用户精细化运营，互联网行业迎来并购潮，合并是大势所趋。从这点来看，水滴筹公司和轻松筹会随大趋势走向合并可能性较大。&lt;/p&gt;\r\n&lt;p&gt;\r\n	二、两强相争不如强强联合&lt;/p&gt;\r\n&lt;p&gt;\r\n	水滴筹公司和轻松筹虽然业务比较相近，但是市场打法完全不同，合并之后能够实现优势互补。&lt;/p&gt;\r\n&lt;p&gt;\r\n	轻松筹成立早，涉及的筹款类型比较多样化，除了大病筹款之外，还有梦想筹款、尝鲜预售等筹款项目，筹款服务多样化让轻松筹在早期收割大量用户。但是，轻松筹平台的审核能力略有不足，这个弱点成为了轻松筹增长的掣肘，从百度指数来看，轻松筹已经进入增长瓶颈期，且下降趋势较为明显。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('29', '29', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P410162452636.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('30', '30', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P410162633955.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('31', '31', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P410162J4V6.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('32', '32', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P410162Z44Y.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('33', '33', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P41016301X91.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('34', '34', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P41016330Ja.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('35', '35', '&lt;div style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; src=&quot;/uploads/allimg/180410/1-1P410163423b8.jpg&quot; /&gt;&lt;/div&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('41', '43', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('42', '44', '', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('43', '45', '&lt;p&gt;\r\n	微信小程序现在一般每周都会推送一次更新通知，上次主要是推送了微信小程序支持插件等相关信息，就在昨天晚上又推送了新的更新通知（微信团队真敬业，一般都是晚上进行推送的）。&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;ldquo;&amp;nbsp;为满足小程序开发者变现需求，内测广告组件能力。为帮助公众号运营者快速接入小程序，新增快速创建小程序接口。另外新增小程序插件管理接口，支持授权第三方平台添加插件。同时更新小程序基础能力。&amp;rdquo;&lt;/p&gt;\r\n&lt;p&gt;\r\n	1、内测小程序广告组件&lt;/p&gt;\r\n&lt;p&gt;\r\n	为满足小程序开发者变现需求，小程序广告组件已启动内测。&lt;/p&gt;\r\n&lt;p&gt;\r\n	开发者开通流量主模块后，可通过创建广告单元，使用广告组件将广告卡片灵活配置在小程序页面内。&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	同时，微信广告已面向广告主开放品牌活动推广、电商推广、公众号推广及应用推广等类目能力，支持小程序广告资源位投放，详见《微信广告新能力》。&lt;/p&gt;\r\n&lt;p&gt;\r\n	2、新增快速创建小程序接口&lt;/p&gt;\r\n&lt;p&gt;\r\n	为帮助已有公众号用户快速接入小程序服务，公众平台新增&amp;ldquo;快速注册小程序&amp;rdquo;权限集。公众号可授权第三方平台快速注册并认证小程序。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('44', '46', '&lt;p&gt;\r\n	还记得几年前百度推出的&amp;ldquo;轻应用&amp;rdquo;么？应该不是记得与否，而是可能很多人都没听过这玩意。&lt;/p&gt;\r\n&lt;p&gt;\r\n	不知道是不是眼红腾讯还是什么鬼，突然发现百度竟然跟着腾讯、阿里的节奏推出了百度小程序了，而且还是瞧瞧的，并没有被媒体大肆报道。在手机百度中的&amp;ldquo;常用服务&amp;rdquo;中可以看到优信二手车，打开的样子简直跟微信小程序一模一样。就是下面这样子的：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	就连关于小程序页面都跟微信小程序一模一样：&lt;/p&gt;\r\n&lt;p&gt;\r\n	瞧瞧几乎都跟微信一模一样，比如关于、返回到小程序首页、安卓手机可以添加到桌面快捷方式（大家都知道ios不让放桌面）等等都一样，好像就是多了一个夜间模式。当然分享也不是分享给百度，那这个分享没啥用，所以只能分享给微信了，谁叫微信那么牛。而且百度都为小程序开放了一个专门的小程序平台网站。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('45', '47', '&lt;p&gt;\r\n	近日，微信公众平台发布通知称微信小程序与小游戏将逐步取消通过wx.getUserInfo方式获取用户信息，提醒开发者逐步使用其他方式代替wx.getUserInfo方式。&lt;/p&gt;\r\n&lt;p&gt;\r\n	微信官方通知称：小程序与小游戏获取用户信息接口调整 为优化用户体验，使用 wx.getUserInfo 接口直接弹出授权框的开发方式将逐步不再支持。从2018年4月30日开始，小程序与小游戏的体验版、开发版调用 wx.getUserInfo 接口，将无法弹出授权询问框，默认调用失败。正式版暂不受影响。开发者可使用以下方式获取或展示用户信息。官方原文如下：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	也就是说，以后在开发过程中应该逐步用open-type和open-data的方式替换之前常用的wx.getUserInfo方式，虽然现在只是4月30号后开发版和体验版将不支持wx.getUserInfo方式，但正式版暂时不受影响。但不排除以后正式版也将完全不支持通过wx.getUserInfo方式获取用户信息。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('46', '48', '&lt;p&gt;\r\n	就在今天晚上早些时候，微构网络了解到，腾讯通过多个公众号（微信公众平台和微信派等）推送消息：&amp;ldquo; 为提升阅读效率，我们对订阅号消息列表改版，用户可直接浏览订阅号消息。&amp;rdquo;&lt;/p&gt;\r\n&lt;p&gt;\r\n	新版可直接浏览订阅号消息改版后，订阅号的群发消息将以&amp;ldquo;标题+封面图&amp;rdquo;的形式直接展示在消息列表里，用户进入订阅号消息列表后可直接阅读。同时优化了对视频、图片、语音等消息的展示。订阅号消息列表的内容按群发送达时间先后展示，最新发布的内容在最上方。&lt;/p&gt;\r\n&lt;p&gt;\r\n	是什么意思呢？&lt;/p&gt;\r\n&lt;p&gt;\r\n	简单地可以理解为：把进入微信订阅号文章的顺序换了一下，从微信会话窗口进入文章可以减少一步。以前是微信会话窗口-&amp;gt;订阅号-&amp;gt;某个订阅号-&amp;gt;该订阅号会话窗口-&amp;gt;点击文章进入文章详情；现在是微信会话窗口-&amp;gt;订阅号消息-&amp;gt;所有订阅号的最新文章列表(可以切换到订阅号列表)-&amp;gt;点击文章进入文章详情。&lt;/p&gt;\r\n&lt;p&gt;\r\n	分享官方回答的两个问题&lt;/p&gt;\r\n&lt;p&gt;\r\n	Q：订阅号改版是否会弱化订阅号的展示？&lt;/p&gt;\r\n&lt;p&gt;\r\n	A：改版依然保留了对订阅号的突出，订阅号的头像和名称展示明显。点击公众号头像可快速进入公众号资料页。&lt;/p&gt;\r\n&lt;p&gt;\r\n	Q：此前置顶的订阅号在列表中如何显示？&lt;/p&gt;\r\n&lt;p&gt;\r\n	A：用户此前置顶的订阅号名称前会出现&amp;ldquo;星标&amp;rdquo;，在微信聊天主界面的订阅号列表盒子和进入后的订阅号消息列表里都有星标，提醒用户阅读。也可在订阅号消息列表右上角进入订阅号会话列表，找到置顶订阅号。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('47', '49', '&lt;p&gt;\r\n	今天中午大概1-2点的时候，刚好在午睡养精蓄锐，不然下午怎么写bug改bug呢？突然微信语音和手机同时响了，结果一看都是同一家单位的客户，只是是两个不同的人而已。&lt;/p&gt;\r\n&lt;p&gt;\r\n	这时候心里开始万马奔腾了，&amp;ldquo;卧槽，有点爱心好不好，大中午的&amp;rdquo;。&lt;/p&gt;\r\n&lt;p&gt;\r\n	对方都表示，小程序部分数据返回不了，帮忙看看是什么问题。其实做开发的都清楚，最怕听到的就是&amp;ldquo;部分数据有问题&amp;rdquo;、&amp;rdquo;在通过xx在通过yy在通过zz后出现了这个问题&amp;rdquo;、&amp;ldquo;今天突然出现了某个问题，但现在不再出现了&amp;rdquo;。&lt;/p&gt;\r\n&lt;p&gt;\r\n	因为这样的问题一般意味着bug藏得深，需要杀死一堆脑细胞了。&lt;/p&gt;\r\n&lt;p&gt;\r\n	然后马上去看其中的一个API接口，结果一看发现连网络都不通&amp;hellip;.然后再访问其他的API接口都是网络不通&amp;hellip;.;再访问用户没有反馈到的其他接口，还是网络不通。结果直接访问服务器，还是不通。&lt;/p&gt;\r\n&lt;p&gt;\r\n	对，没错，服务器挂了。&lt;/p&gt;\r\n&lt;p&gt;\r\n	当然，挂了也要帮用户解决不是。虽然我们的代码早就通过对方技术团队验收并交付给他们自己维护了，但不是&amp;ldquo;客户是上帝&amp;rdquo;么。还是跟用户进行了沟通，协助他解决这个问题。因为这个项目访问量不大，而且基本可以断定软件不存在致命（足矣让服务器宕机）的bug；后面用户说内部先沟通后在跟我联系。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('48', '50', '&lt;p&gt;\r\n	昨天有一条关于微信支付0元购的消息在开发圈里炸开了锅，所谓0元购并不是用户抽奖，而是恶意攻击者利用漏洞实现0元支付。&lt;/p&gt;\r\n&lt;p&gt;\r\n	正常的支付基本流程是这样的：用户发起支付-&amp;gt;调起微信支付-&amp;gt;支付成功-&amp;gt;微信支付服务器发送成功通知给应用（比如某个商城）服务端-&amp;gt;应用服务端解析微信支付发送的通知-&amp;gt;解析后的信息进行必要对比确认后更新订单为已付款状态。&lt;/p&gt;\r\n&lt;p&gt;\r\n	然而该漏洞，就是恶意利用解析过程，可以造成读任何文件、内网探测、命令执行等问题。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('49', '51', '&lt;p&gt;\r\n	在前段时间湖南红网有一个需求，大概就是调用用户被置顶的帖子数排名的top10，测试的基本效果就是首先查询到top10的uid集合（由于功能模块原来的的数据结构中仅在置顶表中查询得到uid的信息），最终效果如下（由于测试网站只有少部分数据，因此下面只显示5个）：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	得到uid之后还需要得到用户相关的几个数据，包括头像、个人主页的url以及用户名；头像在discuz中可以使用avatar方法获取，个人主页的url通过uid直接拼装即可。而用户名则需要另外获取，可能有人会说直接使用DB类的fetch_first方法查询common_member表即可查到用户对应的用户名。&lt;/p&gt;\r\n&lt;p&gt;\r\n	但一开始就有个前提，那就是网站的用户分表了，比如一般分表后会产生两个用户表，分别是common_member和common_member_archive，所以光查询前者肯定是不行的。其实阅读discuz的本身的源代码就可以发现，在很多地方他的做法都是通过判断用户是否在common_member中，如果存在则直接调用该值，否则需查询common_member_archive。如下是discuz本身的某个模块的源代码：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	这样显然是可行的，但是通过C类发现并没有通过uid来查username的，只有通过username来查uid的，以上就是这样的。如果要用这种思路则需要这么来写：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	然而，实际上有更加简便的方式的&lt;/p&gt;\r\n&lt;p&gt;\r\n	那就是通过uc来做处理，因为要的是用户名等uc中也保存了的信息，而且对于普通网站用户而言uc中保存的用户信息和dz中保存的用户信息是一致的。比如在discuz源代码中可以看到如下这样的方法：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	只要熟悉discuz开发的朋友都知道，看命名就可以顾名思义的，该方法是用于调取uc中的用户信息的。我们可以在uc_client/client.php找到该方法：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	然后可以在uc_client/control/user.php中找到该方法所调用的方法：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	也就是我们只需要在一开始的时候第二个参数传入1即可，也就是在该方法中会调用get_user_by_uid()，其中的参数其实是uid。然后我们可以在uc_client/model/user.php找到该方法：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	这样就已经调取uc中的用户信息，需要注意的是，在上一步的onget_user方法中返回的时候并没有返回用户的所有信息，也不是返回带有uid、username、email等这些键值的数组。所以如果返回的是$user,如果需要取username的值，不能够写成$user[&amp;#39;username&amp;#39;]的。&lt;/p&gt;\r\n&lt;p&gt;\r\n	至此，采用调用uc用户的方式通过discuz的用户uid获取的了用户的用户名。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('50', '52', '&lt;p&gt;\r\n	随着互联网技术及基础设施的发展，很多以前想想都觉得奢侈的场景应用现在都变得非常日常了，比如视频直播、短视频、VR全景等等。就VR全景而已，最近今年在国内的应用非常火，比如VR看房、VR游览景区等等。&lt;/p&gt;\r\n&lt;p&gt;\r\n	在国内，很多VR全景产品的处理引擎都是基于外国友人写的krpano这套软件，然后在应用层面使用不同的开发技能与工具加上扩展的功能模块。就目前我们参与过的VR项目，底层核心部分的处理引擎都是采用krpano。基于krpano的全景项目我们开发了数个，目前就遇到了一个极端情况下的问题。&lt;/p&gt;\r\n&lt;p&gt;\r\n	x01问题&lt;/p&gt;\r\n&lt;p&gt;\r\n	用户反馈：一次性上传20张20MB左右图片；上传采用阿里云OSS，是没有问题的，然而上传成功后在等待切图的时候，一直卡住不动了。而上传较少的图片（哪怕图片超过100MB）或者较多图片每张图片很小都可以上传并切图完成。&lt;/p&gt;\r\n&lt;p&gt;\r\n	x02分析&lt;/p&gt;\r\n&lt;p&gt;\r\n	到了切图流程说明图片肯定是上传成功的，因为采用第三方存储的架构项目，全景图片处理的基本流程是：上传原图到阿里云OSS&amp;ndash;&amp;gt;服务端从阿里云OSS通过CDN获取图片（也可以直接一步到位传到服务器本地）&amp;ndash;&amp;gt;krpano切图并在服务器临时存储或永久存储&amp;ndash;&amp;gt;切图生成的图片上传到OSS，并在并在数据库记录各个图片路径&amp;ndash;&amp;gt;通过krpano算法组合图片生成我们看到的全景。&lt;/p&gt;\r\n&lt;p&gt;\r\n	于是，图片上传接口肯定是正常的，不管图片是直接上传到服务器本地还是先上传到阿里OSS这类第三方存储云平台；而且切图接口返回也是正常的，也就是说明切图流程已经开始执行了；再者开发的时候由于考虑这种场景下上传及切图处理时间肯定不会太短，所以做了一个心跳处理，而且该接口也是正常的。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('51', '53', '&lt;p&gt;\r\n	1、您说的这些费用主要是网站设计开发的费用，开发费用根据需求而定，比如我们这里普通企业网站PC版3000为参考，PC+手机版（数据同步，同步更新，支持微信访问）是5000为参考，具体根据具体需求。当然市场上也有一些成品网站，就是那种现成的而无需设计开发的，可能几百到几千不等。&lt;/p&gt;\r\n&lt;p&gt;\r\n	2、网站上传是不需要费用的（当然仅仅是只企业网站的新网站，因为没多少数据量）。&lt;/p&gt;\r\n&lt;p&gt;\r\n	3、域名注册本身费用为几十元一年，域名是每年需要付费的。&lt;/p&gt;\r\n&lt;p&gt;\r\n	4、实际上还有一部分费用是网站服务器空间的费用，这个费用一般企业网站不需要多少，几百足矣。&lt;/p&gt;\r\n&lt;p&gt;\r\n	5、如果是我们这里开发网站，第一条所说的开发费用中包括了设计开发费用+一年服务器空间使用+一年域名费用+一年维护费用（仅技术维护），第二年起只需要支付400元每年的服务器空间费用，就可以包括一年服务器空间使用+一年域名费用+一年维护费用（仅技术维护）。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('52', '54', '&lt;p&gt;\r\n	最近收到一些咨询，问自己的项目（小型项目，用户量并不大）已经有ios和安卓客户端，还有网页版，是否有必要再开发小程序。&lt;/p&gt;\r\n&lt;p&gt;\r\n	我们的建议是，是有必要开发小程序的，理由如下：&lt;/p&gt;\r\n&lt;blockquote&gt;\r\n	&lt;p&gt;\r\n		第一，成本低。由于开发app的时候已经写了后台服务端，也提供了完善的API接口，因此后台服务端的成本极低，只需要稍微调整下即可把APP用到的API复用到小程序中。&lt;/p&gt;\r\n	&lt;p&gt;\r\n		第二，易推广。小程序基于上十亿用户量，有丰富的流量入口。而一些小众的APP推广起来是很困难的，用户的安装门槛也非常高；而小程序的推广门槛就低很多，毕竟无需安装。我们甚至可以让小程序为app引流，比如一些高级功能我们在小程序中做一些限制并引导用户安装APP。&lt;/p&gt;\r\n&lt;/blockquote&gt;\r\n&lt;p&gt;\r\n	但是不得不说的是，并不是小程序开发就一定花的时间非常短。比如我看到某些开发公司就声称，开发同样功能模块的APP和小程序，APP需要3个月，而小程序连一个月都不需要。实际上这是偷换概念，就是为了贬低app抬高小程序，以达到自己的目的。实际上他们是这样计算的：&lt;/p&gt;\r\n&lt;blockquote&gt;\r\n	&lt;p&gt;\r\n		APP开发时间=需求沟通+UE设计+UI设计+后台服务端开发（含API）+APP客户端（安卓和IOS）+其他变更或测试时间。&lt;/p&gt;\r\n	&lt;p&gt;\r\n		小程序开发时间=小程序前端开发时间。&lt;/p&gt;\r\n&lt;/blockquote&gt;\r\n&lt;p&gt;\r\n	这样的计算显然对APP来讲不公平，因为小程序开发也需要需求沟通+UE设计+UI设计+后台服务端开发（含API）+其他变更或测试时间的。&lt;/p&gt;\r\n&lt;p&gt;\r\n	总的来说，在需求的功能模块一样的情况下，app开发的工作量确实需要比小程序多一些，毕竟app需要开发安卓和ios两个端，而小程序只需写一次前端代码就可以应用到各个平台，但没很多宣传的差距那么大。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('53', '55', '&lt;p&gt;\r\n	现在https是趋势，很多地方需要强制使用https，比如微信小程序的网络请求、web-view等都需要目标url是支持https访问的。那么怎么才能让网站支持https访问呢？你只需要做两个事情就够了：&lt;/p&gt;\r\n&lt;p&gt;\r\n	首先，你得为网站所属域名申请一个ssl证书，这个证书有一些是免费的，满足基本的需求，一般一年有效期，到期后可以续签或者更好其他签发机构。另外也有收费的，从几千到几万甚至更多一年。如果你只是让网站支持https，那么使用免费的证书即可。&lt;/p&gt;\r\n&lt;p&gt;\r\n	其次，部署ssl证书到网站，这个需要一些专业技能，需要熟悉服务器的配置，当然市场上也存在一些傻瓜化部署方案，但也需要一定的知识储备。&lt;/p&gt;\r\n&lt;p&gt;\r\n	此外，有一些运营一定时间的网站，由于当初设计的时候没考虑https的支持，还可能需要对网站的一些路径进行改造，否则可能出现https访问时出现不安全的提示；而且往往这部分工作量是最多的。&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	我们微构网络具备完善的https支持方案，如果我们开发的项目都可以很容易提供https支持，同时快速部署ssl证书。在项目开发过程中，这部分我们是不需要另外收费的。如果你已有项目需要支持https而且你自己无从下手，不妨试试我们的技术支持服务。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('54', '56', '&lt;p&gt;\r\n	今天早上有正在做的小程序项目的客户在讨论组中问到，问是微信小程序是名称是否要有商标。我可以肯定的告诉大家是不需要的。&lt;/p&gt;\r\n&lt;p&gt;\r\n	同时需要注意的是：第一，小程序的名称是没有一定要求商标，而且绝大多数小程序名称也并没有商标，但是不能侵犯别人的商标，这样就有假冒伪劣的嫌疑，特别是腾讯自己的。第二，小程序发布后，非个人类帐号可通过认证方式改名。第三，微信小程序的规则是会变化的，这只是现在的规则，不过怎么变也基本不太可能强制要求名称跟商标保持一致。&lt;/p&gt;\r\n&lt;p&gt;\r\n	所以微信小程序是可以改名的，但需要通过重新去认证小程序的方式去修改，而且不支持个人小程序帐号的。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('55', '57', '&lt;p&gt;\r\n	不少客户在要做网站的时候都有一个问题就是：我的域名早就有了，在万网买的，而我现在想用腾讯云的服务器，这样可以备案么？这样的问题除了面对面跟客户沟通的时候出现，最近在网站统计数据中，发现不少网友也在搜索类似的问题。所以这里就有必要跟大家分享一下这个问题。&lt;/p&gt;\r\n&lt;p&gt;\r\n	答案就是：域名和服务器空间不在一个服务商是可以备案的，备案流程跟普通的备案流程是一致的。在目前我国网站备案制度中并没有要求域名和服务器的服务商是同一家。&lt;/p&gt;\r\n&lt;p&gt;\r\n	比如万网在好几年前就被阿里云收购，显然跟腾讯云没什么关系，但万网的域名加上腾讯云的服务器是可以备案的，而且是通过腾讯云进行备案 ，接入服务商就是腾讯云。&lt;/p&gt;\r\n&lt;p&gt;\r\n	在此，我们建议大家的网站进行网站备案；因为现在很多场合都需要是通过网站备案的，比如做百度的推广、做微信小程序等等。&lt;/p&gt;\r\n&lt;p&gt;\r\n	而我们微构网络的项目是可以免费协助客户进行网站备案哦，客户只需要配合提供所规定的资料即可完成网站备案。所需要的时间大概是7-15天的样子。当然，有相关的问题，可以通过我们的网站联系我们哦。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('56', '58', '&lt;p&gt;\r\n	大家都知道现在微信小程序成了一款非常火的产品，又成了一个巨大的流量入口，有流量的地方就意味着交易。而附近的小程序基于位置信息向用户曝光自己的小程序，是一个非常好的流量来源渠道。那么怎么才能把自己的微信小程序添加到附近的小程序中呢，也就是在你的微信菜单-发现-小程序-附近的小程序中出现你自己的小程序。&lt;/p&gt;\r\n&lt;p&gt;\r\n	其实并不复杂，就是当我们的小程序上架后，可以在小程序的管理后台找到&amp;ldquo;附近的小程序&amp;rdquo; ，如下图：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	点击这个菜单后我们可以进入到附近小程序的设置页面：&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;\r\n	然后我们点击添加按钮即可：&lt;/p&gt;\r\n&lt;p&gt;\r\n	按照要求，结合自己的实际填写相关信息后，点击提交即可提交到腾讯微信小程序官方进行审核。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');
INSERT INTO `ey_article_content` VALUES ('57', '59', '&lt;p&gt;\r\n	目前微信小程序wx.setStorage获得的缓存数据是&amp;ldquo;持久&amp;rdquo;保存的，不是&amp;ldquo;永久&amp;rdquo;，获得后就存在客户端，除非主动销毁或者从客户端删除该小程序。就是你在&amp;ldquo;微信&amp;mdash;发现&amp;mdash;小程序&amp;rdquo;列表里删除这个小程序。&lt;/p&gt;\r\n&lt;p&gt;\r\n	目前这个API并不能够直接设置缓存时间，但能够通过一定处理达到超时处理，详情可以参考微构网络团队此前发布的技术文章《微信小程序wx.setStorage数据缓存实现缓存过期时间》。&lt;/p&gt;\r\n', '', '1653996666', '1653996666');

-- -----------------------------
-- Table structure for `ey_article_order`
-- -----------------------------
DROP TABLE IF EXISTS `ey_article_order`;
CREATE TABLE `ey_article_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章订单ID',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '媒体订单编号',
  `users_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0未付款，1已付款',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单应付总金额',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_name` varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `wechat_pay_type` varchar(20) NOT NULL DEFAULT '' COMMENT '微信支付时，标记使用的支付类型（扫码支付，微信内部，微信H5页面）',
  `pay_details` text COMMENT '支付时返回的数据，以serialize序列化后存入，用于后续查询。',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频文档ID',
  `product_name` varchar(100) DEFAULT '' COMMENT '视频文档名称',
  `product_litpic` varchar(500) DEFAULT '' COMMENT '视频文档封面图片',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_code` (`order_code`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章订单表';


-- -----------------------------
-- Table structure for `ey_article_pay`
-- -----------------------------
DROP TABLE IF EXISTS `ey_article_pay`;
CREATE TABLE `ey_article_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT '0',
  `part_free` tinyint(1) DEFAULT '0' COMMENT '是否试看 0-否 1-是',
  `size` float(10,2) DEFAULT '1.00' COMMENT 'KB',
  `free_content` longtext COMMENT '试看内容',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章付费预览表';


-- -----------------------------
-- Table structure for `ey_ask`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ask`;
CREATE TABLE `ey_ask` (
  `ask_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题栏目ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `ask_title` varchar(200) NOT NULL DEFAULT '' COMMENT '问题标题',
  `is_recom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '问题是否推荐',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '问题状态：0未解决，1已解决，2已关闭',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览点击量',
  `replies` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题回复量',
  `content` text NOT NULL COMMENT '问题内容',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '问题网址',
  `users_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '问题发布时IP地址',
  `is_review` tinyint(1) NOT NULL DEFAULT '1' COMMENT '问题是否审核，1是，0否',
  `follow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关注问题则表示有回复时发送邮件通知到问题发布人',
  `solve_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '解决时间(这个问题存在最佳答案则表示已解决)',
  `bestanswer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最佳答案',
  `sort_order` int(10) NOT NULL DEFAULT '100' COMMENT '排序号',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '悬赏金额',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '1-删除',
  PRIMARY KEY (`ask_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题表';


-- -----------------------------
-- Table structure for `ey_ask_answer`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ask_answer`;
CREATE TABLE `ey_ask_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ask_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题ID',
  `is_bestanswer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否最佳答案，0否，1是',
  `is_review` tinyint(1) NOT NULL DEFAULT '1' COMMENT '问题是否审核，1是，0否',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题栏目ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `click_like` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞量',
  `users_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '用户IP地址',
  `content` text NOT NULL COMMENT '内容',
  `ifcheck` tinyint(1) NOT NULL DEFAULT '1',
  `answer_pid` int(10) NOT NULL DEFAULT '0' COMMENT '子答案的父答案',
  `at_users_id` int(10) NOT NULL DEFAULT '0' COMMENT '被@的用户ID',
  `at_answer_id` int(10) NOT NULL DEFAULT '0' COMMENT '@答案ID',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-删除',
  PRIMARY KEY (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='答案表';


-- -----------------------------
-- Table structure for `ey_ask_answer_like`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ask_answer_like`;
CREATE TABLE `ey_ask_answer_like` (
  `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ask_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题ID',
  `answer_id` int(10) NOT NULL DEFAULT '0' COMMENT '答案ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `click_like` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞',
  `like_source` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '点赞来源，1=点赞提问(ask_id)，2=点赞评论(answer_id)，3=点赞回复(answer_id)，默认值为2，兼容以前的那些评论数据',
  `users_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '用户IP地址',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`like_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='答案点赞表';


-- -----------------------------
-- Table structure for `ey_ask_score_level`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ask_score_level`;
CREATE TABLE `ey_ask_score_level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT '',
  `min` mediumint(8) DEFAULT '0',
  `max` mediumint(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='积分等级表';

-- -----------------------------
-- Records of `ey_ask_score_level`
-- -----------------------------
INSERT INTO `ey_ask_score_level` VALUES ('1', '青铜', '0', '1000');
INSERT INTO `ey_ask_score_level` VALUES ('2', '白银', '1001', '5000');
INSERT INTO `ey_ask_score_level` VALUES ('3', '黄金', '5001', '20000');
INSERT INTO `ey_ask_score_level` VALUES ('4', '王者', '20001', '0');

-- -----------------------------
-- Table structure for `ey_ask_type`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ask_type`;
CREATE TABLE `ey_ask_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目自增',
  `type_name` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` text COMMENT 'seo描述',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '排序号',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='问题栏目分类表';

-- -----------------------------
-- Records of `ey_ask_type`
-- -----------------------------
INSERT INTO `ey_ask_type` VALUES ('1', '问题求助', '0', '', '', '', '100', '1565770890', '1611910466');
INSERT INTO `ey_ask_type` VALUES ('2', '功能建议', '0', '', '', '', '100', '1565770890', '1611910466');
INSERT INTO `ey_ask_type` VALUES ('3', 'BUG反馈', '1', '', '', '', '100', '1565771021', '1611910466');
INSERT INTO `ey_ask_type` VALUES ('4', '其他问题', '1', '', '', '', '100', '1565771021', '1611910466');
INSERT INTO `ey_ask_type` VALUES ('5', '业务咨询', '0', '', '', '', '100', '1611910466', '1611910466');

-- -----------------------------
-- Table structure for `ey_auth_role`
-- -----------------------------
DROP TABLE IF EXISTS `ey_auth_role`;
CREATE TABLE `ey_auth_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '角色名',
  `pid` int(10) DEFAULT '0' COMMENT '父角色ID',
  `remark` text COMMENT '备注信息',
  `grade` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '级别',
  `language` text COMMENT '多语言权限',
  `online_update` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '在线升级',
  `only_oneself` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '只看自己发布',
  `check_oneself` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '发布文档自动通过审核，1--是，0--否',
  `cud` varchar(255) DEFAULT '' COMMENT '增改删',
  `permission` text COMMENT '已允许的权限',
  `built_in` tinyint(1) DEFAULT '0' COMMENT '内置用户组，1表示内置',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=正常，0=屏蔽)',
  `admin_id` int(10) DEFAULT '0' COMMENT '操作管理员ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员角色表';

-- -----------------------------
-- Records of `ey_auth_role`
-- -----------------------------
INSERT INTO `ey_auth_role` VALUES ('1', '优化推广员', '0', '', '0', '', '0', '1', '1', 'a:3:{i:0;s:3:\"add\";i:1;s:4:\"edit\";i:2;s:3:\"del\";}', 'a:2:{s:5:\"rules\";a:8:{i:0;s:1:\"1\";i:1;s:1:\"3\";i:2;s:1:\"4\";i:3;s:1:\"8\";i:4;s:1:\"9\";i:5;s:2:\"10\";i:6;s:2:\"14\";i:7;i:2;}s:7:\"arctype\";a:29:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:2:\"33\";i:7;s:2:\"34\";i:8;s:2:\"35\";i:9;s:1:\"8\";i:10;s:2:\"32\";i:11;s:1:\"9\";i:12;s:2:\"30\";i:13;s:2:\"31\";i:14;s:2:\"11\";i:15;s:2:\"12\";i:16;s:2:\"13\";i:17;s:2:\"23\";i:18;s:2:\"20\";i:19;s:2:\"24\";i:20;s:2:\"25\";i:21;s:2:\"21\";i:22;s:2:\"26\";i:23;s:2:\"22\";i:24;s:2:\"27\";i:25;s:2:\"28\";i:26;s:2:\"29\";i:27;s:1:\"1\";i:28;s:2:\"33\";}}', '1', '100', '1', '0', '1541058693', '1541058693');
INSERT INTO `ey_auth_role` VALUES ('2', '内容管理员', '0', '', '0', '', '0', '1', '1', 'a:3:{i:0;s:3:\"add\";i:1;s:4:\"edit\";i:2;s:3:\"del\";}', 'a:2:{s:5:\"rules\";a:4:{i:0;s:1:\"1\";i:1;s:2:\"10\";i:2;s:2:\"14\";i:3;i:2;}s:7:\"arctype\";a:29:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:2:\"33\";i:7;s:2:\"34\";i:8;s:2:\"35\";i:9;s:1:\"8\";i:10;s:2:\"32\";i:11;s:1:\"9\";i:12;s:2:\"30\";i:13;s:2:\"31\";i:14;s:2:\"11\";i:15;s:2:\"12\";i:16;s:2:\"13\";i:17;s:2:\"23\";i:18;s:2:\"20\";i:19;s:2:\"24\";i:20;s:2:\"25\";i:21;s:2:\"21\";i:22;s:2:\"26\";i:23;s:2:\"22\";i:24;s:2:\"27\";i:25;s:2:\"28\";i:26;s:2:\"29\";i:27;s:1:\"1\";i:28;s:2:\"33\";}}', '1', '100', '1', '0', '1541059290', '1541059290');

-- -----------------------------
-- Table structure for `ey_channelfield`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channelfield`;
CREATE TABLE `ey_channelfield` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字段名称',
  `channel_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属文档模型id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '字段标题',
  `dtype` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` text NOT NULL COMMENT '字段定义',
  `maxlength` int(10) NOT NULL DEFAULT '0' COMMENT '最大长度，文本数据必须填写，大于255为text类型',
  `dfvalue` text NOT NULL COMMENT '默认值',
  `dfvalue_unit` varchar(50) NOT NULL DEFAULT '' COMMENT '数值单位',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `is_screening` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否应用于条件筛选',
  `is_release` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否应用于会员投稿发布',
  `ifeditable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在编辑页显示',
  `ifrequire` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `ifsystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '字段分类，1=系统(不可修改)，0=自定义',
  `ifmain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否主表字段',
  `ifcontrol` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，控制该条数据是否允许被控制，1为不允许控制，0为允许控制',
  `sort_order` int(5) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=470 DEFAULT CHARSET=utf8 COMMENT='自定义字段表';

-- -----------------------------
-- Records of `ey_channelfield`
-- -----------------------------
INSERT INTO `ey_channelfield` VALUES ('1', 'add_time', '0', '新增时间', 'datetime', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091575', '1533091575');
INSERT INTO `ey_channelfield` VALUES ('2', 'update_time', '0', '更新时间', 'datetime', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091601', '1533091601');
INSERT INTO `ey_channelfield` VALUES ('3', 'aid', '0', '文档ID', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091624', '1533091624');
INSERT INTO `ey_channelfield` VALUES ('4', 'typeid', '0', '当前栏目ID', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091930', '1533091930');
INSERT INTO `ey_channelfield` VALUES ('5', 'channel', '0', '模型ID', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092214', '1533092214');
INSERT INTO `ey_channelfield` VALUES ('6', 'is_b', '0', '是否加粗', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092246', '1533092246');
INSERT INTO `ey_channelfield` VALUES ('7', 'title', '0', '文档标题', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092381', '1533092381');
INSERT INTO `ey_channelfield` VALUES ('8', 'litpic', '0', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092398', '1533092398');
INSERT INTO `ey_channelfield` VALUES ('9', 'is_head', '0', '是否头条', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('10', 'is_special', '0', '是否特荐', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092439', '1533092439');
INSERT INTO `ey_channelfield` VALUES ('11', 'is_top', '0', '是否置顶', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092454', '1533092454');
INSERT INTO `ey_channelfield` VALUES ('12', 'is_recom', '0', '是否推荐', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092468', '1533092468');
INSERT INTO `ey_channelfield` VALUES ('13', 'is_jump', '0', '是否跳转', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092484', '1533092484');
INSERT INTO `ey_channelfield` VALUES ('14', 'author', '0', '作者', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092498', '1533092498');
INSERT INTO `ey_channelfield` VALUES ('15', 'click', '0', '浏览量', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092512', '1533092512');
INSERT INTO `ey_channelfield` VALUES ('16', 'arcrank', '0', '阅读权限', 'select', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092534', '1533092534');
INSERT INTO `ey_channelfield` VALUES ('17', 'jumplinks', '0', '跳转链接', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092553', '1533092553');
INSERT INTO `ey_channelfield` VALUES ('18', 'ismake', '0', '是否静态页面', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092698', '1533092698');
INSERT INTO `ey_channelfield` VALUES ('19', 'seo_title', '0', 'SEO标题', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092713', '1533092713');
INSERT INTO `ey_channelfield` VALUES ('20', 'seo_keywords', '0', 'SEO关键词', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092725', '1533092725');
INSERT INTO `ey_channelfield` VALUES ('21', 'seo_description', '0', 'SEO描述', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092739', '1533092739');
INSERT INTO `ey_channelfield` VALUES ('22', 'status', '0', '状态', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092753', '1533092753');
INSERT INTO `ey_channelfield` VALUES ('23', 'sort_order', '0', '排序号', 'int', 'int(11)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092766', '1533092766');
INSERT INTO `ey_channelfield` VALUES ('24', 'content', '2', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359739', '1533359739');
INSERT INTO `ey_channelfield` VALUES ('25', 'content', '3', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359588', '1533359588');
INSERT INTO `ey_channelfield` VALUES ('26', 'content', '4', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359752', '1533359752');
INSERT INTO `ey_channelfield` VALUES ('27', 'content', '6', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533464715', '1533464715');
INSERT INTO `ey_channelfield` VALUES ('29', 'content', '1', '内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533464713', '1533464713');
INSERT INTO `ey_channelfield` VALUES ('30', 'update_time', '-99', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('31', 'add_time', '-99', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('32', 'status', '-99', '启用 (1=正常，0=屏蔽)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('33', 'is_part', '-99', '栏目属性：0=内容栏目，1=外部链接', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('34', 'is_hidden', '-99', '是否隐藏栏目：0=显示，1=隐藏', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('35', 'sort_order', '-99', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('36', 'seo_description', '-99', 'seo描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('37', 'seo_keywords', '-99', 'seo关键字', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('38', 'seo_title', '-99', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('39', 'tempview', '-99', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('40', 'templist', '-99', '列表模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('41', 'litpic', '-99', '栏目图片', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('42', 'typelink', '-99', '栏目链接', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('43', 'grade', '-99', '栏目等级', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('44', 'englist_name', '-99', '栏目英文名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('45', 'dirpath', '-99', '目录存放HTML路径', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('46', 'dirname', '-99', '目录英文名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('47', 'typename', '-99', '栏目名称', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('48', 'parent_id', '-99', '栏目上级ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('49', 'current_channel', '-99', '栏目当前模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('50', 'channeltype', '-99', '栏目顶级模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('51', 'id', '-99', '栏目ID', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('52', 'del_method', '-99', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('53', 'is_del', '0', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('54', 'del_method', '0', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('55', 'admin_id', '0', '管理员ID', 'int', 'int(10)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('56', 'lang', '0', '语言标识', 'text', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('57', 'prom_type', '0', '产品类型：0普通产品，1虚拟产品', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('58', 'users_price', '0', '价格', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '0', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('59', 'prom_type', '2', '产品类型：0普通产品，1虚拟产品', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('60', 'users_price', '2', '价格', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '0', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('61', 'users_id', '0', '会员ID', 'int', 'int(11)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('62', 'arc_level_id', '0', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('63', 'arc_level_id', '4', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('64', 'weapp_code', '-99', '插件栏目唯一标识', 'text', 'varchar(200)', '200', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('65', 'is_release', '-99', '栏目是否应用于会员投稿发布，1是，0否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('66', 'old_price', '0', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('67', 'stock_count', '0', '商品库存量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('68', 'stock_show', '0', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('69', 'joinaid', '0', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('70', 'downcount', '0', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('71', 'downcount', '4', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('72', 'htmlfilename', '0', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('73', 'htmlfilename', '1', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('74', 'htmlfilename', '2', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('75', 'htmlfilename', '3', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('76', 'htmlfilename', '4', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('77', 'htmlfilename', '6', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('78', 'attrlist_id', '0', '参数列表ID', 'int', 'int(10) unsigned', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091930', '1533091930');
INSERT INTO `ey_channelfield` VALUES ('79', 'sales_num', '0', '销售量', 'int', 'int(10) unsigned', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533091930', '1533091930');
INSERT INTO `ey_channelfield` VALUES ('81', 'topid', '-99', '顶级栏目ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1557042574', '1557042574');
INSERT INTO `ey_channelfield` VALUES ('82', 'is_slide', '0', '是否幻灯', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('83', 'is_roll', '0', '是否幻灯', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('84', 'is_diyattr', '0', '是否自定义', 'switch', 'tinyint(1)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533092420', '1533092420');
INSERT INTO `ey_channelfield` VALUES ('85', 'update_time', '5', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('86', 'add_time', '5', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('87', 'htmlfilename', '5', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('88', 'downcount', '5', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('89', 'joinaid', '5', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('90', 'del_method', '5', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('91', 'is_del', '5', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('92', 'arc_level_id', '5', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('93', 'users_id', '5', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('94', 'admin_id', '5', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('95', 'lang', '5', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('96', 'sort_order', '5', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('97', 'status', '5', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('98', 'tempview', '5', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('99', 'prom_type', '5', '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('100', 'stock_show', '5', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('101', 'stock_count', '5', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('102', 'sales_num', '5', '销售量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('103', 'old_price', '5', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('104', 'users_free', '5', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('105', 'users_price', '5', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('106', 'attrlist_id', '5', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('107', 'seo_description', '5', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('108', 'seo_keywords', '5', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('109', 'seo_title', '5', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('110', 'ismake', '5', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('111', 'jumplinks', '5', '外链跳转', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('112', 'arcrank', '5', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('113', 'click', '5', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('114', 'author', '5', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('115', 'is_diyattr', '5', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('116', 'is_slide', '5', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('117', 'is_roll', '5', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('118', 'is_litpic', '5', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('119', 'is_jump', '5', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('120', 'is_recom', '5', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('121', 'is_top', '5', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('122', 'is_special', '5', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('123', 'is_head', '5', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('124', 'litpic', '5', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('125', 'title', '5', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('126', 'is_b', '5', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('127', 'channel', '5', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('128', 'typeid', '5', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('129', 'aid', '5', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('130', 'content', '5', '内容详情', 'htmltext', 'longtext', '0', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('131', 'courseware', '5', '课件地址', 'text', 'varchar(200)', '200', '', '', '', '0', '1', '0', '0', '1', '0', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('132', 'courseware_free', '5', '课件收费', 'select', 'enum(\'免费\',\'收费\')', '0', '免费,收费', '', '', '0', '1', '0', '0', '1', '0', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('133', 'total_duration', '5', '视频总时长', 'int', 'int(10)', '10', '0', '', '', '0', '1', '0', '0', '1', '0', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('134', 'total_video', '5', '视频数', 'int', 'int(10)', '10', '0', '', '', '0', '1', '0', '0', '1', '0', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('135', 'update_time', '7', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('136', 'add_time', '7', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('137', 'htmlfilename', '7', '自定义文件名', 'text', 'varchar(50)', '50', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('138', 'downcount', '7', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('139', 'joinaid', '7', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('140', 'del_method', '7', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('141', 'is_del', '7', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('142', 'arc_level_id', '7', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('143', 'users_id', '7', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('144', 'admin_id', '7', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('145', 'lang', '7', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('146', 'sort_order', '7', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('147', 'status', '7', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('148', 'tempview', '7', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('149', 'prom_type', '7', '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('150', 'stock_show', '7', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('151', 'stock_count', '7', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('152', 'sales_num', '7', '销售量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('153', 'old_price', '7', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('154', 'users_free', '7', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('155', 'users_price', '7', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('156', 'attrlist_id', '7', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('157', 'seo_description', '7', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('158', 'seo_keywords', '7', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('159', 'seo_title', '7', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('160', 'ismake', '7', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('161', 'jumplinks', '7', '外链跳转', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('162', 'arcrank', '7', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('163', 'click', '7', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('164', 'author', '7', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('165', 'is_diyattr', '7', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('166', 'is_slide', '7', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('167', 'is_roll', '7', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('168', 'is_litpic', '7', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('169', 'is_jump', '7', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('170', 'is_recom', '7', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('171', 'is_top', '7', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('172', 'is_special', '7', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('173', 'is_head', '7', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('174', 'litpic', '7', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('175', 'title', '7', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('176', 'is_b', '7', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('177', 'channel', '7', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('178', 'typeid', '7', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('179', 'aid', '7', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('180', 'content', '7', '内容详情', 'htmltext', 'longtext', '0', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('181', 'restric_type', '0', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1616293251', '1616293251');
INSERT INTO `ey_channelfield` VALUES ('182', 'diy_dirpath', '-99', '自定义HTML保存路径', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('183', 'rulelist', '-99', '列表静态文件存放规则', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('184', 'ruleview', '-99', '文档静态文件存放规则', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1533524780', '1533524780');
INSERT INTO `ey_channelfield` VALUES ('185', 'subtitle', '0', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1636338535', '1636338535');
INSERT INTO `ey_channelfield` VALUES ('186', 'origin', '0', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1636338535', '1636338535');
INSERT INTO `ey_channelfield` VALUES ('187', 'stypeid', '0', '副栏目', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1636338535', '1636338535');
INSERT INTO `ey_channelfield` VALUES ('188', 'update_time', '1', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('189', 'add_time', '1', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('190', 'area_id', '1', '所在区域', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('191', 'city_id', '1', '所在城市', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('192', 'province_id', '1', '省份', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('193', 'collection', '1', '收藏数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('194', 'appraise', '1', '评价数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('195', 'downcount', '1', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('196', 'joinaid', '1', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('197', 'del_method', '1', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('198', 'is_del', '1', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('199', 'restric_type', '1', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('200', 'arc_level_id', '1', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('201', 'users_id', '1', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('202', 'admin_id', '1', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('203', 'lang', '1', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('204', 'sort_order', '1', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('205', 'status', '1', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('206', 'tempview', '1', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('207', 'prom_type', '1', '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘)，3=虚拟(自定义文本)', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('208', 'stock_show', '1', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('209', 'stock_count', '1', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('210', 'sales_num', '1', '销售量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('211', 'old_price', '1', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('212', 'users_free', '1', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('213', 'users_price', '1', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('214', 'attrlist_id', '1', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('215', 'seo_description', '1', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('216', 'seo_keywords', '1', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('217', 'seo_title', '1', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('218', 'ismake', '1', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('219', 'jumplinks', '1', '外链跳转', 'text', 'varchar(255)', '255', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('220', 'arcrank', '1', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('221', 'click', '1', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('222', 'author', '1', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('223', 'origin', '1', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('224', 'is_diyattr', '1', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('225', 'is_slide', '1', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('226', 'is_roll', '1', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('227', 'is_litpic', '1', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('228', 'is_jump', '1', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('229', 'is_recom', '1', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('230', 'is_top', '1', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('231', 'is_special', '1', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('232', 'is_head', '1', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('233', 'litpic', '1', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('234', 'subtitle', '1', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('235', 'title', '1', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('236', 'is_b', '1', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('237', 'channel', '1', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('238', 'stypeid', '1', '副栏目ID集合', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('239', 'typeid', '1', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('240', 'aid', '1', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862075', '1641862075');
INSERT INTO `ey_channelfield` VALUES ('241', 'update_time', '2', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('242', 'add_time', '2', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('243', 'area_id', '2', '所在区域', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('244', 'city_id', '2', '所在城市', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('245', 'province_id', '2', '省份', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('246', 'collection', '2', '收藏数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('247', 'appraise', '2', '评价数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('248', 'downcount', '2', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('249', 'joinaid', '2', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('250', 'del_method', '2', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('251', 'is_del', '2', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('252', 'restric_type', '2', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('253', 'arc_level_id', '2', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('254', 'users_id', '2', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('255', 'admin_id', '2', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('256', 'lang', '2', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('257', 'sort_order', '2', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('258', 'status', '2', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('259', 'tempview', '2', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('260', 'stock_show', '2', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('261', 'stock_count', '2', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('262', 'sales_num', '2', '销售量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('263', 'old_price', '2', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('264', 'users_free', '2', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('265', 'attrlist_id', '2', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('266', 'seo_description', '2', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('267', 'seo_keywords', '2', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('268', 'seo_title', '2', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('269', 'ismake', '2', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('270', 'jumplinks', '2', '外链跳转', 'text', 'varchar(255)', '255', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('271', 'arcrank', '2', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('272', 'click', '2', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('273', 'author', '2', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('274', 'origin', '2', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('275', 'is_diyattr', '2', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('276', 'is_slide', '2', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('277', 'is_roll', '2', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('278', 'is_litpic', '2', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('279', 'is_jump', '2', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('280', 'is_recom', '2', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('281', 'is_top', '2', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('282', 'is_special', '2', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('283', 'is_head', '2', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('284', 'litpic', '2', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('285', 'subtitle', '2', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('286', 'title', '2', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('287', 'is_b', '2', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('288', 'channel', '2', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('289', 'stypeid', '2', '副栏目ID集合', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('290', 'typeid', '2', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('291', 'aid', '2', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862078', '1641862078');
INSERT INTO `ey_channelfield` VALUES ('292', 'update_time', '3', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('293', 'add_time', '3', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('294', 'area_id', '3', '所在区域', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('295', 'city_id', '3', '所在城市', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('296', 'province_id', '3', '省份', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('297', 'collection', '3', '收藏数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('298', 'appraise', '3', '评价数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('299', 'downcount', '3', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('300', 'joinaid', '3', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('301', 'del_method', '3', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('302', 'is_del', '3', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('303', 'restric_type', '3', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('304', 'arc_level_id', '3', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('305', 'users_id', '3', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('306', 'admin_id', '3', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('307', 'lang', '3', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('308', 'sort_order', '3', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('309', 'status', '3', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('310', 'tempview', '3', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('311', 'prom_type', '3', '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘)，3=虚拟(自定义文本)', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('312', 'stock_show', '3', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('313', 'stock_count', '3', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('314', 'sales_num', '3', '销售量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('315', 'old_price', '3', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('316', 'users_free', '3', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('317', 'users_price', '3', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('318', 'attrlist_id', '3', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('319', 'seo_description', '3', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('320', 'seo_keywords', '3', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('321', 'seo_title', '3', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('322', 'ismake', '3', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('323', 'jumplinks', '3', '外链跳转', 'text', 'varchar(255)', '255', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('324', 'arcrank', '3', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('325', 'click', '3', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('326', 'author', '3', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('327', 'origin', '3', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('328', 'is_diyattr', '3', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('329', 'is_slide', '3', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('330', 'is_roll', '3', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('331', 'is_litpic', '3', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('332', 'is_jump', '3', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('333', 'is_recom', '3', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('334', 'is_top', '3', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('335', 'is_special', '3', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('336', 'is_head', '3', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('337', 'litpic', '3', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('338', 'subtitle', '3', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('339', 'title', '3', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('340', 'is_b', '3', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('341', 'channel', '3', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('342', 'stypeid', '3', '副栏目ID集合', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('343', 'typeid', '3', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('344', 'aid', '3', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862080', '1641862080');
INSERT INTO `ey_channelfield` VALUES ('345', 'update_time', '4', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('346', 'add_time', '4', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('347', 'area_id', '4', '所在区域', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('348', 'city_id', '4', '所在城市', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('349', 'province_id', '4', '省份', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('350', 'collection', '4', '收藏数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('351', 'appraise', '4', '评价数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('352', 'joinaid', '4', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('353', 'del_method', '4', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('354', 'is_del', '4', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('355', 'restric_type', '4', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('356', 'users_id', '4', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('357', 'admin_id', '4', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('358', 'lang', '4', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('359', 'sort_order', '4', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('360', 'status', '4', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('361', 'tempview', '4', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('362', 'prom_type', '4', '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘)，3=虚拟(自定义文本)', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('363', 'stock_show', '4', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('364', 'stock_count', '4', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('365', 'sales_num', '4', '销售量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('366', 'old_price', '4', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('367', 'users_free', '4', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('368', 'users_price', '4', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('369', 'attrlist_id', '4', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('370', 'seo_description', '4', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('371', 'seo_keywords', '4', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('372', 'seo_title', '4', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('373', 'ismake', '4', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('374', 'jumplinks', '4', '外链跳转', 'text', 'varchar(255)', '255', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('375', 'arcrank', '4', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('376', 'click', '4', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('377', 'author', '4', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('378', 'origin', '4', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('379', 'is_diyattr', '4', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('380', 'is_slide', '4', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('381', 'is_roll', '4', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('382', 'is_litpic', '4', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('383', 'is_jump', '4', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('384', 'is_recom', '4', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('385', 'is_top', '4', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('386', 'is_special', '4', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('387', 'is_head', '4', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('388', 'litpic', '4', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('389', 'subtitle', '4', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('390', 'title', '4', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('391', 'is_b', '4', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('392', 'channel', '4', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('393', 'stypeid', '4', '副栏目ID集合', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('394', 'typeid', '4', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('395', 'aid', '4', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862083', '1641862083');
INSERT INTO `ey_channelfield` VALUES ('396', 'update_time', '6', '更新时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('397', 'add_time', '6', '新增时间', 'datetime', 'int(11)', '11', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('398', 'area_id', '6', '所在区域', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('399', 'city_id', '6', '所在城市', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('400', 'province_id', '6', '省份', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('401', 'collection', '6', '收藏数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('402', 'appraise', '6', '评价数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('403', 'downcount', '6', '下载次数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('404', 'joinaid', '6', '关联文档ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('405', 'del_method', '6', '伪删除状态，1为主动删除，2为跟随上级栏目被动删除', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('406', 'is_del', '6', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('407', 'restric_type', '6', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('408', 'arc_level_id', '6', '文档会员权限ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('409', 'users_id', '6', '会员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('410', 'admin_id', '6', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('411', 'lang', '6', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('412', 'sort_order', '6', '排序号', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('413', 'status', '6', '状态(0=屏蔽，1=正常)', 'switch', 'tinyint(1)', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('414', 'tempview', '6', '文档模板文件名', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('415', 'prom_type', '6', '产品类型：0=普通产品，1=虚拟(默认手动发货)，2=虚拟(网盘)，3=虚拟(自定义文本)', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('416', 'stock_show', '6', '商品库存在产品详情页是否显示，1为显示，0为不显示', 'switch', 'tinyint(1) unsigned', '1', '1', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('417', 'stock_count', '6', '商品库存量', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('418', 'sales_num', '6', '销售量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('419', 'old_price', '6', '产品旧价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('420', 'users_free', '6', '是否会员免费，默认0不免费，1为免费', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('421', 'users_price', '6', '会员价', 'decimal', 'decimal(10,2)', '10', '0.00', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('422', 'attrlist_id', '6', '参数列表ID', 'int', 'int(10) unsigned', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('423', 'seo_description', '6', 'SEO描述', 'multitext', 'text', '0', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('424', 'seo_keywords', '6', 'SEO关键词', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('425', 'seo_title', '6', 'SEO标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('426', 'ismake', '6', '是否静态页面（0=动态，1=静态）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('427', 'jumplinks', '6', '外链跳转', 'text', 'varchar(255)', '255', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('428', 'arcrank', '6', '阅读权限：0=开放浏览，-1=待审核稿件', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('429', 'click', '6', '浏览量', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('430', 'author', '6', '作者', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('431', 'origin', '6', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('432', 'is_diyattr', '6', '自定义（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('433', 'is_slide', '6', '幻灯（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('434', 'is_roll', '6', '滚动（0=否，1=是）', 'switch', 'tinyint(1) unsigned', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('435', 'is_litpic', '6', '图片（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('436', 'is_jump', '6', '跳转链接（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('437', 'is_recom', '6', '推荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('438', 'is_top', '6', '置顶（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('439', 'is_special', '6', '特荐（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('440', 'is_head', '6', '头条（0=否，1=是）', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('441', 'litpic', '6', '缩略图', 'img', 'varchar(250)', '250', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('442', 'subtitle', '6', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('443', 'title', '6', '标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('444', 'is_b', '6', '加粗', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('445', 'channel', '6', '模型ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('446', 'stypeid', '6', '副栏目ID集合', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('447', 'typeid', '6', '当前栏目', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('448', 'aid', '6', 'aid', 'int', 'int(10)', '10', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862087', '1641862087');
INSERT INTO `ey_channelfield` VALUES ('449', 'area_id', '7', '所在区域', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('450', 'city_id', '7', '所在城市', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('451', 'province_id', '7', '省份', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('452', 'collection', '7', '收藏数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('453', 'appraise', '7', '评价数', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('454', 'restric_type', '7', '限制模式，0=免费，1=付费，2=会员专享，3=会员付费', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('455', 'origin', '7', '来源', 'text', 'varchar(30)', '30', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('456', 'subtitle', '7', '副标题', 'text', 'varchar(200)', '200', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('457', 'stypeid', '7', '副栏目ID集合', 'text', 'varchar(90)', '90', '', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862089', '1641862089');
INSERT INTO `ey_channelfield` VALUES ('458', 'lang', '-99', '语言标识', 'text', 'varchar(50)', '50', 'cn', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862097', '1641862097');
INSERT INTO `ey_channelfield` VALUES ('459', 'is_del', '-99', '伪删除，1=是，0=否', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862097', '1641862097');
INSERT INTO `ey_channelfield` VALUES ('460', 'admin_id', '-99', '管理员ID', 'int', 'int(10)', '10', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1641862097', '1641862097');
INSERT INTO `ey_channelfield` VALUES ('461', 'target', '-99', '新窗口打开', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('462', 'nofollow', '-99', '防抓取', 'switch', 'tinyint(1)', '1', '0', '', '', '0', '0', '1', '0', '1', '1', '1', '100', '1', '1547890773', '1547890773');
INSERT INTO `ey_channelfield` VALUES ('463', 'content_ey_m', '1', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533464713', '1623047123');
INSERT INTO `ey_channelfield` VALUES ('464', 'content_ey_m', '2', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1645086030', '1645086039');
INSERT INTO `ey_channelfield` VALUES ('465', 'content_ey_m', '3', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359588', '1533359588');
INSERT INTO `ey_channelfield` VALUES ('466', 'content_ey_m', '4', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533359752', '1533359752');
INSERT INTO `ey_channelfield` VALUES ('467', 'content_ey_m', '5', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1591957363', '1591957363');
INSERT INTO `ey_channelfield` VALUES ('468', 'content_ey_m', '6', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1533464715', '1533464715');
INSERT INTO `ey_channelfield` VALUES ('469', 'content_ey_m', '7', '手机端内容详情', 'htmltext', 'longtext', '250', '', '', '', '0', '1', '1', '0', '1', '0', '0', '100', '1', '1602320145', '1602320145');

-- -----------------------------
-- Table structure for `ey_channelfield_bind`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channelfield_bind`;
CREATE TABLE `ey_channelfield_bind` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目ID',
  `field_id` int(10) DEFAULT '0' COMMENT '自定义字段ID',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='栏目与自定义字段绑定表';


-- -----------------------------
-- Table structure for `ey_channelfield_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channelfield_log`;
CREATE TABLE `ey_channelfield_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '字段名称',
  `channel_id` int(10) DEFAULT '0' COMMENT '模型ID',
  `dtype` varchar(32) DEFAULT '' COMMENT '字段类型',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义字段日志表';


-- -----------------------------
-- Table structure for `ey_channeltype`
-- -----------------------------
DROP TABLE IF EXISTS `ey_channeltype`;
CREATE TABLE `ey_channeltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` varchar(50) NOT NULL DEFAULT '' COMMENT '识别id',
  `title` varchar(30) DEFAULT '' COMMENT '名称',
  `ntitle` varchar(30) DEFAULT '' COMMENT '左侧菜单名称',
  `table` varchar(50) DEFAULT '' COMMENT '表名',
  `ctl_name` varchar(50) DEFAULT '' COMMENT '控制器名称（区分大小写）',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=启用，0=屏蔽)',
  `ifsystem` tinyint(1) DEFAULT '0' COMMENT '字段分类，1=系统(不可修改)，0=自定义',
  `is_repeat_title` tinyint(1) DEFAULT '1' COMMENT '文档标题重复，1=允许，0=不允许',
  `is_release` tinyint(1) DEFAULT '0' COMMENT '模型是否允许应用于会员投稿发布，1是，0否',
  `is_litpic_users_release` tinyint(1) DEFAULT '1' COMMENT '缩略图是否应用于会员投稿，1=允许，0=不允许',
  `data` text COMMENT '额外序列化存储数据',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `sort_order` smallint(6) DEFAULT '50' COMMENT '排序',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idention` (`nid`) USING BTREE,
  UNIQUE KEY `ctl_name` (`ctl_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='系统模型表';

-- -----------------------------
-- Records of `ey_channeltype`
-- -----------------------------
INSERT INTO `ey_channeltype` VALUES ('1', 'article', '文章模型', '文章', 'article', 'Article', '1', '1', '1', '1', '1', '', '0', '1', '0', '1531800410');
INSERT INTO `ey_channeltype` VALUES ('4', 'download', '下载模型', '下载', 'download', 'Download', '1', '1', '1', '1', '1', '', '0', '4', '0', '1531800410');
INSERT INTO `ey_channeltype` VALUES ('2', 'product', '产品模型', '产品', 'product', 'Product', '1', '1', '1', '1', '1', '', '0', '2', '0', '1531800410');
INSERT INTO `ey_channeltype` VALUES ('8', 'guestbook', '留言模型', '留言', 'guestbook', 'Guestbook', '1', '1', '1', '1', '1', '', '0', '8', '1509197711', '1531800410');
INSERT INTO `ey_channeltype` VALUES ('6', 'single', '单页模型', '单页', 'single', 'Single', '1', '1', '1', '1', '1', '', '0', '6', '1523091961', '1531800410');
INSERT INTO `ey_channeltype` VALUES ('3', 'images', '图集模型', '图集', 'images', 'Images', '1', '1', '1', '1', '1', '', '0', '3', '1523929121', '1531800410');
INSERT INTO `ey_channeltype` VALUES ('5', 'media', '视频模型', '视频', 'media', 'Media', '0', '1', '1', '1', '1', '', '0', '5', '1509197711', '1564532747');
INSERT INTO `ey_channeltype` VALUES ('7', 'special', '专题模型', '专题', 'special', 'Special', '0', '1', '1', '1', '1', '', '0', '7', '1509197711', '1564532747');
INSERT INTO `ey_channeltype` VALUES ('51', 'ask', '问答模型', '问答', 'ask', 'Ask', '0', '1', '1', '1', '1', '', '1', '9', '1509197711', '1654567245');

-- -----------------------------
-- Table structure for `ey_citysite`
-- -----------------------------
DROP TABLE IF EXISTS `ey_citysite`;
CREATE TABLE `ey_citysite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(32) DEFAULT '' COMMENT '地区名称',
  `level` tinyint(4) DEFAULT '0' COMMENT '地区等级 分省市县区',
  `parent_id` int(10) DEFAULT '0' COMMENT '父id',
  `topid` int(10) DEFAULT '0' COMMENT '顶级ID',
  `initial` varchar(5) DEFAULT '' COMMENT '首字母',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（1：开启，0：隐藏）',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门',
  `domain` varchar(50) NOT NULL DEFAULT '' COMMENT '二级域名',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '二级域名开启状态，0=否，1=是',
  `seoset` tinyint(1) DEFAULT '0' COMMENT 'SEO设置，0=使用主站，1=自定义',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` text COMMENT 'SEO描述',
  `sort_order` int(6) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`) USING BTREE,
  KEY `level` (`level`,`status`) USING BTREE,
  KEY `initial` (`initial`,`sort_order`,`id`) USING BTREE,
  KEY `parent_id` (`parent_id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='城市分站表';


-- -----------------------------
-- Table structure for `ey_common_pic`
-- -----------------------------
DROP TABLE IF EXISTS `ey_common_pic`;
CREATE TABLE `ey_common_pic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用图片ID',
  `pic_path` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '多语言',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='常用图片';

-- -----------------------------
-- Records of `ey_common_pic`
-- -----------------------------
INSERT INTO `ey_common_pic` VALUES ('1', '/uploads/allimg/180410/1-1P4101Z3290-L.jpg', 'cn', '1654005225', '1654005225');
INSERT INTO `ey_common_pic` VALUES ('2', '/uploads/allimg/180410/1-1P4101Z3420-L.jpg', 'cn', '1654005238', '1654005238');
INSERT INTO `ey_common_pic` VALUES ('3', '/uploads/allimg/180410/1-1P4101Z3530-L.jpg', 'cn', '1654005238', '1654005238');
INSERT INTO `ey_common_pic` VALUES ('4', '/uploads/allimg/20220607/1-22060FT231306.png', 'cn', '1654562553', '1654562553');
INSERT INTO `ey_common_pic` VALUES ('5', '/uploads/allimg/20220607/1-22060FT253N9.jpg', 'cn', '1654562574', '1654562574');

-- -----------------------------
-- Table structure for `ey_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_config`;
CREATE TABLE `ey_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '配置的key键名',
  `value` text,
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `desc` varchar(50) DEFAULT '' COMMENT '描述',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- -----------------------------
-- Records of `ey_config`
-- -----------------------------
INSERT INTO `ey_config` VALUES ('1', 'is_mark', '0', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('2', 'mark_txt', '易优Cms', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('3', 'mark_img', '/public/upload/water/2018/05/08/93806077e5a4c4e12ceed30df5cde761.png', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('4', 'mark_width', '200', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('5', 'mark_height', '50', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('6', 'mark_degree', '54', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('7', 'mark_quality', '56', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('8', 'mark_sel', '9', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('9', 'sms_time_out', '120', 'sms', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('10', 'theme_style', '1', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('11', 'file_size', '100', 'basic', '', 'cn', '0', '1654002656');
INSERT INTO `ey_config` VALUES ('12', 'image_type', 'jpg|gif|png|bmp|jpeg|ico', 'basic', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('13', 'file_type', 'zip|gz|rar|iso|doc|xsl|ppt|wps', 'basic', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('14', 'media_type', 'swf|mpg|mp3|rm|rmvb|wmv|wma|wav|mid|mov', 'basic', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('15', 'web_keywords', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('17', 'sms_platform', '1', 'sms', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('18', 'seo_viewtitle_format', '2', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('19', 'smtp_server', 'smtp.qq.com', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('20', 'smtp_port', '25', 'smtp', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('21', 'smtp_user', 'desdev@vip.qq.com', 'smtp', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('22', 'smtp_pwd', '7260444huxiao', 'smtp', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('23', 'inc_type', 'smtp', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('24', 'mark_type', 'img', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('25', 'mark_txt_size', '30', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('26', 'mark_txt_color', '#000000', 'water', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('27', 'oss_switch', '0', 'oss', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('28', 'web_name', '互联网信息化服务网站模板', 'web', '', 'cn', '0', '1654562528');
INSERT INTO `ey_config` VALUES ('29', 'web_logo', '/uploads/allimg/20220607/1-22060FT231306.png', 'web', '', 'cn', '0', '1654562557');
INSERT INTO `ey_config` VALUES ('184', 'web_status_url', '', 'web', '', 'cn', '0', '1654005421');
INSERT INTO `ey_config` VALUES ('30', 'web_ico', '/favicon.ico', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('31', 'web_basehost', 'http://127.0.0.37', 'web', '', 'cn', '0', '1654016040');
INSERT INTO `ey_config` VALUES ('32', 'web_description', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('79', 'web_recordnum', '粤ICP备12345678号', 'web', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('33', 'web_copyright', 'Copyright © 2002-2022 某某网络设计有限公司 版权所有', 'web', '', 'cn', '0', '1654562528');
INSERT INTO `ey_config` VALUES ('34', 'web_thirdcode_pc', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('35', 'web_thirdcode_wap', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('39', 'seo_arcdir', '/html', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('40', 'seo_pseudo', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('41', 'list_symbol', '>', 'basic', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('42', 'sitemap_auto', '1', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('43', 'sitemap_not1', '0', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('44', 'sitemap_not2', '1', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('45', 'sitemap_xml', '1', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('46', 'sitemap_txt', '0', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('47', 'sitemap_zzbaidutoken', '', 'sitemap', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('48', 'seo_expires_in', '7200', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('55', 'web_title', '互联网信息化服务网站模板', 'web', '', 'cn', '0', '1654562528');
INSERT INTO `ey_config` VALUES ('56', 'smtp_test_eamil', 'xxxxxxxx@qq.com', 'smtp', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('57', 'web_authortoken', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('62', 'seo_inlet', '0', 'seo', '', 'cn', '0', '1653996635');
INSERT INTO `ey_config` VALUES ('63', 'web_cmspath', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('64', 'web_sqldatapath', '/data/sqldata_dQu4TzBeELHavPtybiLB', 'web', '', 'cn', '0', '1654562475');
INSERT INTO `ey_config` VALUES ('65', 'web_cmsurl', '', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('66', 'web_templets_dir', '/template', 'web', '', 'cn', '0', '1654016004');
INSERT INTO `ey_config` VALUES ('67', 'web_templeturl', '/template', 'web', '', 'cn', '0', '1654016004');
INSERT INTO `ey_config` VALUES ('68', 'web_templets_pc', '/template/pc', 'web', '', 'cn', '0', '1654016004');
INSERT INTO `ey_config` VALUES ('69', 'web_templets_m', '/template/mobile', 'web', '', 'cn', '0', '1654016004');
INSERT INTO `ey_config` VALUES ('70', 'web_eyoucms', 'http://www.eyoucms.com', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('78', '_cmscopyright', 'jdFbzvsEHAAzE6PfTTropP7s', 'php', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('76', 'seo_liststitle_format', '2', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('77', 'web_status', '0', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('80', 'web_is_authortoken', '-1', 'web', '', 'cn', '0', '1654567250');
INSERT INTO `ey_config` VALUES ('81', 'web_adminbasefile', '/login.php', 'web', '', 'cn', '0', '1654005034');
INSERT INTO `ey_config` VALUES ('82', 'seo_rewrite_format', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('83', 'web_cmsmode', '2', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('84', 'web_htmlcache_expires_in', '7200', 'web', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('85', 'web_show_popup_upgrade', '1', 'web', '', 'cn', '0', '1653987098');
INSERT INTO `ey_config` VALUES ('86', 'web_weapp_switch', '-1', 'web', '', 'cn', '0', '1654005049');
INSERT INTO `ey_config` VALUES ('88', 'seo_dynamic_format', '1', 'seo', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('89', 'system_sql_mode', '', 'system', '', 'cn', '0', '1654562459');
INSERT INTO `ey_config` VALUES ('90', 'system_home_default_lang', 'cn', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('91', 'system_langnum', '1', 'system', '', 'cn', '0', '0');
INSERT INTO `ey_config` VALUES ('92', 'system_auth_code', '$2y$11$8d9231996c510adfeff4905', 'system', '', 'cn', '0', '1611053262');
INSERT INTO `ey_config` VALUES ('93', 'system_robots_edit', '1', 'system', '', 'cn', '0', '1611053268');
INSERT INTO `ey_config` VALUES ('94', 'system_synleveldata', '1', 'system', '', 'cn', '0', '1611053268');
INSERT INTO `ey_config` VALUES ('95', 'system_upgrade_filelist', 'YXBwbGljYXRpb24vY29tbW9uL2NvbnRyb2xsZXIvQ29tbW9uLnBocDxicj5hcHBsaWNhdGlvbi9jb21tb24vbG9naWMvU21zTG9naWMucGhwPGJyPmFwcGxpY2F0aW9uL2NvbW1vbi9sb2dpYy9GdW5jdGlvbkxvZ2ljLnBocDxicj5hcHBsaWNhdGlvbi9jb21tb24vbW9kZWwvVXNlcnNNb25leS5waHA8YnI+YXBwbGljYXRpb24vY29tbW9uL21vZGVsL0NpdHlzaXRlLnBocDxicj5hcHBsaWNhdGlvbi9yb3V0ZS5waHA8YnI+YXBwbGljYXRpb24vdXNlci9jb250cm9sbGVyL1BheUFwaS5waHA8YnI+YXBwbGljYXRpb24vdXNlci9jb250cm9sbGVyL1BheS5waHA8YnI+YXBwbGljYXRpb24vdXNlci9jb250cm9sbGVyL1VzZXJzUmVsZWFzZS5waHA8YnI+YXBwbGljYXRpb24vdXNlci9jb250cm9sbGVyL1Nob3AucGhwPGJyPmFwcGxpY2F0aW9uL3VzZXIvY29udHJvbGxlci9Vc2Vycy5waHA8YnI+YXBwbGljYXRpb24vdXNlci9jb250cm9sbGVyL1VwbG9hZGlmeS5waHA8YnI+YXBwbGljYXRpb24vdXNlci9sb2dpYy9GdW5jdGlvbkxvZ2ljLnBocDxicj5hcHBsaWNhdGlvbi91c2VyL2xvZ2ljL1BheUFwaUxvZ2ljLnBocDxicj5hcHBsaWNhdGlvbi91c2VyL21vZGVsL1VzZXJzUmVsZWFzZS5waHA8YnI+YXBwbGljYXRpb24vdXNlci9tb2RlbC9NZWRpYUZpbGUucGhwPGJyPmFwcGxpY2F0aW9uL3VzZXIvbW9kZWwvU2hvcC5waHA8YnI+YXBwbGljYXRpb24vY29tbW9uLnBocDxicj5hcHBsaWNhdGlvbi9mdW5jdGlvbi5waHA8YnI+YXBwbGljYXRpb24vaGVscGVyLnBocDxicj5hcHBsaWNhdGlvbi9hcGkvY29udHJvbGxlci92MS9BcGkucGhwPGJyPmFwcGxpY2F0aW9uL2FwaS9jb250cm9sbGVyL3YxL0Jhc2UucGhwPGJyPmFwcGxpY2F0aW9uL2FwaS9jb250cm9sbGVyL3YxL1VzZXJzLnBocDxicj5hcHBsaWNhdGlvbi9hcGkvY29udHJvbGxlci9PdGhlci5waHA8YnI+YXBwbGljYXRpb24vYXBpL2NvbnRyb2xsZXIvRGl5YWpheC5waHA8YnI+YXBwbGljYXRpb24vYXBpL2NvbnRyb2xsZXIvQWpheC5waHA8YnI+YXBwbGljYXRpb24vYXBpL2xvZ2ljL3YxL0FwaUxvZ2ljLnBocDxicj5hcHBsaWNhdGlvbi9hcGkvbW9kZWwvdjEvQXBpLnBocDxicj5hcHBsaWNhdGlvbi9hcGkvbW9kZWwvdjEvUG9zdGVyLnBocDxicj5hcHBsaWNhdGlvbi9hcGkvbW9kZWwvdjEvVXNlci5waHA8YnI+YXBwbGljYXRpb24vYXBpL21vZGVsL3YxL0Jhc2UucGhwPGJyPmFwcGxpY2F0aW9uL2FwaS9tb2RlbC92MS9TaG9wLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb21tb24ucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2JlaGF2aW9yL1ZpZXdGaWx0ZXJCZWhhdmlvci5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vYmVoYXZpb3IvQWN0aW9uQmVnaW5CZWhhdmlvci5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9JbWFnZXMucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvQWRtaW4ucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvQXJjdHlwZS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9BcmNoaXZlcy5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9BcnRpY2xlLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL1VlZGl0b3IucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvU2VjdXJpdHkucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvVXNlcnNSZWxlYXNlLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL0xldmVsLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL1RhZ3MucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvUHJvZHVjdC5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9CYXNlLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL0Rpc2NvdW50LnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL1NwZWNpYWwucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvRm9ybS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9TaXRlbWFwLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL0FyY2hpdmVzRmxhZy5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9Eb3dubG9hZC5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9TZW8ucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvQWRQb3NpdGlvbi5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9JbmRleC5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9BdXRoUm9sZS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9DaGFubmVsdHlwZS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9NZW1iZXIucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbnRyb2xsZXIvU3lzdGVtLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL09yZGVyLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL1Nob3BTZXJ2aWNlLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL1Nob3BQcm9kdWN0LnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL0N1c3RvbS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9TaG9wLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL05vdGlmeS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vY29udHJvbGxlci9BamF4LnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb250cm9sbGVyL0xhbmd1YWdlLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9sb2dpYy9BamF4TG9naWMucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2xvZ2ljL0ZpbGVtYW5hZ2VyTG9naWMucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2xvZ2ljL1VwZ3JhZGVMb2dpYy5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vbG9naWMvRm9ybUxvZ2ljLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9sb2dpYy9Qcm9kdWN0U3BlY0xvZ2ljLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb25mL21lbnUucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbmYvYXV0aF9ydWxlLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9jb25mL2dsb2JhbC5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vbW9kZWwvRm9ybS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vbW9kZWwvUHJvZHVjdFNwZWNWYWx1ZS5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vbW9kZWwvUHJvZHVjdFNwZWNEYXRhLnBocDxicj5hcHBsaWNhdGlvbi9hZG1pbi9tb2RlbC9Gb3JtRmllbGQucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL21vZGVsL1Nob3BPcmRlclNlcnZpY2UucGhwPGJyPmFwcGxpY2F0aW9uL2FkbWluL2NvbmZpZy5waHA8YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZmlsZW1hbmFnZXIvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3BfY29tbWVudC9jb21tZW50X2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9hc2svYXNrX2xpc3QuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2Fzay9hbnN3ZXIuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2FyY3R5cGUvZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYXJjdHlwZS9hZGQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2FyY3R5cGUvYWpheF9uZXd0cGwuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2FyY3R5cGUvc2luZ2xlX2VkaXQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2ZpZWxkL2NoYW5uZWxfYWRkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9maWVsZC9hZGRvbml0ZW0uaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2ZpZWxkL2NoYW5uZWxfZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZmllbGQvYWRkb25leHRpdGVtLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9hdXRoX3JvbGUvZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYXV0aF9yb2xlL2FkZC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZGlzY291bnQvZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZGlzY291bnQvYWRkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9kaXNjb3VudC9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZGlzY291bnQvZ29vZHNfbGlzdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZGlzY291bnQvYmFyLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9kaXNjb3VudC9hY3RpdmVfaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2Rpc2NvdW50L2FjdGl2ZV9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9kaXNjb3VudC9hY3RpdmVfYWRkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9kaXNjb3VudC9hamF4X2FyY2hpdmVzX2xpc3QuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2luZGV4L3N3aXRjaF9tYXBfbmV3Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9pbmRleC9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvaW5kZXgvYWpheF9jb250ZW50X3RvdGFsLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9pbmRleC9zd2l0Y2hfbWFwLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9pbmRleC9hamF4X3F1aWNrbWVudS5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvaW5kZXgvd2VsY29tZS5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvb3JkZXIvbGVmdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc3BlY2lhbC9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zcGVjaWFsL2FkZC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc3BlY2lhbC9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvdWlzZXQvdWlfaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL21lZGlhL2VkaXQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL21lZGlhL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaG9wL21hcmtldF9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2hvcC9sZWZ0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaG9wL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaG9wL29yZGVyX2V4cHJlc3MuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3Avc3BlY19pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2hvcC9jb25mLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaG9wL29yZGVyX3NlbmQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3Avb3JkZXJfZGV0YWlscy5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvdG9vbHMvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2xhbmd1YWdlL29mZmljaWFsX3BhY2tfaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2xhbmd1YWdlL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9sYW5ndWFnZS9wYWNrX2JhdGNoX2FkZC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvbGFuZ3VhZ2UvcGFja19hZGQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2xhbmd1YWdlL3BhY2tfZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvbGFuZ3VhZ2UvcGFja19pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvcmVjeWNsZV9iaW4vYXJjaGl2ZXNfaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3JlY3ljbGVfYmluL2N1c3RvbXZhcl9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvcmVjeWNsZV9iaW4vZ2Jvb2thdHRyX2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9yZWN5Y2xlX2Jpbi9hcmN0eXBlX2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9yZWN5Y2xlX2Jpbi9wcm9hdHRyX2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaGFycC9hY3RpdmVfdGltZV9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2hhcnAvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3NoYXJwL2Jhci5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2hhcnAvYWN0aXZlX2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS91cGxvYWRpbWduZXcvZ2V0X3VwbG9hZF9saXN0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS91cGxvYWRpbWduZXcvZ2V0X2Rpcl9pbWdsaXN0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS91cGxvYWRpbWduZXcvdXBsb2FkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zZW8vc2l0ZW1hcC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2VvL3NpdGUuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nlby9idWlsZC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2VvL3Nlby5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2VvL2NoYW5uZWwuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3RhZ3MvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3RhZ3MvdGFnX2xpc3QuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3BfcHJvZHVjdC9hdHRyaWJ1dGVfaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3BfcHJvZHVjdC9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaG9wX3Byb2R1Y3QvYWRkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zaG9wX3Byb2R1Y3QvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3BfcHJvZHVjdC9hdHRybGlzdF9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvY3VzdG9tL2VkaXQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2N1c3RvbS9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYWRtaW4vYWRtaW5fYWRkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9hZG1pbi9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYWRtaW4vYWRtaW5fcHdkX2FqYXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2FkbWluL2xvZ2luX3p5Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9hZG1pbi9sb2dpbi5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYWRtaW4vYWRtaW5fcHdkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9hZG1pbi9hZG1pbl9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zeXN0ZW0vc210cF90cGxfZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc3lzdGVtL3BheV9zZXQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3N5c3RlbS9vc3MuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3N5c3RlbS9zbXRwLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zeXN0ZW0vd2ViMi5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc3lzdGVtL3Ntcy5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc3lzdGVtL2FwaV9jb25mLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zeXN0ZW0vcGF5X2FwaV9saXN0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zeXN0ZW0vbWljcm9zaXRlLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zeXN0ZW0vdGh1bWIuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2FydGljbGUvZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYXJ0aWNsZS9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvbGV2ZWwvdXBncmFkZV9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvYXJjaGl2ZXMvYWpheF9uZXd0cGwuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2FyY2hpdmVzL2luZGV4X2RyYWZ0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9hcmNoaXZlcy9pbmRleF9hcmNoaXZlcy5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZm9ybS92aWV3X2Zvcm1fZGF0YS5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvZm9ybS9maWVsZF9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9mb3JtL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9mb3JtL2xhYmVsX2NhbGwuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2Zvcm0vZmllbGRfYWRkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9mb3JtL2ZpZWxkLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9wcm9kdWN0L2VkaXQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Byb2R1Y3QvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2NoYW5uZWx0eXBlL2VkaXQuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL2NoYW5uZWx0eXBlL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zZWN1cml0eS9zZWNvbmRfdmVyaWZ5X2FkZC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2VjdXJpdHkvaW5kZXguaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3NlY3VyaXR5L2FqYXhfZm9yY2VfdmVyaWZ5Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zZWN1cml0eS93ZWNoYXRfZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvc2VjdXJpdHkvc2Vjb25kX3ZlcmlmeV9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9zdGF0aXN0aWNzL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9tZW1iZXIvbW9uZXlfaW5kZXhfbmV3Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9tZW1iZXIvdXNlcnNfY29uZmlnLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9tZW1iZXIvbGVmdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvbWVtYmVyL21lZGlhX2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9tZW1iZXIvcGF5X3NldC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvbWVtYmVyL3VzZXJzX2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9tZW1iZXIvYXJ0aWNsZV9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvbWVtYmVyL21vbmV5X2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9kb3dubG9hZC9lZGl0Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9kb3dubG9hZC9pbmRleC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvY291cG9uL3NlbGVjdF9hcmN0eXBlLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9jb3Vwb24vZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvY291cG9uL2FkZC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvY291cG9uL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9wdWJsaWMvbGVmdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvcHVibGljL2xheW91dC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvcHVibGljL3RoZW1lX2Nzcy5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvcHVibGljL2Rpc3BhdGNoX2p1bXAuaHRtPGJyPmFwcGxpY2F0aW9uL2FkbWluL3RlbXBsYXRlL3Nob3Bfc2VydmljZS9hZnRlcl9zZXJ2aWNlLmh0bTxicj5hcHBsaWNhdGlvbi9hZG1pbi90ZW1wbGF0ZS9pbWFnZXMvZWRpdC5odG08YnI+YXBwbGljYXRpb24vYWRtaW4vdGVtcGxhdGUvaW1hZ2VzL2luZGV4Lmh0bTxicj5hcHBsaWNhdGlvbi9leHRyYS9lcnJvcl9jb2RlLnBocDxicj5hcHBsaWNhdGlvbi9leHRyYS9leHRyYV9jYWNoZV9rZXkucGhwPGJyPmFwcGxpY2F0aW9uL2V4dHJhL2dsb2JhbC5waHA8YnI+YXBwbGljYXRpb24vaG9tZS9jb21tb24ucGhwPGJyPmFwcGxpY2F0aW9uL2hvbWUvYmVoYXZpb3IvVmlld0ZpbHRlckJlaGF2aW9yLnBocDxicj5hcHBsaWNhdGlvbi9ob21lL2NvbnRyb2xsZXIvTGlzdHMucGhwPGJyPmFwcGxpY2F0aW9uL2hvbWUvY29udHJvbGxlci9WaWV3LnBocDxicj5hcHBsaWNhdGlvbi9ob21lL2NvbnRyb2xsZXIvU2VhcmNoLnBocDxicj5hcHBsaWNhdGlvbi9ob21lL2NvbnRyb2xsZXIvSW5kZXgucGhwPGJyPmFwcGxpY2F0aW9uL2hvbWUvY29udHJvbGxlci9CdWlsZGh0bWwucGhwPGJyPmFwcGxpY2F0aW9uL2NvbmZpZy5waHA8YnI+Y29yZS90cGwvZGlzcGF0Y2hfanVtcC50cGw8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL1JlcXVlc3QucGhwPGJyPmNvcmUvbGlicmFyeS90aGluay9leGNlcHRpb24vUERPRXhjZXB0aW9uLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvQXBwLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2V5b3UvVGFnQXJjdmlldy5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ1RhZy5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ0NpdHlzaXRlLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2V5b3UvVGFnU3BjYXJ0LnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2V5b3UvVGFnU3BzdWJtaXRvcmRlci5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ0Fkdi5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ1Nwb3JkZXIucGhwPGJyPmNvcmUvbGlicmFyeS90aGluay90ZW1wbGF0ZS90YWdsaWIvZXlvdS9UYWdDb2xsZWN0LnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2V5b3UvQmFzZS5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ0dsb2JhbC5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ0xpc3QucGhwPGJyPmNvcmUvbGlicmFyeS90aGluay90ZW1wbGF0ZS90YWdsaWIvZXlvdS9UYWdTcG9yZGVybGlzdC5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ1Bvc2l0aW9uLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2V5b3UvVGFnQXJjbGlzdC5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ0Zvcm0ucGhwPGJyPmNvcmUvbGlicmFyeS90aGluay90ZW1wbGF0ZS90YWdsaWIvZXlvdS9UYWdDaGFubmVsYXJ0bGlzdC5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9leW91L1RhZ1NwZWNub2RlLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2V5b3UvVGFnRmllbGQucGhwPGJyPmNvcmUvbGlicmFyeS90aGluay90ZW1wbGF0ZS90YWdsaWIvZXlvdS9UYWdBcnRpY2xlcGF5LnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2FwaS9UYWdQcmVuZXh0LnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2FwaS9UYWdBcmN2aWV3LnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2FwaS9UYWdMaWtlYXJ0aWNsZS5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9hcGkvVGFnTGlrZS5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9hcGkvQmFzZS5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9hcGkvVGFnR2xvYmFsLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2FwaS9UYWdMaXN0LnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2FwaS9UYWdDaGFubmVsLnBocDxicj5jb3JlL2xpYnJhcnkvdGhpbmsvdGVtcGxhdGUvdGFnbGliL2FwaS9UYWdDb21tZW50bGlzdC5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9hcGkvVGFnQXJjbGlzdC5waHA8YnI+Y29yZS9saWJyYXJ5L3RoaW5rL3RlbXBsYXRlL3RhZ2xpYi9hcGkvVGFnQ2hhbm5lbGxpc3QucGhwPGJyPmNvcmUvbGlicmFyeS90aGluay90ZW1wbGF0ZS90YWdsaWIvRXlvdS5waHA8YnI+dmVuZG9yL1BIUEV4Y2VsLnppcDxicj52ZW5kb3IvcGhwbWFpbGVyL1BIUE1haWxlckF1dG9sb2FkLnBocDxicj5kYXRhL3NjaGVtYS9leV9zaG9wX29yZGVyLnBocDxicj5kYXRhL3NjaGVtYS9leV9zaGFycF9nb29kcy5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfYXJjdHlwZS5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfZGlzY291bnRfYWN0aXZlX2dvb2RzLnBocDxicj5kYXRhL3NjaGVtYS9leV91cGxvYWRzLnBocDxicj5kYXRhL3NjaGVtYS9leV90YWdpbmRleC5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfdXNlcnNfbW9uZXkucGhwPGJyPmRhdGEvc2NoZW1hL2V5X3Nob3BfY291cG9uLnBocDxicj5kYXRhL3NjaGVtYS9leV9wcm9kdWN0X3NwZWNfdmFsdWUucGhwPGJyPmRhdGEvc2NoZW1hL2V5X2FkbWluLnBocDxicj5kYXRhL3NjaGVtYS9leV91c2Vycy5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfYWRtaW5fbWVudS5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfZm9ybV9saXN0LnBocDxicj5kYXRhL3NjaGVtYS9leV9kaXNjb3VudF9nb29kcy5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfZm9ybV9maWVsZC5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfZGlzY291bnRfYWN0aXZlLnBocDxicj5kYXRhL3NjaGVtYS9leV9zaG9wX2V4cHJlc3MucGhwPGJyPmRhdGEvc2NoZW1hL2V5X3Nob3Bfb3JkZXJfc2VydmljZS5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfZm9ybV92YWx1ZS5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfYWRtaW5fd3hsb2dpbi5waHA8YnI+ZGF0YS9zY2hlbWEvZXlfZm9ybS5waHA8YnI+ZGF0YS9jb25mL3ZlcnNpb24udHh0PGJyPmRhdGEvY29uZi9hZG1pbl92ZXJ0aWZ5LnR4dDxicj5kYXRhL3dlYXBwL1NhbXBsZS93ZWFwcC9TYW1wbGUvdGVtcGxhdGUvaGVhZGVyLmh0bTxicj5kYXRhL3dlYXBwL1NhbXBsZS93ZWFwcC9TYW1wbGUvdGVtcGxhdGUvYmFyLmh0bTxicj5kYXRhL3dlYXBwL1NhbXBsZS93ZWFwcC9TYW1wbGUvdGVtcGxhdGUvc2tpbi9jc3MvbWFpbi5jc3M8YnI+ZGF0YS93ZWFwcC9TYW1wbGUvd2VhcHAvU2FtcGxlL3RlbXBsYXRlL3NraW4vanMvZ2xvYmFsLmpzPGJyPmRhdGEvd2VhcHAvU2FtcGxlL3RlbXBsYXRlL3BsdWdpbnMvc2FtcGxlL3BjL2luZGV4Lmh0bTxicj5kYXRhL3dlYXBwL1NhbXBsZS90ZW1wbGF0ZS9wbHVnaW5zL3NhbXBsZS9tb2JpbGUvaW5kZXguaHRtPGJyPnB1YmxpYy9wbHVnaW5zL3VwbG9hZGltZ25ldy9jc3MvaW1hZ2UtdXBsb2FkLmNzczxicj5wdWJsaWMvcGx1Z2lucy91cGxvYWRpbWduZXcvanMvZ2V0X3VwbG9hZF9saXN0LmpzPGJyPnB1YmxpYy9wbHVnaW5zL1VlZGl0b3IvZGlhbG9ncy9wcmV2aWV3bW9iaWxlL3ByZXZpZXdtb2JpbGUuaHRtbDxicj5wdWJsaWMvcGx1Z2lucy9VZWRpdG9yL2xhbmcvemgtY24vemgtY24uanM8YnI+cHVibGljL3BsdWdpbnMvVWVkaXRvci91ZWRpdG9yLmFsbC5taW4uanM8YnI+cHVibGljL3BsdWdpbnMvVWVkaXRvci90aGVtZXMvZGVmYXVsdC9jc3MvdWVkaXRvci5jc3M8YnI+cHVibGljL3BsdWdpbnMvVWVkaXRvci90aGVtZXMvZGVmYXVsdC9pbWFnZXMvaXBob25lLWJnLnBuZzxicj5wdWJsaWMvcGx1Z2lucy9VZWRpdG9yL3RoZW1lcy9kZWZhdWx0L2ltYWdlcy9wcmV2aWV3TW9iaWxlLnBuZzxicj5wdWJsaWMvcGx1Z2lucy9VZWRpdG9yL3VlZGl0b3IuY29uZmlnLmpzPGJyPnB1YmxpYy9wbHVnaW5zL1VlZGl0b3IvdWVkaXRvci5hbGwuanM8YnI+cHVibGljL3N0YXRpYy9jb21tb24vanMvdGFnX2NvbGxlY3Rpb25fbGlzdC5qczxicj5wdWJsaWMvc3RhdGljL2NvbW1vbi9qcy92aWV3X2FyY3JhbmsuanM8YnI+cHVibGljL3N0YXRpYy9jb21tb24vanMvdGFnX3VzZXIuanM8YnI+cHVibGljL3N0YXRpYy9jb21tb24vanMvdGFnX3Nwb3JkZXJfdjIuanM8YnI+cHVibGljL3N0YXRpYy9jb21tb24vZGlzcGF0Y2hfanVtcC5odG08YnI+cHVibGljL3N0YXRpYy9hZG1pbi9jc3MvbWFpbi5jc3M8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9jc3Mvd2VsY29tZS5jc3M8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9mb250L2Nzcy9pY29uZm9udC5jc3M8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9mb250L2ZvbnRzL2ljb25mb250LndvZmYyPGJyPnB1YmxpYy9zdGF0aWMvYWRtaW4vZm9udC9mb250cy9pY29uZm9udC50dGY8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9mb250L2ZvbnRzL2ljb25mb250LndvZmY8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9qcy9nbG9iYWwuanM8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9qcy9hZG1pbmNwLmpzPGJyPnB1YmxpYy9zdGF0aWMvYWRtaW4vanMvdXBncmFkZS5qczxicj5wdWJsaWMvc3RhdGljL2FkbWluL2pzL215QWpheDIuanM8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9pbWFnZXMvcGFzc3dvcmRfc2hvdy5wbmc8YnI+cHVibGljL3N0YXRpYy9hZG1pbi9pbWFnZXMvcGFzc3dvcmRfaGlkZS5wbmc8YnI+cHVibGljL2h0bWwvc2l0ZW1hcC5odG0=', 'system', '', 'cn', '0', '1648864505');
INSERT INTO `ey_config` VALUES ('150', 'seo_uphtml_after_home', '0', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('151', 'seo_uphtml_after_channel', '1', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('152', 'seo_uphtml_after_pernext', '1', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('153', 'seo_html_templet', 'index.htm', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('154', 'seo_html_position', '../index.html', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('155', 'seo_showmod', '1', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('156', 'seo_maxpagesize', '50', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('157', 'seo_upnext', '1', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('158', 'seo_pagesize', '20', 'seo', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('159', 'basic_img_auto_wh', '0', 'basic', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('160', 'basic_img_alt', '0', 'basic', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('161', 'basic_img_title', '0', 'basic', '', 'cn', '0', '1641862059');
INSERT INTO `ey_config` VALUES ('162', 'system_correctarctypedirpath', '1', 'system', '', 'cn', '0', '1641862070');
INSERT INTO `ey_config` VALUES ('96', 'smtp_syn_weapp', '1', 'smtp', '', 'cn', '0', '1611053270');
INSERT INTO `ey_config` VALUES ('111', 'syn_admin_logic_arctype_topid2', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('112', 'syn_admin_logic_check_oneself', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('113', 'syn_admin_logic_links_group', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('114', 'sms_type', '1', 'sms', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('115', 'syn_admin_logic_1608189503', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('116', 'download_select_servername', 'a:6:{i:0;s:12:\"立即下载\";i:1;s:15:\"本地服务器\";i:2;s:15:\"远程服务器\";i:3;s:12:\"百度网盘\";i:4;s:15:\"七牛云存储\";i:5;s:12:\"腾讯网盘\";}', 'download', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('117', 'syn_admin_logic_1608191377', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('118', 'system_paginate_pagesize', '20', 'system', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('119', 'web_theme_color', '#3398cc', 'web', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('120', 'web_assist_color', '#2189be', 'web', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('121', 'web_loginbgimg', '/public/static/admin/images/login-bg.jpg', 'web', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('122', 'syn_admin_logic_1609039608', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('123', 'syn_admin_logic_1609291091', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('124', 'admin_logic_1610086647', '1', 'syn', '', 'cn', '0', '1611055150');
INSERT INTO `ey_config` VALUES ('125', 'php_eyou_blacklist', '', 'php', '', 'cn', '0', '1611055155');
INSERT INTO `ey_config` VALUES ('126', 'php_serviceinfo', 'e3adBFYDBVVRBQkFVQcGWlMGVVYMBQRXBwIHBV1CEFNWUVEWXBEXSUNCXFQVQmsSD0QCDFc+XUFVDxAPCRUQUUxBXFsUVVwJBFhKUkcIFj4WCQcDDj1HBAJSAmlNDFAJAWlBAwAGBDkUAVwFB25BWgUGATlMVVcAAz1HAV0IU2xMAgYAXm9AU1INAWkQBANWUG0QUwxZBW1FVVdTDmVHVl8FBRZKEVQQFV1WRwhBU1NBC0c5TFlQVAU9RwAKAFRsTA0EUgJvQFEEVgxpEAsCV1NtEFAMVQRtRVVXBFllRwYKDQxoEwUCUVJpTABSVlI+FgRRVV09R1dWUQMXFBtTRU1dW0YLQFJXQw8baRAKVgdWbRBQC1hUbUVZAlNcZUcEXFYBaBMKA1BRaUwBAAMHPhYFAFRYPUcGAlUKaU0PAQgBaUECUQcGORQADlEDbkFXVwEBOUwHVAEBQx4XWUxGWFZHWUcBAhtQQw8baRAKVgdWbRBQC1hUbUVZAlNcZUcEXFYBaBMKA1BRaUwBAAMHPhYFAFRYPUcGAlUKaU0PAQgBaUECUQcGORQADlEDbkFXVwEBOUwHVAEBQ08', 'php', '', 'cn', '0', '1654567250');
INSERT INTO `ey_config` VALUES ('127', 'php_servicecode', '', 'php', '', 'cn', '0', '1611055155');
INSERT INTO `ey_config` VALUES ('109', 'syn_admin_logic_special_addfields', '5', 'syn', '', 'cn', '0', '1616293251');
INSERT INTO `ey_config` VALUES ('110', 'syn_admin_logic_session_conf', '1', 'syn', '', 'cn', '0', '1611055054');
INSERT INTO `ey_config` VALUES ('108', 'syn_admin_logic_users_download', '1', 'syn', '', 'cn', '0', '1611054964');
INSERT INTO `ey_config` VALUES ('105', 'syn_admin_logic_video_addfields', '5', 'syn', '', 'cn', '0', '1616293251');
INSERT INTO `ey_config` VALUES ('106', 'syn_admin_logic_add_tag', '1', 'syn', '', 'cn', '0', '1611054872');
INSERT INTO `ey_config` VALUES ('107', 'syn_admin_logic_users_parameter', '1', 'syn', '', 'cn', '0', '1611054872');
INSERT INTO `ey_config` VALUES ('99', 'syn_admin_logic_sms_template', '1', 'syn', '', 'cn', '0', '1611054772');
INSERT INTO `ey_config` VALUES ('100', 'php_weapp_plugin_open', '1', 'php', '', 'cn', '0', '1654567250');
INSERT INTO `ey_config` VALUES ('101', 'syn_admin_logic_unlink', '1', 'syn', '', 'cn', '0', '1611054772');
INSERT INTO `ey_config` VALUES ('102', 'syn_admin_logic_update_basic', '1', 'syn', '', 'cn', '0', '1611054772');
INSERT INTO `ey_config` VALUES ('103', 'syn_admin_logic_update_tag', '1', 'syn', '', 'cn', '0', '1611054772');
INSERT INTO `ey_config` VALUES ('104', 'syn_admin_logic_update_arctype', '1', 'syn', '', 'cn', '0', '1611054772');
INSERT INTO `ey_config` VALUES ('98', 'system_smtp_tpl_5', '1', 'system', '', 'cn', '0', '1611054608');
INSERT INTO `ey_config` VALUES ('97', 'syn_gb_attribute_showlist', '1', 'syn', '', 'cn', '0', '1611054521');
INSERT INTO `ey_config` VALUES ('128', 'other_arcclick', '500|1000', 'other', '', 'cn', '0', '1611057171');
INSERT INTO `ey_config` VALUES ('129', 'php_servicemeal', '0', 'php', '', 'cn', '0', '1616293291');
INSERT INTO `ey_config` VALUES ('130', 'syn_admin_logic_video_addfields_2', '1', 'syn', '', 'cn', '0', '1616293251');
INSERT INTO `ey_config` VALUES ('131', 'syn_admin_logic_1608884981_2', '1', 'syn', '', 'cn', '0', '1616293251');
INSERT INTO `ey_config` VALUES ('132', 'system_version', 'v1.5.8', 'system', '', 'cn', '0', '1648864534');
INSERT INTO `ey_config` VALUES ('133', 'syn_admin_logic_arctype_topid', '2', 'syn', '', 'cn', '0', '1616293292');
INSERT INTO `ey_config` VALUES ('134', 'syn_admin_logic_balance_pay', '1', 'syn', '', 'cn', '0', '1616293292');
INSERT INTO `ey_config` VALUES ('135', 'basic_img_style_wh', '0', 'basic', '', 'cn', '0', '1616293292');
INSERT INTO `ey_config` VALUES ('136', 'syn_admin_logic_1610086648', '1', 'syn', '', 'cn', '0', '1616293292');
INSERT INTO `ey_config` VALUES ('137', 'syn_admin_logic_1614829120', '1', 'syn', '', 'cn', '0', '1616293292');
INSERT INTO `ey_config` VALUES ('138', 'syn_admin_logic_1616123192', '1', 'syn', '', 'cn', '0', '1616293292');
INSERT INTO `ey_config` VALUES ('139', 'web_adminlogo', '', 'web', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('140', 'web_loginlogo', '', 'web', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('141', 'syn_admin_logic_1608884981', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('142', 'syn_admin_logic_1614829121', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('143', 'syn_admin_logic_ask_answer_like', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('144', 'syn_admin_logic_archives_1618279798', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('145', 'syn_admin_logic_1623036205', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('146', 'admin_logic_1623055490', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('147', 'system_use_language', '0', 'system', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('148', 'admin_logic_1623133485', '1', 'syn', '', 'cn', '0', '1623814141');
INSERT INTO `ey_config` VALUES ('149', 'other_pcwapjs', '0', 'other', '', 'cn', '0', '1639021937');
INSERT INTO `ey_config` VALUES ('163', 'system_crypt_auth_code', '$2y$11$8d9231996c510adfeff4905', 'system', '', 'cn', '0', '1648864537');
INSERT INTO `ey_config` VALUES ('164', 'web_citysite_open', '0', 'web', '', 'cn', '0', '1648864596');
INSERT INTO `ey_config` VALUES ('165', 'admin_logic_1_1648775669', '1', 'syn', '', 'cn', '0', '1648864596');
INSERT INTO `ey_config` VALUES ('166', 'web_mobile_domain_open', '0', 'web', '', 'cn', '0', '1653987098');
INSERT INTO `ey_config` VALUES ('167', 'web_is_https', '0', 'web', '', 'cn', '0', '1653987098');
INSERT INTO `ey_config` VALUES ('168', 'recycle_switch', '0', 'web', '', 'cn', '0', '1653987098');
INSERT INTO `ey_config` VALUES ('169', 'web_stypeid_open', '0', 'web', '', 'cn', '0', '1653987098');
INSERT INTO `ey_config` VALUES ('170', 'web_tpl_theme', '', 'web', '', 'cn', '0', '1654016004');
INSERT INTO `ey_config` VALUES ('171', 'system_usecodelist', '074aVggJAQNVVAEICAIBWgUBUgFQBQYBAAJXVgU9RFQHVQEkfmx7cTQuZ3pUYWEjV3VhfBMDbyRXZnAxWiskdCIrZSR+dHRmMwxhf21Xdip2YmB8VHx0JGIGcyEHPARgJSh9IlR4dncwPmd+CVhiIHZQU2o2ZHw9ZQN1J0EFJXMxVFI0bmtrZDApZH1ffVM0cUdpeyJ/fCFcdW4hcA43ZlVUUDFUAXhyJC1nbFNhYTNbAHx9JVNzTkBdYzoZNhxtCy5dLlBpW1YUPkdqUmlZMwN9X1wKVXM0BmsbAGEMP309CVELd1QFYCJSBXRuSmtNQmcIcSxiWS9CZV9RdSIBbzwDAS1vdAFpOUtiUldVYFBWQ2R8E3xzMlt+dSR3CiBgISdyNW1WfnRVFH5pU2V7N0gEempVYFY3clRzJWANBXATWHw3CFZkazQAYX8IdWUxYUBpewgHZiFKR2IlQSA+VDYgbDJpaGRmVD1pYFBlQSBHAWd8IntkIQkBAwxSLg9SEFN6Ohd3bRwPUmAMYmVQCXZnVnIAZGFVEmo', 'system', '', 'cn', '0', '1654004767');
INSERT INTO `ey_config` VALUES ('172', 'basic_indexname', '主页', 'basic', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('173', 'seo_html_arcdir', '/a', 'seo', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('174', 'seo_force_inlet', '0', 'seo', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('175', 'sitemap_archives_num', '100', 'sitemap', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('176', 'sitemap_tags_num', '200', 'sitemap', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('177', 'smtp_from_eamil', 'desdev@vip.qq.com', 'smtp', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('178', 'web_attr_1', '020-66889888', 'web', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('179', 'web_attr_2', '188 666 999 88', 'web', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('180', 'web_attr_3', '广东省广州市番禺经济开发区58号', 'web', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('181', 'web_attr_4', 'admin@admin.com', 'web', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('182', 'web_attr_5', '88889999', 'web', '', 'cn', '0', '1653996665');
INSERT INTO `ey_config` VALUES ('183', 'web_attr_6', '/uploads/allimg/20220607/1-22060FT253N9.jpg', 'web', '', 'cn', '0', '1654562578');
INSERT INTO `ey_config` VALUES ('185', 'web_status_tpl', '', 'web', '', 'cn', '0', '1654005421');
INSERT INTO `ey_config` VALUES ('186', 'web_recordnum_mode', '0', 'web', '', 'cn', '0', '1654005421');
INSERT INTO `ey_config` VALUES ('187', 'web_garecordnum', '', 'web', '', 'cn', '0', '1654005421');
INSERT INTO `ey_config` VALUES ('188', 'web_garecordnum_mode', '0', 'web', '', 'cn', '0', '1654005421');

-- -----------------------------
-- Table structure for `ey_config_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_config_attribute`;
CREATE TABLE `ey_config_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `inc_type` varchar(20) DEFAULT '' COMMENT '变量分组',
  `attr_name` varchar(60) DEFAULT '' COMMENT '变量标题',
  `attr_var_name` varchar(50) DEFAULT '' COMMENT '变量名',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框，3=上传图片',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='自定义变量表';

-- -----------------------------
-- Records of `ey_config_attribute`
-- -----------------------------
INSERT INTO `ey_config_attribute` VALUES ('1', 'web', '电话', 'web_attr_1', '0', 'cn', '1653996665', '1654562578');
INSERT INTO `ey_config_attribute` VALUES ('2', 'web', '手机', 'web_attr_2', '0', 'cn', '1653996665', '1654562578');
INSERT INTO `ey_config_attribute` VALUES ('3', 'web', '地址', 'web_attr_3', '0', 'cn', '1653996665', '1654562578');
INSERT INTO `ey_config_attribute` VALUES ('4', 'web', '邮箱', 'web_attr_4', '0', 'cn', '1653996665', '1654562578');
INSERT INTO `ey_config_attribute` VALUES ('5', 'web', 'QQ客服', 'web_attr_5', '0', 'cn', '1653996665', '1654562578');
INSERT INTO `ey_config_attribute` VALUES ('6', 'web', '微信二维码', 'web_attr_6', '3', 'cn', '1654005387', '1654562578');

-- -----------------------------
-- Table structure for `ey_discount_active`
-- -----------------------------
DROP TABLE IF EXISTS `ey_discount_active`;
CREATE TABLE `ey_discount_active` (
  `active_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动会场ID',
  `active_name` varchar(255) DEFAULT '' COMMENT '活动名称',
  `start_date` int(11) unsigned DEFAULT '0' COMMENT '活动开始时间',
  `end_date` int(11) DEFAULT '0' COMMENT '活动结束时间',
  `limit_type` tinyint(3) unsigned DEFAULT '1' COMMENT '限购类型 1-不限购,2-活动期内每人最多购买n件,3-活动期内每人每天最多购买n件',
  `limit` int(11) unsigned DEFAULT '0' COMMENT '限购数量',
  `preheat` tinyint(3) DEFAULT '0' COMMENT '是否开启预热 0-关闭 1-开启',
  `preheat_time` int(11) DEFAULT '0' COMMENT '预热时间,不能大于开启时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态(0禁用 1启用)',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`active_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣-活动会场表';


-- -----------------------------
-- Table structure for `ey_discount_active_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ey_discount_active_goods`;
CREATE TABLE `ey_discount_active_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `active_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动ID',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '文档id',
  `discount_goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀商品ID',
  `sales_actual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际销量',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣-活动会场与商品关联表';


-- -----------------------------
-- Table structure for `ey_discount_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ey_discount_goods`;
CREATE TABLE `ey_discount_goods` (
  `discount_gid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品ID',
  `aid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID->aid',
  `discount_stock` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限时折扣商品库存总量',
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '限时折扣价格',
  `sales` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '累积销量',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '商品排序(数字越小越靠前)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品状态(0下架 1上架)',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_sku` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-多规格商品',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`discount_gid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣-商品表';


-- -----------------------------
-- Table structure for `ey_diyminipro`
-- -----------------------------
DROP TABLE IF EXISTS `ey_diyminipro`;
CREATE TABLE `ey_diyminipro` (
  `mini_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板ID',
  `categoryid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '模板标题',
  `litpic` varchar(250) NOT NULL DEFAULT '' COMMENT '封面图',
  `component` text NOT NULL COMMENT '组件库',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：4=审核中，5=发布',
  `cloud_id` int(10) NOT NULL DEFAULT '0' COMMENT '云ID',
  `config` text NOT NULL COMMENT '相关序列化信息',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`mini_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信小程序记录表';


-- -----------------------------
-- Table structure for `ey_diyminipro_page`
-- -----------------------------
DROP TABLE IF EXISTS `ey_diyminipro_page`;
CREATE TABLE `ey_diyminipro_page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_type` tinyint(3) NOT NULL DEFAULT '-1' COMMENT '页面类型(1首页 -1自定义页)',
  `page_name` varchar(255) NOT NULL DEFAULT '' COMMENT '页面名称',
  `page_data` longtext NOT NULL COMMENT '页面数据',
  `mini_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '微信小程序id',
  `is_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '设为首页：0=否，1=是',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统内置',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示：1=显示，0=隐藏',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`page_id`),
  KEY `mini_id` (`mini_id`,`lang`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信小程序diy页面表';


-- -----------------------------
-- Table structure for `ey_diyminipro_setting`
-- -----------------------------
DROP TABLE IF EXISTS `ey_diyminipro_setting`;
CREATE TABLE `ey_diyminipro_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '页面组',
  `value` text NOT NULL COMMENT '组装之后的值',
  `mini_id` int(11) NOT NULL DEFAULT '0' COMMENT '小程序ID',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `type` (`name`) USING BTREE,
  KEY `mini_id` (`mini_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信小程序多功能配置表';


-- -----------------------------
-- Table structure for `ey_download_attr_field`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_attr_field`;
CREATE TABLE `ey_download_attr_field` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `field_name` varchar(32) DEFAULT '' COMMENT '字段名称',
  `field_title` varchar(32) DEFAULT '' COMMENT '字段标题',
  `field_use` tinyint(1) DEFAULT '0' COMMENT '字段是否使用，0未使用，1为使用',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上传文件属性表';

-- -----------------------------
-- Records of `ey_download_attr_field`
-- -----------------------------
INSERT INTO `ey_download_attr_field` VALUES ('1', 'extract_code', '提取码', '1', '1', 'cn', '1561001807', '1561024954');
INSERT INTO `ey_download_attr_field` VALUES ('2', 'server_name', '服务器名称', '1', '2', 'cn', '1561001807', '1561078673');

-- -----------------------------
-- Table structure for `ey_download_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_content`;
CREATE TABLE `ey_download_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_download_file`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_file`;
CREATE TABLE `ey_download_file` (
  `file_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `file_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `extract_code` varchar(20) DEFAULT '' COMMENT '文件提取码',
  `file_size` varchar(255) DEFAULT '' COMMENT '文件大小',
  `file_ext` varchar(50) DEFAULT '' COMMENT '文件后缀名',
  `file_name` varchar(200) DEFAULT '' COMMENT '文件名',
  `server_name` varchar(200) DEFAULT '' COMMENT '服务器名称',
  `file_mime` varchar(200) DEFAULT '' COMMENT '文件类型',
  `uhash` varchar(200) DEFAULT '' COMMENT '自定义的一种加密方式，用于文件下载权限验证',
  `md5file` varchar(200) DEFAULT '' COMMENT 'md5_file加密，可以检测上传/下载的文件包是否损坏',
  `is_remote` tinyint(1) DEFAULT '0' COMMENT '是否远程',
  `downcount` int(10) DEFAULT '0' COMMENT '下载次数',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`file_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载附件表';


-- -----------------------------
-- Table structure for `ey_download_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_download_log`;
CREATE TABLE `ey_download_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `users_id` int(10) DEFAULT '0' COMMENT '用户ID',
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `file_id` int(10) DEFAULT '0' COMMENT '附件ID',
  `ip` varchar(20) DEFAULT '' COMMENT 'ip',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`log_id`),
  KEY `file_id` (`file_id`,`aid`,`users_id`) USING BTREE,
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载记录表';


-- -----------------------------
-- Table structure for `ey_field_type`
-- -----------------------------
DROP TABLE IF EXISTS `ey_field_type`;
CREATE TABLE `ey_field_type` (
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '中文类型名',
  `ifoption` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要设置选项',
  `sort_order` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='字段类型表';

-- -----------------------------
-- Records of `ey_field_type`
-- -----------------------------
INSERT INTO `ey_field_type` VALUES ('text', '单行文本', '0', '1', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('checkbox', '多选项', '1', '5', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('multitext', '多行文本', '0', '2', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('radio', '单选项', '1', '4', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('switch', '开关', '0', '13', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('select', '下拉框', '1', '6', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('img', '单张图', '0', '10', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('int', '整数类型', '0', '7', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('datetime', '日期和时间', '0', '12', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('htmltext', 'HTML文本', '0', '3', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('imgs', '多张图', '0', '11', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('decimal', '金额类型', '0', '9', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('float', '小数类型', '0', '8', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('region', '区域类型', '1', '6', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('file', '附件类型', '0', '11', '1532485708', '1532485708');
INSERT INTO `ey_field_type` VALUES ('media', '多媒体类型', '0', '11', '1532485708', '1532485708');

-- -----------------------------
-- Table structure for `ey_form`
-- -----------------------------
DROP TABLE IF EXISTS `ey_form`;
CREATE TABLE `ey_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增表单ID',
  `form_name` varchar(255) NOT NULL DEFAULT '' COMMENT '表单名称',
  `intro` text NOT NULL COMMENT '表单描述，预留',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '表单状态，0关闭，1开启',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单管理表';


-- -----------------------------
-- Table structure for `ey_form_field`
-- -----------------------------
DROP TABLE IF EXISTS `ey_form_field`;
CREATE TABLE `ey_form_field` (
  `field_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增字段ID',
  `form_id` int(11) unsigned DEFAULT '0' COMMENT '表单管理表ID',
  `field_name` varchar(60) DEFAULT '' COMMENT '字段名称',
  `field_type` varchar(32) DEFAULT '' COMMENT '字段类型',
  `field_value` text COMMENT '可选值列表',
  `is_fill` tinyint(1) unsigned DEFAULT '0' COMMENT '是否必填字段，0非必填，1必填，预留',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认字段，0非默认，1默认，预留',
  `sort_order` int(11) unsigned DEFAULT '100' COMMENT '字段排序，预留',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`field_id`),
  KEY `form_id` (`form_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单字段表';


-- -----------------------------
-- Table structure for `ey_form_list`
-- -----------------------------
DROP TABLE IF EXISTS `ey_form_list`;
CREATE TABLE `ey_form_list` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增字段ID',
  `form_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单管理ID',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP所在城市',
  `come_from` varchar(100) NOT NULL DEFAULT '' COMMENT '来源页面标题',
  `come_url` varchar(500) NOT NULL DEFAULT '' COMMENT '来源页面链接',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读，预留',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `aid` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `md5data` varchar(50) DEFAULT '' COMMENT '数据序列化之后的MD5加密，提交内容的唯一性',
  PRIMARY KEY (`list_id`),
  KEY `form_id` (`form_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单数据主表';


-- -----------------------------
-- Table structure for `ey_form_value`
-- -----------------------------
DROP TABLE IF EXISTS `ey_form_value`;
CREATE TABLE `ey_form_value` (
  `value_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增字段ID',
  `list_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单数据主表ID',
  `form_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单管理ID',
  `field_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单字段表ID',
  `field_value` text NOT NULL COMMENT '表单数据内容表字段值',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`value_id`),
  KEY `list_id` (`list_id`) USING BTREE,
  KEY `form_id` (`form_id`) USING BTREE,
  KEY `field_id` (`field_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单数据内容表';


-- -----------------------------
-- Table structure for `ey_guestbook`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook`;
CREATE TABLE `ey_guestbook` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT '0' COMMENT '栏目ID',
  `channel` smallint(5) DEFAULT '0' COMMENT '模型ID',
  `md5data` varchar(50) DEFAULT '' COMMENT '数据序列化之后的MD5加密，提交内容的唯一性',
  `ip` varchar(255) DEFAULT '' COMMENT 'ip地址',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '0=未读，1=已读',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='留言主表';


-- -----------------------------
-- Table structure for `ey_guestbook_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook_attr`;
CREATE TABLE `ey_guestbook_attr` (
  `guest_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言表单id自增',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '留言id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '表单id',
  `attr_value` text COMMENT '表单值',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`guest_attr_id`),
  KEY `attr_id` (`attr_id`) USING BTREE,
  KEY `guest_id` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='留言表单属性值';


-- -----------------------------
-- Table structure for `ey_guestbook_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_guestbook_attribute`;
CREATE TABLE `ey_guestbook_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表单id',
  `attr_name` varchar(60) DEFAULT '' COMMENT '表单名称',
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '栏目ID',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text COMMENT '可选值列表',
  `is_showlist` tinyint(1) DEFAULT '0' COMMENT '在列表显示 0=隐藏，1=显示',
  `required` tinyint(1) DEFAULT '0' COMMENT '必填 0=否，1=是',
  `validate_type` smallint(5) DEFAULT '0' COMMENT '验证格式，0=不验证，1=手机，2=Email',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '表单排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `guest_id` (`typeid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='留言表单属性';

-- -----------------------------
-- Records of `ey_guestbook_attribute`
-- -----------------------------
INSERT INTO `ey_guestbook_attribute` VALUES ('7', '需求', '33', '0', '', '0', '0', '0', '100', 'cn', '0', '1654564069', '1654564069');
INSERT INTO `ey_guestbook_attribute` VALUES ('5', '姓名', '33', '0', '', '0', '1', '0', '100', 'cn', '0', '1654564036', '1654564036');
INSERT INTO `ey_guestbook_attribute` VALUES ('6', '电话号码', '33', '0', '', '0', '1', '0', '100', 'cn', '0', '1654564058', '1654564058');

-- -----------------------------
-- Table structure for `ey_hooks`
-- -----------------------------
DROP TABLE IF EXISTS `ey_hooks`;
CREATE TABLE `ey_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `module` varchar(50) DEFAULT '' COMMENT '钩子挂载的插件',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：0=无效，1=有效',
  `add_time` int(10) DEFAULT NULL,
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件钩子表';


-- -----------------------------
-- Table structure for `ey_images_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_images_content`;
CREATE TABLE `ey_images_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_images_upload`
-- -----------------------------
DROP TABLE IF EXISTS `ey_images_upload`;
CREATE TABLE `ey_images_upload` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '图集ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `intro` varchar(2000) DEFAULT '' COMMENT '图集描述',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` mediumint(8) unsigned DEFAULT '0' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`img_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图集图片表';


-- -----------------------------
-- Table structure for `ey_language`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language`;
CREATE TABLE `ey_language` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID，自增',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '语言名称',
  `mark` varchar(50) NOT NULL DEFAULT '' COMMENT '语言标识（唯一）',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '单独域名(外部链接)',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '新窗口打开，0=否，1=是',
  `is_home_default` tinyint(1) DEFAULT '0' COMMENT '默认前台语言，1=是，0=否',
  `is_admin_default` tinyint(1) DEFAULT '0' COMMENT '默认后台语言，1=是，0=否',
  `syn_pack_id` int(10) DEFAULT '0' COMMENT '最后一次同步官方语言包ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '语言状态，0=关闭，1=开启',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='多语言主表';

-- -----------------------------
-- Records of `ey_language`
-- -----------------------------
INSERT INTO `ey_language` VALUES ('1', '简体中文', 'cn', '', '0', '1', '1', '24', '1', '100', '1541583096', '1543890743');

-- -----------------------------
-- Table structure for `ey_language_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_attr`;
CREATE TABLE `ey_language_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID，自增',
  `attr_name` varchar(200) NOT NULL DEFAULT '' COMMENT '来自ey_weapp_language_attr表的attr_name',
  `attr_value` text NOT NULL COMMENT '变量值',
  `attr_group` varchar(50) DEFAULT '' COMMENT '分组，以表名划分（不含表前缀）',
  `lang` varchar(50) NOT NULL DEFAULT '' COMMENT '所属语言',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `attr_value` (`attr_name`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多语言模板变量关联绑定表';


-- -----------------------------
-- Table structure for `ey_language_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_attribute`;
CREATE TABLE `ey_language_attribute` (
  `attr_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID，自增',
  `attr_title` varchar(200) NOT NULL DEFAULT '' COMMENT '变量标题',
  `attr_name` varchar(200) NOT NULL DEFAULT '' COMMENT '变量名称',
  `attr_group` varchar(50) DEFAULT '' COMMENT '分组，以表名划分（不含表前缀）',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，0=否，1=是',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='多语言模板变量表';


-- -----------------------------
-- Table structure for `ey_language_mark`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_mark`;
CREATE TABLE `ey_language_mark` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '国家语言名称',
  `cn_title` varchar(50) NOT NULL DEFAULT '' COMMENT '中文名称',
  `mark` varchar(50) DEFAULT '' COMMENT '多语言标识',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `sort_order` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='国家语言表';

-- -----------------------------
-- Records of `ey_language_mark`
-- -----------------------------
INSERT INTO `ey_language_mark` VALUES ('1', '简体中文', '简体中文', 'cn', 'zhongwenjianti', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('2', 'Vietnamese', '越南语', 'vi', 'yuenanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('3', '繁体中文', '繁体中文', 'zh', 'zhongwenfanti', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('4', 'English', '英语', 'en', 'yingyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('5', 'Indonesian', '印尼语', 'id', 'yinniyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('6', 'Urdu', '乌尔都语', 'ur', 'wuerduyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('7', 'Yiddish', '意第绪语', 'yi', 'yidixuyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('8', 'Italian', '意大利语', 'it', 'yidaliyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('9', 'Greek', '希腊语', 'el', 'xilayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('10', 'Spanish Basque', '西班牙的巴斯克语', 'eu', 'xibanyadebasikeyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('11', 'Spanish', '西班牙语', 'es', 'xibanyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('12', 'Hungarian', '匈牙利语', 'hu', 'xiongyaliyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('13', 'Hebrew', '希伯来语', 'iw', 'xibolaiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('14', 'Ukrainian', '乌克兰语', 'uk', 'wukelanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('15', 'Welsh', '威尔士语', 'cy', 'weiershiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('16', 'Thai', '泰语', 'th', 'taiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('17', 'Turkish', '土耳其语', 'tr', 'tuerqiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('18', 'Swahili', '斯瓦希里语', 'sw', 'siwaxiliyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('19', 'Japanese', '日语', 'ja', 'riyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('20', 'Swedish', '瑞典语', 'sv', 'ruidianyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('21', 'Serbian', '塞尔维亚语', 'sr', 'saierweiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('22', 'Slovak', '斯洛伐克语', 'sk', 'siluofakeyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('23', 'Slovenian', '斯洛文尼亚语', 'sl', 'siluowenniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('24', 'Portuguese', '葡萄牙语', 'pt', 'putaoyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('25', 'Norwegian', '挪威语', 'no', 'nuoweiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('26', 'Macedonian', '马其顿语', 'mk', 'maqidunyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('27', 'Malay', '马来语', 'ms', 'malaiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('28', 'Maltese', '马耳他语', 'mt', 'maertayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('29', 'Romanian', '罗马尼亚语', 'ro', 'luomaniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('30', 'Lithuanian', '立陶宛语', 'lt', 'litaowanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('31', 'Latvian', '拉脱维亚语', 'lv', 'latuoweiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('32', 'Latin', '拉丁语', 'la', 'ladingyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('33', 'Croatian', '克罗地亚语', 'hr', 'keluodiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('34', 'Czech', '捷克语', 'cs', 'jiekeyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('35', 'Catalan', '加泰罗尼亚语', 'ca', 'jiatailuoniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('36', 'Galician', '加利西亚语', 'gl', 'jialixiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('37', 'Dutch', '荷兰语', 'nl', 'helanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('38', 'Korean', '韩语', 'ko', 'hanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('39', 'Haitian Creole', '海地克里奥尔语', 'ht', 'haidikeliaoeryu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('40', 'Finnish', '芬兰语', 'fi', 'fenlanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('41', 'Filipino', '菲律宾语', 'tl', 'feilvbinyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('42', 'Russian', '俄语', 'ru', 'eyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('43', 'Boolean (Afrikaans)', '布尔语(南非荷兰语)', 'af', 'bueryunanfeihelanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('44', 'French', '法语', 'fr', 'fayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('45', 'Danish', '丹麦语', 'da', 'danmaiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('46', 'German', '德语', 'de', 'deyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('47', 'Azerbaijani', '阿塞拜疆语', 'az', 'asaibaijiangyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('48', 'Irish', '爱尔兰语', 'ga', 'aierlanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('49', 'Estonian', '爱沙尼亚语', 'et', 'aishaniyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('50', 'Belarusian', '白俄罗斯语', 'be', 'baieluosiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('51', 'Bulgarian', '保加利亚语', 'bg', 'baojialiyayu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('52', 'Icelandic', '冰岛语', 'is', 'bingdaoyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('53', 'Polish', '波兰语', 'pl', 'bolanyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('54', 'Persian', '波斯语', 'fa', 'bosiyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('55', 'Arabic', '阿拉伯语', 'ar', 'alaboyu', '100', '0', '1541583096');
INSERT INTO `ey_language_mark` VALUES ('56', 'Albanian', '阿尔巴尼亚语', 'sq', 'aerbaniyayu', '100', '0', '1541583096');

-- -----------------------------
-- Table structure for `ey_language_pack`
-- -----------------------------
DROP TABLE IF EXISTS `ey_language_pack`;
CREATE TABLE `ey_language_pack` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '变量名',
  `value` text NOT NULL COMMENT '变量值',
  `is_syn` tinyint(1) DEFAULT '0' COMMENT '同步官方语言包：0=否，1=是',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='模板语言包变量';

-- -----------------------------
-- Records of `ey_language_pack`
-- -----------------------------
INSERT INTO `ey_language_pack` VALUES ('1', 'sys1', '首页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('2', 'sys2', '上一页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('3', 'sys3', '下一页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('4', 'sys4', '末页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('5', 'sys5', '共<strong>%s</strong>页 <strong>%s</strong>条', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('6', 'sys6', '全部', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('7', 'sys7', '搜索', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('8', 'sys8', '查看详情', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('9', 'sys9', '网站首页', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('10', 'sys10', '暂无', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('11', 'sys11', '上一篇', '1', 'cn', '100', '1543890216', '1543890216');
INSERT INTO `ey_language_pack` VALUES ('12', 'sys12', '下一篇', '1', 'cn', '100', '1543890216', '1543890216');

-- -----------------------------
-- Table structure for `ey_links`
-- -----------------------------
DROP TABLE IF EXISTS `ey_links`;
CREATE TABLE `ey_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(1) DEFAULT '1' COMMENT '类型：1=文字链接，2=图片链接',
  `groupid` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '分组id， 默认分组值为1',
  `title` varchar(50) DEFAULT '' COMMENT '网站标题',
  `url` varchar(100) DEFAULT '' COMMENT '网站地址',
  `logo` varchar(255) DEFAULT '' COMMENT '网站LOGO',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序号',
  `target` tinyint(1) DEFAULT '0' COMMENT '是否开启浏览器新窗口',
  `nofollow` tinyint(1) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `intro` text COMMENT '网站简况',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1=显示，0=屏蔽)',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `delete_time` int(11) DEFAULT '0' COMMENT '软删除时间',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- -----------------------------
-- Records of `ey_links`
-- -----------------------------
INSERT INTO `ey_links` VALUES ('2', '1', '1', '百度', 'http://www.baidu.com/', '', '1', '0', '0', '', '', '1', 'cn', '0', '1226375403', '1653999987');
INSERT INTO `ey_links` VALUES ('8', '1', '1', '淘宝', 'http://www.taobao.com/', '', '1', '0', '0', '', '', '1', 'cn', '0', '1227772703', '1653999999');
INSERT INTO `ey_links` VALUES ('9', '1', '1', '天猫', 'http://www.tmall.com/', '', '1', '0', '0', '', '', '1', 'cn', '0', '1227772717', '1654000009');

-- -----------------------------
-- Table structure for `ey_links_group`
-- -----------------------------
DROP TABLE IF EXISTS `ey_links_group`;
CREATE TABLE `ey_links_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分组名称',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态(1=显示，0=屏蔽)',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='友情链接分组';

-- -----------------------------
-- Records of `ey_links_group`
-- -----------------------------
INSERT INTO `ey_links_group` VALUES ('1', '综合网站', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('2', '娱乐类', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('3', '教育类', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('4', '计算机类', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('5', '电子商务', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('6', '网上信息', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('7', '论坛类', '1', '100', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_links_group` VALUES ('8', '其它类型', '1', '100', 'cn', '1653996665', '1653996665');

-- -----------------------------
-- Table structure for `ey_media_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_media_content`;
CREATE TABLE `ey_media_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `courseware` varchar(200) NOT NULL DEFAULT '' COMMENT '课件地址',
  `courseware_free` enum('免费','收费') NOT NULL DEFAULT '免费' COMMENT '课件收费',
  `total_duration` int(10) NOT NULL DEFAULT '0' COMMENT '视频总时长',
  `total_video` int(10) NOT NULL DEFAULT '0' COMMENT '视频数',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频附加表';


-- -----------------------------
-- Table structure for `ey_media_file`
-- -----------------------------
DROP TABLE IF EXISTS `ey_media_file`;
CREATE TABLE `ey_media_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '视频模型文件表',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '文档标题',
  `file_name` varchar(200) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_title` varchar(200) NOT NULL DEFAULT '' COMMENT '选集标题',
  `file_url` text NOT NULL COMMENT '存储路径',
  `file_time` int(8) NOT NULL DEFAULT '0' COMMENT '文件时长',
  `file_ext` varchar(50) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `file_size` varchar(255) NOT NULL DEFAULT '' COMMENT '文件大小',
  `file_mime` varchar(200) NOT NULL DEFAULT '' COMMENT '文件类型',
  `uhash` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义的一种加密方式，用于视频播放的权限验证',
  `md5file` varchar(200) NOT NULL DEFAULT '' COMMENT 'md5_file加密，可以检测上传/播放的视频文件是否损坏',
  `is_remote` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否远程 1-远程',
  `playcount` int(10) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `gratis` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否试看，0不试看，1试看',
  `sort_order` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频附件表';


-- -----------------------------
-- Table structure for `ey_media_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_media_log`;
CREATE TABLE `ey_media_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `users_id` int(10) DEFAULT '0' COMMENT '用户ID',
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `file_id` int(10) DEFAULT '0' COMMENT '视频ID',
  `ip` varchar(20) DEFAULT '' COMMENT 'ip',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`log_id`),
  KEY `file_id` (`file_id`,`aid`,`users_id`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频日志表';


-- -----------------------------
-- Table structure for `ey_media_order`
-- -----------------------------
DROP TABLE IF EXISTS `ey_media_order`;
CREATE TABLE `ey_media_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '媒体订单ID',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '媒体订单编号',
  `users_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0未付款，1已付款',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单应付总金额',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_name` varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `wechat_pay_type` varchar(20) NOT NULL DEFAULT '' COMMENT '微信支付时，标记使用的支付类型（扫码支付，微信内部，微信H5页面）',
  `pay_details` text COMMENT '支付时返回的数据，以serialize序列化后存入，用于后续查询。',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频文档ID',
  `product_name` varchar(100) DEFAULT '' COMMENT '视频文档名称',
  `product_litpic` varchar(500) DEFAULT '' COMMENT '视频文档封面图片',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_code` (`order_code`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频订单表';


-- -----------------------------
-- Table structure for `ey_media_play_record`
-- -----------------------------
DROP TABLE IF EXISTS `ey_media_play_record`;
CREATE TABLE `ey_media_play_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) DEFAULT '0' COMMENT '用户id',
  `aid` int(10) DEFAULT '0' COMMENT '课程id',
  `file_id` int(10) DEFAULT '0' COMMENT '文件id',
  `play_time` int(10) DEFAULT '0' COMMENT '播放时间',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='视频播放时长表';


-- -----------------------------
-- Table structure for `ey_nav_list`
-- -----------------------------
DROP TABLE IF EXISTS `ey_nav_list`;
CREATE TABLE `ey_nav_list` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `nav_name` varchar(200) NOT NULL DEFAULT '' COMMENT '导航名称',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `topid` int(10) NOT NULL DEFAULT '0' COMMENT '顶级菜单id',
  `en_name` varchar(200) NOT NULL DEFAULT '' COMMENT '英文名称',
  `nav_url` varchar(200) NOT NULL DEFAULT '' COMMENT '导航链接',
  `position_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航位置',
  `arctype_sync` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否与栏目同步',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同步栏目的ID',
  `nav_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '导航图片',
  `is_remote` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否远程图片',
  `target` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否打开新窗口，1=是，0=否',
  `nofollow` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用nofollow，1=是，0=否',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用 (1=正常，0=停用)',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '100' COMMENT '排序号',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`nav_id`) USING BTREE,
  KEY `position_id` (`position_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航列表';


-- -----------------------------
-- Table structure for `ey_nav_position`
-- -----------------------------
DROP TABLE IF EXISTS `ey_nav_position`;
CREATE TABLE `ey_nav_position` (
  `position_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '导航列表ID',
  `position_name` varchar(200) DEFAULT '' COMMENT '导航列表名称',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='导航位置表';

-- -----------------------------
-- Records of `ey_nav_position`
-- -----------------------------
INSERT INTO `ey_nav_position` VALUES ('1', 'PC端主导航', '100', '0', '0', '1624861478');
INSERT INTO `ey_nav_position` VALUES ('2', 'PC端顶部导航', '100', '0', '0', '1624861478');
INSERT INTO `ey_nav_position` VALUES ('3', 'PC端中部导航', '100', '0', '0', '1624861478');
INSERT INTO `ey_nav_position` VALUES ('4', 'PC端底部导航', '100', '0', '0', '1624861478');
INSERT INTO `ey_nav_position` VALUES ('5', '移动端中部导航', '100', '0', '0', '1624861478');
INSERT INTO `ey_nav_position` VALUES ('6', '移动端底部导航', '100', '0', '0', '1624861478');

-- -----------------------------
-- Table structure for `ey_pay_api_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_pay_api_config`;
CREATE TABLE `ey_pay_api_config` (
  `pay_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付接口配置ID，自增',
  `pay_name` varchar(64) NOT NULL DEFAULT '' COMMENT '支付接口配置名称，微信支付，支付宝支付...',
  `pay_mark` varchar(64) NOT NULL DEFAULT '' COMMENT '支付接口配置标识，wechat，alipay...',
  `pay_info` text NOT NULL COMMENT '支付接口配置信息，数组以序列化存储',
  `pay_terminal` varchar(100) NOT NULL DEFAULT '' COMMENT '支付时的终端，暂时预留',
  `system_built` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否属于系统内置，0否，1是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0=关闭，1=开启)',
  `lang` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='支付接口配置表';

-- -----------------------------
-- Records of `ey_pay_api_config`
-- -----------------------------
INSERT INTO `ey_pay_api_config` VALUES ('1', '微信支付', 'wechat', '', 'a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}', '1', '1', 'cn', '1590111253', '1590661409');
INSERT INTO `ey_pay_api_config` VALUES ('2', '支付宝支付', 'alipay', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', '1', '1', 'cn', '1590111253', '1590662059');

-- -----------------------------
-- Table structure for `ey_product_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_attr`;
CREATE TABLE `ey_product_attr` (
  `product_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品属性id自增',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text COMMENT '属性值',
  `attr_price` varchar(255) DEFAULT '' COMMENT '属性价格',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`product_attr_id`),
  KEY `aid` (`aid`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品表单属性值';


-- -----------------------------
-- Table structure for `ey_product_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_attribute`;
CREATE TABLE `ey_product_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) DEFAULT '' COMMENT '属性名称',
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '栏目id',
  `attr_index` tinyint(1) unsigned DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_input_type` tinyint(1) unsigned DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text COMMENT '可选值列表',
  `sort_order` int(11) unsigned DEFAULT '0' COMMENT '属性排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`typeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品表单属性表';


-- -----------------------------
-- Table structure for `ey_product_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_content`;
CREATE TABLE `ey_product_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `news_id` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资讯内容表_存储正常内容';


-- -----------------------------
-- Table structure for `ey_product_img`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_img`;
CREATE TABLE `ey_product_img` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `title` varchar(200) DEFAULT '' COMMENT '产品标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `intro` varchar(2000) DEFAULT '' COMMENT '图集描述',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` varchar(255) DEFAULT '' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `sort_order` smallint(5) DEFAULT '0' COMMENT '排序',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`img_id`),
  KEY `arcid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品图片表';


-- -----------------------------
-- Table structure for `ey_product_netdisk`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_netdisk`;
CREATE TABLE `ey_product_netdisk` (
  `nd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '网盘商品id',
  `aid` int(10) DEFAULT '0' COMMENT '产品ID',
  `netdisk_url` varchar(255) NOT NULL DEFAULT '' COMMENT '网盘地址',
  `netdisk_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '提取码',
  `unzip_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '解压密码',
  `text_content` text NOT NULL COMMENT '文本内容',
  `lang` varchar(10) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`nd_id`) USING BTREE,
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品虚拟表';


-- -----------------------------
-- Table structure for `ey_product_spec_data`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_spec_data`;
CREATE TABLE `ey_product_spec_data` (
  `spec_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(10) DEFAULT '0' COMMENT '产品ID',
  `spec_mark_id` int(10) DEFAULT '0' COMMENT '规格标记ID',
  `spec_name` varchar(100) DEFAULT '' COMMENT '规格名称',
  `spec_value_id` int(10) DEFAULT '0' COMMENT '规格值ID',
  `spec_value` varchar(100) DEFAULT '' COMMENT '规格值',
  `spec_is_select` tinyint(1) DEFAULT '0' COMMENT '是否选中（0=否，1=是）',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`spec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品规格数据表';


-- -----------------------------
-- Table structure for `ey_product_spec_preset`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_spec_preset`;
CREATE TABLE `ey_product_spec_preset` (
  `preset_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `preset_mark_id` int(10) DEFAULT '0' COMMENT '预设参数标记ID',
  `preset_name` varchar(100) DEFAULT '' COMMENT '规格名称',
  `preset_value` varchar(100) DEFAULT '' COMMENT '规格值',
  `spec_sync` tinyint(1) unsigned DEFAULT '0' COMMENT '是否同步到已发布的商品规格：0否，1是。',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`preset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品规格预设表';

-- -----------------------------
-- Records of `ey_product_spec_preset`
-- -----------------------------
INSERT INTO `ey_product_spec_preset` VALUES ('1', '1', '产品颜色', '红', '0', '100', 'cn', '1565752372', '1565752623');
INSERT INTO `ey_product_spec_preset` VALUES ('2', '1', '产品颜色', '蓝', '0', '100', 'cn', '1565752372', '1565752623');
INSERT INTO `ey_product_spec_preset` VALUES ('3', '1', '产品颜色', '黄', '0', '100', 'cn', '1565752372', '1565752623');

-- -----------------------------
-- Table structure for `ey_product_spec_value`
-- -----------------------------
DROP TABLE IF EXISTS `ey_product_spec_value`;
CREATE TABLE `ey_product_spec_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `aid` int(10) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `spec_value_id` varchar(100) NOT NULL DEFAULT '' COMMENT '规格值ID',
  `spec_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '规格价格',
  `spec_stock` int(10) NOT NULL DEFAULT '0' COMMENT '规格库存',
  `spec_sales_num` int(10) NOT NULL DEFAULT '0' COMMENT '销售量',
  `seckill_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '秒杀价格',
  `seckill_stock` int(10) NOT NULL DEFAULT '0' COMMENT '秒杀库存(独立库存，与spec_stock/限时折扣库存不同步)',
  `seckill_sales_num` int(10) NOT NULL DEFAULT '0' COMMENT '秒杀销售量',
  `is_seckill` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-普通 1-秒杀',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '限时折扣价格',
  `discount_stock` int(10) NOT NULL DEFAULT '0' COMMENT '限时折扣库存(独立库存，与spec_stock/秒杀库存不同步)',
  `discount_sales_num` int(10) NOT NULL DEFAULT '0' COMMENT '限时折扣销售量',
  `is_discount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-普通 1-限时折扣',
  PRIMARY KEY (`value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品多规格组装表';


-- -----------------------------
-- Table structure for `ey_quickentry`
-- -----------------------------
DROP TABLE IF EXISTS `ey_quickentry`;
CREATE TABLE `ey_quickentry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT '' COMMENT '名称',
  `laytext` varchar(50) DEFAULT '' COMMENT '完整标题',
  `type` smallint(5) DEFAULT '0' COMMENT '归类，1=快捷入口，2=内容统计',
  `controller` varchar(20) DEFAULT '' COMMENT '控制器名',
  `action` varchar(20) DEFAULT '' COMMENT '操作名',
  `vars` varchar(100) DEFAULT '' COMMENT 'URL参数字符串',
  `groups` smallint(5) DEFAULT '0' COMMENT '分组，1=模型',
  `checked` tinyint(4) DEFAULT '0' COMMENT '选中，0=否，1=是',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1=有效，0=无效',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='快捷入口表';

-- -----------------------------
-- Records of `ey_quickentry`
-- -----------------------------
INSERT INTO `ey_quickentry` VALUES ('1', '产品', '产品列表', '1', 'Product', 'index', 'channel=2', '1', '0', '1', '3', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('2', '下载', '下载列表', '1', 'Download', 'index', 'channel=4', '1', '0', '1', '4', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('3', '文章', '文章列表', '1', 'Article', 'index', 'channel=1', '1', '0', '1', '6', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('4', '图集', '图集列表', '1', 'Images', 'index', 'channel=3', '1', '0', '1', '7', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('5', '内容管理', '内容列表', '1', 'Archives', 'index', '', '0', '0', '1', '13', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('7', '回收站', '回收站', '1', 'RecycleBin', 'archives_index', '', '0', '1', '1', '4', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('8', '栏目管理', '栏目管理', '1', 'Arctype', 'index', '', '0', '0', '1', '5', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('9', '留言', '留言列表', '1', 'Guestbook', 'index', 'channel=8', '1', '0', '1', '6', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('10', '网站信息', '网站信息', '1', 'System', 'web', '', '0', '0', '1', '7', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('11', '水印配置', '水印配置', '1', 'System', 'water', '', '0', '1', '1', '8', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('12', '缩略图配置', '缩略图配置', '1', 'System', 'thumb', '', '0', '1', '1', '9', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('13', '数据备份', '数据备份', '1', 'Tools', 'index', '', '0', '0', '1', '11', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('14', 'URL配置', 'URL配置', '1', 'Seo', 'seo', '', '0', '1', '1', '1', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('15', '模板管理', '模板管理', '1', 'Filemanager', 'index', '', '0', '1', '1', '6', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('16', 'SiteMap', 'SiteMap', '1', 'Sitemap', 'index', '', '0', '1', '1', '12', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('17', '频道模型', '频道模型', '1', 'Channeltype', 'index', '', '0', '1', '1', '2', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('18', '广告管理', '广告管理', '1', 'AdPosition', 'index', '', '0', '0', '1', '3', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('19', '友情链接', '友情链接', '1', 'Links', 'index', '', '0', '0', '1', '10', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('20', 'Tags管理', 'Tags管理', '1', 'Tags', 'index', '', '0', '1', '1', '14', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('21', '管理员管理', '管理员管理', '1', 'Admin', 'index', '', '0', '0', '1', '15', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('22', '接口配置', '接口配置', '1', 'System', 'api_conf', '', '0', '1', '1', '16', '1569232484', '1571893529');
INSERT INTO `ey_quickentry` VALUES ('23', '文章', '文章列表', '2', 'Article', 'index', 'channel=1', '1', '1', '1', '1', '1569310798', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('24', '产品', '产品列表', '2', 'Product', 'index', 'channel=2', '1', '0', '1', '2', '1569310798', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('25', '下载', '下载列表', '2', 'Download', 'index', 'channel=4', '1', '0', '1', '4', '1569310798', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('26', '图集', '图集列表', '2', 'Images', 'index', 'channel=3', '1', '0', '1', '3', '1569310798', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('27', '留言', '留言列表', '2', 'Guestbook', 'index', 'channel=8', '1', '0', '1', '5', '1569310798', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('28', '广告', '广告管理', '2', 'AdPosition', 'index', '', '0', '1', '1', '8', '1569232484', '1571898872');
INSERT INTO `ey_quickentry` VALUES ('29', '友情链接', '友情链接', '2', 'Links', 'index', '', '0', '1', '1', '9', '1569232484', '1571898872');
INSERT INTO `ey_quickentry` VALUES ('30', 'Tags标签', 'Tags管理', '2', 'Tags', 'index', '', '0', '1', '1', '10', '1569232484', '1571898872');
INSERT INTO `ey_quickentry` VALUES ('31', '会员', '会员管理', '2', 'Member', 'users_index', '', '0', '0', '0', '7', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('32', '插件应用', '插件应用', '1', 'Weapp', 'index', '', '0', '0', '0', '17', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('33', '会员中心', '会员中心', '1', 'Member', 'users_index', '', '0', '0', '0', '18', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('34', '商城中心', '商城中心', '1', 'Shop', 'index', '', '0', '0', '0', '19', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('35', '订单', '订单管理', '2', 'Shop', 'index', '', '0', '0', '0', '6', '1569232484', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('37', '专题', '专题列表', '2', 'Special', 'index', 'channel=7', '1', '0', '0', '7', '1600078966', '1654567245');
INSERT INTO `ey_quickentry` VALUES ('39', '视频', '视频列表', '2', 'Media', 'index', 'channel=5', '1', '0', '0', '4', '1569310798', '1654567245');

-- -----------------------------
-- Table structure for `ey_region`
-- -----------------------------
DROP TABLE IF EXISTS `ey_region`;
CREATE TABLE `ey_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(32) DEFAULT '' COMMENT '地区名称',
  `level` tinyint(4) DEFAULT '0' COMMENT '地区等级 分省市县区',
  `parent_id` int(10) DEFAULT '0' COMMENT '父id',
  `initial` varchar(5) DEFAULT '' COMMENT '首字母',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `initial` (`initial`)
) ENGINE=MyISAM AUTO_INCREMENT=47964 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- -----------------------------
-- Records of `ey_region`
-- -----------------------------
INSERT INTO `ey_region` VALUES ('1', '北京市', '1', '0', 'B');
INSERT INTO `ey_region` VALUES ('2', '北京市', '2', '1', 'B');
INSERT INTO `ey_region` VALUES ('3', '东城区', '3', '2', 'D');
INSERT INTO `ey_region` VALUES ('14', '西城区', '3', '2', 'X');
INSERT INTO `ey_region` VALUES ('22', '崇文区', '3', '2', 'C');
INSERT INTO `ey_region` VALUES ('30', '宣武区', '3', '2', 'X');
INSERT INTO `ey_region` VALUES ('39', '朝阳区', '3', '2', 'C');
INSERT INTO `ey_region` VALUES ('83', '丰台区', '3', '2', 'F');
INSERT INTO `ey_region` VALUES ('105', '石景山区', '3', '2', 'S');
INSERT INTO `ey_region` VALUES ('115', '海淀区', '3', '2', 'H');
INSERT INTO `ey_region` VALUES ('145', '门头沟区', '3', '2', 'M');
INSERT INTO `ey_region` VALUES ('159', '房山区', '3', '2', 'F');
INSERT INTO `ey_region` VALUES ('188', '通州区', '3', '2', 'T');
INSERT INTO `ey_region` VALUES ('204', '顺义区', '3', '2', 'S');
INSERT INTO `ey_region` VALUES ('227', '昌平区', '3', '2', 'C');
INSERT INTO `ey_region` VALUES ('245', '大兴区', '3', '2', 'D');
INSERT INTO `ey_region` VALUES ('264', '怀柔区', '3', '2', 'H');
INSERT INTO `ey_region` VALUES ('281', '平谷区', '3', '2', 'P');
INSERT INTO `ey_region` VALUES ('301', '密云区', '3', '2', 'M');
INSERT INTO `ey_region` VALUES ('322', '延庆区', '3', '2', 'Y');
INSERT INTO `ey_region` VALUES ('338', '天津市', '1', '0', 'T');
INSERT INTO `ey_region` VALUES ('339', '天津市', '2', '338', 'T');
INSERT INTO `ey_region` VALUES ('340', '和平区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('347', '河东区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('361', '河西区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('375', '南开区', '3', '339', 'N');
INSERT INTO `ey_region` VALUES ('388', '河北区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('399', '红桥区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('410', '塘沽区', '3', '339', 'T');
INSERT INTO `ey_region` VALUES ('425', '汉沽区', '3', '339', 'H');
INSERT INTO `ey_region` VALUES ('435', '大港区', '3', '339', 'D');
INSERT INTO `ey_region` VALUES ('445', '东丽区', '3', '339', 'D');
INSERT INTO `ey_region` VALUES ('460', '西青区', '3', '339', 'X');
INSERT INTO `ey_region` VALUES ('473', '津南区', '3', '339', 'J');
INSERT INTO `ey_region` VALUES ('488', '北辰区', '3', '339', 'B');
INSERT INTO `ey_region` VALUES ('504', '武清区', '3', '339', 'W');
INSERT INTO `ey_region` VALUES ('538', '宝坻区', '3', '339', 'B');
INSERT INTO `ey_region` VALUES ('570', '宁河区', '3', '339', 'N');
INSERT INTO `ey_region` VALUES ('586', '静海区', '3', '339', 'J');
INSERT INTO `ey_region` VALUES ('608', '蓟州区', '3', '339', 'J');
INSERT INTO `ey_region` VALUES ('636', '河北省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('637', '石家庄市', '2', '636', 'S');
INSERT INTO `ey_region` VALUES ('638', '市辖区', '3', '637', 'S');
INSERT INTO `ey_region` VALUES ('639', '长安区', '3', '637', 'C');
INSERT INTO `ey_region` VALUES ('651', '桥东区', '3', '637', 'Q');
INSERT INTO `ey_region` VALUES ('662', '桥西区', '3', '637', 'Q');
INSERT INTO `ey_region` VALUES ('675', '新华区', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('691', '井陉矿区', '3', '637', 'J');
INSERT INTO `ey_region` VALUES ('697', '裕华区', '3', '637', 'Y');
INSERT INTO `ey_region` VALUES ('708', '井陉县', '3', '637', 'J');
INSERT INTO `ey_region` VALUES ('726', '正定县', '3', '637', 'Z');
INSERT INTO `ey_region` VALUES ('736', '栾城县', '3', '637', 'L');
INSERT INTO `ey_region` VALUES ('745', '行唐县', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('761', '灵寿县', '3', '637', 'L');
INSERT INTO `ey_region` VALUES ('777', '高邑县', '3', '637', 'G');
INSERT INTO `ey_region` VALUES ('783', '深泽县', '3', '637', 'S');
INSERT INTO `ey_region` VALUES ('790', '赞皇县', '3', '637', 'Z');
INSERT INTO `ey_region` VALUES ('802', '无极县', '3', '637', 'W');
INSERT INTO `ey_region` VALUES ('814', '平山县', '3', '637', 'P');
INSERT INTO `ey_region` VALUES ('838', '元氏县', '3', '637', 'Y');
INSERT INTO `ey_region` VALUES ('854', '赵县', '3', '637', 'Z');
INSERT INTO `ey_region` VALUES ('866', '辛集市', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('882', '藁城市', '3', '637', 'G');
INSERT INTO `ey_region` VALUES ('898', '晋州市', '3', '637', 'J');
INSERT INTO `ey_region` VALUES ('909', '新乐市', '3', '637', 'X');
INSERT INTO `ey_region` VALUES ('922', '鹿泉市', '3', '637', 'L');
INSERT INTO `ey_region` VALUES ('936', '唐山市', '2', '636', 'T');
INSERT INTO `ey_region` VALUES ('937', '市辖区', '3', '936', 'S');
INSERT INTO `ey_region` VALUES ('938', '路南区', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('952', '路北区', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('965', '古冶区', '3', '936', 'G');
INSERT INTO `ey_region` VALUES ('977', '开平区', '3', '936', 'K');
INSERT INTO `ey_region` VALUES ('989', '丰南区', '3', '936', 'F');
INSERT INTO `ey_region` VALUES ('1007', '丰润区', '3', '936', 'F');
INSERT INTO `ey_region` VALUES ('1034', '滦县', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('1048', '滦南县', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('1067', '乐亭县', '3', '936', 'L');
INSERT INTO `ey_region` VALUES ('1085', '迁西县', '3', '936', 'Q');
INSERT INTO `ey_region` VALUES ('1104', '玉田县', '3', '936', 'Y');
INSERT INTO `ey_region` VALUES ('1125', '唐海县', '3', '936', 'T');
INSERT INTO `ey_region` VALUES ('1140', '遵化市', '3', '936', 'Z');
INSERT INTO `ey_region` VALUES ('1168', '迁安市', '3', '936', 'Q');
INSERT INTO `ey_region` VALUES ('1188', '秦皇岛市', '2', '636', 'Q');
INSERT INTO `ey_region` VALUES ('1189', '市辖区', '3', '1188', 'S');
INSERT INTO `ey_region` VALUES ('1190', '海港区', '3', '1188', 'H');
INSERT INTO `ey_region` VALUES ('1208', '山海关区', '3', '1188', 'S');
INSERT INTO `ey_region` VALUES ('1218', '北戴河区', '3', '1188', 'B');
INSERT INTO `ey_region` VALUES ('1223', '青龙县', '3', '1188', 'Q');
INSERT INTO `ey_region` VALUES ('1249', '昌黎县', '3', '1188', 'C');
INSERT INTO `ey_region` VALUES ('1266', '抚宁县', '3', '1188', 'F');
INSERT INTO `ey_region` VALUES ('1278', '卢龙县', '3', '1188', 'L');
INSERT INTO `ey_region` VALUES ('1291', '邯郸市', '2', '636', 'H');
INSERT INTO `ey_region` VALUES ('1292', '市辖区', '3', '1291', 'S');
INSERT INTO `ey_region` VALUES ('1293', '邯山区', '3', '1291', 'H');
INSERT INTO `ey_region` VALUES ('1307', '丛台区', '3', '1291', 'C');
INSERT INTO `ey_region` VALUES ('1319', '复兴区', '3', '1291', 'F');
INSERT INTO `ey_region` VALUES ('1329', '峰峰矿区', '3', '1291', 'F');
INSERT INTO `ey_region` VALUES ('1339', '邯郸县', '3', '1291', 'H');
INSERT INTO `ey_region` VALUES ('1350', '临漳县', '3', '1291', 'L');
INSERT INTO `ey_region` VALUES ('1365', '成安县', '3', '1291', 'C');
INSERT INTO `ey_region` VALUES ('1375', '大名县', '3', '1291', 'D');
INSERT INTO `ey_region` VALUES ('1396', '涉县', '3', '1291', 'S');
INSERT INTO `ey_region` VALUES ('1414', '磁县', '3', '1291', 'C');
INSERT INTO `ey_region` VALUES ('1434', '肥乡县', '3', '1291', 'F');
INSERT INTO `ey_region` VALUES ('1444', '永年县', '3', '1291', 'Y');
INSERT INTO `ey_region` VALUES ('1465', '邱县', '3', '1291', 'Q');
INSERT INTO `ey_region` VALUES ('1473', '鸡泽县', '3', '1291', 'J');
INSERT INTO `ey_region` VALUES ('1481', '广平县', '3', '1291', 'G');
INSERT INTO `ey_region` VALUES ('1489', '馆陶县', '3', '1291', 'G');
INSERT INTO `ey_region` VALUES ('1498', '魏县', '3', '1291', 'W');
INSERT INTO `ey_region` VALUES ('1520', '曲周县', '3', '1291', 'Q');
INSERT INTO `ey_region` VALUES ('1531', '武安市', '3', '1291', 'W');
INSERT INTO `ey_region` VALUES ('1554', '邢台市', '2', '636', 'X');
INSERT INTO `ey_region` VALUES ('1555', '市辖区', '3', '1554', 'S');
INSERT INTO `ey_region` VALUES ('1556', '桥东区', '3', '1554', 'Q');
INSERT INTO `ey_region` VALUES ('1564', '桥西区', '3', '1554', 'Q');
INSERT INTO `ey_region` VALUES ('1572', '邢台县', '3', '1554', 'X');
INSERT INTO `ey_region` VALUES ('1593', '临城县', '3', '1554', 'L');
INSERT INTO `ey_region` VALUES ('1602', '内邱县', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1612', '柏乡县', '3', '1554', 'B');
INSERT INTO `ey_region` VALUES ('1619', '隆尧县', '3', '1554', 'L');
INSERT INTO `ey_region` VALUES ('1633', '任县', '3', '1554', 'R');
INSERT INTO `ey_region` VALUES ('1642', '南和县', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1651', '宁晋县', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1669', '巨鹿县', '3', '1554', 'J');
INSERT INTO `ey_region` VALUES ('1680', '新河县', '3', '1554', 'X');
INSERT INTO `ey_region` VALUES ('1687', '广宗县', '3', '1554', 'G');
INSERT INTO `ey_region` VALUES ('1696', '平乡县', '3', '1554', 'P');
INSERT INTO `ey_region` VALUES ('1704', '威县', '3', '1554', 'W');
INSERT INTO `ey_region` VALUES ('1721', '清河县', '3', '1554', 'Q');
INSERT INTO `ey_region` VALUES ('1728', '临西县', '3', '1554', 'L');
INSERT INTO `ey_region` VALUES ('1738', '南宫市', '3', '1554', 'N');
INSERT INTO `ey_region` VALUES ('1754', '沙河市', '3', '1554', 'S');
INSERT INTO `ey_region` VALUES ('1772', '保定市', '2', '636', 'B');
INSERT INTO `ey_region` VALUES ('1773', '市辖区', '3', '1772', 'S');
INSERT INTO `ey_region` VALUES ('1774', '新市区', '3', '1772', 'X');
INSERT INTO `ey_region` VALUES ('1787', '北市区', '3', '1772', 'B');
INSERT INTO `ey_region` VALUES ('1796', '南市区', '3', '1772', 'N');
INSERT INTO `ey_region` VALUES ('1806', '满城区', '3', '1772', 'M');
INSERT INTO `ey_region` VALUES ('1820', '清苑区', '3', '1772', 'Q');
INSERT INTO `ey_region` VALUES ('1839', '涞水县', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('1856', '阜平县', '3', '1772', 'F');
INSERT INTO `ey_region` VALUES ('1870', '徐水区', '3', '1772', 'X');
INSERT INTO `ey_region` VALUES ('1885', '定兴县', '3', '1772', 'D');
INSERT INTO `ey_region` VALUES ('1902', '唐县', '3', '1772', 'T');
INSERT INTO `ey_region` VALUES ('1923', '高阳县', '3', '1772', 'G');
INSERT INTO `ey_region` VALUES ('1933', '容城县', '3', '1772', 'R');
INSERT INTO `ey_region` VALUES ('1942', '涞源县', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('1960', '望都县', '3', '1772', 'W');
INSERT INTO `ey_region` VALUES ('1969', '安新县', '3', '1772', 'A');
INSERT INTO `ey_region` VALUES ('1982', '易县', '3', '1772', 'Y');
INSERT INTO `ey_region` VALUES ('2010', '曲阳县', '3', '1772', 'Q');
INSERT INTO `ey_region` VALUES ('2029', '蠡县', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('2043', '顺平县', '3', '1772', 'S');
INSERT INTO `ey_region` VALUES ('2054', '博野县', '3', '1772', 'B');
INSERT INTO `ey_region` VALUES ('2062', '雄县', '3', '1772', 'X');
INSERT INTO `ey_region` VALUES ('2072', '涿州市', '3', '1772', 'Z');
INSERT INTO `ey_region` VALUES ('2088', '定州市', '3', '1772', 'D');
INSERT INTO `ey_region` VALUES ('2114', '安国市', '3', '1772', 'A');
INSERT INTO `ey_region` VALUES ('2126', '高碑店市', '3', '1772', 'G');
INSERT INTO `ey_region` VALUES ('2142', '张家口市', '2', '636', 'Z');
INSERT INTO `ey_region` VALUES ('2143', '市辖区', '3', '2142', 'S');
INSERT INTO `ey_region` VALUES ('2144', '桥东区', '3', '2142', 'Q');
INSERT INTO `ey_region` VALUES ('2154', '桥西区', '3', '2142', 'Q');
INSERT INTO `ey_region` VALUES ('2164', '宣化区', '3', '2142', 'X');
INSERT INTO `ey_region` VALUES ('2176', '下花园区', '3', '2142', 'X');
INSERT INTO `ey_region` VALUES ('2183', '宣化县', '3', '2142', 'X');
INSERT INTO `ey_region` VALUES ('2198', '张北县', '3', '2142', 'Z');
INSERT INTO `ey_region` VALUES ('2220', '康保县', '3', '2142', 'K');
INSERT INTO `ey_region` VALUES ('2237', '沽源县', '3', '2142', 'G');
INSERT INTO `ey_region` VALUES ('2256', '尚义县', '3', '2142', 'S');
INSERT INTO `ey_region` VALUES ('2271', '蔚县', '3', '2142', 'W');
INSERT INTO `ey_region` VALUES ('2294', '阳原县', '3', '2142', 'Y');
INSERT INTO `ey_region` VALUES ('2309', '怀安县', '3', '2142', 'H');
INSERT INTO `ey_region` VALUES ('2321', '万全县', '3', '2142', 'W');
INSERT INTO `ey_region` VALUES ('2333', '怀来县', '3', '2142', 'H');
INSERT INTO `ey_region` VALUES ('2351', '涿鹿县', '3', '2142', 'Z');
INSERT INTO `ey_region` VALUES ('2369', '赤城县', '3', '2142', 'C');
INSERT INTO `ey_region` VALUES ('2388', '崇礼县', '3', '2142', 'C');
INSERT INTO `ey_region` VALUES ('2400', '承德市', '2', '636', 'C');
INSERT INTO `ey_region` VALUES ('2401', '市辖区', '3', '2400', 'S');
INSERT INTO `ey_region` VALUES ('2402', '双桥区', '3', '2400', 'S');
INSERT INTO `ey_region` VALUES ('2415', '双滦区', '3', '2400', 'S');
INSERT INTO `ey_region` VALUES ('2422', '鹰手营子矿区', '3', '2400', 'Y');
INSERT INTO `ey_region` VALUES ('2427', '承德县', '3', '2400', 'C');
INSERT INTO `ey_region` VALUES ('2453', '兴隆县', '3', '2400', 'X');
INSERT INTO `ey_region` VALUES ('2474', '平泉县', '3', '2400', 'P');
INSERT INTO `ey_region` VALUES ('2494', '滦平县', '3', '2400', 'L');
INSERT INTO `ey_region` VALUES ('2517', '隆化县', '3', '2400', 'L');
INSERT INTO `ey_region` VALUES ('2543', '丰宁县', '3', '2400', 'F');
INSERT INTO `ey_region` VALUES ('2570', '宽城县', '3', '2400', 'K');
INSERT INTO `ey_region` VALUES ('2589', '围场县', '3', '2400', 'W');
INSERT INTO `ey_region` VALUES ('2629', '沧州市', '2', '636', 'C');
INSERT INTO `ey_region` VALUES ('2630', '市辖区', '3', '2629', 'S');
INSERT INTO `ey_region` VALUES ('2631', '新华区', '3', '2629', 'X');
INSERT INTO `ey_region` VALUES ('2639', '运河区', '3', '2629', 'Y');
INSERT INTO `ey_region` VALUES ('2648', '沧县', '3', '2629', 'C');
INSERT INTO `ey_region` VALUES ('2668', '青县', '3', '2629', 'Q');
INSERT INTO `ey_region` VALUES ('2680', '东光县', '3', '2629', 'D');
INSERT INTO `ey_region` VALUES ('2690', '海兴县', '3', '2629', 'H');
INSERT INTO `ey_region` VALUES ('2701', '盐山县', '3', '2629', 'Y');
INSERT INTO `ey_region` VALUES ('2714', '肃宁县', '3', '2629', 'S');
INSERT INTO `ey_region` VALUES ('2724', '南皮县', '3', '2629', 'N');
INSERT INTO `ey_region` VALUES ('2734', '吴桥县', '3', '2629', 'W');
INSERT INTO `ey_region` VALUES ('2745', '献县', '3', '2629', 'X');
INSERT INTO `ey_region` VALUES ('2765', '孟村县', '3', '2629', 'M');
INSERT INTO `ey_region` VALUES ('2772', '泊头市', '3', '2629', 'B');
INSERT INTO `ey_region` VALUES ('2788', '任邱市', '3', '2629', 'R');
INSERT INTO `ey_region` VALUES ('2809', '黄骅市', '3', '2629', 'H');
INSERT INTO `ey_region` VALUES ('2828', '河间市', '3', '2629', 'H');
INSERT INTO `ey_region` VALUES ('2849', '廊坊市', '2', '636', 'L');
INSERT INTO `ey_region` VALUES ('2850', '市辖区', '3', '2849', 'S');
INSERT INTO `ey_region` VALUES ('2851', '安次区', '3', '2849', 'A');
INSERT INTO `ey_region` VALUES ('2862', '广阳区', '3', '2849', 'G');
INSERT INTO `ey_region` VALUES ('2873', '固安县', '3', '2849', 'G');
INSERT INTO `ey_region` VALUES ('2883', '永清县', '3', '2849', 'Y');
INSERT INTO `ey_region` VALUES ('2895', '香河县', '3', '2849', 'X');
INSERT INTO `ey_region` VALUES ('2906', '大城县', '3', '2849', 'D');
INSERT INTO `ey_region` VALUES ('2918', '文安县', '3', '2849', 'W');
INSERT INTO `ey_region` VALUES ('2932', '大厂县', '3', '2849', 'D');
INSERT INTO `ey_region` VALUES ('2939', '霸州市', '3', '2849', 'B');
INSERT INTO `ey_region` VALUES ('2953', '三河市', '3', '2849', 'S');
INSERT INTO `ey_region` VALUES ('2968', '衡水市', '2', '636', 'H');
INSERT INTO `ey_region` VALUES ('2969', '市辖区', '3', '2968', 'S');
INSERT INTO `ey_region` VALUES ('2970', '桃城区', '3', '2968', 'T');
INSERT INTO `ey_region` VALUES ('2983', '枣强县', '3', '2968', 'Z');
INSERT INTO `ey_region` VALUES ('2995', '武邑县', '3', '2968', 'W');
INSERT INTO `ey_region` VALUES ('3005', '武强县', '3', '2968', 'W');
INSERT INTO `ey_region` VALUES ('3012', '饶阳县', '3', '2968', 'R');
INSERT INTO `ey_region` VALUES ('3020', '安平县', '3', '2968', 'A');
INSERT INTO `ey_region` VALUES ('3029', '故城县', '3', '2968', 'G');
INSERT INTO `ey_region` VALUES ('3043', '景县', '3', '2968', 'J');
INSERT INTO `ey_region` VALUES ('3060', '阜城县', '3', '2968', 'F');
INSERT INTO `ey_region` VALUES ('3071', '冀州市', '3', '2968', 'J');
INSERT INTO `ey_region` VALUES ('3083', '深州市', '3', '2968', 'S');
INSERT INTO `ey_region` VALUES ('3102', '山西', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('3103', '太原市', '2', '3102', 'T');
INSERT INTO `ey_region` VALUES ('3104', '市辖区', '3', '3103', 'S');
INSERT INTO `ey_region` VALUES ('3105', '小店区(人口含高新经济区)', '3', '3103', 'X');
INSERT INTO `ey_region` VALUES ('3117', '迎泽区', '3', '3103', 'Y');
INSERT INTO `ey_region` VALUES ('3126', '杏花岭区', '3', '3103', 'X');
INSERT INTO `ey_region` VALUES ('3140', '尖草坪区', '3', '3103', 'J');
INSERT INTO `ey_region` VALUES ('3155', '万柏林区', '3', '3103', 'W');
INSERT INTO `ey_region` VALUES ('3171', '晋源区', '3', '3103', 'J');
INSERT INTO `ey_region` VALUES ('3178', '清徐县', '3', '3103', 'Q');
INSERT INTO `ey_region` VALUES ('3188', '阳曲县', '3', '3103', 'Y');
INSERT INTO `ey_region` VALUES ('3200', '娄烦县', '3', '3103', 'L');
INSERT INTO `ey_region` VALUES ('3209', '古交市', '3', '3103', 'G');
INSERT INTO `ey_region` VALUES ('3224', '大同市', '2', '3102', 'D');
INSERT INTO `ey_region` VALUES ('3225', '市辖区', '3', '3224', 'S');
INSERT INTO `ey_region` VALUES ('3226', '大同市城区', '3', '3224', 'D');
INSERT INTO `ey_region` VALUES ('3241', '矿区', '3', '3224', 'K');
INSERT INTO `ey_region` VALUES ('3266', '南郊区', '3', '3224', 'N');
INSERT INTO `ey_region` VALUES ('3277', '新荣区', '3', '3224', 'X');
INSERT INTO `ey_region` VALUES ('3286', '阳高县', '3', '3224', 'Y');
INSERT INTO `ey_region` VALUES ('3300', '天镇县', '3', '3224', 'T');
INSERT INTO `ey_region` VALUES ('3312', '广灵县', '3', '3224', 'G');
INSERT INTO `ey_region` VALUES ('3322', '灵丘县', '3', '3224', 'L');
INSERT INTO `ey_region` VALUES ('3335', '浑源县', '3', '3224', 'H');
INSERT INTO `ey_region` VALUES ('3354', '左云县', '3', '3224', 'Z');
INSERT INTO `ey_region` VALUES ('3364', '大同县', '3', '3224', 'D');
INSERT INTO `ey_region` VALUES ('3379', '阳泉市', '2', '3102', 'Y');
INSERT INTO `ey_region` VALUES ('3380', '市辖区', '3', '3379', 'S');
INSERT INTO `ey_region` VALUES ('3381', '城区', '3', '3379', 'C');
INSERT INTO `ey_region` VALUES ('3388', '矿区', '3', '3379', 'K');
INSERT INTO `ey_region` VALUES ('3395', '郊区', '3', '3379', 'J');
INSERT INTO `ey_region` VALUES ('3405', '平定县', '3', '3379', 'P');
INSERT INTO `ey_region` VALUES ('3416', '盂县', '3', '3379', 'Y');
INSERT INTO `ey_region` VALUES ('3431', '长治市', '2', '3102', 'C');
INSERT INTO `ey_region` VALUES ('3432', '市辖区', '3', '3431', 'S');
INSERT INTO `ey_region` VALUES ('3433', '长治市城区', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3445', '长治市郊区', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3454', '长治县', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3466', '襄垣县', '3', '3431', 'X');
INSERT INTO `ey_region` VALUES ('3478', '屯留县', '3', '3431', 'T');
INSERT INTO `ey_region` VALUES ('3493', '平顺县', '3', '3431', 'P');
INSERT INTO `ey_region` VALUES ('3506', '黎城县', '3', '3431', 'L');
INSERT INTO `ey_region` VALUES ('3516', '壶关县', '3', '3431', 'H');
INSERT INTO `ey_region` VALUES ('3530', '长子县', '3', '3431', 'C');
INSERT INTO `ey_region` VALUES ('3543', '武乡县', '3', '3431', 'W');
INSERT INTO `ey_region` VALUES ('3558', '沁县', '3', '3431', 'Q');
INSERT INTO `ey_region` VALUES ('3572', '沁源县', '3', '3431', 'Q');
INSERT INTO `ey_region` VALUES ('3587', '潞城市', '3', '3431', 'L');
INSERT INTO `ey_region` VALUES ('3597', '晋城市', '2', '3102', 'J');
INSERT INTO `ey_region` VALUES ('3598', '市辖区', '3', '3597', 'S');
INSERT INTO `ey_region` VALUES ('3599', '晋城市城区', '3', '3597', 'J');
INSERT INTO `ey_region` VALUES ('3608', '沁水县', '3', '3597', 'Q');
INSERT INTO `ey_region` VALUES ('3623', '阳城县', '3', '3597', 'Y');
INSERT INTO `ey_region` VALUES ('3642', '陵川县', '3', '3597', 'L');
INSERT INTO `ey_region` VALUES ('3655', '泽州县', '3', '3597', 'Z');
INSERT INTO `ey_region` VALUES ('3673', '高平市', '3', '3597', 'G');
INSERT INTO `ey_region` VALUES ('3690', '朔州市', '2', '3102', 'S');
INSERT INTO `ey_region` VALUES ('3691', '市辖区', '3', '3690', 'S');
INSERT INTO `ey_region` VALUES ('3692', '朔城区', '3', '3690', 'S');
INSERT INTO `ey_region` VALUES ('3709', '平鲁区', '3', '3690', 'P');
INSERT INTO `ey_region` VALUES ('3723', '山阴县', '3', '3690', 'S');
INSERT INTO `ey_region` VALUES ('3739', '应县', '3', '3690', 'Y');
INSERT INTO `ey_region` VALUES ('3752', '右玉县', '3', '3690', 'Y');
INSERT INTO `ey_region` VALUES ('3763', '怀仁县', '3', '3690', 'H');
INSERT INTO `ey_region` VALUES ('3776', '晋中市', '2', '3102', 'J');
INSERT INTO `ey_region` VALUES ('3777', '市辖区', '3', '3776', 'S');
INSERT INTO `ey_region` VALUES ('3778', '榆次区', '3', '3776', 'Y');
INSERT INTO `ey_region` VALUES ('3799', '榆社县', '3', '3776', 'Y');
INSERT INTO `ey_region` VALUES ('3810', '左权县', '3', '3776', 'Z');
INSERT INTO `ey_region` VALUES ('3822', '和顺县', '3', '3776', 'H');
INSERT INTO `ey_region` VALUES ('3833', '昔阳县', '3', '3776', 'X');
INSERT INTO `ey_region` VALUES ('3846', '寿阳县', '3', '3776', 'S');
INSERT INTO `ey_region` VALUES ('3861', '太谷县', '3', '3776', 'T');
INSERT INTO `ey_region` VALUES ('3871', '祁县', '3', '3776', 'Q');
INSERT INTO `ey_region` VALUES ('3880', '平遥县', '3', '3776', 'P');
INSERT INTO `ey_region` VALUES ('3895', '灵石县', '3', '3776', 'L');
INSERT INTO `ey_region` VALUES ('3908', '介休市', '3', '3776', 'J');
INSERT INTO `ey_region` VALUES ('3925', '运城市', '2', '3102', 'Y');
INSERT INTO `ey_region` VALUES ('3926', '市辖区', '3', '3925', 'S');
INSERT INTO `ey_region` VALUES ('3927', '盐湖区', '3', '3925', 'Y');
INSERT INTO `ey_region` VALUES ('3950', '临猗县', '3', '3925', 'L');
INSERT INTO `ey_region` VALUES ('3967', '万荣县', '3', '3925', 'W');
INSERT INTO `ey_region` VALUES ('3982', '闻喜县', '3', '3925', 'W');
INSERT INTO `ey_region` VALUES ('3996', '稷山县', '3', '3925', 'J');
INSERT INTO `ey_region` VALUES ('4004', '新绛县', '3', '3925', 'X');
INSERT INTO `ey_region` VALUES ('4013', '绛县', '3', '3925', 'J');
INSERT INTO `ey_region` VALUES ('4024', '垣曲县', '3', '3925', 'Y');
INSERT INTO `ey_region` VALUES ('4036', '夏县', '3', '3925', 'X');
INSERT INTO `ey_region` VALUES ('4048', '平陆县', '3', '3925', 'P');
INSERT INTO `ey_region` VALUES ('4059', '芮城县', '3', '3925', 'R');
INSERT INTO `ey_region` VALUES ('4070', '永济市', '3', '3925', 'Y');
INSERT INTO `ey_region` VALUES ('4082', '河津市', '3', '3925', 'H');
INSERT INTO `ey_region` VALUES ('4093', '忻州市', '2', '3102', 'X');
INSERT INTO `ey_region` VALUES ('4094', '市辖区', '3', '4093', 'S');
INSERT INTO `ey_region` VALUES ('4095', '忻府区', '3', '4093', 'X');
INSERT INTO `ey_region` VALUES ('4116', '定襄县', '3', '4093', 'D');
INSERT INTO `ey_region` VALUES ('4126', '五台县', '3', '4093', 'W');
INSERT INTO `ey_region` VALUES ('4146', '代县', '3', '4093', 'D');
INSERT INTO `ey_region` VALUES ('4158', '繁峙县', '3', '4093', 'F');
INSERT INTO `ey_region` VALUES ('4172', '宁武县', '3', '4093', 'N');
INSERT INTO `ey_region` VALUES ('4189', '静乐县', '3', '4093', 'J');
INSERT INTO `ey_region` VALUES ('4204', '神池县', '3', '4093', 'S');
INSERT INTO `ey_region` VALUES ('4215', '五寨县', '3', '4093', 'W');
INSERT INTO `ey_region` VALUES ('4228', '岢岚县', '3', '4093', 'K');
INSERT INTO `ey_region` VALUES ('4241', '河曲县', '3', '4093', 'H');
INSERT INTO `ey_region` VALUES ('4255', '保德县', '3', '4093', 'B');
INSERT INTO `ey_region` VALUES ('4269', '偏关县', '3', '4093', 'P');
INSERT INTO `ey_region` VALUES ('4280', '原平市', '3', '4093', 'Y');
INSERT INTO `ey_region` VALUES ('4304', '临汾市', '2', '3102', 'L');
INSERT INTO `ey_region` VALUES ('4305', '市辖区', '3', '4304', 'S');
INSERT INTO `ey_region` VALUES ('4306', '尧都区', '3', '4304', 'Y');
INSERT INTO `ey_region` VALUES ('4333', '曲沃县', '3', '4304', 'Q');
INSERT INTO `ey_region` VALUES ('4341', '翼城县', '3', '4304', 'Y');
INSERT INTO `ey_region` VALUES ('4352', '襄汾县', '3', '4304', 'X');
INSERT INTO `ey_region` VALUES ('4366', '洪洞县', '3', '4304', 'H');
INSERT INTO `ey_region` VALUES ('4383', '古县', '3', '4304', 'G');
INSERT INTO `ey_region` VALUES ('4391', '安泽县', '3', '4304', 'A');
INSERT INTO `ey_region` VALUES ('4399', '浮山县', '3', '4304', 'F');
INSERT INTO `ey_region` VALUES ('4409', '吉县', '3', '4304', 'J');
INSERT INTO `ey_region` VALUES ('4418', '乡宁县', '3', '4304', 'X');
INSERT INTO `ey_region` VALUES ('4429', '大宁县', '3', '4304', 'D');
INSERT INTO `ey_region` VALUES ('4436', '隰县', '3', '4304', 'X');
INSERT INTO `ey_region` VALUES ('4445', '永和县', '3', '4304', 'Y');
INSERT INTO `ey_region` VALUES ('4453', '蒲县', '3', '4304', 'P');
INSERT INTO `ey_region` VALUES ('4463', '汾西县', '3', '4304', 'F');
INSERT INTO `ey_region` VALUES ('4472', '侯马市', '3', '4304', 'H');
INSERT INTO `ey_region` VALUES ('4481', '霍州市', '3', '4304', 'H');
INSERT INTO `ey_region` VALUES ('4494', '吕梁市', '2', '3102', 'L');
INSERT INTO `ey_region` VALUES ('4495', '市辖区', '3', '4494', 'S');
INSERT INTO `ey_region` VALUES ('4496', '离石区', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4509', '文水县', '3', '4494', 'W');
INSERT INTO `ey_region` VALUES ('4522', '交城县', '3', '4494', 'J');
INSERT INTO `ey_region` VALUES ('4533', '兴县', '3', '4494', 'X');
INSERT INTO `ey_region` VALUES ('4551', '临县', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4575', '柳林县', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4591', '石楼县', '3', '4494', 'S');
INSERT INTO `ey_region` VALUES ('4601', '岚县', '3', '4494', 'L');
INSERT INTO `ey_region` VALUES ('4614', '方山县', '3', '4494', 'F');
INSERT INTO `ey_region` VALUES ('4622', '中阳县', '3', '4494', 'Z');
INSERT INTO `ey_region` VALUES ('4630', '交口县', '3', '4494', 'J');
INSERT INTO `ey_region` VALUES ('4638', '孝义市', '3', '4494', 'X');
INSERT INTO `ey_region` VALUES ('4655', '汾阳市', '3', '4494', 'F');
INSERT INTO `ey_region` VALUES ('4670', '内蒙古', '1', '0', 'N');
INSERT INTO `ey_region` VALUES ('4671', '呼和浩特市', '2', '4670', 'H');
INSERT INTO `ey_region` VALUES ('4672', '市辖区', '3', '4671', 'S');
INSERT INTO `ey_region` VALUES ('4673', '新城区', '3', '4671', 'X');
INSERT INTO `ey_region` VALUES ('4684', '回民区', '3', '4671', 'H');
INSERT INTO `ey_region` VALUES ('4693', '玉泉区', '3', '4671', 'Y');
INSERT INTO `ey_region` VALUES ('4702', '赛罕区', '3', '4671', 'S');
INSERT INTO `ey_region` VALUES ('4715', '土左旗', '3', '4671', 'T');
INSERT INTO `ey_region` VALUES ('4727', '托克托县', '3', '4671', 'T');
INSERT INTO `ey_region` VALUES ('4733', '和林格尔县', '3', '4671', 'H');
INSERT INTO `ey_region` VALUES ('4742', '清水河县', '3', '4671', 'Q');
INSERT INTO `ey_region` VALUES ('4749', '武川县', '3', '4671', 'W');
INSERT INTO `ey_region` VALUES ('4759', '包头市', '2', '4670', 'B');
INSERT INTO `ey_region` VALUES ('4760', '市辖区', '3', '4759', 'S');
INSERT INTO `ey_region` VALUES ('4761', '东河区', '3', '4759', 'D');
INSERT INTO `ey_region` VALUES ('4775', '昆都仑区', '3', '4759', 'K');
INSERT INTO `ey_region` VALUES ('4791', '青山区', '3', '4759', 'Q');
INSERT INTO `ey_region` VALUES ('4803', '石拐区', '3', '4759', 'S');
INSERT INTO `ey_region` VALUES ('4810', '白云鄂博矿区', '3', '4759', 'B');
INSERT INTO `ey_region` VALUES ('4813', '九原区', '3', '4759', 'J');
INSERT INTO `ey_region` VALUES ('4823', '土默特右旗', '3', '4759', 'T');
INSERT INTO `ey_region` VALUES ('4833', '固阳县', '3', '4759', 'G');
INSERT INTO `ey_region` VALUES ('4840', '达茂联合旗', '3', '4759', 'D');
INSERT INTO `ey_region` VALUES ('4849', '乌海市', '2', '4670', 'W');
INSERT INTO `ey_region` VALUES ('4850', '乌海市辖区', '3', '4849', 'W');
INSERT INTO `ey_region` VALUES ('4851', '海勃湾区', '3', '4849', 'H');
INSERT INTO `ey_region` VALUES ('4859', '海南区', '3', '4849', 'H');
INSERT INTO `ey_region` VALUES ('4865', '乌达区', '3', '4849', 'W');
INSERT INTO `ey_region` VALUES ('4874', '赤峰市', '2', '4670', 'C');
INSERT INTO `ey_region` VALUES ('4875', '市辖区', '3', '4874', 'S');
INSERT INTO `ey_region` VALUES ('4876', '红山区', '3', '4874', 'H');
INSERT INTO `ey_region` VALUES ('4888', '元宝山区', '3', '4874', 'Y');
INSERT INTO `ey_region` VALUES ('4896', '松山区', '3', '4874', 'S');
INSERT INTO `ey_region` VALUES ('4919', '阿鲁科尔沁旗', '3', '4874', 'A');
INSERT INTO `ey_region` VALUES ('4932', '巴林左旗', '3', '4874', 'B');
INSERT INTO `ey_region` VALUES ('4944', '巴林右旗', '3', '4874', 'B');
INSERT INTO `ey_region` VALUES ('4953', '林西县', '3', '4874', 'L');
INSERT INTO `ey_region` VALUES ('4963', '克什克腾旗', '3', '4874', 'K');
INSERT INTO `ey_region` VALUES ('4975', '翁牛特旗', '3', '4874', 'W');
INSERT INTO `ey_region` VALUES ('4988', '喀喇沁旗', '3', '4874', 'K');
INSERT INTO `ey_region` VALUES ('4999', '宁城县', '3', '4874', 'N');
INSERT INTO `ey_region` VALUES ('5013', '敖汉旗', '3', '4874', 'A');
INSERT INTO `ey_region` VALUES ('5029', '通辽市', '2', '4670', 'T');
INSERT INTO `ey_region` VALUES ('5030', '市辖区', '3', '5029', 'S');
INSERT INTO `ey_region` VALUES ('5031', '科尔沁区', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5062', '科尔沁左翼中旗', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5079', '科左后旗', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5104', '开鲁县', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5118', '库伦旗', '3', '5029', 'K');
INSERT INTO `ey_region` VALUES ('5125', '奈曼旗', '3', '5029', 'N');
INSERT INTO `ey_region` VALUES ('5139', '扎鲁特旗', '3', '5029', 'Z');
INSERT INTO `ey_region` VALUES ('5155', '霍林郭勒市', '3', '5029', 'H');
INSERT INTO `ey_region` VALUES ('5162', '鄂尔多斯市', '2', '4670', 'E');
INSERT INTO `ey_region` VALUES ('5163', '东胜区', '3', '5162', 'D');
INSERT INTO `ey_region` VALUES ('5176', '达拉特旗', '3', '5162', 'D');
INSERT INTO `ey_region` VALUES ('5185', '准格尔旗', '3', '5162', 'Z');
INSERT INTO `ey_region` VALUES ('5195', '鄂托克前旗', '3', '5162', 'E');
INSERT INTO `ey_region` VALUES ('5201', '鄂托克旗', '3', '5162', 'E');
INSERT INTO `ey_region` VALUES ('5210', '杭锦旗', '3', '5162', 'H');
INSERT INTO `ey_region` VALUES ('5219', '乌审旗', '3', '5162', 'W');
INSERT INTO `ey_region` VALUES ('5228', '伊金霍洛旗', '3', '5162', 'Y');
INSERT INTO `ey_region` VALUES ('5236', '呼伦贝尔市', '2', '4670', 'H');
INSERT INTO `ey_region` VALUES ('5237', '市辖区', '3', '5236', 'S');
INSERT INTO `ey_region` VALUES ('5238', '海拉尔区', '3', '5236', 'H');
INSERT INTO `ey_region` VALUES ('5249', '阿荣旗', '3', '5236', 'A');
INSERT INTO `ey_region` VALUES ('5262', '莫力达瓦旗', '3', '5236', 'M');
INSERT INTO `ey_region` VALUES ('5277', '鄂伦春旗', '3', '5236', 'E');
INSERT INTO `ey_region` VALUES ('5303', '鄂温旗', '3', '5236', 'E');
INSERT INTO `ey_region` VALUES ('5314', '陈巴尔虎旗镇', '3', '5236', 'C');
INSERT INTO `ey_region` VALUES ('5323', '新巴尔虎左旗', '3', '5236', 'X');
INSERT INTO `ey_region` VALUES ('5330', '新巴尔虎右旗', '3', '5236', 'X');
INSERT INTO `ey_region` VALUES ('5337', '满洲里市', '3', '5236', 'M');
INSERT INTO `ey_region` VALUES ('5354', '牙克石市', '3', '5236', 'Y');
INSERT INTO `ey_region` VALUES ('5371', '扎兰屯市', '3', '5236', 'Z');
INSERT INTO `ey_region` VALUES ('5397', '额尔古纳市', '3', '5236', 'E');
INSERT INTO `ey_region` VALUES ('5410', '根河市', '3', '5236', 'G');
INSERT INTO `ey_region` VALUES ('5418', '巴彦淖尔市', '2', '4670', 'B');
INSERT INTO `ey_region` VALUES ('5419', '市辖区', '3', '5418', 'S');
INSERT INTO `ey_region` VALUES ('5420', '临河区', '3', '5418', 'L');
INSERT INTO `ey_region` VALUES ('5440', '五原县', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5450', '磴口县', '3', '5418', 'D');
INSERT INTO `ey_region` VALUES ('5461', '乌拉特前旗', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5477', '乌拉特中旗', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5489', '乌拉特后旗', '3', '5418', 'W');
INSERT INTO `ey_region` VALUES ('5495', '杭锦后旗', '3', '5418', 'H');
INSERT INTO `ey_region` VALUES ('5505', '乌兰察布市', '2', '4670', 'W');
INSERT INTO `ey_region` VALUES ('5506', '市辖区', '3', '5505', 'S');
INSERT INTO `ey_region` VALUES ('5507', '集宁区', '3', '5505', 'J');
INSERT INTO `ey_region` VALUES ('5518', '卓资县', '3', '5505', 'Z');
INSERT INTO `ey_region` VALUES ('5526', '化德县', '3', '5505', 'H');
INSERT INTO `ey_region` VALUES ('5532', '商都县', '3', '5505', 'S');
INSERT INTO `ey_region` VALUES ('5542', '兴和县', '3', '5505', 'X');
INSERT INTO `ey_region` VALUES ('5551', '凉城县', '3', '5505', 'L');
INSERT INTO `ey_region` VALUES ('5562', '察哈尔右翼前旗', '3', '5505', 'C');
INSERT INTO `ey_region` VALUES ('5571', '察右中旗', '3', '5505', 'C');
INSERT INTO `ey_region` VALUES ('5582', '察哈尔右翼后旗', '3', '5505', 'C');
INSERT INTO `ey_region` VALUES ('5590', '四子王旗', '3', '5505', 'S');
INSERT INTO `ey_region` VALUES ('5603', '丰镇市', '3', '5505', 'F');
INSERT INTO `ey_region` VALUES ('5616', '兴安盟', '2', '4670', 'X');
INSERT INTO `ey_region` VALUES ('5617', '乌兰浩特市', '3', '5616', 'W');
INSERT INTO `ey_region` VALUES ('5629', '阿尔山市', '3', '5616', 'A');
INSERT INTO `ey_region` VALUES ('5636', '科右前旗', '3', '5616', 'K');
INSERT INTO `ey_region` VALUES ('5655', '科右中旗', '3', '5616', 'K');
INSERT INTO `ey_region` VALUES ('5677', '扎赉特旗', '3', '5616', 'Z');
INSERT INTO `ey_region` VALUES ('5692', '突泉县', '3', '5616', 'T');
INSERT INTO `ey_region` VALUES ('5702', '锡林郭勒盟', '2', '4670', 'X');
INSERT INTO `ey_region` VALUES ('5703', '二连浩特市', '3', '5702', 'E');
INSERT INTO `ey_region` VALUES ('5709', '锡林浩特市', '3', '5702', 'X');
INSERT INTO `ey_region` VALUES ('5723', '阿巴嘎旗', '3', '5702', 'A');
INSERT INTO `ey_region` VALUES ('5731', '苏尼特左旗', '3', '5702', 'S');
INSERT INTO `ey_region` VALUES ('5738', '苏尼特右旗', '3', '5702', 'S');
INSERT INTO `ey_region` VALUES ('5745', '东乌珠穆沁旗', '3', '5702', 'D');
INSERT INTO `ey_region` VALUES ('5758', '西乌珠穆沁旗', '3', '5702', 'X');
INSERT INTO `ey_region` VALUES ('5766', '太仆寺旗', '3', '5702', 'T');
INSERT INTO `ey_region` VALUES ('5774', '镶黄旗', '3', '5702', 'X');
INSERT INTO `ey_region` VALUES ('5778', '正镶白旗', '3', '5702', 'Z');
INSERT INTO `ey_region` VALUES ('5785', '正蓝旗', '3', '5702', 'Z');
INSERT INTO `ey_region` VALUES ('5794', '多伦县', '3', '5702', 'D');
INSERT INTO `ey_region` VALUES ('5799', '阿拉善盟', '2', '4670', 'A');
INSERT INTO `ey_region` VALUES ('5800', '阿拉善左旗', '3', '5799', 'A');
INSERT INTO `ey_region` VALUES ('5814', '阿拉善右旗', '3', '5799', 'A');
INSERT INTO `ey_region` VALUES ('5820', '额济纳旗', '3', '5799', 'E');
INSERT INTO `ey_region` VALUES ('5827', '辽宁省', '1', '0', 'L');
INSERT INTO `ey_region` VALUES ('5828', '沈阳市', '2', '5827', 'S');
INSERT INTO `ey_region` VALUES ('5829', '市辖区', '3', '5828', 'S');
INSERT INTO `ey_region` VALUES ('5830', '和平区', '3', '5828', 'H');
INSERT INTO `ey_region` VALUES ('5848', '沈河区', '3', '5828', 'S');
INSERT INTO `ey_region` VALUES ('5859', '大东区', '3', '5828', 'D');
INSERT INTO `ey_region` VALUES ('5873', '皇姑区', '3', '5828', 'H');
INSERT INTO `ey_region` VALUES ('5894', '铁西区', '3', '5828', 'T');
INSERT INTO `ey_region` VALUES ('5909', '苏家屯区', '3', '5828', 'S');
INSERT INTO `ey_region` VALUES ('5934', '东陵区', '3', '5828', 'D');
INSERT INTO `ey_region` VALUES ('5954', '新城子区', '3', '5828', 'X');
INSERT INTO `ey_region` VALUES ('5975', '于洪区', '3', '5828', 'Y');
INSERT INTO `ey_region` VALUES ('5998', '辽中县', '3', '5828', 'L');
INSERT INTO `ey_region` VALUES ('6020', '康平县', '3', '5828', 'K');
INSERT INTO `ey_region` VALUES ('6038', '法库县', '3', '5828', 'F');
INSERT INTO `ey_region` VALUES ('6058', '新民市', '3', '5828', 'X');
INSERT INTO `ey_region` VALUES ('6088', '大连市', '2', '5827', 'D');
INSERT INTO `ey_region` VALUES ('6089', '市辖区', '3', '6088', 'S');
INSERT INTO `ey_region` VALUES ('6090', '中山区', '3', '6088', 'Z');
INSERT INTO `ey_region` VALUES ('6099', '西岗区', '3', '6088', 'X');
INSERT INTO `ey_region` VALUES ('6107', '沙河口区', '3', '6088', 'S');
INSERT INTO `ey_region` VALUES ('6117', '甘井子区', '3', '6088', 'G');
INSERT INTO `ey_region` VALUES ('6137', '旅顺口区', '3', '6088', 'L');
INSERT INTO `ey_region` VALUES ('6153', '金州区', '3', '6088', 'J');
INSERT INTO `ey_region` VALUES ('6178', '长海县', '3', '6088', 'C');
INSERT INTO `ey_region` VALUES ('6184', '瓦房店市', '3', '6088', 'W');
INSERT INTO `ey_region` VALUES ('6217', '普兰店市', '3', '6088', 'P');
INSERT INTO `ey_region` VALUES ('6239', '庄河市', '3', '6088', 'Z');
INSERT INTO `ey_region` VALUES ('6266', '鞍山市', '2', '5827', 'A');
INSERT INTO `ey_region` VALUES ('6267', '市辖区', '3', '6266', 'S');
INSERT INTO `ey_region` VALUES ('6268', '铁东区', '3', '6266', 'T');
INSERT INTO `ey_region` VALUES ('6282', '铁西区', '3', '6266', 'T');
INSERT INTO `ey_region` VALUES ('6293', '立山区', '3', '6266', 'L');
INSERT INTO `ey_region` VALUES ('6303', '千山区', '3', '6266', 'Q');
INSERT INTO `ey_region` VALUES ('6316', '台安县', '3', '6266', 'T');
INSERT INTO `ey_region` VALUES ('6331', '岫岩县', '3', '6266', 'X');
INSERT INTO `ey_region` VALUES ('6354', '海城市', '3', '6266', 'H');
INSERT INTO `ey_region` VALUES ('6384', '抚顺市', '2', '5827', 'F');
INSERT INTO `ey_region` VALUES ('6385', '市辖区', '3', '6384', 'S');
INSERT INTO `ey_region` VALUES ('6386', '新抚区', '3', '6384', 'X');
INSERT INTO `ey_region` VALUES ('6395', '东洲区', '3', '6384', 'D');
INSERT INTO `ey_region` VALUES ('6409', '望花区', '3', '6384', 'W');
INSERT INTO `ey_region` VALUES ('6422', '顺城区', '3', '6384', 'S');
INSERT INTO `ey_region` VALUES ('6432', '抚顺县', '3', '6384', 'F');
INSERT INTO `ey_region` VALUES ('6445', '新宾县', '3', '6384', 'X');
INSERT INTO `ey_region` VALUES ('6461', '清原县', '3', '6384', 'Q');
INSERT INTO `ey_region` VALUES ('6476', '本溪市', '2', '5827', 'B');
INSERT INTO `ey_region` VALUES ('6477', '市辖区', '3', '6476', 'S');
INSERT INTO `ey_region` VALUES ('6478', '平山区', '3', '6476', 'P');
INSERT INTO `ey_region` VALUES ('6488', '溪湖区', '3', '6476', 'X');
INSERT INTO `ey_region` VALUES ('6499', '明山区', '3', '6476', 'M');
INSERT INTO `ey_region` VALUES ('6509', '南芬区', '3', '6476', 'N');
INSERT INTO `ey_region` VALUES ('6515', '本溪县', '3', '6476', 'B');
INSERT INTO `ey_region` VALUES ('6528', '桓仁县', '3', '6476', 'H');
INSERT INTO `ey_region` VALUES ('6542', '丹东市', '2', '5827', 'D');
INSERT INTO `ey_region` VALUES ('6543', '市辖区', '3', '6542', 'S');
INSERT INTO `ey_region` VALUES ('6544', '元宝区', '3', '6542', 'Y');
INSERT INTO `ey_region` VALUES ('6552', '振兴区', '3', '6542', 'Z');
INSERT INTO `ey_region` VALUES ('6563', '振安区', '3', '6542', 'Z');
INSERT INTO `ey_region` VALUES ('6573', '宽甸县', '3', '6542', 'K');
INSERT INTO `ey_region` VALUES ('6596', '东港市', '3', '6542', 'D');
INSERT INTO `ey_region` VALUES ('6621', '凤城市', '3', '6542', 'F');
INSERT INTO `ey_region` VALUES ('6643', '锦州市', '2', '5827', 'J');
INSERT INTO `ey_region` VALUES ('6644', '市辖区', '3', '6643', 'S');
INSERT INTO `ey_region` VALUES ('6645', '古塔区', '3', '6643', 'G');
INSERT INTO `ey_region` VALUES ('6655', '凌河区', '3', '6643', 'L');
INSERT INTO `ey_region` VALUES ('6668', '太和区', '3', '6643', 'T');
INSERT INTO `ey_region` VALUES ('6683', '黑山县', '3', '6643', 'H');
INSERT INTO `ey_region` VALUES ('6706', '义县', '3', '6643', 'Y');
INSERT INTO `ey_region` VALUES ('6725', '凌海市', '3', '6643', 'L');
INSERT INTO `ey_region` VALUES ('6750', '北镇市', '3', '6643', 'B');
INSERT INTO `ey_region` VALUES ('6771', '营口市', '2', '5827', 'Y');
INSERT INTO `ey_region` VALUES ('6772', '市辖区', '3', '6771', 'S');
INSERT INTO `ey_region` VALUES ('6773', '站前区', '3', '6771', 'Z');
INSERT INTO `ey_region` VALUES ('6781', '西市区', '3', '6771', 'X');
INSERT INTO `ey_region` VALUES ('6789', '鲅鱼圈区', '3', '6771', 'B');
INSERT INTO `ey_region` VALUES ('6797', '老边区', '3', '6771', 'L');
INSERT INTO `ey_region` VALUES ('6804', '盖州市', '3', '6771', 'G');
INSERT INTO `ey_region` VALUES ('6832', '大石桥市', '3', '6771', 'D');
INSERT INTO `ey_region` VALUES ('6851', '阜新市', '2', '5827', 'F');
INSERT INTO `ey_region` VALUES ('6852', '市辖区', '3', '6851', 'S');
INSERT INTO `ey_region` VALUES ('6853', '海州区', '3', '6851', 'H');
INSERT INTO `ey_region` VALUES ('6865', '新邱区', '3', '6851', 'X');
INSERT INTO `ey_region` VALUES ('6871', '太平区', '3', '6851', 'T');
INSERT INTO `ey_region` VALUES ('6878', '清河门区', '3', '6851', 'Q');
INSERT INTO `ey_region` VALUES ('6885', '细河区', '3', '6851', 'X');
INSERT INTO `ey_region` VALUES ('6893', '阜新县', '3', '6851', 'F');
INSERT INTO `ey_region` VALUES ('6930', '彰武县', '3', '6851', 'Z');
INSERT INTO `ey_region` VALUES ('6955', '辽阳市', '2', '5827', 'L');
INSERT INTO `ey_region` VALUES ('6956', '市辖区', '3', '6955', 'S');
INSERT INTO `ey_region` VALUES ('6957', '白塔区', '3', '6955', 'B');
INSERT INTO `ey_region` VALUES ('6964', '文圣区', '3', '6955', 'W');
INSERT INTO `ey_region` VALUES ('6971', '宏伟区', '3', '6955', 'H');
INSERT INTO `ey_region` VALUES ('6977', '弓长岭区', '3', '6955', 'G');
INSERT INTO `ey_region` VALUES ('6983', '太子河区', '3', '6955', 'T');
INSERT INTO `ey_region` VALUES ('6989', '辽阳县', '3', '6955', 'L');
INSERT INTO `ey_region` VALUES ('7007', '灯塔市', '3', '6955', 'D');
INSERT INTO `ey_region` VALUES ('7024', '盘锦市', '2', '5827', 'P');
INSERT INTO `ey_region` VALUES ('7025', '市辖区', '3', '7024', 'S');
INSERT INTO `ey_region` VALUES ('7026', '双台子区', '3', '7024', 'S');
INSERT INTO `ey_region` VALUES ('7036', '兴隆台区', '3', '7024', 'X');
INSERT INTO `ey_region` VALUES ('7055', '大洼县', '3', '7024', 'D');
INSERT INTO `ey_region` VALUES ('7072', '盘山县', '3', '7024', 'P');
INSERT INTO `ey_region` VALUES ('7088', '铁岭市', '2', '5827', 'T');
INSERT INTO `ey_region` VALUES ('7089', '市辖区', '3', '7088', 'S');
INSERT INTO `ey_region` VALUES ('7090', '银州区', '3', '7088', 'Y');
INSERT INTO `ey_region` VALUES ('7099', '清河区', '3', '7088', 'Q');
INSERT INTO `ey_region` VALUES ('7105', '铁岭县', '3', '7088', 'T');
INSERT INTO `ey_region` VALUES ('7121', '西丰县', '3', '7088', 'X');
INSERT INTO `ey_region` VALUES ('7140', '昌图县', '3', '7088', 'C');
INSERT INTO `ey_region` VALUES ('7180', '调兵山市', '3', '7088', 'D');
INSERT INTO `ey_region` VALUES ('7186', '开原市', '3', '7088', 'K');
INSERT INTO `ey_region` VALUES ('7208', '朝阳市', '2', '5827', 'C');
INSERT INTO `ey_region` VALUES ('7209', '市辖区', '3', '7208', 'S');
INSERT INTO `ey_region` VALUES ('7210', '双塔区', '3', '7208', 'S');
INSERT INTO `ey_region` VALUES ('7225', '龙城区', '3', '7208', 'L');
INSERT INTO `ey_region` VALUES ('7238', '朝阳县', '3', '7208', 'C');
INSERT INTO `ey_region` VALUES ('7267', '建平县', '3', '7208', 'J');
INSERT INTO `ey_region` VALUES ('7299', '喀喇沁左翼县', '3', '7208', 'K');
INSERT INTO `ey_region` VALUES ('7322', '北票市', '3', '7208', 'B');
INSERT INTO `ey_region` VALUES ('7360', '凌源市', '3', '7208', 'L');
INSERT INTO `ey_region` VALUES ('7391', '葫芦岛市', '2', '5827', 'H');
INSERT INTO `ey_region` VALUES ('7392', '市辖区', '3', '7391', 'S');
INSERT INTO `ey_region` VALUES ('7393', '连山区', '3', '7391', 'L');
INSERT INTO `ey_region` VALUES ('7419', '龙港区', '3', '7391', 'L');
INSERT INTO `ey_region` VALUES ('7433', '南票区', '3', '7391', 'N');
INSERT INTO `ey_region` VALUES ('7446', '绥中县', '3', '7391', 'S');
INSERT INTO `ey_region` VALUES ('7474', '建昌县', '3', '7391', 'J');
INSERT INTO `ey_region` VALUES ('7503', '兴城市', '3', '7391', 'X');
INSERT INTO `ey_region` VALUES ('7531', '吉林省', '1', '0', 'J');
INSERT INTO `ey_region` VALUES ('7532', '长春市', '2', '7531', 'C');
INSERT INTO `ey_region` VALUES ('7533', '长春市辖区', '3', '7532', 'C');
INSERT INTO `ey_region` VALUES ('7534', '南关区', '3', '7532', 'N');
INSERT INTO `ey_region` VALUES ('7552', '宽城区', '3', '7532', 'K');
INSERT INTO `ey_region` VALUES ('7569', '朝阳区', '3', '7532', 'C');
INSERT INTO `ey_region` VALUES ('7582', '二道区', '3', '7532', 'E');
INSERT INTO `ey_region` VALUES ('7597', '绿园区', '3', '7532', 'L');
INSERT INTO `ey_region` VALUES ('7610', '双阳区', '3', '7532', 'S');
INSERT INTO `ey_region` VALUES ('7619', '农安县', '3', '7532', 'N');
INSERT INTO `ey_region` VALUES ('7642', '九台市', '3', '7532', 'J');
INSERT INTO `ey_region` VALUES ('7658', '榆树市', '3', '7532', 'Y');
INSERT INTO `ey_region` VALUES ('7687', '德惠市', '3', '7532', 'D');
INSERT INTO `ey_region` VALUES ('7706', '吉林市', '2', '7531', 'J');
INSERT INTO `ey_region` VALUES ('7707', '吉林市辖区', '3', '7706', 'J');
INSERT INTO `ey_region` VALUES ('7708', '昌邑区', '3', '7706', 'C');
INSERT INTO `ey_region` VALUES ('7731', '龙潭区', '3', '7706', 'L');
INSERT INTO `ey_region` VALUES ('7752', '船营区', '3', '7706', 'C');
INSERT INTO `ey_region` VALUES ('7768', '丰满区', '3', '7706', 'F');
INSERT INTO `ey_region` VALUES ('7781', '永吉县', '3', '7706', 'Y');
INSERT INTO `ey_region` VALUES ('7792', '蛟河市', '3', '7706', 'J');
INSERT INTO `ey_region` VALUES ('7810', '桦甸市', '3', '7706', 'H');
INSERT INTO `ey_region` VALUES ('7828', '舒兰市', '3', '7706', 'S');
INSERT INTO `ey_region` VALUES ('7849', '磐石市', '3', '7706', 'P');
INSERT INTO `ey_region` VALUES ('7868', '四平市', '2', '7531', 'S');
INSERT INTO `ey_region` VALUES ('7869', '四平市辖区', '3', '7868', 'S');
INSERT INTO `ey_region` VALUES ('7870', '铁西区', '3', '7868', 'T');
INSERT INTO `ey_region` VALUES ('7878', '铁东区', '3', '7868', 'T');
INSERT INTO `ey_region` VALUES ('7892', '梨树县', '3', '7868', 'L');
INSERT INTO `ey_region` VALUES ('7916', '伊通县', '3', '7868', 'Y');
INSERT INTO `ey_region` VALUES ('7933', '公主岭市', '3', '7868', 'G');
INSERT INTO `ey_region` VALUES ('7964', '双辽市', '3', '7868', 'S');
INSERT INTO `ey_region` VALUES ('7986', '辽源市', '2', '7531', 'L');
INSERT INTO `ey_region` VALUES ('7987', '辽源市辖区', '3', '7986', 'L');
INSERT INTO `ey_region` VALUES ('7988', '龙山区', '3', '7986', 'L');
INSERT INTO `ey_region` VALUES ('8000', '西安区', '3', '7986', 'X');
INSERT INTO `ey_region` VALUES ('8008', '东丰县', '3', '7986', 'D');
INSERT INTO `ey_region` VALUES ('8023', '东辽县', '3', '7986', 'D');
INSERT INTO `ey_region` VALUES ('8037', '通化市', '2', '7531', 'T');
INSERT INTO `ey_region` VALUES ('8038', '通化市辖区', '3', '8037', 'T');
INSERT INTO `ey_region` VALUES ('8039', '东昌区', '3', '8037', 'D');
INSERT INTO `ey_region` VALUES ('8051', '二道江区', '3', '8037', 'E');
INSERT INTO `ey_region` VALUES ('8058', '通化县', '3', '8037', 'T');
INSERT INTO `ey_region` VALUES ('8076', '辉南县', '3', '8037', 'H');
INSERT INTO `ey_region` VALUES ('8088', '柳河县', '3', '8037', 'L');
INSERT INTO `ey_region` VALUES ('8104', '梅河口市', '3', '8037', 'M');
INSERT INTO `ey_region` VALUES ('8129', '集安市', '3', '8037', 'J');
INSERT INTO `ey_region` VALUES ('8144', '白山市', '2', '7531', 'B');
INSERT INTO `ey_region` VALUES ('8145', '白山市辖区', '3', '8144', 'B');
INSERT INTO `ey_region` VALUES ('8146', '八道江区', '3', '8144', 'B');
INSERT INTO `ey_region` VALUES ('8159', '江源区', '3', '8144', 'J');
INSERT INTO `ey_region` VALUES ('8168', '抚松县', '3', '8144', 'F');
INSERT INTO `ey_region` VALUES ('8183', '靖宇县', '3', '8144', 'J');
INSERT INTO `ey_region` VALUES ('8192', '长白县', '3', '8144', 'C');
INSERT INTO `ey_region` VALUES ('8202', '临江市', '3', '8144', 'L');
INSERT INTO `ey_region` VALUES ('8216', '松原市', '2', '7531', 'S');
INSERT INTO `ey_region` VALUES ('8217', '松原市辖区', '3', '8216', 'S');
INSERT INTO `ey_region` VALUES ('8218', '宁江区', '3', '8216', 'N');
INSERT INTO `ey_region` VALUES ('8239', '前郭县', '3', '8216', 'Q');
INSERT INTO `ey_region` VALUES ('8266', '长岭县', '3', '8216', 'C');
INSERT INTO `ey_region` VALUES ('8300', '乾安县', '3', '8216', 'Q');
INSERT INTO `ey_region` VALUES ('8311', '扶余县', '3', '8216', 'F');
INSERT INTO `ey_region` VALUES ('8333', '白城市', '2', '7531', 'B');
INSERT INTO `ey_region` VALUES ('8334', '白城市辖区', '3', '8333', 'B');
INSERT INTO `ey_region` VALUES ('8335', '洮北区', '3', '8333', 'T');
INSERT INTO `ey_region` VALUES ('8362', '镇赉县', '3', '8333', 'Z');
INSERT INTO `ey_region` VALUES ('8375', '通榆县', '3', '8333', 'T');
INSERT INTO `ey_region` VALUES ('8393', '洮南市', '3', '8333', 'T');
INSERT INTO `ey_region` VALUES ('8420', '大安市', '3', '8333', 'D');
INSERT INTO `ey_region` VALUES ('8445', '延边州', '2', '7531', 'Y');
INSERT INTO `ey_region` VALUES ('8446', '延吉市', '3', '8445', 'Y');
INSERT INTO `ey_region` VALUES ('8456', '图们市', '3', '8445', 'T');
INSERT INTO `ey_region` VALUES ('8464', '敦化市', '3', '8445', 'D');
INSERT INTO `ey_region` VALUES ('8489', '珲春市', '3', '8445', 'H');
INSERT INTO `ey_region` VALUES ('8504', '龙井市', '3', '8445', 'L');
INSERT INTO `ey_region` VALUES ('8515', '和龙市', '3', '8445', 'H');
INSERT INTO `ey_region` VALUES ('8530', '汪清县', '3', '8445', 'W');
INSERT INTO `ey_region` VALUES ('8545', '安图县', '3', '8445', 'A');
INSERT INTO `ey_region` VALUES ('8558', '黑龙江省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('8559', '哈尔滨市', '2', '8558', 'H');
INSERT INTO `ey_region` VALUES ('8560', '市辖区', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8561', '道里区', '3', '8559', 'D');
INSERT INTO `ey_region` VALUES ('8585', '南岗区', '3', '8559', 'N');
INSERT INTO `ey_region` VALUES ('8606', '道外区', '3', '8559', 'D');
INSERT INTO `ey_region` VALUES ('8633', '平房区', '3', '8559', 'P');
INSERT INTO `ey_region` VALUES ('8642', '松北区', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8650', '香坊区', '3', '8559', 'X');
INSERT INTO `ey_region` VALUES ('8676', '呼兰区', '3', '8559', 'H');
INSERT INTO `ey_region` VALUES ('8694', '阿城区', '3', '8559', 'A');
INSERT INTO `ey_region` VALUES ('8714', '依兰县', '3', '8559', 'Y');
INSERT INTO `ey_region` VALUES ('8729', '方正县', '3', '8559', 'F');
INSERT INTO `ey_region` VALUES ('8740', '宾县', '3', '8559', 'B');
INSERT INTO `ey_region` VALUES ('8758', '巴彦县', '3', '8559', 'B');
INSERT INTO `ey_region` VALUES ('8778', '木兰县', '3', '8559', 'M');
INSERT INTO `ey_region` VALUES ('8788', '通河县', '3', '8559', 'T');
INSERT INTO `ey_region` VALUES ('8800', '延寿县', '3', '8559', 'Y');
INSERT INTO `ey_region` VALUES ('8812', '双城市', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8838', '尚志市', '3', '8559', 'S');
INSERT INTO `ey_region` VALUES ('8858', '五常市', '3', '8559', 'W');
INSERT INTO `ey_region` VALUES ('8884', '齐齐哈尔市', '2', '8558', 'Q');
INSERT INTO `ey_region` VALUES ('8885', '市辖区', '3', '8884', 'S');
INSERT INTO `ey_region` VALUES ('8886', '龙沙区', '3', '8884', 'L');
INSERT INTO `ey_region` VALUES ('8894', '建华区', '3', '8884', 'J');
INSERT INTO `ey_region` VALUES ('8901', '铁锋区', '3', '8884', 'T');
INSERT INTO `ey_region` VALUES ('8911', '昂昂溪区', '3', '8884', 'A');
INSERT INTO `ey_region` VALUES ('8918', '富拉尔基区', '3', '8884', 'F');
INSERT INTO `ey_region` VALUES ('8928', '碾子山区', '3', '8884', 'N');
INSERT INTO `ey_region` VALUES ('8934', '梅里斯达斡尔族区', '3', '8884', 'M');
INSERT INTO `ey_region` VALUES ('8943', '龙江县', '3', '8884', 'L');
INSERT INTO `ey_region` VALUES ('8958', '依安县', '3', '8884', 'Y');
INSERT INTO `ey_region` VALUES ('8976', '泰来县', '3', '8884', 'T');
INSERT INTO `ey_region` VALUES ('8998', '甘南县', '3', '8884', 'G');
INSERT INTO `ey_region` VALUES ('9011', '富裕县', '3', '8884', 'F');
INSERT INTO `ey_region` VALUES ('9024', '克山县', '3', '8884', 'K');
INSERT INTO `ey_region` VALUES ('9048', '克东县', '3', '8884', 'K');
INSERT INTO `ey_region` VALUES ('9067', '拜泉县', '3', '8884', 'B');
INSERT INTO `ey_region` VALUES ('9084', '讷河市', '3', '8884', 'N');
INSERT INTO `ey_region` VALUES ('9117', '鸡西市', '2', '8558', 'J');
INSERT INTO `ey_region` VALUES ('9118', '市辖区', '3', '9117', 'S');
INSERT INTO `ey_region` VALUES ('9119', '鸡冠区', '3', '9117', 'J');
INSERT INTO `ey_region` VALUES ('9129', '恒山区', '3', '9117', 'H');
INSERT INTO `ey_region` VALUES ('9139', '滴道区', '3', '9117', 'D');
INSERT INTO `ey_region` VALUES ('9146', '梨树区', '3', '9117', 'L');
INSERT INTO `ey_region` VALUES ('9153', '城子河区', '3', '9117', 'C');
INSERT INTO `ey_region` VALUES ('9161', '麻山区', '3', '9117', 'M');
INSERT INTO `ey_region` VALUES ('9164', '鸡东县', '3', '9117', 'J');
INSERT INTO `ey_region` VALUES ('9178', '虎林市', '3', '9117', 'H');
INSERT INTO `ey_region` VALUES ('9199', '密山市', '3', '9117', 'M');
INSERT INTO `ey_region` VALUES ('9222', '鹤岗市', '2', '8558', 'H');
INSERT INTO `ey_region` VALUES ('9223', '市辖区', '3', '9222', 'S');
INSERT INTO `ey_region` VALUES ('9224', '向阳区', '3', '9222', 'X');
INSERT INTO `ey_region` VALUES ('9230', '工农区', '3', '9222', 'G');
INSERT INTO `ey_region` VALUES ('9237', '南山区', '3', '9222', 'N');
INSERT INTO `ey_region` VALUES ('9244', '兴安区', '3', '9222', 'X');
INSERT INTO `ey_region` VALUES ('9250', '东山区', '3', '9222', 'D');
INSERT INTO `ey_region` VALUES ('9261', '兴山区', '3', '9222', 'X');
INSERT INTO `ey_region` VALUES ('9266', '萝北县', '3', '9222', 'L');
INSERT INTO `ey_region` VALUES ('9283', '绥滨县', '3', '9222', 'S');
INSERT INTO `ey_region` VALUES ('9296', '双鸭山市', '2', '8558', 'S');
INSERT INTO `ey_region` VALUES ('9297', '市辖区', '3', '9296', 'S');
INSERT INTO `ey_region` VALUES ('9298', '尖山区', '3', '9296', 'J');
INSERT INTO `ey_region` VALUES ('9307', '岭东区', '3', '9296', 'L');
INSERT INTO `ey_region` VALUES ('9317', '四方台区', '3', '9296', 'S');
INSERT INTO `ey_region` VALUES ('9323', '宝山区', '3', '9296', 'B');
INSERT INTO `ey_region` VALUES ('9335', '集贤县', '3', '9296', 'J');
INSERT INTO `ey_region` VALUES ('9356', '友谊县', '3', '9296', 'Y');
INSERT INTO `ey_region` VALUES ('9370', '宝清县', '3', '9296', 'B');
INSERT INTO `ey_region` VALUES ('9393', '饶河县', '3', '9296', 'R');
INSERT INTO `ey_region` VALUES ('9419', '大庆市', '2', '8558', 'D');
INSERT INTO `ey_region` VALUES ('9420', '市辖区', '3', '9419', 'S');
INSERT INTO `ey_region` VALUES ('9421', '萨尔图区', '3', '9419', 'S');
INSERT INTO `ey_region` VALUES ('9431', '龙凤区', '3', '9419', 'L');
INSERT INTO `ey_region` VALUES ('9440', '让胡路区', '3', '9419', 'R');
INSERT INTO `ey_region` VALUES ('9451', '红岗区', '3', '9419', 'H');
INSERT INTO `ey_region` VALUES ('9458', '大同区', '3', '9419', 'D');
INSERT INTO `ey_region` VALUES ('9474', '肇州县', '3', '9419', 'Z');
INSERT INTO `ey_region` VALUES ('9489', '肇源县', '3', '9419', 'Z');
INSERT INTO `ey_region` VALUES ('9514', '林甸县', '3', '9419', 'L');
INSERT INTO `ey_region` VALUES ('9527', '杜尔伯特县', '3', '9419', 'D');
INSERT INTO `ey_region` VALUES ('9553', '伊春市', '2', '8558', 'Y');
INSERT INTO `ey_region` VALUES ('9554', '市辖区', '3', '9553', 'S');
INSERT INTO `ey_region` VALUES ('9555', '伊春区', '3', '9553', 'Y');
INSERT INTO `ey_region` VALUES ('9561', '南岔区', '3', '9553', 'N');
INSERT INTO `ey_region` VALUES ('9581', '友好区', '3', '9553', 'Y');
INSERT INTO `ey_region` VALUES ('9599', '西林区', '3', '9553', 'X');
INSERT INTO `ey_region` VALUES ('9603', '翠峦区', '3', '9553', 'C');
INSERT INTO `ey_region` VALUES ('9614', '新青区', '3', '9553', 'X');
INSERT INTO `ey_region` VALUES ('9631', '美溪区', '3', '9553', 'M');
INSERT INTO `ey_region` VALUES ('9647', '金山屯区', '3', '9553', 'J');
INSERT INTO `ey_region` VALUES ('9660', '五营区', '3', '9553', 'W');
INSERT INTO `ey_region` VALUES ('9671', '乌马河区', '3', '9553', 'W');
INSERT INTO `ey_region` VALUES ('9685', '汤旺河区', '3', '9553', 'T');
INSERT INTO `ey_region` VALUES ('9702', '带岭区', '3', '9553', 'D');
INSERT INTO `ey_region` VALUES ('9715', '乌伊岭区', '3', '9553', 'W');
INSERT INTO `ey_region` VALUES ('9729', '红星区', '3', '9553', 'H');
INSERT INTO `ey_region` VALUES ('9742', '上甘岭区', '3', '9553', 'S');
INSERT INTO `ey_region` VALUES ('9756', '嘉荫县', '3', '9553', 'J');
INSERT INTO `ey_region` VALUES ('9772', '铁力市', '3', '9553', 'T');
INSERT INTO `ey_region` VALUES ('9785', '佳木斯市', '2', '8558', 'J');
INSERT INTO `ey_region` VALUES ('9786', '市辖区', '3', '9785', 'S');
INSERT INTO `ey_region` VALUES ('9787', '向阳区', '3', '9785', 'X');
INSERT INTO `ey_region` VALUES ('9795', '前进区', '3', '9785', 'Q');
INSERT INTO `ey_region` VALUES ('9802', '东风区', '3', '9785', 'D');
INSERT INTO `ey_region` VALUES ('9810', '郊区', '3', '9785', 'J');
INSERT INTO `ey_region` VALUES ('9825', '桦南县', '3', '9785', 'H');
INSERT INTO `ey_region` VALUES ('9839', '桦川县', '3', '9785', 'H');
INSERT INTO `ey_region` VALUES ('9851', '汤原县', '3', '9785', 'T');
INSERT INTO `ey_region` VALUES ('9866', '抚远县', '3', '9785', 'F');
INSERT INTO `ey_region` VALUES ('9879', '同江市', '3', '9785', 'T');
INSERT INTO `ey_region` VALUES ('9907', '富锦市', '3', '9785', 'F');
INSERT INTO `ey_region` VALUES ('9930', '七台河市', '2', '8558', 'Q');
INSERT INTO `ey_region` VALUES ('9931', '市辖区', '3', '9930', 'S');
INSERT INTO `ey_region` VALUES ('9932', '新兴区', '3', '9930', 'X');
INSERT INTO `ey_region` VALUES ('9944', '桃山区', '3', '9930', 'T');
INSERT INTO `ey_region` VALUES ('9952', '茄子河区', '3', '9930', 'Q');
INSERT INTO `ey_region` VALUES ('9962', '勃利县', '3', '9930', 'B');
INSERT INTO `ey_region` VALUES ('9981', '牡丹江市', '2', '8558', 'M');
INSERT INTO `ey_region` VALUES ('9982', '市辖区', '3', '9981', 'S');
INSERT INTO `ey_region` VALUES ('9983', '东安区', '3', '9981', 'D');
INSERT INTO `ey_region` VALUES ('9989', '阳明区', '3', '9981', 'Y');
INSERT INTO `ey_region` VALUES ('9996', '爱民区', '3', '9981', 'A');
INSERT INTO `ey_region` VALUES ('10005', '西安区', '3', '9981', 'X');
INSERT INTO `ey_region` VALUES ('10014', '东宁县', '3', '9981', 'D');
INSERT INTO `ey_region` VALUES ('10022', '林口县', '3', '9981', 'L');
INSERT INTO `ey_region` VALUES ('10036', '绥芬河市', '3', '9981', 'S');
INSERT INTO `ey_region` VALUES ('10039', '海林市', '3', '9981', 'H');
INSERT INTO `ey_region` VALUES ('10056', '宁安市', '3', '9981', 'N');
INSERT INTO `ey_region` VALUES ('10072', '穆棱市', '3', '9981', 'M');
INSERT INTO `ey_region` VALUES ('10084', '黑河市', '2', '8558', 'H');
INSERT INTO `ey_region` VALUES ('10085', '市辖区', '3', '10084', 'S');
INSERT INTO `ey_region` VALUES ('10086', '爱辉区', '3', '10084', 'A');
INSERT INTO `ey_region` VALUES ('10122', '嫩江县', '3', '10084', 'N');
INSERT INTO `ey_region` VALUES ('10150', '逊克县', '3', '10084', 'X');
INSERT INTO `ey_region` VALUES ('10168', '孙吴县', '3', '10084', 'S');
INSERT INTO `ey_region` VALUES ('10192', '北安市', '3', '10084', 'B');
INSERT INTO `ey_region` VALUES ('10214', '五大连池市', '3', '10084', 'W');
INSERT INTO `ey_region` VALUES ('10252', '绥化市', '2', '8558', 'S');
INSERT INTO `ey_region` VALUES ('10253', '市辖区', '3', '10252', 'S');
INSERT INTO `ey_region` VALUES ('10254', '北林区', '3', '10252', 'B');
INSERT INTO `ey_region` VALUES ('10281', '望奎县', '3', '10252', 'W');
INSERT INTO `ey_region` VALUES ('10301', '兰西县', '3', '10252', 'L');
INSERT INTO `ey_region` VALUES ('10320', '青冈县', '3', '10252', 'Q');
INSERT INTO `ey_region` VALUES ('10342', '庆安县', '3', '10252', 'Q');
INSERT INTO `ey_region` VALUES ('10360', '明水县', '3', '10252', 'M');
INSERT INTO `ey_region` VALUES ('10380', '绥棱县', '3', '10252', 'S');
INSERT INTO `ey_region` VALUES ('10401', '安达市', '3', '10252', 'A');
INSERT INTO `ey_region` VALUES ('10425', '肇东市', '3', '10252', 'Z');
INSERT INTO `ey_region` VALUES ('10452', '海伦市', '3', '10252', 'H');
INSERT INTO `ey_region` VALUES ('10483', '大兴安岭地区', '2', '8558', 'D');
INSERT INTO `ey_region` VALUES ('10484', '加格达奇区', '3', '10483', 'J');
INSERT INTO `ey_region` VALUES ('10495', '松岭区', '3', '10483', 'S');
INSERT INTO `ey_region` VALUES ('10500', '新林区', '3', '10483', 'X');
INSERT INTO `ey_region` VALUES ('10509', '呼中区', '3', '10483', 'H');
INSERT INTO `ey_region` VALUES ('10515', '呼玛县', '3', '10483', 'H');
INSERT INTO `ey_region` VALUES ('10525', '塔河县', '3', '10483', 'T');
INSERT INTO `ey_region` VALUES ('10534', '漠河县', '3', '10483', 'M');
INSERT INTO `ey_region` VALUES ('10543', '上海市', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('10544', '上海市', '2', '10543', 'S');
INSERT INTO `ey_region` VALUES ('10545', '黄浦区', '3', '10544', 'H');
INSERT INTO `ey_region` VALUES ('10555', '卢湾区', '3', '10544', 'L');
INSERT INTO `ey_region` VALUES ('10560', '徐汇区', '3', '10544', 'X');
INSERT INTO `ey_region` VALUES ('10575', '长宁区', '3', '10544', 'C');
INSERT INTO `ey_region` VALUES ('10586', '静安区', '3', '10544', 'J');
INSERT INTO `ey_region` VALUES ('10592', '普陀区', '3', '10544', 'P');
INSERT INTO `ey_region` VALUES ('10602', '闸北区', '3', '10544', 'Z');
INSERT INTO `ey_region` VALUES ('10612', '虹口区', '3', '10544', 'H');
INSERT INTO `ey_region` VALUES ('10623', '杨浦区', '3', '10544', 'Y');
INSERT INTO `ey_region` VALUES ('10636', '闵行区', '3', '10544', 'M');
INSERT INTO `ey_region` VALUES ('10650', '宝山区', '3', '10544', 'B');
INSERT INTO `ey_region` VALUES ('10664', '嘉定区', '3', '10544', 'J');
INSERT INTO `ey_region` VALUES ('10678', '浦东新区', '3', '10544', 'P');
INSERT INTO `ey_region` VALUES ('10704', '金山区', '3', '10544', 'J');
INSERT INTO `ey_region` VALUES ('10715', '松江区', '3', '10544', 'S');
INSERT INTO `ey_region` VALUES ('10735', '青浦区', '3', '10544', 'Q');
INSERT INTO `ey_region` VALUES ('10747', '南汇区', '3', '10544', 'N');
INSERT INTO `ey_region` VALUES ('10765', '奉贤区', '3', '10544', 'F');
INSERT INTO `ey_region` VALUES ('10780', '崇明区', '3', '10544', 'C');
INSERT INTO `ey_region` VALUES ('10808', '江苏省', '1', '0', 'J');
INSERT INTO `ey_region` VALUES ('10809', '南京市', '2', '10808', 'N');
INSERT INTO `ey_region` VALUES ('10810', '市辖区', '3', '10809', 'S');
INSERT INTO `ey_region` VALUES ('10811', '玄武区', '3', '10809', 'X');
INSERT INTO `ey_region` VALUES ('10820', '白下区', '3', '10809', 'B');
INSERT INTO `ey_region` VALUES ('10831', '秦淮区', '3', '10809', 'Q');
INSERT INTO `ey_region` VALUES ('10837', '建邺区', '3', '10809', 'J');
INSERT INTO `ey_region` VALUES ('10845', '鼓楼区', '3', '10809', 'G');
INSERT INTO `ey_region` VALUES ('10853', '下关区', '3', '10809', 'X');
INSERT INTO `ey_region` VALUES ('10860', '浦口区', '3', '10809', 'P');
INSERT INTO `ey_region` VALUES ('10876', '栖霞区', '3', '10809', 'Q');
INSERT INTO `ey_region` VALUES ('10894', '雨花台区', '3', '10809', 'Y');
INSERT INTO `ey_region` VALUES ('10903', '江宁区', '3', '10809', 'J');
INSERT INTO `ey_region` VALUES ('10916', '六合区', '3', '10809', 'L');
INSERT INTO `ey_region` VALUES ('10937', '溧水县', '3', '10809', 'L');
INSERT INTO `ey_region` VALUES ('10947', '高淳县', '3', '10809', 'G');
INSERT INTO `ey_region` VALUES ('10960', '无锡市', '2', '10808', 'W');
INSERT INTO `ey_region` VALUES ('10961', '市辖区', '3', '10960', 'S');
INSERT INTO `ey_region` VALUES ('10962', '崇安区', '3', '10960', 'C');
INSERT INTO `ey_region` VALUES ('10969', '南长区', '3', '10960', 'N');
INSERT INTO `ey_region` VALUES ('10976', '北塘区', '3', '10960', 'B');
INSERT INTO `ey_region` VALUES ('10981', '锡山区', '3', '10960', 'X');
INSERT INTO `ey_region` VALUES ('10990', '惠山区', '3', '10960', 'H');
INSERT INTO `ey_region` VALUES ('10999', '滨湖区', '3', '10960', 'B');
INSERT INTO `ey_region` VALUES ('11018', '江阴市', '3', '10960', 'J');
INSERT INTO `ey_region` VALUES ('11039', '宜兴市', '3', '10960', 'Y');
INSERT INTO `ey_region` VALUES ('11067', '徐州市', '2', '10808', 'X');
INSERT INTO `ey_region` VALUES ('11068', '市辖区', '3', '11067', 'S');
INSERT INTO `ey_region` VALUES ('11069', '鼓楼区', '3', '11067', 'G');
INSERT INTO `ey_region` VALUES ('11081', '云龙区', '3', '11067', 'Y');
INSERT INTO `ey_region` VALUES ('11089', '九里区', '3', '11067', 'J');
INSERT INTO `ey_region` VALUES ('11103', '贾汪区', '3', '11067', 'J');
INSERT INTO `ey_region` VALUES ('11115', '泉山区', '3', '11067', 'Q');
INSERT INTO `ey_region` VALUES ('11126', '丰县', '3', '11067', 'F');
INSERT INTO `ey_region` VALUES ('11142', '沛县', '3', '11067', 'P');
INSERT INTO `ey_region` VALUES ('11160', '铜山县', '3', '11067', 'T');
INSERT INTO `ey_region` VALUES ('11182', '睢宁县', '3', '11067', 'S');
INSERT INTO `ey_region` VALUES ('11200', '新沂市', '3', '11067', 'X');
INSERT INTO `ey_region` VALUES ('11218', '邳州市', '3', '11067', 'P');
INSERT INTO `ey_region` VALUES ('11245', '常州市', '2', '10808', 'C');
INSERT INTO `ey_region` VALUES ('11246', '常州市区', '3', '11245', 'C');
INSERT INTO `ey_region` VALUES ('11247', '天宁区', '3', '11245', 'T');
INSERT INTO `ey_region` VALUES ('11254', '钟楼区', '3', '11245', 'Z');
INSERT INTO `ey_region` VALUES ('11262', '戚墅堰区', '3', '11245', 'Q');
INSERT INTO `ey_region` VALUES ('11266', '新北区', '3', '11245', 'X');
INSERT INTO `ey_region` VALUES ('11276', '武进区', '3', '11245', 'W');
INSERT INTO `ey_region` VALUES ('11311', '溧阳市', '3', '11245', 'L');
INSERT INTO `ey_region` VALUES ('11331', '金坛市', '3', '11245', 'J');
INSERT INTO `ey_region` VALUES ('11348', '苏州市', '2', '10808', 'S');
INSERT INTO `ey_region` VALUES ('11349', '市辖区', '3', '11348', 'S');
INSERT INTO `ey_region` VALUES ('11350', '沧浪区', '3', '11348', 'C');
INSERT INTO `ey_region` VALUES ('11357', '平江区', '3', '11348', 'P');
INSERT INTO `ey_region` VALUES ('11368', '金阊区', '3', '11348', 'J');
INSERT INTO `ey_region` VALUES ('11374', '苏州高新区虎丘区', '3', '11348', 'S');
INSERT INTO `ey_region` VALUES ('11387', '吴中区', '3', '11348', 'W');
INSERT INTO `ey_region` VALUES ('11409', '相城区', '3', '11348', 'X');
INSERT INTO `ey_region` VALUES ('11419', '常熟市', '3', '11348', 'C');
INSERT INTO `ey_region` VALUES ('11433', '张家港市', '3', '11348', 'Z');
INSERT INTO `ey_region` VALUES ('11448', '昆山市', '3', '11348', 'K');
INSERT INTO `ey_region` VALUES ('11460', '吴江市', '3', '11348', 'W');
INSERT INTO `ey_region` VALUES ('11472', '太仓市', '3', '11348', 'T');
INSERT INTO `ey_region` VALUES ('11482', '南通市', '2', '10808', 'N');
INSERT INTO `ey_region` VALUES ('11483', '市辖区', '3', '11482', 'S');
INSERT INTO `ey_region` VALUES ('11484', '崇川区', '3', '11482', 'C');
INSERT INTO `ey_region` VALUES ('11502', '港闸区', '3', '11482', 'G');
INSERT INTO `ey_region` VALUES ('11510', '海安县', '3', '11482', 'H');
INSERT INTO `ey_region` VALUES ('11526', '如东', '3', '11482', 'R');
INSERT INTO `ey_region` VALUES ('11542', '启东市', '3', '11482', 'Q');
INSERT INTO `ey_region` VALUES ('11568', '如皋市', '3', '11482', 'R');
INSERT INTO `ey_region` VALUES ('11600', '通州市', '3', '11482', 'T');
INSERT INTO `ey_region` VALUES ('11627', '海门市', '3', '11482', 'H');
INSERT INTO `ey_region` VALUES ('11663', '连云港市', '2', '10808', 'L');
INSERT INTO `ey_region` VALUES ('11664', '市辖区', '3', '11663', 'S');
INSERT INTO `ey_region` VALUES ('11665', '连云区', '3', '11663', 'L');
INSERT INTO `ey_region` VALUES ('11678', '新浦区', '3', '11663', 'X');
INSERT INTO `ey_region` VALUES ('11692', '海州区', '3', '11663', 'H');
INSERT INTO `ey_region` VALUES ('11699', '赣榆县', '3', '11663', 'G');
INSERT INTO `ey_region` VALUES ('11722', '东海县', '3', '11663', 'D');
INSERT INTO `ey_region` VALUES ('11747', '灌云县', '3', '11663', 'G');
INSERT INTO `ey_region` VALUES ('11771', '灌南县', '3', '11663', 'G');
INSERT INTO `ey_region` VALUES ('11786', '淮安市', '2', '10808', 'H');
INSERT INTO `ey_region` VALUES ('11787', '市辖区', '3', '11786', 'S');
INSERT INTO `ey_region` VALUES ('11788', '清河区', '3', '11786', 'Q');
INSERT INTO `ey_region` VALUES ('11801', '楚州区', '3', '11786', 'C');
INSERT INTO `ey_region` VALUES ('11830', '淮阴区', '3', '11786', 'H');
INSERT INTO `ey_region` VALUES ('11853', '清浦区', '3', '11786', 'Q');
INSERT INTO `ey_region` VALUES ('11863', '涟水县', '3', '11786', 'L');
INSERT INTO `ey_region` VALUES ('11896', '洪泽县', '3', '11786', 'H');
INSERT INTO `ey_region` VALUES ('11909', '盱眙县', '3', '11786', 'X');
INSERT INTO `ey_region` VALUES ('11931', '金湖县', '3', '11786', 'J');
INSERT INTO `ey_region` VALUES ('11947', '盐城市', '2', '10808', 'Y');
INSERT INTO `ey_region` VALUES ('11948', '市辖区', '3', '11947', 'S');
INSERT INTO `ey_region` VALUES ('11949', '亭湖区', '3', '11947', 'T');
INSERT INTO `ey_region` VALUES ('11967', '盐都区', '3', '11947', 'Y');
INSERT INTO `ey_region` VALUES ('11982', '响水县', '3', '11947', 'X');
INSERT INTO `ey_region` VALUES ('11998', '滨海县', '3', '11947', 'B');
INSERT INTO `ey_region` VALUES ('12017', '阜宁县', '3', '11947', 'F');
INSERT INTO `ey_region` VALUES ('12040', '射阳县', '3', '11947', 'S');
INSERT INTO `ey_region` VALUES ('12066', '建湖县', '3', '11947', 'J');
INSERT INTO `ey_region` VALUES ('12083', '东台市', '3', '11947', 'D');
INSERT INTO `ey_region` VALUES ('12117', '大丰市', '3', '11947', 'D');
INSERT INTO `ey_region` VALUES ('12135', '扬州市', '2', '10808', 'Y');
INSERT INTO `ey_region` VALUES ('12136', '市辖区', '3', '12135', 'S');
INSERT INTO `ey_region` VALUES ('12137', '广陵区', '3', '12135', 'G');
INSERT INTO `ey_region` VALUES ('12144', '邗江区', '3', '12135', 'H');
INSERT INTO `ey_region` VALUES ('12160', '维扬区', '3', '12135', 'W');
INSERT INTO `ey_region` VALUES ('12175', '宝应县', '3', '12135', 'B');
INSERT INTO `ey_region` VALUES ('12191', '仪征市', '3', '12135', 'Y');
INSERT INTO `ey_region` VALUES ('12212', '高邮市', '3', '12135', 'G');
INSERT INTO `ey_region` VALUES ('12235', '江都市', '3', '12135', 'J');
INSERT INTO `ey_region` VALUES ('12249', '镇江市', '2', '10808', 'Z');
INSERT INTO `ey_region` VALUES ('12250', '市区', '3', '12249', 'S');
INSERT INTO `ey_region` VALUES ('12251', '京口区', '3', '12249', 'J');
INSERT INTO `ey_region` VALUES ('12265', '润州区', '3', '12249', 'R');
INSERT INTO `ey_region` VALUES ('12273', '丹徒区', '3', '12249', 'D');
INSERT INTO `ey_region` VALUES ('12282', '丹阳市', '3', '12249', 'D');
INSERT INTO `ey_region` VALUES ('12300', '扬中市', '3', '12249', 'Y');
INSERT INTO `ey_region` VALUES ('12312', '句容市', '3', '12249', 'J');
INSERT INTO `ey_region` VALUES ('12343', '泰州市', '2', '10808', 'T');
INSERT INTO `ey_region` VALUES ('12344', '市辖区', '3', '12343', 'S');
INSERT INTO `ey_region` VALUES ('12345', '海陵区', '3', '12343', 'H');
INSERT INTO `ey_region` VALUES ('12362', '高港区', '3', '12343', 'G');
INSERT INTO `ey_region` VALUES ('12370', '兴化市', '3', '12343', 'X');
INSERT INTO `ey_region` VALUES ('12407', '靖江市', '3', '12343', 'J');
INSERT INTO `ey_region` VALUES ('12423', '泰兴市', '3', '12343', 'T');
INSERT INTO `ey_region` VALUES ('12450', '姜堰市', '3', '12343', 'J');
INSERT INTO `ey_region` VALUES ('12475', '宿迁市', '2', '10808', 'S');
INSERT INTO `ey_region` VALUES ('12476', '市辖区', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12477', '宿城区', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12496', '宿豫区', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12515', '沭阳县', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12551', '泗阳县', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12570', '泗洪县', '3', '12475', 'S');
INSERT INTO `ey_region` VALUES ('12596', '浙江省', '1', '0', 'Z');
INSERT INTO `ey_region` VALUES ('12597', '杭州市', '2', '12596', 'H');
INSERT INTO `ey_region` VALUES ('12598', '市辖区', '3', '12597', 'S');
INSERT INTO `ey_region` VALUES ('12599', '上城区', '3', '12597', 'S');
INSERT INTO `ey_region` VALUES ('12606', '下城区', '3', '12597', 'X');
INSERT INTO `ey_region` VALUES ('12615', '江干区', '3', '12597', 'J');
INSERT INTO `ey_region` VALUES ('12626', '拱墅区', '3', '12597', 'G');
INSERT INTO `ey_region` VALUES ('12637', '西湖区', '3', '12597', 'X');
INSERT INTO `ey_region` VALUES ('12652', '滨江区', '3', '12597', 'B');
INSERT INTO `ey_region` VALUES ('12656', '萧山区', '3', '12597', 'X');
INSERT INTO `ey_region` VALUES ('12685', '余杭区', '3', '12597', 'Y');
INSERT INTO `ey_region` VALUES ('12705', '桐庐县', '3', '12597', 'T');
INSERT INTO `ey_region` VALUES ('12719', '淳安县', '3', '12597', 'C');
INSERT INTO `ey_region` VALUES ('12743', '建德市', '3', '12597', 'J');
INSERT INTO `ey_region` VALUES ('12760', '富阳市', '3', '12597', 'F');
INSERT INTO `ey_region` VALUES ('12786', '临安市', '3', '12597', 'L');
INSERT INTO `ey_region` VALUES ('12813', '宁波市', '2', '12596', 'N');
INSERT INTO `ey_region` VALUES ('12814', '市辖区', '3', '12813', 'S');
INSERT INTO `ey_region` VALUES ('12815', '海曙区', '3', '12813', 'H');
INSERT INTO `ey_region` VALUES ('12824', '江东区', '3', '12813', 'J');
INSERT INTO `ey_region` VALUES ('12832', '江北区', '3', '12813', 'J');
INSERT INTO `ey_region` VALUES ('12841', '北仑区', '3', '12813', 'B');
INSERT INTO `ey_region` VALUES ('12851', '镇海区', '3', '12813', 'Z');
INSERT INTO `ey_region` VALUES ('12858', '鄞州区', '3', '12813', 'Y');
INSERT INTO `ey_region` VALUES ('12881', '象山县', '3', '12813', 'X');
INSERT INTO `ey_region` VALUES ('12900', '宁海县', '3', '12813', 'N');
INSERT INTO `ey_region` VALUES ('12919', '余姚市', '3', '12813', 'Y');
INSERT INTO `ey_region` VALUES ('12941', '慈溪市', '3', '12813', 'C');
INSERT INTO `ey_region` VALUES ('12962', '奉化市', '3', '12813', 'F');
INSERT INTO `ey_region` VALUES ('12974', '温州市', '2', '12596', 'W');
INSERT INTO `ey_region` VALUES ('12975', '市辖区', '3', '12974', 'S');
INSERT INTO `ey_region` VALUES ('12976', '鹿城区', '3', '12974', 'L');
INSERT INTO `ey_region` VALUES ('12998', '龙湾区', '3', '12974', 'L');
INSERT INTO `ey_region` VALUES ('13009', '瓯海区', '3', '12974', 'O');
INSERT INTO `ey_region` VALUES ('13023', '洞头县', '3', '12974', 'D');
INSERT INTO `ey_region` VALUES ('13030', '永嘉县', '3', '12974', 'Y');
INSERT INTO `ey_region` VALUES ('13069', '平阳县', '3', '12974', 'P');
INSERT INTO `ey_region` VALUES ('13101', '苍南县', '3', '12974', 'C');
INSERT INTO `ey_region` VALUES ('13138', '文成县', '3', '12974', 'W');
INSERT INTO `ey_region` VALUES ('13172', '泰顺县', '3', '12974', 'T');
INSERT INTO `ey_region` VALUES ('13209', '瑞安市', '3', '12974', 'R');
INSERT INTO `ey_region` VALUES ('13248', '乐清市', '3', '12974', 'L');
INSERT INTO `ey_region` VALUES ('13280', '嘉兴市', '2', '12596', 'J');
INSERT INTO `ey_region` VALUES ('13281', '市辖区', '3', '13280', 'S');
INSERT INTO `ey_region` VALUES ('13282', '南湖区', '3', '13280', 'N');
INSERT INTO `ey_region` VALUES ('13295', '秀洲区', '3', '13280', 'X');
INSERT INTO `ey_region` VALUES ('13304', '嘉善县', '3', '13280', 'J');
INSERT INTO `ey_region` VALUES ('13316', '海盐县', '3', '13280', 'H');
INSERT INTO `ey_region` VALUES ('13325', '海宁市', '3', '13280', 'H');
INSERT INTO `ey_region` VALUES ('13339', '平湖市', '3', '13280', 'P');
INSERT INTO `ey_region` VALUES ('13350', '桐乡市', '3', '13280', 'T');
INSERT INTO `ey_region` VALUES ('13364', '湖州市', '2', '12596', 'H');
INSERT INTO `ey_region` VALUES ('13365', '市辖区', '3', '13364', 'S');
INSERT INTO `ey_region` VALUES ('13366', '吴兴区', '3', '13364', 'W');
INSERT INTO `ey_region` VALUES ('13382', '南浔区', '3', '13364', 'N');
INSERT INTO `ey_region` VALUES ('13392', '德清县', '3', '13364', 'D');
INSERT INTO `ey_region` VALUES ('13404', '长兴县', '3', '13364', 'C');
INSERT INTO `ey_region` VALUES ('13421', '安吉县', '3', '13364', 'A');
INSERT INTO `ey_region` VALUES ('13437', '绍兴市', '2', '12596', 'S');
INSERT INTO `ey_region` VALUES ('13438', '市辖区', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13439', '越城区', '3', '13437', 'Y');
INSERT INTO `ey_region` VALUES ('13453', '绍兴县', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13473', '新昌县', '3', '13437', 'X');
INSERT INTO `ey_region` VALUES ('13490', '诸暨市', '3', '13437', 'Z');
INSERT INTO `ey_region` VALUES ('13518', '上虞市', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13542', '嵊州市', '3', '13437', 'S');
INSERT INTO `ey_region` VALUES ('13564', '金华市', '2', '12596', 'J');
INSERT INTO `ey_region` VALUES ('13565', '市辖区', '3', '13564', 'S');
INSERT INTO `ey_region` VALUES ('13566', '婺城区', '3', '13564', 'W');
INSERT INTO `ey_region` VALUES ('13594', '金东区', '3', '13564', 'J');
INSERT INTO `ey_region` VALUES ('13606', '武义县', '3', '13564', 'W');
INSERT INTO `ey_region` VALUES ('13625', '浦江县', '3', '13564', 'P');
INSERT INTO `ey_region` VALUES ('13641', '磐安县', '3', '13564', 'P');
INSERT INTO `ey_region` VALUES ('13662', '兰溪市', '3', '13564', 'L');
INSERT INTO `ey_region` VALUES ('13678', '义乌市', '3', '13564', 'Y');
INSERT INTO `ey_region` VALUES ('13692', '东阳市', '3', '13564', 'D');
INSERT INTO `ey_region` VALUES ('13711', '永康市', '3', '13564', 'Y');
INSERT INTO `ey_region` VALUES ('13726', '衢州市', '2', '12596', 'Q');
INSERT INTO `ey_region` VALUES ('13727', '市辖区', '3', '13726', 'S');
INSERT INTO `ey_region` VALUES ('13728', '柯城区', '3', '13726', 'K');
INSERT INTO `ey_region` VALUES ('13746', '衢江区', '3', '13726', 'Q');
INSERT INTO `ey_region` VALUES ('13768', '常山县', '3', '13726', 'C');
INSERT INTO `ey_region` VALUES ('13783', '开化县', '3', '13726', 'K');
INSERT INTO `ey_region` VALUES ('13802', '龙游县', '3', '13726', 'L');
INSERT INTO `ey_region` VALUES ('13818', '江山市', '3', '13726', 'J');
INSERT INTO `ey_region` VALUES ('13840', '舟山市', '2', '12596', 'Z');
INSERT INTO `ey_region` VALUES ('13841', '市辖区', '3', '13840', 'S');
INSERT INTO `ey_region` VALUES ('13842', '定海区', '3', '13840', 'D');
INSERT INTO `ey_region` VALUES ('13859', '普陀区', '3', '13840', 'P');
INSERT INTO `ey_region` VALUES ('13874', '岱山县', '3', '13840', 'D');
INSERT INTO `ey_region` VALUES ('13882', '嵊泗县', '3', '13840', 'S');
INSERT INTO `ey_region` VALUES ('13890', '台州市', '2', '12596', 'T');
INSERT INTO `ey_region` VALUES ('13891', '市辖区', '3', '13890', 'S');
INSERT INTO `ey_region` VALUES ('13892', '椒江区', '3', '13890', 'J');
INSERT INTO `ey_region` VALUES ('13903', '黄岩区', '3', '13890', 'H');
INSERT INTO `ey_region` VALUES ('13923', '路桥区', '3', '13890', 'L');
INSERT INTO `ey_region` VALUES ('13934', '玉环县', '3', '13890', 'Y');
INSERT INTO `ey_region` VALUES ('13944', '三门县', '3', '13890', 'S');
INSERT INTO `ey_region` VALUES ('13959', '天台县', '3', '13890', 'T');
INSERT INTO `ey_region` VALUES ('13975', '仙居县', '3', '13890', 'X');
INSERT INTO `ey_region` VALUES ('13996', '温岭市', '3', '13890', 'W');
INSERT INTO `ey_region` VALUES ('14013', '临海市', '3', '13890', 'L');
INSERT INTO `ey_region` VALUES ('14033', '丽水市', '2', '12596', 'L');
INSERT INTO `ey_region` VALUES ('14034', '市辖区', '3', '14033', 'S');
INSERT INTO `ey_region` VALUES ('14035', '莲都区', '3', '14033', 'L');
INSERT INTO `ey_region` VALUES ('14054', '青田县', '3', '14033', 'Q');
INSERT INTO `ey_region` VALUES ('14086', '缙云县', '3', '14033', 'J');
INSERT INTO `ey_region` VALUES ('14111', '遂昌县', '3', '14033', 'S');
INSERT INTO `ey_region` VALUES ('14132', '松阳县', '3', '14033', 'S');
INSERT INTO `ey_region` VALUES ('14153', '云和县', '3', '14033', 'Y');
INSERT INTO `ey_region` VALUES ('14168', '庆元县', '3', '14033', 'Q');
INSERT INTO `ey_region` VALUES ('14189', '景宁县', '3', '14033', 'J');
INSERT INTO `ey_region` VALUES ('14214', '龙泉市', '3', '14033', 'L');
INSERT INTO `ey_region` VALUES ('14234', '安徽省', '1', '0', 'A');
INSERT INTO `ey_region` VALUES ('14235', '合肥市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14236', '市辖区', '3', '14235', 'S');
INSERT INTO `ey_region` VALUES ('14237', '瑶海区', '3', '14235', 'Y');
INSERT INTO `ey_region` VALUES ('14254', '庐阳区', '3', '14235', 'L');
INSERT INTO `ey_region` VALUES ('14269', '蜀山区', '3', '14235', 'S');
INSERT INTO `ey_region` VALUES ('14286', '包河区', '3', '14235', 'B');
INSERT INTO `ey_region` VALUES ('14297', '长丰县', '3', '14235', 'C');
INSERT INTO `ey_region` VALUES ('14314', '肥东县', '3', '14235', 'F');
INSERT INTO `ey_region` VALUES ('14334', '肥西县', '3', '14235', 'F');
INSERT INTO `ey_region` VALUES ('14351', '芜湖市', '2', '14234', 'W');
INSERT INTO `ey_region` VALUES ('14352', '市辖区', '3', '14351', 'S');
INSERT INTO `ey_region` VALUES ('14353', '镜湖区', '3', '14351', 'J');
INSERT INTO `ey_region` VALUES ('14366', '弋江区', '3', '14351', 'Y');
INSERT INTO `ey_region` VALUES ('14374', '鸠江区', '3', '14351', 'J');
INSERT INTO `ey_region` VALUES ('14382', '三山区', '3', '14351', 'S');
INSERT INTO `ey_region` VALUES ('14387', '芜湖县', '3', '14351', 'W');
INSERT INTO `ey_region` VALUES ('14394', '繁昌县', '3', '14351', 'F');
INSERT INTO `ey_region` VALUES ('14401', '南陵县', '3', '14351', 'N');
INSERT INTO `ey_region` VALUES ('14410', '蚌埠市', '2', '14234', 'B');
INSERT INTO `ey_region` VALUES ('14411', '市辖区', '3', '14410', 'S');
INSERT INTO `ey_region` VALUES ('14412', '龙子湖区', '3', '14410', 'L');
INSERT INTO `ey_region` VALUES ('14422', '蚌山区', '3', '14410', 'B');
INSERT INTO `ey_region` VALUES ('14434', '禹会区', '3', '14410', 'Y');
INSERT INTO `ey_region` VALUES ('14443', '淮上区', '3', '14410', 'H');
INSERT INTO `ey_region` VALUES ('14449', '怀远县', '3', '14410', 'H');
INSERT INTO `ey_region` VALUES ('14471', '五河县', '3', '14410', 'W');
INSERT INTO `ey_region` VALUES ('14487', '固镇县', '3', '14410', 'G');
INSERT INTO `ey_region` VALUES ('14500', '淮南市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14501', '市辖区', '3', '14500', 'S');
INSERT INTO `ey_region` VALUES ('14502', '大通区', '3', '14500', 'D');
INSERT INTO `ey_region` VALUES ('14508', '田家庵区', '3', '14500', 'T');
INSERT INTO `ey_region` VALUES ('14523', '谢家集区', '3', '14500', 'X');
INSERT INTO `ey_region` VALUES ('14535', '八公山区', '3', '14500', 'B');
INSERT INTO `ey_region` VALUES ('14542', '潘集区', '3', '14500', 'P');
INSERT INTO `ey_region` VALUES ('14554', '凤台县', '3', '14500', 'F');
INSERT INTO `ey_region` VALUES ('14575', '马鞍山市', '2', '14234', 'M');
INSERT INTO `ey_region` VALUES ('14576', '市辖区', '3', '14575', 'S');
INSERT INTO `ey_region` VALUES ('14577', '金家庄区', '3', '14575', 'J');
INSERT INTO `ey_region` VALUES ('14583', '花山区', '3', '14575', 'H');
INSERT INTO `ey_region` VALUES ('14589', '雨山区', '3', '14575', 'Y');
INSERT INTO `ey_region` VALUES ('14597', '当涂县', '3', '14575', 'D');
INSERT INTO `ey_region` VALUES ('14612', '淮北市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14613', '市辖区', '3', '14612', 'S');
INSERT INTO `ey_region` VALUES ('14614', '杜集区', '3', '14612', 'D');
INSERT INTO `ey_region` VALUES ('14620', '相山区', '3', '14612', 'X');
INSERT INTO `ey_region` VALUES ('14632', '烈山区', '3', '14612', 'L');
INSERT INTO `ey_region` VALUES ('14641', '濉溪县', '3', '14612', 'S');
INSERT INTO `ey_region` VALUES ('14653', '铜陵市', '2', '14234', 'T');
INSERT INTO `ey_region` VALUES ('14654', '市辖区', '3', '14653', 'S');
INSERT INTO `ey_region` VALUES ('14655', '铜官山区', '3', '14653', 'T');
INSERT INTO `ey_region` VALUES ('14663', '狮子山区', '3', '14653', 'S');
INSERT INTO `ey_region` VALUES ('14671', '铜陵市郊区', '3', '14653', 'T');
INSERT INTO `ey_region` VALUES ('14678', '铜陵县', '3', '14653', 'T');
INSERT INTO `ey_region` VALUES ('14687', '安庆市', '2', '14234', 'A');
INSERT INTO `ey_region` VALUES ('14688', '市辖区', '3', '14687', 'S');
INSERT INTO `ey_region` VALUES ('14689', '迎江区', '3', '14687', 'Y');
INSERT INTO `ey_region` VALUES ('14700', '大观区', '3', '14687', 'D');
INSERT INTO `ey_region` VALUES ('14712', '宜秀区', '3', '14687', 'Y');
INSERT INTO `ey_region` VALUES ('14720', '怀宁县', '3', '14687', 'H');
INSERT INTO `ey_region` VALUES ('14741', '枞阳县', '3', '14687', 'C');
INSERT INTO `ey_region` VALUES ('14764', '潜山县', '3', '14687', 'Q');
INSERT INTO `ey_region` VALUES ('14782', '太湖县', '3', '14687', 'T');
INSERT INTO `ey_region` VALUES ('14798', '宿松县', '3', '14687', 'S');
INSERT INTO `ey_region` VALUES ('14823', '望江县', '3', '14687', 'W');
INSERT INTO `ey_region` VALUES ('14834', '岳西县', '3', '14687', 'Y');
INSERT INTO `ey_region` VALUES ('14859', '桐城市', '3', '14687', 'T');
INSERT INTO `ey_region` VALUES ('14887', '黄山市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('14888', '市辖区', '3', '14887', 'S');
INSERT INTO `ey_region` VALUES ('14889', '屯溪区', '3', '14887', 'T');
INSERT INTO `ey_region` VALUES ('14900', '黄山区', '3', '14887', 'H');
INSERT INTO `ey_region` VALUES ('14917', '徽州区', '3', '14887', 'H');
INSERT INTO `ey_region` VALUES ('14926', '歙县', '3', '14887', 'S');
INSERT INTO `ey_region` VALUES ('14955', '休宁县', '3', '14887', 'X');
INSERT INTO `ey_region` VALUES ('14977', '黟县', '3', '14887', 'Y');
INSERT INTO `ey_region` VALUES ('14986', '祁门县', '3', '14887', 'Q');
INSERT INTO `ey_region` VALUES ('15005', '滁州市', '2', '14234', 'C');
INSERT INTO `ey_region` VALUES ('15006', '市辖区', '3', '15005', 'S');
INSERT INTO `ey_region` VALUES ('15007', '琅琊区', '3', '15005', 'L');
INSERT INTO `ey_region` VALUES ('15016', '南谯区', '3', '15005', 'N');
INSERT INTO `ey_region` VALUES ('15034', '来安县', '3', '15005', 'L');
INSERT INTO `ey_region` VALUES ('15053', '全椒县', '3', '15005', 'Q');
INSERT INTO `ey_region` VALUES ('15071', '定远县', '3', '15005', 'D');
INSERT INTO `ey_region` VALUES ('15109', '凤阳县', '3', '15005', 'F');
INSERT INTO `ey_region` VALUES ('15136', '天长市', '3', '15005', 'T');
INSERT INTO `ey_region` VALUES ('15166', '明光市', '3', '15005', 'M');
INSERT INTO `ey_region` VALUES ('15194', '阜阳市', '2', '14234', 'F');
INSERT INTO `ey_region` VALUES ('15195', '市辖区', '3', '15194', 'S');
INSERT INTO `ey_region` VALUES ('15196', '颍州区', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15211', '颍东区', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15224', '颍泉区', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15231', '临泉县', '3', '15194', 'L');
INSERT INTO `ey_region` VALUES ('15264', '太和县', '3', '15194', 'T');
INSERT INTO `ey_region` VALUES ('15296', '阜南县', '3', '15194', 'F');
INSERT INTO `ey_region` VALUES ('15328', '颍上县', '3', '15194', 'Y');
INSERT INTO `ey_region` VALUES ('15359', '界首市', '3', '15194', 'J');
INSERT INTO `ey_region` VALUES ('15378', '宿州市', '2', '14234', 'S');
INSERT INTO `ey_region` VALUES ('15379', '市辖区', '3', '15378', 'S');
INSERT INTO `ey_region` VALUES ('15380', '墉桥区', '3', '15378', 'Y');
INSERT INTO `ey_region` VALUES ('15417', '砀山县', '3', '15378', 'D');
INSERT INTO `ey_region` VALUES ('15437', '萧县', '3', '15378', 'X');
INSERT INTO `ey_region` VALUES ('15461', '灵璧县', '3', '15378', 'L');
INSERT INTO `ey_region` VALUES ('15482', '泗县', '3', '15378', 'S');
INSERT INTO `ey_region` VALUES ('15499', '巢湖市', '2', '14234', 'C');
INSERT INTO `ey_region` VALUES ('15500', '市辖区', '3', '15499', 'S');
INSERT INTO `ey_region` VALUES ('15501', '居巢区', '3', '15499', 'J');
INSERT INTO `ey_region` VALUES ('15520', '庐江县', '3', '15499', 'L');
INSERT INTO `ey_region` VALUES ('15542', '无为县', '3', '15499', 'W');
INSERT INTO `ey_region` VALUES ('15566', '含山县', '3', '15499', 'H');
INSERT INTO `ey_region` VALUES ('15575', '和县', '3', '15499', 'H');
INSERT INTO `ey_region` VALUES ('15586', '六安市', '2', '14234', 'L');
INSERT INTO `ey_region` VALUES ('15587', '市辖区', '3', '15586', 'S');
INSERT INTO `ey_region` VALUES ('15588', '金安区', '3', '15586', 'J');
INSERT INTO `ey_region` VALUES ('15612', '裕安区', '3', '15586', 'Y');
INSERT INTO `ey_region` VALUES ('15635', '寿县', '3', '15586', 'S');
INSERT INTO `ey_region` VALUES ('15662', '霍邱县', '3', '15586', 'H');
INSERT INTO `ey_region` VALUES ('15698', '舒城县', '3', '15586', 'S');
INSERT INTO `ey_region` VALUES ('15720', '金寨县', '3', '15586', 'J');
INSERT INTO `ey_region` VALUES ('15747', '霍山县', '3', '15586', 'H');
INSERT INTO `ey_region` VALUES ('15764', '亳州市', '2', '14234', 'H');
INSERT INTO `ey_region` VALUES ('15765', '市辖区', '3', '15764', 'S');
INSERT INTO `ey_region` VALUES ('15766', '谯城区', '3', '15764', 'Q');
INSERT INTO `ey_region` VALUES ('15795', '涡阳县', '3', '15764', 'W');
INSERT INTO `ey_region` VALUES ('15823', '蒙城县', '3', '15764', 'M');
INSERT INTO `ey_region` VALUES ('15843', '利辛县', '3', '15764', 'L');
INSERT INTO `ey_region` VALUES ('15871', '池州市', '2', '14234', 'C');
INSERT INTO `ey_region` VALUES ('15872', '市辖区', '3', '15871', 'S');
INSERT INTO `ey_region` VALUES ('15873', '贵池区', '3', '15871', 'G');
INSERT INTO `ey_region` VALUES ('15900', '东至县', '3', '15871', 'D');
INSERT INTO `ey_region` VALUES ('15930', '石台县', '3', '15871', 'S');
INSERT INTO `ey_region` VALUES ('15944', '青阳县', '3', '15871', 'Q');
INSERT INTO `ey_region` VALUES ('15958', '宣城市', '2', '14234', 'X');
INSERT INTO `ey_region` VALUES ('15959', '市辖区', '3', '15958', 'S');
INSERT INTO `ey_region` VALUES ('15960', '宣州区', '3', '15958', 'X');
INSERT INTO `ey_region` VALUES ('15987', '郎溪县', '3', '15958', 'L');
INSERT INTO `ey_region` VALUES ('16001', '广德县', '3', '15958', 'G');
INSERT INTO `ey_region` VALUES ('16013', '泾县', '3', '15958', 'J');
INSERT INTO `ey_region` VALUES ('16025', '绩溪县', '3', '15958', 'J');
INSERT INTO `ey_region` VALUES ('16037', '旌德县', '3', '15958', 'J');
INSERT INTO `ey_region` VALUES ('16048', '宁国市', '3', '15958', 'N');
INSERT INTO `ey_region` VALUES ('16068', '福建省', '1', '0', 'F');
INSERT INTO `ey_region` VALUES ('16069', '福州市', '2', '16068', 'F');
INSERT INTO `ey_region` VALUES ('16070', '市辖区', '3', '16069', 'S');
INSERT INTO `ey_region` VALUES ('16071', '鼓楼区', '3', '16069', 'G');
INSERT INTO `ey_region` VALUES ('16082', '台江区', '3', '16069', 'T');
INSERT INTO `ey_region` VALUES ('16093', '仓山区', '3', '16069', 'C');
INSERT INTO `ey_region` VALUES ('16108', '马尾区', '3', '16069', 'M');
INSERT INTO `ey_region` VALUES ('16113', '晋安区', '3', '16069', 'J');
INSERT INTO `ey_region` VALUES ('16123', '闽侯县', '3', '16069', 'M');
INSERT INTO `ey_region` VALUES ('16140', '连江县', '3', '16069', 'L');
INSERT INTO `ey_region` VALUES ('16164', '罗源县', '3', '16069', 'L');
INSERT INTO `ey_region` VALUES ('16177', '闽清县', '3', '16069', 'M');
INSERT INTO `ey_region` VALUES ('16194', '永泰县', '3', '16069', 'Y');
INSERT INTO `ey_region` VALUES ('16216', '平潭县', '3', '16069', 'P');
INSERT INTO `ey_region` VALUES ('16232', '福清市', '3', '16069', 'F');
INSERT INTO `ey_region` VALUES ('16259', '长乐市', '3', '16069', 'C');
INSERT INTO `ey_region` VALUES ('16278', '厦门市', '2', '16068', 'X');
INSERT INTO `ey_region` VALUES ('16279', '市辖区', '3', '16278', 'S');
INSERT INTO `ey_region` VALUES ('16280', '思明区', '3', '16278', 'S');
INSERT INTO `ey_region` VALUES ('16294', '海沧区', '3', '16278', 'H');
INSERT INTO `ey_region` VALUES ('16303', '湖里区', '3', '16278', 'H');
INSERT INTO `ey_region` VALUES ('16315', '集美区', '3', '16278', 'J');
INSERT INTO `ey_region` VALUES ('16326', '同安区', '3', '16278', 'T');
INSERT INTO `ey_region` VALUES ('16341', '翔安区', '3', '16278', 'X');
INSERT INTO `ey_region` VALUES ('16348', '莆田市', '2', '16068', 'P');
INSERT INTO `ey_region` VALUES ('16349', '市辖区', '3', '16348', 'S');
INSERT INTO `ey_region` VALUES ('16350', '城厢区', '3', '16348', 'C');
INSERT INTO `ey_region` VALUES ('16358', '涵江区', '3', '16348', 'H');
INSERT INTO `ey_region` VALUES ('16372', '荔城区', '3', '16348', 'L');
INSERT INTO `ey_region` VALUES ('16379', '秀屿区', '3', '16348', 'X');
INSERT INTO `ey_region` VALUES ('16393', '仙游县', '3', '16348', 'X');
INSERT INTO `ey_region` VALUES ('16412', '三明市', '2', '16068', 'S');
INSERT INTO `ey_region` VALUES ('16413', '市辖区', '3', '16412', 'S');
INSERT INTO `ey_region` VALUES ('16414', '梅列区', '3', '16412', 'M');
INSERT INTO `ey_region` VALUES ('16421', '三元区', '3', '16412', 'S');
INSERT INTO `ey_region` VALUES ('16430', '明溪县', '3', '16412', 'M');
INSERT INTO `ey_region` VALUES ('16440', '清流县', '3', '16412', 'Q');
INSERT INTO `ey_region` VALUES ('16455', '宁化县', '3', '16412', 'N');
INSERT INTO `ey_region` VALUES ('16472', '大田县', '3', '16412', 'D');
INSERT INTO `ey_region` VALUES ('16492', '尤溪县', '3', '16412', 'Y');
INSERT INTO `ey_region` VALUES ('16508', '沙县', '3', '16412', 'S');
INSERT INTO `ey_region` VALUES ('16521', '将乐县', '3', '16412', 'J');
INSERT INTO `ey_region` VALUES ('16535', '泰宁县', '3', '16412', 'T');
INSERT INTO `ey_region` VALUES ('16545', '建宁县', '3', '16412', 'J');
INSERT INTO `ey_region` VALUES ('16556', '永安市', '3', '16412', 'Y');
INSERT INTO `ey_region` VALUES ('16572', '泉州市', '2', '16068', 'Q');
INSERT INTO `ey_region` VALUES ('16573', '市辖区', '3', '16572', 'S');
INSERT INTO `ey_region` VALUES ('16574', '鲤城区', '3', '16572', 'L');
INSERT INTO `ey_region` VALUES ('16584', '丰泽区', '3', '16572', 'F');
INSERT INTO `ey_region` VALUES ('16593', '洛江区', '3', '16572', 'L');
INSERT INTO `ey_region` VALUES ('16600', '泉港区', '3', '16572', 'Q');
INSERT INTO `ey_region` VALUES ('16608', '惠安县', '3', '16572', 'H');
INSERT INTO `ey_region` VALUES ('16625', '安溪县', '3', '16572', 'A');
INSERT INTO `ey_region` VALUES ('16650', '永春县', '3', '16572', 'Y');
INSERT INTO `ey_region` VALUES ('16673', '德化县', '3', '16572', 'D');
INSERT INTO `ey_region` VALUES ('16692', '金门县', '3', '16572', 'J');
INSERT INTO `ey_region` VALUES ('16693', '石狮市', '3', '16572', 'S');
INSERT INTO `ey_region` VALUES ('16703', '晋江市', '3', '16572', 'J');
INSERT INTO `ey_region` VALUES ('16726', '南安市', '3', '16572', 'N');
INSERT INTO `ey_region` VALUES ('16754', '漳州市', '2', '16068', 'Z');
INSERT INTO `ey_region` VALUES ('16755', '市辖区', '3', '16754', 'S');
INSERT INTO `ey_region` VALUES ('16756', '芗城区', '3', '16754', 'X');
INSERT INTO `ey_region` VALUES ('16772', '龙文区', '3', '16754', 'L');
INSERT INTO `ey_region` VALUES ('16778', '云霄县', '3', '16754', 'Y');
INSERT INTO `ey_region` VALUES ('16790', '漳浦县', '3', '16754', 'Z');
INSERT INTO `ey_region` VALUES ('16821', '诏安县', '3', '16754', 'Z');
INSERT INTO `ey_region` VALUES ('16842', '长泰县', '3', '16754', 'C');
INSERT INTO `ey_region` VALUES ('16852', '东山县', '3', '16754', 'D');
INSERT INTO `ey_region` VALUES ('16860', '南靖县', '3', '16754', 'N');
INSERT INTO `ey_region` VALUES ('16872', '平和县', '3', '16754', 'P');
INSERT INTO `ey_region` VALUES ('16889', '华安县', '3', '16754', 'H');
INSERT INTO `ey_region` VALUES ('16899', '龙海市', '3', '16754', 'L');
INSERT INTO `ey_region` VALUES ('16924', '南平市', '2', '16068', 'N');
INSERT INTO `ey_region` VALUES ('16925', '市辖区', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('16926', '延平区', '3', '16924', 'Y');
INSERT INTO `ey_region` VALUES ('16948', '顺昌县', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('16961', '浦城县', '3', '16924', 'P');
INSERT INTO `ey_region` VALUES ('16982', '光泽县', '3', '16924', 'G');
INSERT INTO `ey_region` VALUES ('16991', '松溪县', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('17001', '政和县', '3', '16924', 'Z');
INSERT INTO `ey_region` VALUES ('17012', '邵武市', '3', '16924', 'S');
INSERT INTO `ey_region` VALUES ('17033', '武夷山市', '3', '16924', 'W');
INSERT INTO `ey_region` VALUES ('17044', '建瓯市', '3', '16924', 'J');
INSERT INTO `ey_region` VALUES ('17063', '建阳市', '3', '16924', 'J');
INSERT INTO `ey_region` VALUES ('17077', '龙岩市', '2', '16068', 'L');
INSERT INTO `ey_region` VALUES ('17078', '市辖区', '3', '17077', 'S');
INSERT INTO `ey_region` VALUES ('17079', '新罗区', '3', '17077', 'X');
INSERT INTO `ey_region` VALUES ('17099', '长汀县', '3', '17077', 'C');
INSERT INTO `ey_region` VALUES ('17118', '永定县', '3', '17077', 'Y');
INSERT INTO `ey_region` VALUES ('17143', '上杭县', '3', '17077', 'S');
INSERT INTO `ey_region` VALUES ('17166', '武平县', '3', '17077', 'W');
INSERT INTO `ey_region` VALUES ('17184', '连城县', '3', '17077', 'L');
INSERT INTO `ey_region` VALUES ('17202', '漳平市', '3', '17077', 'Z');
INSERT INTO `ey_region` VALUES ('17219', '宁德市　', '2', '16068', 'N');
INSERT INTO `ey_region` VALUES ('17220', '市辖区', '3', '17219', 'S');
INSERT INTO `ey_region` VALUES ('17221', '蕉城区', '3', '17219', 'J');
INSERT INTO `ey_region` VALUES ('17239', '霞浦县', '3', '17219', 'X');
INSERT INTO `ey_region` VALUES ('17254', '古田县', '3', '17219', 'G');
INSERT INTO `ey_region` VALUES ('17269', '屏南县', '3', '17219', 'P');
INSERT INTO `ey_region` VALUES ('17281', '寿宁县', '3', '17219', 'S');
INSERT INTO `ey_region` VALUES ('17296', '周宁县', '3', '17219', 'Z');
INSERT INTO `ey_region` VALUES ('17306', '柘荣县', '3', '17219', 'Z');
INSERT INTO `ey_region` VALUES ('17316', '福安市', '3', '17219', 'F');
INSERT INTO `ey_region` VALUES ('17341', '福鼎市', '3', '17219', 'F');
INSERT INTO `ey_region` VALUES ('17359', '江西省', '1', '0', 'J');
INSERT INTO `ey_region` VALUES ('17360', '南昌市', '2', '17359', 'N');
INSERT INTO `ey_region` VALUES ('17361', '市辖区', '3', '17360', 'S');
INSERT INTO `ey_region` VALUES ('17362', '东湖区', '3', '17360', 'D');
INSERT INTO `ey_region` VALUES ('17374', '西湖区', '3', '17360', 'X');
INSERT INTO `ey_region` VALUES ('17387', '青云谱区', '3', '17360', 'Q');
INSERT INTO `ey_region` VALUES ('17395', '湾里区', '3', '17360', 'W');
INSERT INTO `ey_region` VALUES ('17402', '青山湖区', '3', '17360', 'Q');
INSERT INTO `ey_region` VALUES ('17420', '南昌县', '3', '17360', 'N');
INSERT INTO `ey_region` VALUES ('17443', '新建县', '3', '17360', 'X');
INSERT INTO `ey_region` VALUES ('17471', '安义县', '3', '17360', 'A');
INSERT INTO `ey_region` VALUES ('17485', '进贤县', '3', '17360', 'J');
INSERT INTO `ey_region` VALUES ('17508', '景德镇市', '2', '17359', 'J');
INSERT INTO `ey_region` VALUES ('17509', '市辖区', '3', '17508', 'S');
INSERT INTO `ey_region` VALUES ('17510', '昌江区', '3', '17508', 'C');
INSERT INTO `ey_region` VALUES ('17534', '珠山区', '3', '17508', 'Z');
INSERT INTO `ey_region` VALUES ('17545', '浮梁县', '3', '17508', 'F');
INSERT INTO `ey_region` VALUES ('17568', '乐平市', '3', '17508', 'L');
INSERT INTO `ey_region` VALUES ('17589', '萍乡市', '2', '17359', 'P');
INSERT INTO `ey_region` VALUES ('17590', '市辖区', '3', '17589', 'S');
INSERT INTO `ey_region` VALUES ('17591', '安源区', '3', '17589', 'A');
INSERT INTO `ey_region` VALUES ('17604', '湘东区', '3', '17589', 'X');
INSERT INTO `ey_region` VALUES ('17616', '莲花县', '3', '17589', 'L');
INSERT INTO `ey_region` VALUES ('17630', '上栗县', '3', '17589', 'S');
INSERT INTO `ey_region` VALUES ('17640', '芦溪县', '3', '17589', 'L');
INSERT INTO `ey_region` VALUES ('17651', '九江市', '2', '17359', 'J');
INSERT INTO `ey_region` VALUES ('17652', '市辖区', '3', '17651', 'S');
INSERT INTO `ey_region` VALUES ('17653', '庐山区', '3', '17651', 'L');
INSERT INTO `ey_region` VALUES ('17667', '浔阳区', '3', '17651', 'X');
INSERT INTO `ey_region` VALUES ('17676', '九江县', '3', '17651', 'J');
INSERT INTO `ey_region` VALUES ('17693', '武宁县', '3', '17651', 'W');
INSERT INTO `ey_region` VALUES ('17714', '修水县', '3', '17651', 'X');
INSERT INTO `ey_region` VALUES ('17751', '永修县', '3', '17651', 'Y');
INSERT INTO `ey_region` VALUES ('17773', '德安县', '3', '17651', 'D');
INSERT INTO `ey_region` VALUES ('17792', '星子县', '3', '17651', 'X');
INSERT INTO `ey_region` VALUES ('17807', '都昌县', '3', '17651', 'D');
INSERT INTO `ey_region` VALUES ('17834', '湖口县', '3', '17651', 'H');
INSERT INTO `ey_region` VALUES ('17849', '彭泽县', '3', '17651', 'P');
INSERT INTO `ey_region` VALUES ('17872', '瑞昌市', '3', '17651', 'R');
INSERT INTO `ey_region` VALUES ('17894', '新余市', '2', '17359', 'X');
INSERT INTO `ey_region` VALUES ('17895', '市辖区', '3', '17894', 'S');
INSERT INTO `ey_region` VALUES ('17896', '渝水区', '3', '17894', 'Y');
INSERT INTO `ey_region` VALUES ('17917', '分宜县', '3', '17894', 'F');
INSERT INTO `ey_region` VALUES ('17934', '鹰潭市', '2', '17359', 'Y');
INSERT INTO `ey_region` VALUES ('17935', '市辖区', '3', '17934', 'S');
INSERT INTO `ey_region` VALUES ('17936', '月湖区', '3', '17934', 'Y');
INSERT INTO `ey_region` VALUES ('17945', '余江县', '3', '17934', 'Y');
INSERT INTO `ey_region` VALUES ('17966', '贵溪市', '3', '17934', 'G');
INSERT INTO `ey_region` VALUES ('17999', '赣州市', '2', '17359', 'G');
INSERT INTO `ey_region` VALUES ('18000', '市辖区', '3', '17999', 'S');
INSERT INTO `ey_region` VALUES ('18001', '章贡区', '3', '17999', 'Z');
INSERT INTO `ey_region` VALUES ('18016', '赣县', '3', '17999', 'G');
INSERT INTO `ey_region` VALUES ('18037', '信丰县', '3', '17999', 'X');
INSERT INTO `ey_region` VALUES ('18055', '大余县', '3', '17999', 'D');
INSERT INTO `ey_region` VALUES ('18068', '上犹县', '3', '17999', 'S');
INSERT INTO `ey_region` VALUES ('18084', '崇义县', '3', '17999', 'C');
INSERT INTO `ey_region` VALUES ('18102', '安远县', '3', '17999', 'A');
INSERT INTO `ey_region` VALUES ('18122', '龙南县', '3', '17999', 'L');
INSERT INTO `ey_region` VALUES ('18139', '定南县', '3', '17999', 'D');
INSERT INTO `ey_region` VALUES ('18148', '全南县', '3', '17999', 'Q');
INSERT INTO `ey_region` VALUES ('18161', '宁都县', '3', '17999', 'N');
INSERT INTO `ey_region` VALUES ('18187', '于都县', '3', '17999', 'Y');
INSERT INTO `ey_region` VALUES ('18212', '兴国县', '3', '17999', 'X');
INSERT INTO `ey_region` VALUES ('18239', '会昌县', '3', '17999', 'H');
INSERT INTO `ey_region` VALUES ('18260', '寻乌县', '3', '17999', 'X');
INSERT INTO `ey_region` VALUES ('18276', '石城县', '3', '17999', 'S');
INSERT INTO `ey_region` VALUES ('18287', '瑞金市', '3', '17999', 'R');
INSERT INTO `ey_region` VALUES ('18306', '南康市', '3', '17999', 'N');
INSERT INTO `ey_region` VALUES ('18330', '吉安市', '2', '17359', 'J');
INSERT INTO `ey_region` VALUES ('18331', '市辖区', '3', '18330', 'S');
INSERT INTO `ey_region` VALUES ('18332', '吉州区', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18345', '青原区', '3', '18330', 'Q');
INSERT INTO `ey_region` VALUES ('18356', '吉安县', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18378', '吉水县', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18398', '峡江县', '3', '18330', 'X');
INSERT INTO `ey_region` VALUES ('18411', '新干县', '3', '18330', 'X');
INSERT INTO `ey_region` VALUES ('18429', '永丰县', '3', '18330', 'Y');
INSERT INTO `ey_region` VALUES ('18454', '泰和县', '3', '18330', 'T');
INSERT INTO `ey_region` VALUES ('18483', '遂川县', '3', '18330', 'S');
INSERT INTO `ey_region` VALUES ('18510', '万安县', '3', '18330', 'W');
INSERT INTO `ey_region` VALUES ('18529', '安福县', '3', '18330', 'A');
INSERT INTO `ey_region` VALUES ('18550', '永新县', '3', '18330', 'Y');
INSERT INTO `ey_region` VALUES ('18575', '井冈山市', '3', '18330', 'J');
INSERT INTO `ey_region` VALUES ('18598', '宜春市', '2', '17359', 'Y');
INSERT INTO `ey_region` VALUES ('18599', '市辖区', '3', '18598', 'S');
INSERT INTO `ey_region` VALUES ('18600', '袁州区', '3', '18598', 'Y');
INSERT INTO `ey_region` VALUES ('18639', '奉新县', '3', '18598', 'F');
INSERT INTO `ey_region` VALUES ('18659', '万载县', '3', '18598', 'W');
INSERT INTO `ey_region` VALUES ('18678', '上高县', '3', '18598', 'S');
INSERT INTO `ey_region` VALUES ('18696', '宜丰县', '3', '18598', 'Y');
INSERT INTO `ey_region` VALUES ('18714', '靖安县', '3', '18598', 'J');
INSERT INTO `ey_region` VALUES ('18727', '铜鼓县', '3', '18598', 'T');
INSERT INTO `ey_region` VALUES ('18741', '丰城市', '3', '18598', 'F');
INSERT INTO `ey_region` VALUES ('18777', '樟树市', '3', '18598', 'Z');
INSERT INTO `ey_region` VALUES ('18799', '高安市', '3', '18598', 'G');
INSERT INTO `ey_region` VALUES ('18829', '抚州市', '2', '17359', 'F');
INSERT INTO `ey_region` VALUES ('18830', '市辖区', '3', '18829', 'S');
INSERT INTO `ey_region` VALUES ('18831', '临川区', '3', '18829', 'L');
INSERT INTO `ey_region` VALUES ('18869', '南城县', '3', '18829', 'N');
INSERT INTO `ey_region` VALUES ('18882', '黎川县', '3', '18829', 'L');
INSERT INTO `ey_region` VALUES ('18900', '南丰县', '3', '18829', 'N');
INSERT INTO `ey_region` VALUES ('18915', '崇仁县', '3', '18829', 'C');
INSERT INTO `ey_region` VALUES ('18931', '乐安县', '3', '18829', 'L');
INSERT INTO `ey_region` VALUES ('18949', '宜黄县', '3', '18829', 'Y');
INSERT INTO `ey_region` VALUES ('18965', '金溪县', '3', '18829', 'J');
INSERT INTO `ey_region` VALUES ('18980', '资溪县', '3', '18829', 'Z');
INSERT INTO `ey_region` VALUES ('18988', '东乡县', '3', '18829', 'D');
INSERT INTO `ey_region` VALUES ('19010', '广昌县', '3', '18829', 'G');
INSERT INTO `ey_region` VALUES ('19024', '上饶市', '2', '17359', 'S');
INSERT INTO `ey_region` VALUES ('19025', '市辖区', '3', '19024', 'S');
INSERT INTO `ey_region` VALUES ('19026', '信州区', '3', '19024', 'X');
INSERT INTO `ey_region` VALUES ('19038', '上饶县', '3', '19024', 'S');
INSERT INTO `ey_region` VALUES ('19062', '广丰县', '3', '19024', 'G');
INSERT INTO `ey_region` VALUES ('19088', '玉山县', '3', '19024', 'Y');
INSERT INTO `ey_region` VALUES ('19108', '铅山县', '3', '19024', 'Q');
INSERT INTO `ey_region` VALUES ('19136', '横峰县', '3', '19024', 'H');
INSERT INTO `ey_region` VALUES ('19151', '弋阳县', '3', '19024', 'Y');
INSERT INTO `ey_region` VALUES ('19171', '余干县', '3', '19024', 'Y');
INSERT INTO `ey_region` VALUES ('19202', '鄱阳县', '3', '19024', 'P');
INSERT INTO `ey_region` VALUES ('19234', '万年县', '3', '19024', 'W');
INSERT INTO `ey_region` VALUES ('19248', '婺源县', '3', '19024', 'W');
INSERT INTO `ey_region` VALUES ('19265', '德兴市', '3', '19024', 'D');
INSERT INTO `ey_region` VALUES ('19280', '山东省', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('19281', '济南市', '2', '19280', 'J');
INSERT INTO `ey_region` VALUES ('19282', '市辖区', '3', '19281', 'S');
INSERT INTO `ey_region` VALUES ('19283', '历下区', '3', '19281', 'L');
INSERT INTO `ey_region` VALUES ('19295', '市中区', '3', '19281', 'S');
INSERT INTO `ey_region` VALUES ('19311', '槐荫区', '3', '19281', 'H');
INSERT INTO `ey_region` VALUES ('19326', '天桥区', '3', '19281', 'T');
INSERT INTO `ey_region` VALUES ('19342', '历城区', '3', '19281', 'L');
INSERT INTO `ey_region` VALUES ('19359', '长清区', '3', '19281', 'C');
INSERT INTO `ey_region` VALUES ('19370', '平阴县', '3', '19281', 'P');
INSERT INTO `ey_region` VALUES ('19378', '济阳县', '3', '19281', 'J');
INSERT INTO `ey_region` VALUES ('19387', '商河县', '3', '19281', 'S');
INSERT INTO `ey_region` VALUES ('19400', '章丘市', '3', '19281', 'Z');
INSERT INTO `ey_region` VALUES ('19421', '青岛市', '2', '19280', 'Q');
INSERT INTO `ey_region` VALUES ('19422', '市辖区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19423', '市南区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19438', '市北区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19456', '四方区', '3', '19421', 'S');
INSERT INTO `ey_region` VALUES ('19464', '黄岛区', '3', '19421', 'H');
INSERT INTO `ey_region` VALUES ('19471', '崂山区', '3', '19421', 'L');
INSERT INTO `ey_region` VALUES ('19476', '李沧区', '3', '19421', 'L');
INSERT INTO `ey_region` VALUES ('19488', '城阳区', '3', '19421', 'C');
INSERT INTO `ey_region` VALUES ('19497', '胶州市', '3', '19421', 'J');
INSERT INTO `ey_region` VALUES ('19516', '即墨市', '3', '19421', 'J');
INSERT INTO `ey_region` VALUES ('19540', '平度市', '3', '19421', 'P');
INSERT INTO `ey_region` VALUES ('19572', '胶南市', '3', '19421', 'J');
INSERT INTO `ey_region` VALUES ('19590', '莱西市', '3', '19421', 'L');
INSERT INTO `ey_region` VALUES ('19608', '淄博市', '2', '19280', 'Z');
INSERT INTO `ey_region` VALUES ('19609', '市辖区', '3', '19608', 'S');
INSERT INTO `ey_region` VALUES ('19610', '淄川区', '3', '19608', 'Z');
INSERT INTO `ey_region` VALUES ('19632', '张店区', '3', '19608', 'Z');
INSERT INTO `ey_region` VALUES ('19649', '博山区', '3', '19608', 'B');
INSERT INTO `ey_region` VALUES ('19663', '临淄区', '3', '19608', 'L');
INSERT INTO `ey_region` VALUES ('19678', '周村区', '3', '19608', 'Z');
INSERT INTO `ey_region` VALUES ('19688', '桓台县', '3', '19608', 'H');
INSERT INTO `ey_region` VALUES ('19700', '高青县', '3', '19608', 'G');
INSERT INTO `ey_region` VALUES ('19710', '沂源县', '3', '19608', 'Y');
INSERT INTO `ey_region` VALUES ('19724', '枣庄市', '2', '19280', 'Z');
INSERT INTO `ey_region` VALUES ('19725', '市辖区', '3', '19724', 'S');
INSERT INTO `ey_region` VALUES ('19726', '市中区', '3', '19724', 'S');
INSERT INTO `ey_region` VALUES ('19738', '薛城区', '3', '19724', 'X');
INSERT INTO `ey_region` VALUES ('19748', '峄城区', '3', '19724', 'Y');
INSERT INTO `ey_region` VALUES ('19756', '台儿庄区', '3', '19724', 'T');
INSERT INTO `ey_region` VALUES ('19763', '山亭区', '3', '19724', 'S');
INSERT INTO `ey_region` VALUES ('19774', '滕州市', '3', '19724', 'T');
INSERT INTO `ey_region` VALUES ('19796', '东营市', '2', '19280', 'D');
INSERT INTO `ey_region` VALUES ('19797', '市辖区', '3', '19796', 'S');
INSERT INTO `ey_region` VALUES ('19798', '东营区', '3', '19796', 'D');
INSERT INTO `ey_region` VALUES ('19809', '河口区', '3', '19796', 'H');
INSERT INTO `ey_region` VALUES ('19817', '垦利县', '3', '19796', 'K');
INSERT INTO `ey_region` VALUES ('19825', '利津县', '3', '19796', 'L');
INSERT INTO `ey_region` VALUES ('19835', '广饶县', '3', '19796', 'G');
INSERT INTO `ey_region` VALUES ('19846', '烟台市', '2', '19280', 'Y');
INSERT INTO `ey_region` VALUES ('19847', '市辖区', '3', '19846', 'S');
INSERT INTO `ey_region` VALUES ('19848', '芝罘区', '3', '19846', 'Z');
INSERT INTO `ey_region` VALUES ('19861', '福山区', '3', '19846', 'F');
INSERT INTO `ey_region` VALUES ('19873', '牟平区', '3', '19846', 'M');
INSERT INTO `ey_region` VALUES ('19887', '莱山区', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19893', '长岛县', '3', '19846', 'C');
INSERT INTO `ey_region` VALUES ('19902', '龙口市', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19916', '莱阳市', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19935', '莱州市', '3', '19846', 'L');
INSERT INTO `ey_region` VALUES ('19952', '蓬莱市', '3', '19846', 'P');
INSERT INTO `ey_region` VALUES ('19965', '招远市', '3', '19846', 'Z');
INSERT INTO `ey_region` VALUES ('19980', '栖霞市', '3', '19846', 'Q');
INSERT INTO `ey_region` VALUES ('19996', '海阳市', '3', '19846', 'H');
INSERT INTO `ey_region` VALUES ('20012', '潍坊市', '2', '19280', 'W');
INSERT INTO `ey_region` VALUES ('20013', '市辖区', '3', '20012', 'S');
INSERT INTO `ey_region` VALUES ('20014', '潍城区', '3', '20012', 'W');
INSERT INTO `ey_region` VALUES ('20023', '寒亭区', '3', '20012', 'H');
INSERT INTO `ey_region` VALUES ('20034', '坊子区', '3', '20012', 'F');
INSERT INTO `ey_region` VALUES ('20043', '奎文区', '3', '20012', 'K');
INSERT INTO `ey_region` VALUES ('20055', '临朐县', '3', '20012', 'L');
INSERT INTO `ey_region` VALUES ('20074', '昌乐县', '3', '20012', 'C');
INSERT INTO `ey_region` VALUES ('20091', '青州市', '3', '20012', 'Q');
INSERT INTO `ey_region` VALUES ('20113', '诸城市', '3', '20012', 'Z');
INSERT INTO `ey_region` VALUES ('20137', '寿光市', '3', '20012', 'S');
INSERT INTO `ey_region` VALUES ('20155', '安丘市', '3', '20012', 'A');
INSERT INTO `ey_region` VALUES ('20179', '高密市', '3', '20012', 'G');
INSERT INTO `ey_region` VALUES ('20200', '昌邑市', '3', '20012', 'C');
INSERT INTO `ey_region` VALUES ('20216', '济宁市', '2', '19280', 'J');
INSERT INTO `ey_region` VALUES ('20217', '市辖区', '3', '20216', 'S');
INSERT INTO `ey_region` VALUES ('20218', '市中区', '3', '20216', 'S');
INSERT INTO `ey_region` VALUES ('20227', '任城区', '3', '20216', 'R');
INSERT INTO `ey_region` VALUES ('20257', '鱼台县', '3', '20216', 'Y');
INSERT INTO `ey_region` VALUES ('20268', '金乡县', '3', '20216', 'J');
INSERT INTO `ey_region` VALUES ('20282', '嘉祥县', '3', '20216', 'J');
INSERT INTO `ey_region` VALUES ('20298', '汶上县', '3', '20216', 'W');
INSERT INTO `ey_region` VALUES ('20313', '泗水县', '3', '20216', 'S');
INSERT INTO `ey_region` VALUES ('20327', '梁山县', '3', '20216', 'L');
INSERT INTO `ey_region` VALUES ('20342', '曲阜市', '3', '20216', 'Q');
INSERT INTO `ey_region` VALUES ('20355', '兖州市', '3', '20216', 'Y');
INSERT INTO `ey_region` VALUES ('20368', '邹城市', '3', '20216', 'Z');
INSERT INTO `ey_region` VALUES ('20386', '泰安市', '2', '19280', 'T');
INSERT INTO `ey_region` VALUES ('20387', '市辖区', '3', '20386', 'S');
INSERT INTO `ey_region` VALUES ('20388', '泰山区', '3', '20386', 'T');
INSERT INTO `ey_region` VALUES ('20397', '岱岳区', '3', '20386', 'D');
INSERT INTO `ey_region` VALUES ('20416', '宁阳县', '3', '20386', 'N');
INSERT INTO `ey_region` VALUES ('20429', '东平县', '3', '20386', 'D');
INSERT INTO `ey_region` VALUES ('20444', '新泰市', '3', '20386', 'X');
INSERT INTO `ey_region` VALUES ('20465', '肥城市', '3', '20386', 'F');
INSERT INTO `ey_region` VALUES ('20480', '威海市', '2', '19280', 'W');
INSERT INTO `ey_region` VALUES ('20481', '市辖区', '3', '20480', 'S');
INSERT INTO `ey_region` VALUES ('20482', '环翠区', '3', '20480', 'H');
INSERT INTO `ey_region` VALUES ('20500', '文登市', '3', '20480', 'W');
INSERT INTO `ey_region` VALUES ('20519', '荣成市', '3', '20480', 'R');
INSERT INTO `ey_region` VALUES ('20542', '乳山市', '3', '20480', 'R');
INSERT INTO `ey_region` VALUES ('20558', '日照市', '2', '19280', 'R');
INSERT INTO `ey_region` VALUES ('20559', '市辖区', '3', '20558', 'S');
INSERT INTO `ey_region` VALUES ('20560', '东港区', '3', '20558', 'D');
INSERT INTO `ey_region` VALUES ('20573', '岚山区', '3', '20558', 'L');
INSERT INTO `ey_region` VALUES ('20583', '五莲县', '3', '20558', 'W');
INSERT INTO `ey_region` VALUES ('20596', '莒县', '3', '20558', 'J');
INSERT INTO `ey_region` VALUES ('20618', '莱芜市', '2', '19280', 'L');
INSERT INTO `ey_region` VALUES ('20619', '市辖区', '3', '20618', 'S');
INSERT INTO `ey_region` VALUES ('20620', '莱城区', '3', '20618', 'L');
INSERT INTO `ey_region` VALUES ('20636', '钢城区', '3', '20618', 'G');
INSERT INTO `ey_region` VALUES ('20642', '临沂市', '2', '19280', 'L');
INSERT INTO `ey_region` VALUES ('20643', '临沂市辖区', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20644', '兰山区', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20656', '罗庄区', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20665', '河东区', '3', '20642', 'H');
INSERT INTO `ey_region` VALUES ('20678', '沂南县', '3', '20642', 'Y');
INSERT INTO `ey_region` VALUES ('20696', '郯城县', '3', '20642', 'T');
INSERT INTO `ey_region` VALUES ('20714', '沂水县', '3', '20642', 'Y');
INSERT INTO `ey_region` VALUES ('20734', '苍山县', '3', '20642', 'C');
INSERT INTO `ey_region` VALUES ('20756', '费县', '3', '20642', 'F');
INSERT INTO `ey_region` VALUES ('20775', '平邑县', '3', '20642', 'P');
INSERT INTO `ey_region` VALUES ('20792', '莒南县', '3', '20642', 'J');
INSERT INTO `ey_region` VALUES ('20811', '蒙阴县', '3', '20642', 'M');
INSERT INTO `ey_region` VALUES ('20823', '临沭县', '3', '20642', 'L');
INSERT INTO `ey_region` VALUES ('20836', '德州市', '2', '19280', 'D');
INSERT INTO `ey_region` VALUES ('20837', '市辖区', '3', '20836', 'S');
INSERT INTO `ey_region` VALUES ('20838', '德城区', '3', '20836', 'D');
INSERT INTO `ey_region` VALUES ('20850', '陵县', '3', '20836', 'L');
INSERT INTO `ey_region` VALUES ('20864', '宁津县', '3', '20836', 'N');
INSERT INTO `ey_region` VALUES ('20876', '庆云县', '3', '20836', 'Q');
INSERT INTO `ey_region` VALUES ('20886', '临邑县', '3', '20836', 'L');
INSERT INTO `ey_region` VALUES ('20899', '齐河县', '3', '20836', 'Q');
INSERT INTO `ey_region` VALUES ('20914', '平原县', '3', '20836', 'P');
INSERT INTO `ey_region` VALUES ('20927', '夏津县', '3', '20836', 'X');
INSERT INTO `ey_region` VALUES ('20942', '武城县', '3', '20836', 'W');
INSERT INTO `ey_region` VALUES ('20952', '乐陵市', '3', '20836', 'L');
INSERT INTO `ey_region` VALUES ('20969', '禹城市', '3', '20836', 'Y');
INSERT INTO `ey_region` VALUES ('20981', '聊城市', '2', '19280', 'L');
INSERT INTO `ey_region` VALUES ('20982', '市辖区', '3', '20981', 'S');
INSERT INTO `ey_region` VALUES ('20983', '东昌府区', '3', '20981', 'D');
INSERT INTO `ey_region` VALUES ('21004', '阳谷县', '3', '20981', 'Y');
INSERT INTO `ey_region` VALUES ('21023', '莘县', '3', '20981', 'S');
INSERT INTO `ey_region` VALUES ('21046', '茌平县', '3', '20981', 'C');
INSERT INTO `ey_region` VALUES ('21063', '东阿县', '3', '20981', 'D');
INSERT INTO `ey_region` VALUES ('21075', '冠县', '3', '20981', 'G');
INSERT INTO `ey_region` VALUES ('21093', '高唐县', '3', '20981', 'G');
INSERT INTO `ey_region` VALUES ('21106', '临清市', '3', '20981', 'L');
INSERT INTO `ey_region` VALUES ('21123', '滨州市', '2', '19280', 'B');
INSERT INTO `ey_region` VALUES ('21124', '市辖区', '3', '21123', 'S');
INSERT INTO `ey_region` VALUES ('21125', '滨城区', '3', '21123', 'B');
INSERT INTO `ey_region` VALUES ('21141', '惠民县', '3', '21123', 'H');
INSERT INTO `ey_region` VALUES ('21156', '阳信县', '3', '21123', 'Y');
INSERT INTO `ey_region` VALUES ('21166', '无棣县', '3', '21123', 'W');
INSERT INTO `ey_region` VALUES ('21178', '沾化县', '3', '21123', 'Z');
INSERT INTO `ey_region` VALUES ('21190', '博兴县', '3', '21123', 'B');
INSERT INTO `ey_region` VALUES ('21201', '邹平县', '3', '21123', 'Z');
INSERT INTO `ey_region` VALUES ('21218', '菏泽市', '2', '19280', 'H');
INSERT INTO `ey_region` VALUES ('21219', '市辖区', '3', '21218', 'S');
INSERT INTO `ey_region` VALUES ('21220', '牡丹区', '3', '21218', 'M');
INSERT INTO `ey_region` VALUES ('21245', '曹县', '3', '21218', 'C');
INSERT INTO `ey_region` VALUES ('21271', '单县', '3', '21218', 'D');
INSERT INTO `ey_region` VALUES ('21292', '成武县', '3', '21218', 'C');
INSERT INTO `ey_region` VALUES ('21305', '巨野县', '3', '21218', 'J');
INSERT INTO `ey_region` VALUES ('21322', '郓城县', '3', '21218', 'Y');
INSERT INTO `ey_region` VALUES ('21344', '鄄城县', '3', '21218', 'J');
INSERT INTO `ey_region` VALUES ('21361', '定陶县', '3', '21218', 'D');
INSERT INTO `ey_region` VALUES ('21373', '东明县', '3', '21218', 'D');
INSERT INTO `ey_region` VALUES ('21387', '河南省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('21388', '郑州市', '2', '21387', 'Z');
INSERT INTO `ey_region` VALUES ('21389', '市辖区', '3', '21388', 'S');
INSERT INTO `ey_region` VALUES ('21390', '中原区', '3', '21388', 'Z');
INSERT INTO `ey_region` VALUES ('21404', '二七区', '3', '21388', 'E');
INSERT INTO `ey_region` VALUES ('21420', '管城回族区', '3', '21388', 'G');
INSERT INTO `ey_region` VALUES ('21435', '金水区', '3', '21388', 'J');
INSERT INTO `ey_region` VALUES ('21453', '上街区', '3', '21388', 'S');
INSERT INTO `ey_region` VALUES ('21460', '惠济区', '3', '21388', 'H');
INSERT INTO `ey_region` VALUES ('21469', '中牟县', '3', '21388', 'Z');
INSERT INTO `ey_region` VALUES ('21487', '巩义市', '3', '21388', 'G');
INSERT INTO `ey_region` VALUES ('21508', '荥阳市', '3', '21388', 'X');
INSERT INTO `ey_region` VALUES ('21523', '新密市', '3', '21388', 'X');
INSERT INTO `ey_region` VALUES ('21542', '新郑市', '3', '21388', 'X');
INSERT INTO `ey_region` VALUES ('21558', '登封市', '3', '21388', 'D');
INSERT INTO `ey_region` VALUES ('21575', '开封市', '2', '21387', 'K');
INSERT INTO `ey_region` VALUES ('21576', '市辖区', '3', '21575', 'S');
INSERT INTO `ey_region` VALUES ('21577', '龙亭区', '3', '21575', 'L');
INSERT INTO `ey_region` VALUES ('21584', '顺河区', '3', '21575', 'S');
INSERT INTO `ey_region` VALUES ('21593', '鼓楼区', '3', '21575', 'G');
INSERT INTO `ey_region` VALUES ('21602', '禹王台区', '3', '21575', 'Y');
INSERT INTO `ey_region` VALUES ('21610', '金明区', '3', '21575', 'J');
INSERT INTO `ey_region` VALUES ('21618', '杞县', '3', '21575', 'Q');
INSERT INTO `ey_region` VALUES ('21640', '通许县', '3', '21575', 'T');
INSERT INTO `ey_region` VALUES ('21653', '尉氏县', '3', '21575', 'W');
INSERT INTO `ey_region` VALUES ('21671', '开封县', '3', '21575', 'K');
INSERT INTO `ey_region` VALUES ('21687', '兰考县', '3', '21575', 'L');
INSERT INTO `ey_region` VALUES ('21711', '洛阳市', '2', '21387', 'L');
INSERT INTO `ey_region` VALUES ('21712', '市辖区', '3', '21711', 'S');
INSERT INTO `ey_region` VALUES ('21713', '老城区', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21722', '西工区', '3', '21711', 'X');
INSERT INTO `ey_region` VALUES ('21733', '廛河回族区', '3', '21711', 'C');
INSERT INTO `ey_region` VALUES ('21742', '涧西区', '3', '21711', 'J');
INSERT INTO `ey_region` VALUES ('21758', '吉利区', '3', '21711', 'J');
INSERT INTO `ey_region` VALUES ('21761', '洛龙区', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21770', '孟津县', '3', '21711', 'M');
INSERT INTO `ey_region` VALUES ('21781', '新安县', '3', '21711', 'X');
INSERT INTO `ey_region` VALUES ('21794', '栾川县', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21809', '嵩县', '3', '21711', 'S');
INSERT INTO `ey_region` VALUES ('21829', '汝阳县', '3', '21711', 'R');
INSERT INTO `ey_region` VALUES ('21844', '宜阳县', '3', '21711', 'Y');
INSERT INTO `ey_region` VALUES ('21862', '洛宁县', '3', '21711', 'L');
INSERT INTO `ey_region` VALUES ('21881', '伊川县', '3', '21711', 'Y');
INSERT INTO `ey_region` VALUES ('21896', '偃师市', '3', '21711', 'Y');
INSERT INTO `ey_region` VALUES ('21913', '平顶山市', '2', '21387', 'P');
INSERT INTO `ey_region` VALUES ('21914', '市辖区', '3', '21913', 'S');
INSERT INTO `ey_region` VALUES ('21915', '新华区', '3', '21913', 'X');
INSERT INTO `ey_region` VALUES ('21928', '卫东区', '3', '21913', 'W');
INSERT INTO `ey_region` VALUES ('21940', '石龙区', '3', '21913', 'S');
INSERT INTO `ey_region` VALUES ('21945', '湛河区', '3', '21913', 'Z');
INSERT INTO `ey_region` VALUES ('21954', '宝丰县', '3', '21913', 'B');
INSERT INTO `ey_region` VALUES ('21968', '叶  县', '3', '21913', 'Y');
INSERT INTO `ey_region` VALUES ('21987', '鲁山县', '3', '21913', 'L');
INSERT INTO `ey_region` VALUES ('22009', '郏  县', '3', '21913', 'J');
INSERT INTO `ey_region` VALUES ('22024', '舞钢市', '3', '21913', 'W');
INSERT INTO `ey_region` VALUES ('22037', '汝州市', '3', '21913', 'R');
INSERT INTO `ey_region` VALUES ('22058', '安阳市', '2', '21387', 'A');
INSERT INTO `ey_region` VALUES ('22059', '市辖区', '3', '22058', 'S');
INSERT INTO `ey_region` VALUES ('22060', '文峰区', '3', '22058', 'W');
INSERT INTO `ey_region` VALUES ('22080', '北关区', '3', '22058', 'B');
INSERT INTO `ey_region` VALUES ('22090', '殷都区', '3', '22058', 'Y');
INSERT INTO `ey_region` VALUES ('22101', '龙安区', '3', '22058', 'L');
INSERT INTO `ey_region` VALUES ('22111', '安阳县', '3', '22058', 'A');
INSERT INTO `ey_region` VALUES ('22133', '汤阴县', '3', '22058', 'T');
INSERT INTO `ey_region` VALUES ('22144', '滑县', '3', '22058', 'H');
INSERT INTO `ey_region` VALUES ('22167', '内黄县', '3', '22058', 'N');
INSERT INTO `ey_region` VALUES ('22185', '林州市', '3', '22058', 'L');
INSERT INTO `ey_region` VALUES ('22206', '鹤壁市', '2', '21387', 'H');
INSERT INTO `ey_region` VALUES ('22207', '市辖区', '3', '22206', 'S');
INSERT INTO `ey_region` VALUES ('22208', '鹤山区', '3', '22206', 'H');
INSERT INTO `ey_region` VALUES ('22216', '山城区', '3', '22206', 'S');
INSERT INTO `ey_region` VALUES ('22224', '淇滨区', '3', '22206', 'Q');
INSERT INTO `ey_region` VALUES ('22232', '浚县', '3', '22206', 'J');
INSERT INTO `ey_region` VALUES ('22243', '淇县', '3', '22206', 'Q');
INSERT INTO `ey_region` VALUES ('22251', '新乡市', '2', '21387', 'X');
INSERT INTO `ey_region` VALUES ('22252', '市辖区', '3', '22251', 'S');
INSERT INTO `ey_region` VALUES ('22253', '红旗区', '3', '22251', 'H');
INSERT INTO `ey_region` VALUES ('22264', '卫滨区', '3', '22251', 'W');
INSERT INTO `ey_region` VALUES ('22273', '凤泉区', '3', '22251', 'F');
INSERT INTO `ey_region` VALUES ('22279', '牧野区', '3', '22251', 'M');
INSERT INTO `ey_region` VALUES ('22290', '新乡县', '3', '22251', 'X');
INSERT INTO `ey_region` VALUES ('22299', '获嘉县', '3', '22251', 'H');
INSERT INTO `ey_region` VALUES ('22312', '原阳县', '3', '22251', 'Y');
INSERT INTO `ey_region` VALUES ('22330', '延津县', '3', '22251', 'Y');
INSERT INTO `ey_region` VALUES ('22347', '封丘县', '3', '22251', 'F');
INSERT INTO `ey_region` VALUES ('22367', '长垣县', '3', '22251', 'C');
INSERT INTO `ey_region` VALUES ('22386', '卫辉市', '3', '22251', 'W');
INSERT INTO `ey_region` VALUES ('22400', '辉县市', '3', '22251', 'H');
INSERT INTO `ey_region` VALUES ('22423', '焦作市', '2', '21387', 'J');
INSERT INTO `ey_region` VALUES ('22424', '市辖区', '3', '22423', 'S');
INSERT INTO `ey_region` VALUES ('22425', '解放区', '3', '22423', 'J');
INSERT INTO `ey_region` VALUES ('22435', '中站区', '3', '22423', 'Z');
INSERT INTO `ey_region` VALUES ('22446', '马村区', '3', '22423', 'M');
INSERT INTO `ey_region` VALUES ('22454', '山阳区', '3', '22423', 'S');
INSERT INTO `ey_region` VALUES ('22465', '修武县', '3', '22423', 'X');
INSERT INTO `ey_region` VALUES ('22475', '博爱县', '3', '22423', 'B');
INSERT INTO `ey_region` VALUES ('22487', '武陟县', '3', '22423', 'W');
INSERT INTO `ey_region` VALUES ('22503', '温县', '3', '22423', 'W');
INSERT INTO `ey_region` VALUES ('22515', '济源市', '3', '22423', 'J');
INSERT INTO `ey_region` VALUES ('22532', '沁阳市', '3', '22423', 'Q');
INSERT INTO `ey_region` VALUES ('22546', '孟州市', '3', '22423', 'M');
INSERT INTO `ey_region` VALUES ('22558', '濮阳市', '2', '21387', 'P');
INSERT INTO `ey_region` VALUES ('22559', '市辖区', '3', '22558', 'S');
INSERT INTO `ey_region` VALUES ('22560', '华龙区', '3', '22558', 'H');
INSERT INTO `ey_region` VALUES ('22578', '清丰县', '3', '22558', 'Q');
INSERT INTO `ey_region` VALUES ('22596', '南乐县', '3', '22558', 'N');
INSERT INTO `ey_region` VALUES ('22609', '范县', '3', '22558', 'F');
INSERT INTO `ey_region` VALUES ('22622', '台前县', '3', '22558', 'T');
INSERT INTO `ey_region` VALUES ('22632', '濮阳县', '3', '22558', 'P');
INSERT INTO `ey_region` VALUES ('22655', '许昌市', '2', '21387', 'X');
INSERT INTO `ey_region` VALUES ('22656', '市辖区', '3', '22655', 'S');
INSERT INTO `ey_region` VALUES ('22657', '魏都区', '3', '22655', 'W');
INSERT INTO `ey_region` VALUES ('22671', '许昌县', '3', '22655', 'X');
INSERT INTO `ey_region` VALUES ('22688', '鄢陵县', '3', '22655', 'Y');
INSERT INTO `ey_region` VALUES ('22701', '襄城县', '3', '22655', 'X');
INSERT INTO `ey_region` VALUES ('22718', '禹州市', '3', '22655', 'Y');
INSERT INTO `ey_region` VALUES ('22745', '长葛市', '3', '22655', 'C');
INSERT INTO `ey_region` VALUES ('22762', '漯河市', '2', '21387', 'L');
INSERT INTO `ey_region` VALUES ('22763', '市辖区', '3', '22762', 'S');
INSERT INTO `ey_region` VALUES ('22764', '源汇区', '3', '22762', 'Y');
INSERT INTO `ey_region` VALUES ('22773', '郾城区', '3', '22762', 'Y');
INSERT INTO `ey_region` VALUES ('22783', '召陵区', '3', '22762', 'Z');
INSERT INTO `ey_region` VALUES ('22793', '舞阳县', '3', '22762', 'W');
INSERT INTO `ey_region` VALUES ('22808', '临颖县', '3', '22762', 'L');
INSERT INTO `ey_region` VALUES ('22824', '三门峡市', '2', '21387', 'S');
INSERT INTO `ey_region` VALUES ('22825', '市辖区', '3', '22824', 'S');
INSERT INTO `ey_region` VALUES ('22826', '湖滨区', '3', '22824', 'H');
INSERT INTO `ey_region` VALUES ('22838', '渑池县', '3', '22824', 'M');
INSERT INTO `ey_region` VALUES ('22851', '陕县', '3', '22824', 'S');
INSERT INTO `ey_region` VALUES ('22865', '卢氏县', '3', '22824', 'L');
INSERT INTO `ey_region` VALUES ('22885', '义马市', '3', '22824', 'Y');
INSERT INTO `ey_region` VALUES ('22893', '灵宝市', '3', '22824', 'L');
INSERT INTO `ey_region` VALUES ('22910', '南阳市', '2', '21387', 'N');
INSERT INTO `ey_region` VALUES ('22911', '市辖区', '3', '22910', 'S');
INSERT INTO `ey_region` VALUES ('22912', '宛城区', '3', '22910', 'W');
INSERT INTO `ey_region` VALUES ('22930', '卧龙区', '3', '22910', 'W');
INSERT INTO `ey_region` VALUES ('22951', '南召县', '3', '22910', 'N');
INSERT INTO `ey_region` VALUES ('22973', '方城县', '3', '22910', 'F');
INSERT INTO `ey_region` VALUES ('22992', '西峡县', '3', '22910', 'X');
INSERT INTO `ey_region` VALUES ('23013', '镇平县', '3', '22910', 'Z');
INSERT INTO `ey_region` VALUES ('23036', '内乡县', '3', '22910', 'N');
INSERT INTO `ey_region` VALUES ('23053', '淅川县', '3', '22910', 'X');
INSERT INTO `ey_region` VALUES ('23071', '社旗县', '3', '22910', 'S');
INSERT INTO `ey_region` VALUES ('23087', '唐河县', '3', '22910', 'T');
INSERT INTO `ey_region` VALUES ('23108', '新野县', '3', '22910', 'X');
INSERT INTO `ey_region` VALUES ('23123', '桐柏县', '3', '22910', 'T');
INSERT INTO `ey_region` VALUES ('23140', '邓州市', '3', '22910', 'D');
INSERT INTO `ey_region` VALUES ('23170', '商丘市', '2', '21387', 'S');
INSERT INTO `ey_region` VALUES ('23171', '市辖区', '3', '23170', 'S');
INSERT INTO `ey_region` VALUES ('23172', '梁园区', '3', '23170', 'L');
INSERT INTO `ey_region` VALUES ('23192', '睢阳区', '3', '23170', 'S');
INSERT INTO `ey_region` VALUES ('23211', '民权县', '3', '23170', 'M');
INSERT INTO `ey_region` VALUES ('23232', '睢县', '3', '23170', 'S');
INSERT INTO `ey_region` VALUES ('23253', '宁陵县', '3', '23170', 'N');
INSERT INTO `ey_region` VALUES ('23268', '柘城县', '3', '23170', 'Z');
INSERT INTO `ey_region` VALUES ('23290', '虞城县', '3', '23170', 'Y');
INSERT INTO `ey_region` VALUES ('23317', '夏邑县', '3', '23170', 'X');
INSERT INTO `ey_region` VALUES ('23342', '永城市', '3', '23170', 'Y');
INSERT INTO `ey_region` VALUES ('23372', '信阳市', '2', '21387', 'X');
INSERT INTO `ey_region` VALUES ('23373', '市辖区', '3', '23372', 'S');
INSERT INTO `ey_region` VALUES ('23374', '浉河区', '3', '23372', 'S');
INSERT INTO `ey_region` VALUES ('23393', '平桥区', '3', '23372', 'P');
INSERT INTO `ey_region` VALUES ('23414', '罗山县', '3', '23372', 'L');
INSERT INTO `ey_region` VALUES ('23435', '光山县', '3', '23372', 'G');
INSERT INTO `ey_region` VALUES ('23455', '新县', '3', '23372', 'X');
INSERT INTO `ey_region` VALUES ('23471', '商城县', '3', '23372', 'S');
INSERT INTO `ey_region` VALUES ('23492', '固始县', '3', '23372', 'G');
INSERT INTO `ey_region` VALUES ('23525', '潢川县', '3', '23372', 'H');
INSERT INTO `ey_region` VALUES ('23549', '淮滨县', '3', '23372', 'H');
INSERT INTO `ey_region` VALUES ('23567', '息县', '3', '23372', 'X');
INSERT INTO `ey_region` VALUES ('23589', '周口市', '2', '21387', 'Z');
INSERT INTO `ey_region` VALUES ('23590', '市辖区', '3', '23589', 'S');
INSERT INTO `ey_region` VALUES ('23591', '川汇区', '3', '23589', 'C');
INSERT INTO `ey_region` VALUES ('23604', '扶沟县', '3', '23589', 'F');
INSERT INTO `ey_region` VALUES ('23621', '西华县', '3', '23589', 'X');
INSERT INTO `ey_region` VALUES ('23647', '商水县', '3', '23589', 'S');
INSERT INTO `ey_region` VALUES ('23672', '沈丘县', '3', '23589', 'S');
INSERT INTO `ey_region` VALUES ('23695', '郸城县', '3', '23589', 'D');
INSERT INTO `ey_region` VALUES ('23716', '淮阳县', '3', '23589', 'H');
INSERT INTO `ey_region` VALUES ('23736', '太康县', '3', '23589', 'T');
INSERT INTO `ey_region` VALUES ('23766', '鹿邑县', '3', '23589', 'L');
INSERT INTO `ey_region` VALUES ('23796', '项城市', '3', '23589', 'X');
INSERT INTO `ey_region` VALUES ('23818', '驻马店市', '2', '21387', 'Z');
INSERT INTO `ey_region` VALUES ('23819', '市辖区', '3', '23818', 'S');
INSERT INTO `ey_region` VALUES ('23820', '驿城区', '3', '23818', 'Y');
INSERT INTO `ey_region` VALUES ('23840', '西平县', '3', '23818', 'X');
INSERT INTO `ey_region` VALUES ('23861', '上蔡县', '3', '23818', 'S');
INSERT INTO `ey_region` VALUES ('23886', '平舆县', '3', '23818', 'P');
INSERT INTO `ey_region` VALUES ('23905', '正阳县', '3', '23818', 'Z');
INSERT INTO `ey_region` VALUES ('23926', '确山县', '3', '23818', 'Q');
INSERT INTO `ey_region` VALUES ('23940', '泌阳县', '3', '23818', 'M');
INSERT INTO `ey_region` VALUES ('23965', '汝南县', '3', '23818', 'R');
INSERT INTO `ey_region` VALUES ('23983', '遂平县', '3', '23818', 'S');
INSERT INTO `ey_region` VALUES ('23999', '新蔡县', '3', '23818', 'X');
INSERT INTO `ey_region` VALUES ('24022', '湖北省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('24023', '武汉市', '2', '24022', 'W');
INSERT INTO `ey_region` VALUES ('24024', '市辖区', '3', '24023', 'S');
INSERT INTO `ey_region` VALUES ('24025', '江岸区', '3', '24023', 'J');
INSERT INTO `ey_region` VALUES ('24043', '江汉区', '3', '24023', 'J');
INSERT INTO `ey_region` VALUES ('24057', '硚口区', '3', '24023', 'Q');
INSERT INTO `ey_region` VALUES ('24069', '汉阳区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24082', '武昌区', '3', '24023', 'W');
INSERT INTO `ey_region` VALUES ('24098', '青山区', '3', '24023', 'Q');
INSERT INTO `ey_region` VALUES ('24111', '洪山区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24129', '东西湖区', '3', '24023', 'D');
INSERT INTO `ey_region` VALUES ('24142', '汉南区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24150', '蔡甸区', '3', '24023', 'C');
INSERT INTO `ey_region` VALUES ('24165', '江夏区', '3', '24023', 'J');
INSERT INTO `ey_region` VALUES ('24185', '黄陂区', '3', '24023', 'H');
INSERT INTO `ey_region` VALUES ('24205', '武汉市新洲区', '3', '24023', 'W');
INSERT INTO `ey_region` VALUES ('24224', '黄石市', '2', '24022', 'H');
INSERT INTO `ey_region` VALUES ('24225', '市辖区', '3', '24224', 'S');
INSERT INTO `ey_region` VALUES ('24226', '黄石港区', '3', '24224', 'H');
INSERT INTO `ey_region` VALUES ('24233', '西塞山区', '3', '24224', 'X');
INSERT INTO `ey_region` VALUES ('24242', '下陆区', '3', '24224', 'X');
INSERT INTO `ey_region` VALUES ('24247', '铁山区', '3', '24224', 'T');
INSERT INTO `ey_region` VALUES ('24250', '阳新县', '3', '24224', 'Y');
INSERT INTO `ey_region` VALUES ('24273', '大冶市', '3', '24224', 'D');
INSERT INTO `ey_region` VALUES ('24291', '十堰市', '2', '24022', 'S');
INSERT INTO `ey_region` VALUES ('24292', '市辖区', '3', '24291', 'S');
INSERT INTO `ey_region` VALUES ('24293', '茅箭区', '3', '24291', 'M');
INSERT INTO `ey_region` VALUES ('24302', '张湾区', '3', '24291', 'Z');
INSERT INTO `ey_region` VALUES ('24314', '郧县', '3', '24291', 'Y');
INSERT INTO `ey_region` VALUES ('24335', '郧西县', '3', '24291', 'Y');
INSERT INTO `ey_region` VALUES ('24354', '竹山县', '3', '24291', 'Z');
INSERT INTO `ey_region` VALUES ('24374', '竹溪县', '3', '24291', 'Z');
INSERT INTO `ey_region` VALUES ('24405', '房县', '3', '24291', 'F');
INSERT INTO `ey_region` VALUES ('24435', '丹江口市', '3', '24291', 'D');
INSERT INTO `ey_region` VALUES ('24453', '宜昌市', '2', '24022', 'Y');
INSERT INTO `ey_region` VALUES ('24454', '市辖区', '3', '24453', 'S');
INSERT INTO `ey_region` VALUES ('24455', '西陵区', '3', '24453', 'X');
INSERT INTO `ey_region` VALUES ('24465', '伍家岗区', '3', '24453', 'W');
INSERT INTO `ey_region` VALUES ('24471', '点军区', '3', '24453', 'D');
INSERT INTO `ey_region` VALUES ('24477', '猇亭区', '3', '24453', 'X');
INSERT INTO `ey_region` VALUES ('24481', '夷陵区', '3', '24453', 'Y');
INSERT INTO `ey_region` VALUES ('24495', '远安县', '3', '24453', 'Y');
INSERT INTO `ey_region` VALUES ('24503', '兴山县', '3', '24453', 'X');
INSERT INTO `ey_region` VALUES ('24512', '秭归县', '3', '24453', 'Z');
INSERT INTO `ey_region` VALUES ('24525', '长阳县', '3', '24453', 'C');
INSERT INTO `ey_region` VALUES ('24537', '五峰县', '3', '24453', 'W');
INSERT INTO `ey_region` VALUES ('24546', '宜都市', '3', '24453', 'Y');
INSERT INTO `ey_region` VALUES ('24559', '当阳市', '3', '24453', 'D');
INSERT INTO `ey_region` VALUES ('24570', '枝江市', '3', '24453', 'Z');
INSERT INTO `ey_region` VALUES ('24580', '襄樊市', '2', '24022', 'X');
INSERT INTO `ey_region` VALUES ('24581', '市辖区', '3', '24580', 'S');
INSERT INTO `ey_region` VALUES ('24582', '襄城区', '3', '24580', 'X');
INSERT INTO `ey_region` VALUES ('24591', '樊城区', '3', '24580', 'F');
INSERT INTO `ey_region` VALUES ('24608', '襄阳区', '3', '24580', 'X');
INSERT INTO `ey_region` VALUES ('24623', '南漳县', '3', '24580', 'N');
INSERT INTO `ey_region` VALUES ('24635', '谷城县', '3', '24580', 'G');
INSERT INTO `ey_region` VALUES ('24647', '保康县', '3', '24580', 'B');
INSERT INTO `ey_region` VALUES ('24659', '老河口市', '3', '24580', 'L');
INSERT INTO `ey_region` VALUES ('24674', '枣阳市', '3', '24580', 'Z');
INSERT INTO `ey_region` VALUES ('24692', '宜城市', '3', '24580', 'Y');
INSERT INTO `ey_region` VALUES ('24706', '鄂州市', '2', '24022', 'E');
INSERT INTO `ey_region` VALUES ('24707', '市辖区', '3', '24706', 'S');
INSERT INTO `ey_region` VALUES ('24708', '粱子湖区', '3', '24706', 'L');
INSERT INTO `ey_region` VALUES ('24714', '华容区', '3', '24706', 'H');
INSERT INTO `ey_region` VALUES ('24722', '鄂城区', '3', '24706', 'E');
INSERT INTO `ey_region` VALUES ('24737', '荆门市', '2', '24022', 'J');
INSERT INTO `ey_region` VALUES ('24738', '市辖区', '3', '24737', 'S');
INSERT INTO `ey_region` VALUES ('24739', '东宝区', '3', '24737', 'D');
INSERT INTO `ey_region` VALUES ('24749', '掇刀区', '3', '24737', 'D');
INSERT INTO `ey_region` VALUES ('24755', '京山县', '3', '24737', 'J');
INSERT INTO `ey_region` VALUES ('24778', '沙洋县', '3', '24737', 'S');
INSERT INTO `ey_region` VALUES ('24794', '钟祥市', '3', '24737', 'Z');
INSERT INTO `ey_region` VALUES ('24816', '孝感市', '2', '24022', 'X');
INSERT INTO `ey_region` VALUES ('24817', '市辖区', '3', '24816', 'S');
INSERT INTO `ey_region` VALUES ('24818', '孝南区', '3', '24816', 'X');
INSERT INTO `ey_region` VALUES ('24838', '孝昌县', '3', '24816', 'X');
INSERT INTO `ey_region` VALUES ('24853', '大悟县', '3', '24816', 'D');
INSERT INTO `ey_region` VALUES ('24871', '云梦县', '3', '24816', 'Y');
INSERT INTO `ey_region` VALUES ('24885', '应城市', '3', '24816', 'Y');
INSERT INTO `ey_region` VALUES ('24903', '安陆市', '3', '24816', 'A');
INSERT INTO `ey_region` VALUES ('24920', '汉川市', '3', '24816', 'H');
INSERT INTO `ey_region` VALUES ('24949', '荆州市', '2', '24022', 'J');
INSERT INTO `ey_region` VALUES ('24950', '市辖区', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('24951', '沙市区', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('24965', '荆州区', '3', '24949', 'J');
INSERT INTO `ey_region` VALUES ('24978', '公安县', '3', '24949', 'G');
INSERT INTO `ey_region` VALUES ('24995', '监利县', '3', '24949', 'J');
INSERT INTO `ey_region` VALUES ('25019', '江陵县', '3', '24949', 'J');
INSERT INTO `ey_region` VALUES ('25032', '石首市', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('25048', '洪湖市', '3', '24949', 'H');
INSERT INTO `ey_region` VALUES ('25069', '松滋市', '3', '24949', 'S');
INSERT INTO `ey_region` VALUES ('25086', '黄冈市', '2', '24022', 'H');
INSERT INTO `ey_region` VALUES ('25087', '市辖区', '3', '25086', 'S');
INSERT INTO `ey_region` VALUES ('25088', '黄州区', '3', '25086', 'H');
INSERT INTO `ey_region` VALUES ('25099', '团风县', '3', '25086', 'T');
INSERT INTO `ey_region` VALUES ('25112', '红安县', '3', '25086', 'H');
INSERT INTO `ey_region` VALUES ('25126', '罗田县', '3', '25086', 'L');
INSERT INTO `ey_region` VALUES ('25143', '英山县', '3', '25086', 'Y');
INSERT INTO `ey_region` VALUES ('25158', '浠水县', '3', '25086', 'X');
INSERT INTO `ey_region` VALUES ('25175', '蕲春县', '3', '25086', 'Q');
INSERT INTO `ey_region` VALUES ('25192', '黄梅县', '3', '25086', 'H');
INSERT INTO `ey_region` VALUES ('25211', '麻城市', '3', '25086', 'M');
INSERT INTO `ey_region` VALUES ('25235', '武穴市', '3', '25086', 'W');
INSERT INTO `ey_region` VALUES ('25249', '咸宁市', '2', '24022', 'X');
INSERT INTO `ey_region` VALUES ('25250', '市辖区', '3', '25249', 'S');
INSERT INTO `ey_region` VALUES ('25251', '咸安区', '3', '25249', 'X');
INSERT INTO `ey_region` VALUES ('25266', '嘉鱼县', '3', '25249', 'J');
INSERT INTO `ey_region` VALUES ('25276', '通城县', '3', '25249', 'T');
INSERT INTO `ey_region` VALUES ('25290', '崇阳县', '3', '25249', 'C');
INSERT INTO `ey_region` VALUES ('25303', '通山县', '3', '25249', 'T');
INSERT INTO `ey_region` VALUES ('25317', '赤壁市', '3', '25249', 'C');
INSERT INTO `ey_region` VALUES ('25335', '随州市', '2', '24022', 'S');
INSERT INTO `ey_region` VALUES ('25336', '市辖区', '3', '25335', 'S');
INSERT INTO `ey_region` VALUES ('25337', '曾都区', '3', '25335', 'Z');
INSERT INTO `ey_region` VALUES ('25367', '广水市', '3', '25335', 'G');
INSERT INTO `ey_region` VALUES ('25388', '恩施州', '2', '24022', 'E');
INSERT INTO `ey_region` VALUES ('25389', '恩施市', '3', '25388', 'E');
INSERT INTO `ey_region` VALUES ('25406', '利川市', '3', '25388', 'L');
INSERT INTO `ey_region` VALUES ('25422', '建始县', '3', '25388', 'J');
INSERT INTO `ey_region` VALUES ('25433', '巴东县', '3', '25388', 'B');
INSERT INTO `ey_region` VALUES ('25446', '宣恩县', '3', '25388', 'X');
INSERT INTO `ey_region` VALUES ('25456', '咸丰县', '3', '25388', 'X');
INSERT INTO `ey_region` VALUES ('25467', '来凤县', '3', '25388', 'L');
INSERT INTO `ey_region` VALUES ('25476', '鹤峰县', '3', '25388', 'H');
INSERT INTO `ey_region` VALUES ('25487', '省直辖行政单位', '2', '24022', 'S');
INSERT INTO `ey_region` VALUES ('25488', '仙桃市', '3', '25487', 'X');
INSERT INTO `ey_region` VALUES ('25516', '潜江市', '3', '25487', 'Q');
INSERT INTO `ey_region` VALUES ('25541', '天门市', '3', '25487', 'T');
INSERT INTO `ey_region` VALUES ('25570', '神农架林区', '3', '25487', 'S');
INSERT INTO `ey_region` VALUES ('25579', '湖南省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('25580', '长沙市', '2', '25579', 'C');
INSERT INTO `ey_region` VALUES ('25581', '市辖区', '3', '25580', 'S');
INSERT INTO `ey_region` VALUES ('25582', '芙蓉区', '3', '25580', 'F');
INSERT INTO `ey_region` VALUES ('25596', '天心区', '3', '25580', 'T');
INSERT INTO `ey_region` VALUES ('25607', '岳麓区', '3', '25580', 'Y');
INSERT INTO `ey_region` VALUES ('25620', '开福区', '3', '25580', 'K');
INSERT INTO `ey_region` VALUES ('25634', '雨花区', '3', '25580', 'Y');
INSERT INTO `ey_region` VALUES ('25645', '长沙县', '3', '25580', 'C');
INSERT INTO `ey_region` VALUES ('25666', '望城县', '3', '25580', 'W');
INSERT INTO `ey_region` VALUES ('25686', '宁乡县', '3', '25580', 'N');
INSERT INTO `ey_region` VALUES ('25720', '浏阳市', '3', '25580', 'L');
INSERT INTO `ey_region` VALUES ('25758', '株洲市', '2', '25579', 'Z');
INSERT INTO `ey_region` VALUES ('25759', '市辖区', '3', '25758', 'S');
INSERT INTO `ey_region` VALUES ('25760', '荷塘区', '3', '25758', 'H');
INSERT INTO `ey_region` VALUES ('25768', '芦淞区', '3', '25758', 'L');
INSERT INTO `ey_region` VALUES ('25777', '石峰区', '3', '25758', 'S');
INSERT INTO `ey_region` VALUES ('25785', '天元区', '3', '25758', 'T');
INSERT INTO `ey_region` VALUES ('25791', '株洲县', '3', '25758', 'Z');
INSERT INTO `ey_region` VALUES ('25810', '攸县', '3', '25758', 'Y');
INSERT INTO `ey_region` VALUES ('25836', '茶陵县', '3', '25758', 'C');
INSERT INTO `ey_region` VALUES ('25863', '炎陵县', '3', '25758', 'Y');
INSERT INTO `ey_region` VALUES ('25881', '醴陵市', '3', '25758', 'L');
INSERT INTO `ey_region` VALUES ('25912', '湘潭市', '2', '25579', 'X');
INSERT INTO `ey_region` VALUES ('25913', '市辖区', '3', '25912', 'S');
INSERT INTO `ey_region` VALUES ('25914', '雨湖区', '3', '25912', 'Y');
INSERT INTO `ey_region` VALUES ('25929', '岳塘区', '3', '25912', 'Y');
INSERT INTO `ey_region` VALUES ('25947', '湘潭县', '3', '25912', 'X');
INSERT INTO `ey_region` VALUES ('25970', '湘乡市', '3', '25912', 'X');
INSERT INTO `ey_region` VALUES ('25993', '韶山市', '3', '25912', 'S');
INSERT INTO `ey_region` VALUES ('26001', '衡阳市', '2', '25579', 'H');
INSERT INTO `ey_region` VALUES ('26002', '市辖区', '3', '26001', 'S');
INSERT INTO `ey_region` VALUES ('26003', '珠晖区', '3', '26001', 'Z');
INSERT INTO `ey_region` VALUES ('26019', '雁峰区', '3', '26001', 'Y');
INSERT INTO `ey_region` VALUES ('26028', '石鼓区', '3', '26001', 'S');
INSERT INTO `ey_region` VALUES ('26037', '蒸湘区', '3', '26001', 'Z');
INSERT INTO `ey_region` VALUES ('26045', '南岳区', '3', '26001', 'N');
INSERT INTO `ey_region` VALUES ('26051', '衡阳县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26080', '衡南县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26112', '衡山县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26130', '衡东县', '3', '26001', 'H');
INSERT INTO `ey_region` VALUES ('26155', '祁东县', '3', '26001', 'Q');
INSERT INTO `ey_region` VALUES ('26179', '耒阳市', '3', '26001', 'L');
INSERT INTO `ey_region` VALUES ('26215', '常宁市', '3', '26001', 'C');
INSERT INTO `ey_region` VALUES ('26242', '邵阳市', '2', '25579', 'S');
INSERT INTO `ey_region` VALUES ('26243', '市辖区', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26244', '双清区', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26257', '大祥区', '3', '26242', 'D');
INSERT INTO `ey_region` VALUES ('26272', '北塔区', '3', '26242', 'B');
INSERT INTO `ey_region` VALUES ('26279', '邵东县', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26306', '新邵县', '3', '26242', 'X');
INSERT INTO `ey_region` VALUES ('26322', '邵阳县', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26348', '隆回县', '3', '26242', 'L');
INSERT INTO `ey_region` VALUES ('26375', '洞口县', '3', '26242', 'D');
INSERT INTO `ey_region` VALUES ('26399', '绥宁县', '3', '26242', 'S');
INSERT INTO `ey_region` VALUES ('26425', '新宁县', '3', '26242', 'X');
INSERT INTO `ey_region` VALUES ('26444', '城步县', '3', '26242', 'C');
INSERT INTO `ey_region` VALUES ('26465', '武冈市', '3', '26242', 'W');
INSERT INTO `ey_region` VALUES ('26485', '岳阳市', '2', '25579', 'Y');
INSERT INTO `ey_region` VALUES ('26486', '市辖区', '3', '26485', 'S');
INSERT INTO `ey_region` VALUES ('26487', '岳阳楼区', '3', '26485', 'Y');
INSERT INTO `ey_region` VALUES ('26511', '云溪区', '3', '26485', 'Y');
INSERT INTO `ey_region` VALUES ('26521', '君山区', '3', '26485', 'J');
INSERT INTO `ey_region` VALUES ('26529', '岳阳县', '3', '26485', 'Y');
INSERT INTO `ey_region` VALUES ('26551', '华容县', '3', '26485', 'H');
INSERT INTO `ey_region` VALUES ('26572', '湘阴县', '3', '26485', 'X');
INSERT INTO `ey_region` VALUES ('26592', '平江县', '3', '26485', 'P');
INSERT INTO `ey_region` VALUES ('26620', '汩罗市', '3', '26485', 'G');
INSERT INTO `ey_region` VALUES ('26657', '临湘市', '3', '26485', 'L');
INSERT INTO `ey_region` VALUES ('26683', '常德市', '2', '25579', 'C');
INSERT INTO `ey_region` VALUES ('26684', '市辖区', '3', '26683', 'S');
INSERT INTO `ey_region` VALUES ('26685', '武陵区', '3', '26683', 'W');
INSERT INTO `ey_region` VALUES ('26702', '鼎城区', '3', '26683', 'D');
INSERT INTO `ey_region` VALUES ('26741', '安乡县', '3', '26683', 'A');
INSERT INTO `ey_region` VALUES ('26762', '汉寿县', '3', '26683', 'H');
INSERT INTO `ey_region` VALUES ('26793', '澧县', '3', '26683', 'L');
INSERT INTO `ey_region` VALUES ('26826', '临澧县', '3', '26683', 'L');
INSERT INTO `ey_region` VALUES ('26844', '桃源县', '3', '26683', 'T');
INSERT INTO `ey_region` VALUES ('26885', '石门县', '3', '26683', 'S');
INSERT INTO `ey_region` VALUES ('26912', '津市市', '3', '26683', 'J');
INSERT INTO `ey_region` VALUES ('26925', '张家界市', '2', '25579', 'Z');
INSERT INTO `ey_region` VALUES ('26926', '市辖区', '3', '26925', 'S');
INSERT INTO `ey_region` VALUES ('26927', '永定区', '3', '26925', 'Y');
INSERT INTO `ey_region` VALUES ('26959', '武陵源区', '3', '26925', 'W');
INSERT INTO `ey_region` VALUES ('26966', '慈利县', '3', '26925', 'C');
INSERT INTO `ey_region` VALUES ('26998', '桑植县', '3', '26925', 'S');
INSERT INTO `ey_region` VALUES ('27038', '益阳市', '2', '25579', 'Y');
INSERT INTO `ey_region` VALUES ('27039', '市辖区', '3', '27038', 'S');
INSERT INTO `ey_region` VALUES ('27040', '资阳区', '3', '27038', 'Z');
INSERT INTO `ey_region` VALUES ('27049', '赫山区', '3', '27038', 'H');
INSERT INTO `ey_region` VALUES ('27069', '南县', '3', '27038', 'N');
INSERT INTO `ey_region` VALUES ('27087', '桃江县', '3', '27038', 'T');
INSERT INTO `ey_region` VALUES ('27106', '安化县', '3', '27038', 'A');
INSERT INTO `ey_region` VALUES ('27130', '沅江市', '3', '27038', 'Y');
INSERT INTO `ey_region` VALUES ('27147', '郴州市', '2', '25579', 'C');
INSERT INTO `ey_region` VALUES ('27148', '市辖区', '3', '27147', 'S');
INSERT INTO `ey_region` VALUES ('27149', '北湖区', '3', '27147', 'B');
INSERT INTO `ey_region` VALUES ('27168', '苏仙区', '3', '27147', 'S');
INSERT INTO `ey_region` VALUES ('27188', '桂阳县', '3', '27147', 'G');
INSERT INTO `ey_region` VALUES ('27228', '宜章县', '3', '27147', 'Y');
INSERT INTO `ey_region` VALUES ('27256', '永兴县', '3', '27147', 'Y');
INSERT INTO `ey_region` VALUES ('27282', '嘉禾县', '3', '27147', 'J');
INSERT INTO `ey_region` VALUES ('27300', '临武县', '3', '27147', 'L');
INSERT INTO `ey_region` VALUES ('27323', '汝城县', '3', '27147', 'R');
INSERT INTO `ey_region` VALUES ('27347', '桂东县', '3', '27147', 'G');
INSERT INTO `ey_region` VALUES ('27367', '安仁县', '3', '27147', 'A');
INSERT INTO `ey_region` VALUES ('27389', '资兴市', '3', '27147', 'Z');
INSERT INTO `ey_region` VALUES ('27418', '永州市', '2', '25579', 'Y');
INSERT INTO `ey_region` VALUES ('27419', '市辖区', '3', '27418', 'S');
INSERT INTO `ey_region` VALUES ('27420', '零陵区', '3', '27418', 'L');
INSERT INTO `ey_region` VALUES ('27437', '冷水滩区', '3', '27418', 'L');
INSERT INTO `ey_region` VALUES ('27459', '祁阳县', '3', '27418', 'Q');
INSERT INTO `ey_region` VALUES ('27492', '东安县', '3', '27418', 'D');
INSERT INTO `ey_region` VALUES ('27511', '双牌县', '3', '27418', 'S');
INSERT INTO `ey_region` VALUES ('27527', '道县', '3', '27418', 'D');
INSERT INTO `ey_region` VALUES ('27554', '江永县', '3', '27418', 'J');
INSERT INTO `ey_region` VALUES ('27567', '宁远县', '3', '27418', 'N');
INSERT INTO `ey_region` VALUES ('27585', '蓝山县', '3', '27418', 'L');
INSERT INTO `ey_region` VALUES ('27606', '新田县', '3', '27418', 'X');
INSERT INTO `ey_region` VALUES ('27626', '江华县', '3', '27418', 'J');
INSERT INTO `ey_region` VALUES ('27650', '怀化市', '2', '25579', 'H');
INSERT INTO `ey_region` VALUES ('27651', '市辖区', '3', '27650', 'S');
INSERT INTO `ey_region` VALUES ('27652', '鹤城区', '3', '27650', 'H');
INSERT INTO `ey_region` VALUES ('27667', '中方县', '3', '27650', 'Z');
INSERT INTO `ey_region` VALUES ('27690', '沅陵县', '3', '27650', 'Y');
INSERT INTO `ey_region` VALUES ('27714', '辰溪县', '3', '27650', 'C');
INSERT INTO `ey_region` VALUES ('27745', '溆浦县', '3', '27650', 'X');
INSERT INTO `ey_region` VALUES ('27789', '会同县', '3', '27650', 'H');
INSERT INTO `ey_region` VALUES ('27815', '麻阳县', '3', '27650', 'M');
INSERT INTO `ey_region` VALUES ('27839', '新晃县', '3', '27650', 'X');
INSERT INTO `ey_region` VALUES ('27863', '芷江县', '3', '27650', 'Z');
INSERT INTO `ey_region` VALUES ('27892', '靖州苗族侗族县', '3', '27650', 'J');
INSERT INTO `ey_region` VALUES ('27906', '通道县', '3', '27650', 'T');
INSERT INTO `ey_region` VALUES ('27930', '洪江市', '3', '27650', 'H');
INSERT INTO `ey_region` VALUES ('27963', '娄底市', '2', '25579', 'L');
INSERT INTO `ey_region` VALUES ('27964', '市辖区', '3', '27963', 'S');
INSERT INTO `ey_region` VALUES ('27965', '娄星区', '3', '27963', 'L');
INSERT INTO `ey_region` VALUES ('27980', '双峰县', '3', '27963', 'S');
INSERT INTO `ey_region` VALUES ('27997', '新化县', '3', '27963', 'X');
INSERT INTO `ey_region` VALUES ('28027', '冷水江市', '3', '27963', 'L');
INSERT INTO `ey_region` VALUES ('28044', '涟源市', '3', '27963', 'L');
INSERT INTO `ey_region` VALUES ('28065', '湘西州', '2', '25579', 'X');
INSERT INTO `ey_region` VALUES ('28066', '吉首市', '3', '28065', 'J');
INSERT INTO `ey_region` VALUES ('28082', '泸溪县', '3', '28065', 'L');
INSERT INTO `ey_region` VALUES ('28099', '凤凰县', '3', '28065', 'F');
INSERT INTO `ey_region` VALUES ('28124', '花垣县', '3', '28065', 'H');
INSERT INTO `ey_region` VALUES ('28143', '保靖县', '3', '28065', 'B');
INSERT INTO `ey_region` VALUES ('28161', '古丈县', '3', '28065', 'G');
INSERT INTO `ey_region` VALUES ('28174', '永顺县', '3', '28065', 'Y');
INSERT INTO `ey_region` VALUES ('28205', '龙山县', '3', '28065', 'L');
INSERT INTO `ey_region` VALUES ('28240', '广东省', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('28241', '广州市', '2', '28240', 'G');
INSERT INTO `ey_region` VALUES ('28242', '市辖区', '3', '28241', 'S');
INSERT INTO `ey_region` VALUES ('28243', '荔湾区', '3', '28241', 'L');
INSERT INTO `ey_region` VALUES ('28266', '越秀区', '3', '28241', 'Y');
INSERT INTO `ey_region` VALUES ('28289', '海珠区', '3', '28241', 'H');
INSERT INTO `ey_region` VALUES ('28308', '天河区', '3', '28241', 'T');
INSERT INTO `ey_region` VALUES ('28330', '白云区', '3', '28241', 'B');
INSERT INTO `ey_region` VALUES ('28349', '黄埔区', '3', '28241', 'H');
INSERT INTO `ey_region` VALUES ('28359', '番禺区', '3', '28241', 'F');
INSERT INTO `ey_region` VALUES ('28377', '花都区', '3', '28241', 'H');
INSERT INTO `ey_region` VALUES ('28386', '南沙区', '3', '28241', 'N');
INSERT INTO `ey_region` VALUES ('28392', '萝岗区', '3', '28241', 'L');
INSERT INTO `ey_region` VALUES ('28399', '增城市', '3', '28241', 'Z');
INSERT INTO `ey_region` VALUES ('28409', '从化市', '3', '28241', 'C');
INSERT INTO `ey_region` VALUES ('28421', '韶关市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('28422', '市辖区', '3', '28421', 'S');
INSERT INTO `ey_region` VALUES ('28423', '武江区', '3', '28421', 'W');
INSERT INTO `ey_region` VALUES ('28431', '浈江区', '3', '28421', 'Z');
INSERT INTO `ey_region` VALUES ('28448', '曲江区', '3', '28421', 'Q');
INSERT INTO `ey_region` VALUES ('28463', '始兴县', '3', '28421', 'S');
INSERT INTO `ey_region` VALUES ('28475', '仁化县', '3', '28421', 'R');
INSERT INTO `ey_region` VALUES ('28488', '翁源县', '3', '28421', 'W');
INSERT INTO `ey_region` VALUES ('28497', '乳源县', '3', '28421', 'R');
INSERT INTO `ey_region` VALUES ('28509', '新丰县', '3', '28421', 'X');
INSERT INTO `ey_region` VALUES ('28517', '乐昌市', '3', '28421', 'L');
INSERT INTO `ey_region` VALUES ('28539', '南雄市', '3', '28421', 'N');
INSERT INTO `ey_region` VALUES ('28558', '深圳市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('28559', '市辖区', '3', '28558', 'S');
INSERT INTO `ey_region` VALUES ('28560', '罗湖区', '3', '28558', 'L');
INSERT INTO `ey_region` VALUES ('28571', '福田区', '3', '28558', 'F');
INSERT INTO `ey_region` VALUES ('28581', '南山区', '3', '28558', 'N');
INSERT INTO `ey_region` VALUES ('28590', '宝安区', '3', '28558', 'B');
INSERT INTO `ey_region` VALUES ('28604', '龙岗区', '3', '28558', 'L');
INSERT INTO `ey_region` VALUES ('28619', '盐田区', '3', '28558', 'Y');
INSERT INTO `ey_region` VALUES ('28626', '珠海市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('28627', '市辖区', '3', '28626', 'S');
INSERT INTO `ey_region` VALUES ('28628', '香洲区', '3', '28626', 'X');
INSERT INTO `ey_region` VALUES ('28646', '斗门区', '3', '28626', 'D');
INSERT INTO `ey_region` VALUES ('28654', '金湾区', '3', '28626', 'J');
INSERT INTO `ey_region` VALUES ('28659', '汕头市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('28660', '市辖区', '3', '28659', 'S');
INSERT INTO `ey_region` VALUES ('28661', '龙湖区', '3', '28659', 'L');
INSERT INTO `ey_region` VALUES ('28669', '金平区', '3', '28659', 'J');
INSERT INTO `ey_region` VALUES ('28687', '濠江区', '3', '28659', 'H');
INSERT INTO `ey_region` VALUES ('28695', '潮阳区', '3', '28659', 'C');
INSERT INTO `ey_region` VALUES ('28709', '潮南区', '3', '28659', 'C');
INSERT INTO `ey_region` VALUES ('28721', '澄海区', '3', '28659', 'C');
INSERT INTO `ey_region` VALUES ('28733', '南澳县', '3', '28659', 'N');
INSERT INTO `ey_region` VALUES ('28737', '佛山市', '2', '28240', 'F');
INSERT INTO `ey_region` VALUES ('28738', '市辖区', '3', '28737', 'S');
INSERT INTO `ey_region` VALUES ('28739', '禅城区', '3', '28737', 'C');
INSERT INTO `ey_region` VALUES ('28744', '南海区', '3', '28737', 'N');
INSERT INTO `ey_region` VALUES ('28753', '顺德区', '3', '28737', 'S');
INSERT INTO `ey_region` VALUES ('28764', '三水区', '3', '28737', 'S');
INSERT INTO `ey_region` VALUES ('28776', '高明区', '3', '28737', 'G');
INSERT INTO `ey_region` VALUES ('28785', '江门市', '2', '28240', 'J');
INSERT INTO `ey_region` VALUES ('28786', '市辖区', '3', '28785', 'S');
INSERT INTO `ey_region` VALUES ('28787', '蓬江区', '3', '28785', 'P');
INSERT INTO `ey_region` VALUES ('28797', '江海区', '3', '28785', 'J');
INSERT INTO `ey_region` VALUES ('28803', '新会区', '3', '28785', 'X');
INSERT INTO `ey_region` VALUES ('28818', '台山市', '3', '28785', 'T');
INSERT INTO `ey_region` VALUES ('28837', '开平市', '3', '28785', 'K');
INSERT INTO `ey_region` VALUES ('28853', '鹤山市', '3', '28785', 'H');
INSERT INTO `ey_region` VALUES ('28867', '恩平市', '3', '28785', 'E');
INSERT INTO `ey_region` VALUES ('28880', '湛江市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('28881', '市辖区', '3', '28880', 'S');
INSERT INTO `ey_region` VALUES ('28882', '湛江市赤坎区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28891', '湛江市霞山区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28904', '湛江市坡头区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28914', '湛江市麻章区', '3', '28880', 'Z');
INSERT INTO `ey_region` VALUES ('28923', '遂溪县', '3', '28880', 'S');
INSERT INTO `ey_region` VALUES ('28941', '徐闻县', '3', '28880', 'X');
INSERT INTO `ey_region` VALUES ('28962', '廉江市', '3', '28880', 'L');
INSERT INTO `ey_region` VALUES ('28984', '雷州市', '3', '28880', 'L');
INSERT INTO `ey_region` VALUES ('29010', '吴川市', '3', '28880', 'W');
INSERT INTO `ey_region` VALUES ('29026', '茂名市', '2', '28240', 'M');
INSERT INTO `ey_region` VALUES ('29027', '市辖区', '3', '29026', 'S');
INSERT INTO `ey_region` VALUES ('29028', '茂南区', '3', '29026', 'M');
INSERT INTO `ey_region` VALUES ('29045', '茂港区', '3', '29026', 'M');
INSERT INTO `ey_region` VALUES ('29053', '电白县', '3', '29026', 'D');
INSERT INTO `ey_region` VALUES ('29075', '高州市', '3', '29026', 'G');
INSERT INTO `ey_region` VALUES ('29107', '化州市', '3', '29026', 'H');
INSERT INTO `ey_region` VALUES ('29138', '信宜市', '3', '29026', 'X');
INSERT INTO `ey_region` VALUES ('29159', '肇庆市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('29160', '市辖区', '3', '29159', 'S');
INSERT INTO `ey_region` VALUES ('29161', '端州区', '3', '29159', 'D');
INSERT INTO `ey_region` VALUES ('29169', '鼎湖区', '3', '29159', 'D');
INSERT INTO `ey_region` VALUES ('29178', '广宁县', '3', '29159', 'G');
INSERT INTO `ey_region` VALUES ('29196', '怀集县', '3', '29159', 'H');
INSERT INTO `ey_region` VALUES ('29217', '封开县', '3', '29159', 'F');
INSERT INTO `ey_region` VALUES ('29234', '德庆县', '3', '29159', 'D');
INSERT INTO `ey_region` VALUES ('29248', '高要市', '3', '29159', 'G');
INSERT INTO `ey_region` VALUES ('29266', '四会市', '3', '29159', 'S');
INSERT INTO `ey_region` VALUES ('29282', '惠州市', '2', '28240', 'H');
INSERT INTO `ey_region` VALUES ('29283', '市辖区', '3', '29282', 'S');
INSERT INTO `ey_region` VALUES ('29284', '惠城区', '3', '29282', 'H');
INSERT INTO `ey_region` VALUES ('29304', '惠阳区', '3', '29282', 'H');
INSERT INTO `ey_region` VALUES ('29317', '博罗县', '3', '29282', 'B');
INSERT INTO `ey_region` VALUES ('29335', '惠东县', '3', '29282', 'H');
INSERT INTO `ey_region` VALUES ('29355', '龙门县', '3', '29282', 'L');
INSERT INTO `ey_region` VALUES ('29371', '梅州市', '2', '28240', 'M');
INSERT INTO `ey_region` VALUES ('29372', '市辖区', '3', '29371', 'S');
INSERT INTO `ey_region` VALUES ('29373', '梅江区', '3', '29371', 'M');
INSERT INTO `ey_region` VALUES ('29380', '梅县', '3', '29371', 'M');
INSERT INTO `ey_region` VALUES ('29400', '大埔县', '3', '29371', 'D');
INSERT INTO `ey_region` VALUES ('29418', '丰顺县', '3', '29371', 'F');
INSERT INTO `ey_region` VALUES ('29436', '五华县', '3', '29371', 'W');
INSERT INTO `ey_region` VALUES ('29453', '平远县', '3', '29371', 'P');
INSERT INTO `ey_region` VALUES ('29466', '蕉岭县', '3', '29371', 'J');
INSERT INTO `ey_region` VALUES ('29477', '兴宁市', '3', '29371', 'X');
INSERT INTO `ey_region` VALUES ('29498', '汕尾市', '2', '28240', 'S');
INSERT INTO `ey_region` VALUES ('29499', '市辖区', '3', '29498', 'S');
INSERT INTO `ey_region` VALUES ('29500', '城区', '3', '29498', 'C');
INSERT INTO `ey_region` VALUES ('29511', '海丰县', '3', '29498', 'H');
INSERT INTO `ey_region` VALUES ('29529', '陆河县', '3', '29498', 'L');
INSERT INTO `ey_region` VALUES ('29538', '陆丰市', '3', '29498', 'L');
INSERT INTO `ey_region` VALUES ('29568', '河源市', '2', '28240', 'H');
INSERT INTO `ey_region` VALUES ('29569', '市辖区', '3', '29568', 'S');
INSERT INTO `ey_region` VALUES ('29570', '源城区', '3', '29568', 'Y');
INSERT INTO `ey_region` VALUES ('29578', '紫金县', '3', '29568', 'Z');
INSERT INTO `ey_region` VALUES ('29599', '龙川县', '3', '29568', 'L');
INSERT INTO `ey_region` VALUES ('29625', '连平县', '3', '29568', 'L');
INSERT INTO `ey_region` VALUES ('29639', '和平县', '3', '29568', 'H');
INSERT INTO `ey_region` VALUES ('29657', '东源县', '3', '29568', 'D');
INSERT INTO `ey_region` VALUES ('29679', '阳江市', '2', '28240', 'Y');
INSERT INTO `ey_region` VALUES ('29680', '市辖区', '3', '29679', 'S');
INSERT INTO `ey_region` VALUES ('29681', '江城区', '3', '29679', 'J');
INSERT INTO `ey_region` VALUES ('29698', '阳西县', '3', '29679', 'Y');
INSERT INTO `ey_region` VALUES ('29709', '阳东县', '3', '29679', 'Y');
INSERT INTO `ey_region` VALUES ('29729', '阳春市', '3', '29679', 'Y');
INSERT INTO `ey_region` VALUES ('29755', '清远市', '2', '28240', 'Q');
INSERT INTO `ey_region` VALUES ('29756', '市辖区', '3', '29755', 'S');
INSERT INTO `ey_region` VALUES ('29757', '清城区', '3', '29755', 'Q');
INSERT INTO `ey_region` VALUES ('29766', '佛冈县', '3', '29755', 'F');
INSERT INTO `ey_region` VALUES ('29773', '阳山县', '3', '29755', 'Y');
INSERT INTO `ey_region` VALUES ('29787', '连山县', '3', '29755', 'L');
INSERT INTO `ey_region` VALUES ('29797', '连南县', '3', '29755', 'L');
INSERT INTO `ey_region` VALUES ('29805', '清新县', '3', '29755', 'Q');
INSERT INTO `ey_region` VALUES ('29816', '英德市', '3', '29755', 'Y');
INSERT INTO `ey_region` VALUES ('29842', '连州市', '3', '29755', 'L');
INSERT INTO `ey_region` VALUES ('29855', '东莞市', '2', '28240', 'D');
INSERT INTO `ey_region` VALUES ('29890', '中山市', '2', '28240', 'Z');
INSERT INTO `ey_region` VALUES ('29915', '潮州市', '2', '28240', 'C');
INSERT INTO `ey_region` VALUES ('29916', '市辖区', '3', '29915', 'S');
INSERT INTO `ey_region` VALUES ('29917', '潮州市湘桥区', '3', '29915', 'C');
INSERT INTO `ey_region` VALUES ('29930', '潮州市潮安县', '3', '29915', 'C');
INSERT INTO `ey_region` VALUES ('29954', '潮州市饶平县', '3', '29915', 'C');
INSERT INTO `ey_region` VALUES ('29977', '揭阳市', '2', '28240', 'J');
INSERT INTO `ey_region` VALUES ('29978', '市辖区', '3', '29977', 'S');
INSERT INTO `ey_region` VALUES ('29979', '榕城区', '3', '29977', 'R');
INSERT INTO `ey_region` VALUES ('29990', '揭东县', '3', '29977', 'J');
INSERT INTO `ey_region` VALUES ('30008', '揭西县', '3', '29977', 'J');
INSERT INTO `ey_region` VALUES ('30032', '惠来县', '3', '29977', 'H');
INSERT INTO `ey_region` VALUES ('30054', '普宁市', '3', '29977', 'P');
INSERT INTO `ey_region` VALUES ('30086', '云浮市', '2', '28240', 'Y');
INSERT INTO `ey_region` VALUES ('30087', '市辖区', '3', '30086', 'S');
INSERT INTO `ey_region` VALUES ('30088', '云城区', '3', '30086', 'Y');
INSERT INTO `ey_region` VALUES ('30096', '新兴县', '3', '30086', 'X');
INSERT INTO `ey_region` VALUES ('30112', '郁南县', '3', '30086', 'Y');
INSERT INTO `ey_region` VALUES ('30132', '云安县', '3', '30086', 'Y');
INSERT INTO `ey_region` VALUES ('30141', '罗定市', '3', '30086', 'L');
INSERT INTO `ey_region` VALUES ('30164', '广西', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('30165', '南宁市', '2', '30164', 'N');
INSERT INTO `ey_region` VALUES ('30166', '市辖区', '3', '30165', 'S');
INSERT INTO `ey_region` VALUES ('30167', '兴宁区', '3', '30165', 'X');
INSERT INTO `ey_region` VALUES ('30174', '青秀区', '3', '30165', 'Q');
INSERT INTO `ey_region` VALUES ('30186', '江南区', '3', '30165', 'J');
INSERT INTO `ey_region` VALUES ('30196', '西乡塘区', '3', '30165', 'X');
INSERT INTO `ey_region` VALUES ('30214', '良庆区', '3', '30165', 'L');
INSERT INTO `ey_region` VALUES ('30222', '邕宁区', '3', '30165', 'Y');
INSERT INTO `ey_region` VALUES ('30228', '武鸣县', '3', '30165', 'W');
INSERT INTO `ey_region` VALUES ('30245', '隆安县', '3', '30165', 'L');
INSERT INTO `ey_region` VALUES ('30257', '马山县', '3', '30165', 'M');
INSERT INTO `ey_region` VALUES ('30270', '上林县', '3', '30165', 'S');
INSERT INTO `ey_region` VALUES ('30282', '宾阳县', '3', '30165', 'B');
INSERT INTO `ey_region` VALUES ('30300', '横县', '3', '30165', 'H');
INSERT INTO `ey_region` VALUES ('30319', '柳州市', '2', '30164', 'L');
INSERT INTO `ey_region` VALUES ('30320', '市辖区', '3', '30319', 'S');
INSERT INTO `ey_region` VALUES ('30321', '城中区', '3', '30319', 'C');
INSERT INTO `ey_region` VALUES ('30329', '鱼峰区', '3', '30319', 'Y');
INSERT INTO `ey_region` VALUES ('30338', '柳南区', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30348', '柳北区', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30361', '柳江县', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30374', '柳城县', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30387', '鹿寨县', '3', '30319', 'L');
INSERT INTO `ey_region` VALUES ('30398', '融安县', '3', '30319', 'R');
INSERT INTO `ey_region` VALUES ('30411', '融水县', '3', '30319', 'R');
INSERT INTO `ey_region` VALUES ('30432', '三江县', '3', '30319', 'S');
INSERT INTO `ey_region` VALUES ('30448', '桂林市', '2', '30164', 'G');
INSERT INTO `ey_region` VALUES ('30449', '市辖区', '3', '30448', 'S');
INSERT INTO `ey_region` VALUES ('30450', '秀峰区', '3', '30448', 'X');
INSERT INTO `ey_region` VALUES ('30454', '叠彩区', '3', '30448', 'D');
INSERT INTO `ey_region` VALUES ('30458', '象山区', '3', '30448', 'X');
INSERT INTO `ey_region` VALUES ('30463', '七星区', '3', '30448', 'Q');
INSERT INTO `ey_region` VALUES ('30469', '雁山区', '3', '30448', 'Y');
INSERT INTO `ey_region` VALUES ('30475', '阳朔县', '3', '30448', 'Y');
INSERT INTO `ey_region` VALUES ('30485', '临桂县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30497', '灵川县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30509', '全州县', '3', '30448', 'Q');
INSERT INTO `ey_region` VALUES ('30528', '兴安县', '3', '30448', 'X');
INSERT INTO `ey_region` VALUES ('30539', '永福县', '3', '30448', 'Y');
INSERT INTO `ey_region` VALUES ('30549', '灌阳县', '3', '30448', 'G');
INSERT INTO `ey_region` VALUES ('30559', '龙胜县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30570', '资源县', '3', '30448', 'Z');
INSERT INTO `ey_region` VALUES ('30578', '平乐县', '3', '30448', 'P');
INSERT INTO `ey_region` VALUES ('30589', '荔浦县', '3', '30448', 'L');
INSERT INTO `ey_region` VALUES ('30603', '恭城县', '3', '30448', 'G');
INSERT INTO `ey_region` VALUES ('30613', '梧州市', '2', '30164', 'W');
INSERT INTO `ey_region` VALUES ('30614', '市辖区', '3', '30613', 'S');
INSERT INTO `ey_region` VALUES ('30615', '万秀区', '3', '30613', 'W');
INSERT INTO `ey_region` VALUES ('30622', '蝶山区', '3', '30613', 'D');
INSERT INTO `ey_region` VALUES ('30628', '长洲区', '3', '30613', 'C');
INSERT INTO `ey_region` VALUES ('30633', '苍梧县', '3', '30613', 'C');
INSERT INTO `ey_region` VALUES ('30646', '藤县', '3', '30613', 'T');
INSERT INTO `ey_region` VALUES ('30663', '蒙山县', '3', '30613', 'M');
INSERT INTO `ey_region` VALUES ('30673', '岑溪市', '3', '30613', 'C');
INSERT INTO `ey_region` VALUES ('30688', '北海市', '2', '30164', 'B');
INSERT INTO `ey_region` VALUES ('30689', '市辖区', '3', '30688', 'S');
INSERT INTO `ey_region` VALUES ('30690', '海城区', '3', '30688', 'H');
INSERT INTO `ey_region` VALUES ('30699', '银海区', '3', '30688', 'Y');
INSERT INTO `ey_region` VALUES ('30704', '铁山港区', '3', '30688', 'T');
INSERT INTO `ey_region` VALUES ('30708', '合浦县', '3', '30688', 'H');
INSERT INTO `ey_region` VALUES ('30724', '防城港市', '2', '30164', 'F');
INSERT INTO `ey_region` VALUES ('30725', '市辖区', '3', '30724', 'S');
INSERT INTO `ey_region` VALUES ('30726', '港口区', '3', '30724', 'G');
INSERT INTO `ey_region` VALUES ('30732', '防城区', '3', '30724', 'F');
INSERT INTO `ey_region` VALUES ('30748', '上思县', '3', '30724', 'S');
INSERT INTO `ey_region` VALUES ('30758', '东兴市', '3', '30724', 'D');
INSERT INTO `ey_region` VALUES ('30762', '钦州市', '2', '30164', 'Q');
INSERT INTO `ey_region` VALUES ('30763', '市辖区', '3', '30762', 'S');
INSERT INTO `ey_region` VALUES ('30764', '钦南区', '3', '30762', 'Q');
INSERT INTO `ey_region` VALUES ('30783', '钦北区', '3', '30762', 'Q');
INSERT INTO `ey_region` VALUES ('30796', '灵山县', '3', '30762', 'L');
INSERT INTO `ey_region` VALUES ('30817', '浦北县', '3', '30762', 'P');
INSERT INTO `ey_region` VALUES ('30834', '贵港市', '2', '30164', 'G');
INSERT INTO `ey_region` VALUES ('30835', '市辖区', '3', '30834', 'S');
INSERT INTO `ey_region` VALUES ('30836', '港北区', '3', '30834', 'G');
INSERT INTO `ey_region` VALUES ('30845', '港南区', '3', '30834', 'G');
INSERT INTO `ey_region` VALUES ('30855', '覃塘区', '3', '30834', 'Q');
INSERT INTO `ey_region` VALUES ('30866', '平南县', '3', '30834', 'P');
INSERT INTO `ey_region` VALUES ('30888', '桂平市', '3', '30834', 'G');
INSERT INTO `ey_region` VALUES ('30915', '玉林市', '2', '30164', 'Y');
INSERT INTO `ey_region` VALUES ('30916', '市辖区', '3', '30915', 'S');
INSERT INTO `ey_region` VALUES ('30917', '玉州区', '3', '30915', 'Y');
INSERT INTO `ey_region` VALUES ('30933', '容县', '3', '30915', 'R');
INSERT INTO `ey_region` VALUES ('30949', '陆川县', '3', '30915', 'L');
INSERT INTO `ey_region` VALUES ('30964', '博白县', '3', '30915', 'B');
INSERT INTO `ey_region` VALUES ('30993', '兴业县', '3', '30915', 'X');
INSERT INTO `ey_region` VALUES ('31007', '北流市', '3', '30915', 'B');
INSERT INTO `ey_region` VALUES ('31033', '百色市', '2', '30164', 'B');
INSERT INTO `ey_region` VALUES ('31034', '市辖区', '3', '31033', 'S');
INSERT INTO `ey_region` VALUES ('31035', '右江区', '3', '31033', 'Y');
INSERT INTO `ey_region` VALUES ('31045', '田阳县', '3', '31033', 'T');
INSERT INTO `ey_region` VALUES ('31056', '田东县', '3', '31033', 'T');
INSERT INTO `ey_region` VALUES ('31067', '平果县', '3', '31033', 'P');
INSERT INTO `ey_region` VALUES ('31081', '德保县', '3', '31033', 'D');
INSERT INTO `ey_region` VALUES ('31095', '靖西县', '3', '31033', 'J');
INSERT INTO `ey_region` VALUES ('31115', '那坡县', '3', '31033', 'N');
INSERT INTO `ey_region` VALUES ('31125', '凌云县', '3', '31033', 'L');
INSERT INTO `ey_region` VALUES ('31134', '乐业县', '3', '31033', 'L');
INSERT INTO `ey_region` VALUES ('31143', '田林县', '3', '31033', 'T');
INSERT INTO `ey_region` VALUES ('31158', '西林县', '3', '31033', 'X');
INSERT INTO `ey_region` VALUES ('31167', '隆林县', '3', '31033', 'L');
INSERT INTO `ey_region` VALUES ('31184', '贺州市', '2', '30164', 'H');
INSERT INTO `ey_region` VALUES ('31185', '市辖区', '3', '31184', 'S');
INSERT INTO `ey_region` VALUES ('31186', '八步区', '3', '31184', 'B');
INSERT INTO `ey_region` VALUES ('31208', '昭平县', '3', '31184', 'Z');
INSERT INTO `ey_region` VALUES ('31221', '钟山县', '3', '31184', 'Z');
INSERT INTO `ey_region` VALUES ('31236', '富川县', '3', '31184', 'F');
INSERT INTO `ey_region` VALUES ('31249', '河池市', '2', '30164', 'H');
INSERT INTO `ey_region` VALUES ('31250', '市辖区', '3', '31249', 'S');
INSERT INTO `ey_region` VALUES ('31251', '金城江区', '3', '31249', 'J');
INSERT INTO `ey_region` VALUES ('31264', '南丹县', '3', '31249', 'N');
INSERT INTO `ey_region` VALUES ('31276', '天峨县', '3', '31249', 'T');
INSERT INTO `ey_region` VALUES ('31286', '凤山县', '3', '31249', 'F');
INSERT INTO `ey_region` VALUES ('31296', '东兰县', '3', '31249', 'D');
INSERT INTO `ey_region` VALUES ('31311', '罗城县', '3', '31249', 'L');
INSERT INTO `ey_region` VALUES ('31323', '环江县', '3', '31249', 'H');
INSERT INTO `ey_region` VALUES ('31336', '巴马县', '3', '31249', 'B');
INSERT INTO `ey_region` VALUES ('31347', '都安县', '3', '31249', 'D');
INSERT INTO `ey_region` VALUES ('31367', '大化县', '3', '31249', 'D');
INSERT INTO `ey_region` VALUES ('31384', '宜州市', '3', '31249', 'Y');
INSERT INTO `ey_region` VALUES ('31401', '来宾市', '2', '30164', 'L');
INSERT INTO `ey_region` VALUES ('31402', '市辖区', '3', '31401', 'S');
INSERT INTO `ey_region` VALUES ('31403', '兴宾区', '3', '31401', 'X');
INSERT INTO `ey_region` VALUES ('31427', '忻城县', '3', '31401', 'X');
INSERT INTO `ey_region` VALUES ('31440', '象州县', '3', '31401', 'X');
INSERT INTO `ey_region` VALUES ('31452', '武宣县', '3', '31401', 'W');
INSERT INTO `ey_region` VALUES ('31463', '金秀县', '3', '31401', 'J');
INSERT INTO `ey_region` VALUES ('31474', '合山市', '3', '31401', 'H');
INSERT INTO `ey_region` VALUES ('31478', '崇左市', '2', '30164', 'C');
INSERT INTO `ey_region` VALUES ('31479', '市辖区', '3', '31478', 'S');
INSERT INTO `ey_region` VALUES ('31480', '江州区', '3', '31478', 'J');
INSERT INTO `ey_region` VALUES ('31490', '扶绥县', '3', '31478', 'F');
INSERT INTO `ey_region` VALUES ('31502', '宁明县', '3', '31478', 'N');
INSERT INTO `ey_region` VALUES ('31516', '龙州县', '3', '31478', 'L');
INSERT INTO `ey_region` VALUES ('31529', '大新县', '3', '31478', 'D');
INSERT INTO `ey_region` VALUES ('31544', '天等县', '3', '31478', 'T');
INSERT INTO `ey_region` VALUES ('31558', '凭祥市', '3', '31478', 'P');
INSERT INTO `ey_region` VALUES ('31563', '海南省', '1', '0', 'H');
INSERT INTO `ey_region` VALUES ('31564', '海口市', '2', '31563', 'H');
INSERT INTO `ey_region` VALUES ('31565', '市辖区', '3', '31564', 'S');
INSERT INTO `ey_region` VALUES ('31566', '秀英区', '3', '31564', 'X');
INSERT INTO `ey_region` VALUES ('31575', '龙华区', '3', '31564', 'L');
INSERT INTO `ey_region` VALUES ('31587', '琼山区', '3', '31564', 'Q');
INSERT INTO `ey_region` VALUES ('31601', '美兰区', '3', '31564', 'M');
INSERT INTO `ey_region` VALUES ('31618', '三亚市', '2', '31563', 'S');
INSERT INTO `ey_region` VALUES ('31619', '市辖区', '3', '31618', 'S');
INSERT INTO `ey_region` VALUES ('31634', '五指山市', '2', '31563', 'W');
INSERT INTO `ey_region` VALUES ('31635', '冲山镇', '3', '31634', 'C');
INSERT INTO `ey_region` VALUES ('31636', '南圣镇', '3', '31634', 'N');
INSERT INTO `ey_region` VALUES ('31637', '毛阳镇', '3', '31634', 'M');
INSERT INTO `ey_region` VALUES ('31638', '番阳镇', '3', '31634', 'F');
INSERT INTO `ey_region` VALUES ('31639', '畅好乡', '3', '31634', 'C');
INSERT INTO `ey_region` VALUES ('31640', '毛道乡', '3', '31634', 'M');
INSERT INTO `ey_region` VALUES ('31641', '水满乡', '3', '31634', 'S');
INSERT INTO `ey_region` VALUES ('31642', '国营畅好农场', '3', '31634', 'G');
INSERT INTO `ey_region` VALUES ('31643', '琼海市', '2', '31563', 'Q');
INSERT INTO `ey_region` VALUES ('31644', '嘉积镇', '3', '31643', 'J');
INSERT INTO `ey_region` VALUES ('31645', '万泉镇', '3', '31643', 'W');
INSERT INTO `ey_region` VALUES ('31646', '石壁镇', '3', '31643', 'S');
INSERT INTO `ey_region` VALUES ('31647', '中原镇', '3', '31643', 'Z');
INSERT INTO `ey_region` VALUES ('31648', '博敖镇', '3', '31643', 'B');
INSERT INTO `ey_region` VALUES ('31649', '阳江镇', '3', '31643', 'Y');
INSERT INTO `ey_region` VALUES ('31650', '龙江镇', '3', '31643', 'L');
INSERT INTO `ey_region` VALUES ('31651', '潭门镇', '3', '31643', 'T');
INSERT INTO `ey_region` VALUES ('31652', '塔洋镇', '3', '31643', 'T');
INSERT INTO `ey_region` VALUES ('31653', '长坡镇', '3', '31643', 'C');
INSERT INTO `ey_region` VALUES ('31654', '大路镇', '3', '31643', 'D');
INSERT INTO `ey_region` VALUES ('31655', '会山镇', '3', '31643', 'H');
INSERT INTO `ey_region` VALUES ('31656', '国营东太农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31657', '国营东平农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31658', '国营东红农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31659', '国营东升农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31660', '国营南俸农场', '3', '31643', 'G');
INSERT INTO `ey_region` VALUES ('31661', '彬村山华侨农场', '3', '31643', 'B');
INSERT INTO `ey_region` VALUES ('31662', '儋州市', '2', '31563', 'D');
INSERT INTO `ey_region` VALUES ('31663', '那大镇', '3', '31662', 'N');
INSERT INTO `ey_region` VALUES ('31664', '和庆镇', '3', '31662', 'H');
INSERT INTO `ey_region` VALUES ('31665', '南丰镇', '3', '31662', 'N');
INSERT INTO `ey_region` VALUES ('31666', '大成镇', '3', '31662', 'D');
INSERT INTO `ey_region` VALUES ('31667', '雅星镇', '3', '31662', 'Y');
INSERT INTO `ey_region` VALUES ('31668', '兰洋镇', '3', '31662', 'L');
INSERT INTO `ey_region` VALUES ('31669', '光村镇', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31670', '木棠镇', '3', '31662', 'M');
INSERT INTO `ey_region` VALUES ('31671', '海头镇', '3', '31662', 'H');
INSERT INTO `ey_region` VALUES ('31672', '峨蔓镇', '3', '31662', 'E');
INSERT INTO `ey_region` VALUES ('31673', '三都镇', '3', '31662', 'S');
INSERT INTO `ey_region` VALUES ('31674', '王五镇', '3', '31662', 'W');
INSERT INTO `ey_region` VALUES ('31675', '白马井镇', '3', '31662', 'B');
INSERT INTO `ey_region` VALUES ('31676', '中和镇', '3', '31662', 'Z');
INSERT INTO `ey_region` VALUES ('31677', '排浦镇', '3', '31662', 'P');
INSERT INTO `ey_region` VALUES ('31678', '东成镇', '3', '31662', 'D');
INSERT INTO `ey_region` VALUES ('31679', '新州镇', '3', '31662', 'X');
INSERT INTO `ey_region` VALUES ('31680', '国营西培农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31681', '国营西华农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31682', '国营西庆农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31683', '国营西流农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31684', '国营西联农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31685', '国营蓝洋农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31686', '国营新盈农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31687', '国营八一农场东山分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31688', '国营八一农场金川分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31689', '国营八一农场长岭分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31690', '国营八一农场英岛分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31691', '国营八一农场春江分场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31692', '国营八一农场强打管区', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31693', '国营龙山农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31694', '国营红岭农场', '3', '31662', 'G');
INSERT INTO `ey_region` VALUES ('31695', '洋浦经济开发区', '3', '31662', 'Y');
INSERT INTO `ey_region` VALUES ('31696', '华南热作学院', '3', '31662', 'H');
INSERT INTO `ey_region` VALUES ('31697', '文昌市', '2', '31563', 'W');
INSERT INTO `ey_region` VALUES ('31698', '文城镇', '3', '31697', 'W');
INSERT INTO `ey_region` VALUES ('31699', '重兴镇', '3', '31697', 'Z');
INSERT INTO `ey_region` VALUES ('31700', '蓬莱镇', '3', '31697', 'P');
INSERT INTO `ey_region` VALUES ('31701', '会文镇', '3', '31697', 'H');
INSERT INTO `ey_region` VALUES ('31702', '东路镇', '3', '31697', 'D');
INSERT INTO `ey_region` VALUES ('31703', '潭牛镇', '3', '31697', 'T');
INSERT INTO `ey_region` VALUES ('31704', '东阁镇', '3', '31697', 'D');
INSERT INTO `ey_region` VALUES ('31705', '文教镇', '3', '31697', 'W');
INSERT INTO `ey_region` VALUES ('31706', '东郊镇', '3', '31697', 'D');
INSERT INTO `ey_region` VALUES ('31707', '龙楼镇', '3', '31697', 'L');
INSERT INTO `ey_region` VALUES ('31708', '昌洒镇', '3', '31697', 'C');
INSERT INTO `ey_region` VALUES ('31709', '翁田镇', '3', '31697', 'W');
INSERT INTO `ey_region` VALUES ('31710', '抱罗镇', '3', '31697', 'B');
INSERT INTO `ey_region` VALUES ('31711', '冯坡镇', '3', '31697', 'F');
INSERT INTO `ey_region` VALUES ('31712', '锦山镇', '3', '31697', 'J');
INSERT INTO `ey_region` VALUES ('31713', '铺前镇', '3', '31697', 'P');
INSERT INTO `ey_region` VALUES ('31714', '国营东路农场', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31715', '国营南阳农场', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31716', '国营罗豆农场', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31717', '国营文昌橡胶研究所', '3', '31697', 'G');
INSERT INTO `ey_region` VALUES ('31718', '万宁市', '2', '31563', 'W');
INSERT INTO `ey_region` VALUES ('31719', '万城镇', '3', '31718', 'W');
INSERT INTO `ey_region` VALUES ('31720', '龙滚镇', '3', '31718', 'L');
INSERT INTO `ey_region` VALUES ('31721', '和乐镇', '3', '31718', 'H');
INSERT INTO `ey_region` VALUES ('31722', '后安镇', '3', '31718', 'H');
INSERT INTO `ey_region` VALUES ('31723', '大茂镇', '3', '31718', 'D');
INSERT INTO `ey_region` VALUES ('31724', '东澳镇', '3', '31718', 'D');
INSERT INTO `ey_region` VALUES ('31725', '礼纪镇', '3', '31718', 'L');
INSERT INTO `ey_region` VALUES ('31726', '长丰镇', '3', '31718', 'C');
INSERT INTO `ey_region` VALUES ('31727', '山根镇', '3', '31718', 'S');
INSERT INTO `ey_region` VALUES ('31728', '北大镇', '3', '31718', 'B');
INSERT INTO `ey_region` VALUES ('31729', '南桥镇', '3', '31718', 'N');
INSERT INTO `ey_region` VALUES ('31730', '三更罗镇', '3', '31718', 'S');
INSERT INTO `ey_region` VALUES ('31731', '国营东兴农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31732', '国营东和农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31733', '国营东岭农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31734', '国营南林农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31735', '国营新中农场', '3', '31718', 'G');
INSERT INTO `ey_region` VALUES ('31736', '兴隆华侨农场', '3', '31718', 'X');
INSERT INTO `ey_region` VALUES ('31737', '地方国营六连林场', '3', '31718', 'D');
INSERT INTO `ey_region` VALUES ('31738', '东方市', '2', '31563', 'D');
INSERT INTO `ey_region` VALUES ('31739', '八所镇', '3', '31738', 'B');
INSERT INTO `ey_region` VALUES ('31740', '东河镇', '3', '31738', 'D');
INSERT INTO `ey_region` VALUES ('31741', '大田镇', '3', '31738', 'D');
INSERT INTO `ey_region` VALUES ('31742', '感城镇', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31743', '板桥镇', '3', '31738', 'B');
INSERT INTO `ey_region` VALUES ('31744', '三家镇', '3', '31738', 'S');
INSERT INTO `ey_region` VALUES ('31745', '四更镇', '3', '31738', 'S');
INSERT INTO `ey_region` VALUES ('31746', '新龙镇', '3', '31738', 'X');
INSERT INTO `ey_region` VALUES ('31747', '天安乡', '3', '31738', 'T');
INSERT INTO `ey_region` VALUES ('31748', '江边乡', '3', '31738', 'J');
INSERT INTO `ey_region` VALUES ('31749', '国营广坝农场', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31750', '国营公爱农场', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31751', '国营红泉农场', '3', '31738', 'G');
INSERT INTO `ey_region` VALUES ('31752', '省国营东方华侨农场', '3', '31738', 'S');
INSERT INTO `ey_region` VALUES ('31753', '定安县', '2', '31563', 'D');
INSERT INTO `ey_region` VALUES ('31754', '定城镇', '3', '31753', 'D');
INSERT INTO `ey_region` VALUES ('31755', '新竹镇', '3', '31753', 'X');
INSERT INTO `ey_region` VALUES ('31756', '龙湖镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31757', '黄竹镇', '3', '31753', 'H');
INSERT INTO `ey_region` VALUES ('31758', '雷鸣镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31759', '龙门镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31760', '龙河镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31761', '岭口镇', '3', '31753', 'L');
INSERT INTO `ey_region` VALUES ('31762', '翰林镇', '3', '31753', 'H');
INSERT INTO `ey_region` VALUES ('31763', '富文镇', '3', '31753', 'F');
INSERT INTO `ey_region` VALUES ('31764', '国营中瑞农场', '3', '31753', 'G');
INSERT INTO `ey_region` VALUES ('31765', '国营南海农场', '3', '31753', 'G');
INSERT INTO `ey_region` VALUES ('31766', '国营金鸡岭农场', '3', '31753', 'G');
INSERT INTO `ey_region` VALUES ('31767', '定安热作研究所', '3', '31753', 'D');
INSERT INTO `ey_region` VALUES ('31768', '屯昌县', '2', '31563', 'T');
INSERT INTO `ey_region` VALUES ('31769', '屯城镇', '3', '31768', 'T');
INSERT INTO `ey_region` VALUES ('31770', '新兴镇', '3', '31768', 'X');
INSERT INTO `ey_region` VALUES ('31771', '枫木镇', '3', '31768', 'F');
INSERT INTO `ey_region` VALUES ('31772', '乌坡镇', '3', '31768', 'W');
INSERT INTO `ey_region` VALUES ('31773', '南吕镇', '3', '31768', 'N');
INSERT INTO `ey_region` VALUES ('31774', '南坤镇', '3', '31768', 'N');
INSERT INTO `ey_region` VALUES ('31775', '坡心镇', '3', '31768', 'P');
INSERT INTO `ey_region` VALUES ('31776', '西昌镇', '3', '31768', 'X');
INSERT INTO `ey_region` VALUES ('31777', '国营中建农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31778', '国营中坤农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31779', '国营黄岭农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31780', '国营南吕农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31781', '国营广青农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31782', '国营晨星农场', '3', '31768', 'G');
INSERT INTO `ey_region` VALUES ('31783', '澄迈县', '2', '31563', 'C');
INSERT INTO `ey_region` VALUES ('31784', '金江镇', '3', '31783', 'J');
INSERT INTO `ey_region` VALUES ('31785', '老城镇', '3', '31783', 'L');
INSERT INTO `ey_region` VALUES ('31786', '瑞溪镇', '3', '31783', 'R');
INSERT INTO `ey_region` VALUES ('31787', '永发镇', '3', '31783', 'Y');
INSERT INTO `ey_region` VALUES ('31788', '加乐镇', '3', '31783', 'J');
INSERT INTO `ey_region` VALUES ('31789', '文儒镇', '3', '31783', 'W');
INSERT INTO `ey_region` VALUES ('31790', '中兴镇', '3', '31783', 'Z');
INSERT INTO `ey_region` VALUES ('31791', '仁兴镇', '3', '31783', 'R');
INSERT INTO `ey_region` VALUES ('31792', '福山镇', '3', '31783', 'F');
INSERT INTO `ey_region` VALUES ('31793', '桥头镇', '3', '31783', 'Q');
INSERT INTO `ey_region` VALUES ('31794', '国营红光农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31795', '国营红岗农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31796', '国营西达农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31797', '国营昆仑农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31798', '国营和岭农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31799', '国营金安农场', '3', '31783', 'G');
INSERT INTO `ey_region` VALUES ('31800', '澄迈县华侨农场', '3', '31783', 'C');
INSERT INTO `ey_region` VALUES ('31801', '临高县', '2', '31563', 'L');
INSERT INTO `ey_region` VALUES ('31802', '临城镇', '3', '31801', 'L');
INSERT INTO `ey_region` VALUES ('31803', '波莲镇', '3', '31801', 'B');
INSERT INTO `ey_region` VALUES ('31804', '东英镇', '3', '31801', 'D');
INSERT INTO `ey_region` VALUES ('31805', '博厚镇', '3', '31801', 'B');
INSERT INTO `ey_region` VALUES ('31806', '皇桐镇', '3', '31801', 'H');
INSERT INTO `ey_region` VALUES ('31807', '多文镇', '3', '31801', 'D');
INSERT INTO `ey_region` VALUES ('31808', '和舍镇', '3', '31801', 'H');
INSERT INTO `ey_region` VALUES ('31809', '南宝镇', '3', '31801', 'N');
INSERT INTO `ey_region` VALUES ('31810', '新盈镇', '3', '31801', 'X');
INSERT INTO `ey_region` VALUES ('31811', '调楼镇', '3', '31801', 'D');
INSERT INTO `ey_region` VALUES ('31812', '国营红华农场', '3', '31801', 'G');
INSERT INTO `ey_region` VALUES ('31813', '国营加来农场', '3', '31801', 'G');
INSERT INTO `ey_region` VALUES ('31814', '白沙县', '2', '31563', 'B');
INSERT INTO `ey_region` VALUES ('31815', '牙叉镇', '3', '31814', 'Y');
INSERT INTO `ey_region` VALUES ('31816', '七坊镇', '3', '31814', 'Q');
INSERT INTO `ey_region` VALUES ('31817', '邦溪镇', '3', '31814', 'B');
INSERT INTO `ey_region` VALUES ('31818', '打安镇', '3', '31814', 'D');
INSERT INTO `ey_region` VALUES ('31819', '细水乡', '3', '31814', 'X');
INSERT INTO `ey_region` VALUES ('31820', '元门乡', '3', '31814', 'Y');
INSERT INTO `ey_region` VALUES ('31821', '南开乡', '3', '31814', 'N');
INSERT INTO `ey_region` VALUES ('31822', '阜龙乡', '3', '31814', 'F');
INSERT INTO `ey_region` VALUES ('31823', '青松乡', '3', '31814', 'Q');
INSERT INTO `ey_region` VALUES ('31824', '金波乡', '3', '31814', 'J');
INSERT INTO `ey_region` VALUES ('31825', '荣邦乡', '3', '31814', 'R');
INSERT INTO `ey_region` VALUES ('31826', '国营金波农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31827', '国营白沙农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31828', '国营牙叉农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31829', '国营卫星农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31830', '国营龙江农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31831', '国营珠碧江农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31832', '国营芙蓉田农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31833', '国营大岭农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31834', '国营邦溪农场', '3', '31814', 'G');
INSERT INTO `ey_region` VALUES ('31835', '昌江县', '2', '31563', 'C');
INSERT INTO `ey_region` VALUES ('31836', '石碌镇', '3', '31835', 'S');
INSERT INTO `ey_region` VALUES ('31837', '叉河镇', '3', '31835', 'C');
INSERT INTO `ey_region` VALUES ('31838', '十月田镇', '3', '31835', 'S');
INSERT INTO `ey_region` VALUES ('31839', '乌烈镇', '3', '31835', 'W');
INSERT INTO `ey_region` VALUES ('31840', '昌化镇', '3', '31835', 'C');
INSERT INTO `ey_region` VALUES ('31841', '海尾镇', '3', '31835', 'H');
INSERT INTO `ey_region` VALUES ('31842', '七叉镇', '3', '31835', 'Q');
INSERT INTO `ey_region` VALUES ('31843', '王下乡', '3', '31835', 'W');
INSERT INTO `ey_region` VALUES ('31844', '国营红田农场', '3', '31835', 'G');
INSERT INTO `ey_region` VALUES ('31845', '国营红林农场', '3', '31835', 'G');
INSERT INTO `ey_region` VALUES ('31846', '国营坝王岭林场', '3', '31835', 'G');
INSERT INTO `ey_region` VALUES ('31847', '海南钢铁公司', '3', '31835', 'H');
INSERT INTO `ey_region` VALUES ('31848', '乐东县', '2', '31563', 'L');
INSERT INTO `ey_region` VALUES ('31849', '抱由镇', '3', '31848', 'B');
INSERT INTO `ey_region` VALUES ('31850', '万冲镇', '3', '31848', 'W');
INSERT INTO `ey_region` VALUES ('31851', '大安镇', '3', '31848', 'D');
INSERT INTO `ey_region` VALUES ('31852', '志仲镇', '3', '31848', 'Z');
INSERT INTO `ey_region` VALUES ('31853', '千家镇', '3', '31848', 'Q');
INSERT INTO `ey_region` VALUES ('31854', '九所镇', '3', '31848', 'J');
INSERT INTO `ey_region` VALUES ('31855', '利国镇', '3', '31848', 'L');
INSERT INTO `ey_region` VALUES ('31856', '黄流镇', '3', '31848', 'H');
INSERT INTO `ey_region` VALUES ('31857', '佛罗镇', '3', '31848', 'F');
INSERT INTO `ey_region` VALUES ('31858', '尖峰镇', '3', '31848', 'J');
INSERT INTO `ey_region` VALUES ('31859', '莺歌海镇', '3', '31848', 'Y');
INSERT INTO `ey_region` VALUES ('31860', '国营乐中农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31861', '国营山荣农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31862', '国营乐光农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31863', '国营报伦农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31864', '国营福报农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31865', '国营保国农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31866', '国营保显农场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31867', '国营尖峰岭林业公司', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31868', '国营莺歌海盐场', '3', '31848', 'G');
INSERT INTO `ey_region` VALUES ('31869', '陵水县', '2', '31563', 'L');
INSERT INTO `ey_region` VALUES ('31870', '椰林镇', '3', '31869', 'Y');
INSERT INTO `ey_region` VALUES ('31871', '光坡镇', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31872', '三才镇', '3', '31869', 'S');
INSERT INTO `ey_region` VALUES ('31873', '英州镇', '3', '31869', 'Y');
INSERT INTO `ey_region` VALUES ('31874', '隆广镇', '3', '31869', 'L');
INSERT INTO `ey_region` VALUES ('31875', '文罗镇', '3', '31869', 'W');
INSERT INTO `ey_region` VALUES ('31876', '本号镇', '3', '31869', 'B');
INSERT INTO `ey_region` VALUES ('31877', '新村镇', '3', '31869', 'X');
INSERT INTO `ey_region` VALUES ('31878', '黎安镇', '3', '31869', 'L');
INSERT INTO `ey_region` VALUES ('31879', '提蒙乡', '3', '31869', 'T');
INSERT INTO `ey_region` VALUES ('31880', '群英乡', '3', '31869', 'Q');
INSERT INTO `ey_region` VALUES ('31881', '国营岭门农场', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31882', '国营南平农场', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31883', '国营吊罗山林业公司', '3', '31869', 'G');
INSERT INTO `ey_region` VALUES ('31884', '保亭县', '2', '31563', 'B');
INSERT INTO `ey_region` VALUES ('31885', '保城镇', '3', '31884', 'B');
INSERT INTO `ey_region` VALUES ('31886', '什玲镇', '3', '31884', 'S');
INSERT INTO `ey_region` VALUES ('31887', '加茂镇', '3', '31884', 'J');
INSERT INTO `ey_region` VALUES ('31888', '响水镇', '3', '31884', 'X');
INSERT INTO `ey_region` VALUES ('31889', '新政镇', '3', '31884', 'X');
INSERT INTO `ey_region` VALUES ('31890', '三道镇', '3', '31884', 'S');
INSERT INTO `ey_region` VALUES ('31891', '六弓乡', '3', '31884', 'L');
INSERT INTO `ey_region` VALUES ('31892', '南林乡', '3', '31884', 'N');
INSERT INTO `ey_region` VALUES ('31893', '毛感乡', '3', '31884', 'M');
INSERT INTO `ey_region` VALUES ('31894', '国营五指山茶场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31895', '国营新星农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31896', '国营保亭热作所', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31897', '国营金江农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31898', '国营南茂农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31899', '国营三道农场', '3', '31884', 'G');
INSERT INTO `ey_region` VALUES ('31900', '琼中县', '2', '31563', 'Q');
INSERT INTO `ey_region` VALUES ('31901', '营根镇', '3', '31900', 'Y');
INSERT INTO `ey_region` VALUES ('31902', '湾岭镇', '3', '31900', 'W');
INSERT INTO `ey_region` VALUES ('31903', '黎母山镇', '3', '31900', 'L');
INSERT INTO `ey_region` VALUES ('31904', '和平镇', '3', '31900', 'H');
INSERT INTO `ey_region` VALUES ('31905', '长征镇', '3', '31900', 'C');
INSERT INTO `ey_region` VALUES ('31906', '红毛镇', '3', '31900', 'H');
INSERT INTO `ey_region` VALUES ('31907', '中平镇', '3', '31900', 'Z');
INSERT INTO `ey_region` VALUES ('31908', '吊罗山乡', '3', '31900', 'D');
INSERT INTO `ey_region` VALUES ('31909', '上安乡', '3', '31900', 'S');
INSERT INTO `ey_region` VALUES ('31910', '什运乡', '3', '31900', 'S');
INSERT INTO `ey_region` VALUES ('31911', '国营新进农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31912', '国营大丰农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31913', '国营阳江农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31914', '国营乌石农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31915', '国营南方农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31916', '国营岭头农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31917', '国营加钗农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31918', '国营长征农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31919', '国营乘坡农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31920', '国营太平农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31921', '国营新伟农场', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31922', '国营黎母山林业公司', '3', '31900', 'G');
INSERT INTO `ey_region` VALUES ('31923', '西沙群岛', '3', '31924', 'X');
INSERT INTO `ey_region` VALUES ('31924', '三沙市', '2', '31563', 'S');
INSERT INTO `ey_region` VALUES ('31925', '南沙群岛', '3', '31924', 'N');
INSERT INTO `ey_region` VALUES ('47499', '香港岛', '2', '47494', 'X');
INSERT INTO `ey_region` VALUES ('31927', '中沙群岛的岛礁及其海域', '3', '31924', 'Z');
INSERT INTO `ey_region` VALUES ('47498', '九龙', '2', '47494', 'J');
INSERT INTO `ey_region` VALUES ('31929', '重庆市', '1', '0', 'Z');
INSERT INTO `ey_region` VALUES ('31930', '重庆市', '2', '31929', 'C');
INSERT INTO `ey_region` VALUES ('31931', '万州区', '3', '31930', 'W');
INSERT INTO `ey_region` VALUES ('31984', '涪陵区', '3', '31930', 'F');
INSERT INTO `ey_region` VALUES ('32031', '渝中区', '3', '31930', 'Y');
INSERT INTO `ey_region` VALUES ('32044', '大渡口区', '3', '31930', 'D');
INSERT INTO `ey_region` VALUES ('32053', '江北区', '3', '31930', 'J');
INSERT INTO `ey_region` VALUES ('32066', '沙坪坝区', '3', '31930', 'S');
INSERT INTO `ey_region` VALUES ('32093', '九龙坡区', '3', '31930', 'J');
INSERT INTO `ey_region` VALUES ('32112', '南岸区', '3', '31930', 'N');
INSERT INTO `ey_region` VALUES ('32127', '北碚区', '3', '31930', 'B');
INSERT INTO `ey_region` VALUES ('32145', '万盛区', '3', '31930', 'W');
INSERT INTO `ey_region` VALUES ('32156', '双桥区', '3', '31930', 'S');
INSERT INTO `ey_region` VALUES ('32160', '渝北区', '3', '31930', 'Y');
INSERT INTO `ey_region` VALUES ('32191', '巴南区', '3', '31930', 'B');
INSERT INTO `ey_region` VALUES ('32213', '黔江区', '3', '31930', 'Q');
INSERT INTO `ey_region` VALUES ('32244', '长寿区', '3', '31930', 'C');
INSERT INTO `ey_region` VALUES ('32263', '江津区', '3', '31930', 'J');
INSERT INTO `ey_region` VALUES ('32291', '合川区', '3', '31930', 'H');
INSERT INTO `ey_region` VALUES ('32322', '永川区', '3', '31930', 'Y');
INSERT INTO `ey_region` VALUES ('32345', '南川区', '3', '31930', 'N');
INSERT INTO `ey_region` VALUES ('32380', '县', '2', '31929', 'X');
INSERT INTO `ey_region` VALUES ('32381', '綦江县', '3', '32380', 'Q');
INSERT INTO `ey_region` VALUES ('32401', '潼南县', '3', '32380', 'T');
INSERT INTO `ey_region` VALUES ('32424', '铜梁县', '3', '32380', 'T');
INSERT INTO `ey_region` VALUES ('32453', '大足县', '3', '32380', 'D');
INSERT INTO `ey_region` VALUES ('32478', '荣昌县', '3', '32380', 'R');
INSERT INTO `ey_region` VALUES ('32499', '璧山县', '3', '32380', 'B');
INSERT INTO `ey_region` VALUES ('32513', '梁平县', '3', '32380', 'L');
INSERT INTO `ey_region` VALUES ('32549', '城口县', '3', '32380', 'C');
INSERT INTO `ey_region` VALUES ('32574', '丰都县', '3', '32380', 'F');
INSERT INTO `ey_region` VALUES ('32606', '垫江县', '3', '32380', 'D');
INSERT INTO `ey_region` VALUES ('32632', '武隆县', '3', '32380', 'W');
INSERT INTO `ey_region` VALUES ('32659', '忠县', '3', '32380', 'Z');
INSERT INTO `ey_region` VALUES ('32688', '开县', '3', '32380', 'K');
INSERT INTO `ey_region` VALUES ('32727', '云阳县', '3', '32380', 'Y');
INSERT INTO `ey_region` VALUES ('32771', '奉节县', '3', '32380', 'F');
INSERT INTO `ey_region` VALUES ('32802', '巫山县', '3', '32380', 'W');
INSERT INTO `ey_region` VALUES ('32829', '巫溪县', '3', '32380', 'W');
INSERT INTO `ey_region` VALUES ('32861', '石柱县', '3', '32380', 'S');
INSERT INTO `ey_region` VALUES ('32894', '秀山县', '3', '32380', 'X');
INSERT INTO `ey_region` VALUES ('32927', '酉阳县', '3', '32380', 'Y');
INSERT INTO `ey_region` VALUES ('32967', '彭水县', '3', '32380', 'P');
INSERT INTO `ey_region` VALUES ('33007', '四川省', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('33008', '成都市', '2', '33007', 'C');
INSERT INTO `ey_region` VALUES ('33009', '市辖区', '3', '33008', 'S');
INSERT INTO `ey_region` VALUES ('33010', '锦江区', '3', '33008', 'J');
INSERT INTO `ey_region` VALUES ('33027', '青羊区', '3', '33008', 'Q');
INSERT INTO `ey_region` VALUES ('33042', '金牛区', '3', '33008', 'J');
INSERT INTO `ey_region` VALUES ('33058', '武侯区', '3', '33008', 'W');
INSERT INTO `ey_region` VALUES ('33076', '成华区', '3', '33008', 'C');
INSERT INTO `ey_region` VALUES ('33091', '龙泉驿区', '3', '33008', 'L');
INSERT INTO `ey_region` VALUES ('33104', '青白江区', '3', '33008', 'Q');
INSERT INTO `ey_region` VALUES ('33116', '新都区', '3', '33008', 'X');
INSERT INTO `ey_region` VALUES ('33130', '温江区', '3', '33008', 'W');
INSERT INTO `ey_region` VALUES ('33141', '金堂县', '3', '33008', 'J');
INSERT INTO `ey_region` VALUES ('33163', '双流县', '3', '33008', 'S');
INSERT INTO `ey_region` VALUES ('33189', '郫县', '3', '33008', 'P');
INSERT INTO `ey_region` VALUES ('33205', '大邑县', '3', '33008', 'D');
INSERT INTO `ey_region` VALUES ('33226', '蒲江县', '3', '33008', 'P');
INSERT INTO `ey_region` VALUES ('33239', '新津县', '3', '33008', 'X');
INSERT INTO `ey_region` VALUES ('33252', '都江堰市', '3', '33008', 'D');
INSERT INTO `ey_region` VALUES ('33272', '彭州市', '3', '33008', 'P');
INSERT INTO `ey_region` VALUES ('33293', '邛崃市', '3', '33008', 'Q');
INSERT INTO `ey_region` VALUES ('33318', '崇州市', '3', '33008', 'C');
INSERT INTO `ey_region` VALUES ('33344', '自贡市', '2', '33007', 'Z');
INSERT INTO `ey_region` VALUES ('33345', '市辖区', '3', '33344', 'S');
INSERT INTO `ey_region` VALUES ('33346', '自流井区', '3', '33344', 'Z');
INSERT INTO `ey_region` VALUES ('33360', '贡井区', '3', '33344', 'G');
INSERT INTO `ey_region` VALUES ('33374', '大安区', '3', '33344', 'D');
INSERT INTO `ey_region` VALUES ('33391', '沿滩区', '3', '33344', 'Y');
INSERT INTO `ey_region` VALUES ('33405', '荣县', '3', '33344', 'R');
INSERT INTO `ey_region` VALUES ('33433', '富顺县', '3', '33344', 'F');
INSERT INTO `ey_region` VALUES ('33460', '攀枝花市', '2', '33007', 'P');
INSERT INTO `ey_region` VALUES ('33461', '市辖区', '3', '33460', 'S');
INSERT INTO `ey_region` VALUES ('33462', '攀枝花东区', '3', '33460', 'P');
INSERT INTO `ey_region` VALUES ('33473', '西区', '3', '33460', 'X');
INSERT INTO `ey_region` VALUES ('33481', '仁和区', '3', '33460', 'R');
INSERT INTO `ey_region` VALUES ('33497', '米易县', '3', '33460', 'M');
INSERT INTO `ey_region` VALUES ('33511', '盐边县', '3', '33460', 'Y');
INSERT INTO `ey_region` VALUES ('33528', '泸州市', '2', '33007', 'L');
INSERT INTO `ey_region` VALUES ('33529', '市辖区', '3', '33528', 'S');
INSERT INTO `ey_region` VALUES ('33530', '江阳区', '3', '33528', 'J');
INSERT INTO `ey_region` VALUES ('33548', '纳溪区', '3', '33528', 'N');
INSERT INTO `ey_region` VALUES ('33563', '龙马潭区', '3', '33528', 'L');
INSERT INTO `ey_region` VALUES ('33577', '泸县', '3', '33528', 'L');
INSERT INTO `ey_region` VALUES ('33597', '合江县', '3', '33528', 'H');
INSERT INTO `ey_region` VALUES ('33625', '叙永县', '3', '33528', 'X');
INSERT INTO `ey_region` VALUES ('33654', '古蔺县', '3', '33528', 'G');
INSERT INTO `ey_region` VALUES ('33681', '德阳市', '2', '33007', 'D');
INSERT INTO `ey_region` VALUES ('33682', '市辖区', '3', '33681', 'S');
INSERT INTO `ey_region` VALUES ('33683', '旌阳区', '3', '33681', 'J');
INSERT INTO `ey_region` VALUES ('33701', '中江县', '3', '33681', 'Z');
INSERT INTO `ey_region` VALUES ('33747', '罗江县', '3', '33681', 'L');
INSERT INTO `ey_region` VALUES ('33758', '广汉市', '3', '33681', 'G');
INSERT INTO `ey_region` VALUES ('33778', '什邡市', '3', '33681', 'S');
INSERT INTO `ey_region` VALUES ('33795', '绵竹市', '3', '33681', 'M');
INSERT INTO `ey_region` VALUES ('33817', '绵阳市', '2', '33007', 'M');
INSERT INTO `ey_region` VALUES ('33818', '市辖区', '3', '33817', 'S');
INSERT INTO `ey_region` VALUES ('33819', '涪城区', '3', '33817', 'F');
INSERT INTO `ey_region` VALUES ('33844', '游仙区', '3', '33817', 'Y');
INSERT INTO `ey_region` VALUES ('33873', '三台县', '3', '33817', 'S');
INSERT INTO `ey_region` VALUES ('33937', '盐亭县', '3', '33817', 'Y');
INSERT INTO `ey_region` VALUES ('33974', '安县', '3', '33817', 'A');
INSERT INTO `ey_region` VALUES ('33995', '梓潼县', '3', '33817', 'Z');
INSERT INTO `ey_region` VALUES ('34028', '北川县', '3', '33817', 'B');
INSERT INTO `ey_region` VALUES ('34049', '平武县', '3', '33817', 'P');
INSERT INTO `ey_region` VALUES ('34075', '江油市', '3', '33817', 'J');
INSERT INTO `ey_region` VALUES ('34120', '广元市', '2', '33007', 'G');
INSERT INTO `ey_region` VALUES ('34121', '市辖区', '3', '34120', 'S');
INSERT INTO `ey_region` VALUES ('34122', '市中区', '3', '34120', 'S');
INSERT INTO `ey_region` VALUES ('34143', '元坝区', '3', '34120', 'Y');
INSERT INTO `ey_region` VALUES ('34173', '朝天区', '3', '34120', 'C');
INSERT INTO `ey_region` VALUES ('34199', '旺苍县', '3', '34120', 'W');
INSERT INTO `ey_region` VALUES ('34238', '青川县', '3', '34120', 'Q');
INSERT INTO `ey_region` VALUES ('34276', '剑阁县', '3', '34120', 'J');
INSERT INTO `ey_region` VALUES ('34334', '苍溪县', '3', '34120', 'C');
INSERT INTO `ey_region` VALUES ('34376', '遂宁市', '2', '33007', 'S');
INSERT INTO `ey_region` VALUES ('34377', '市辖区', '3', '34376', 'S');
INSERT INTO `ey_region` VALUES ('34378', '船山区', '3', '34376', 'C');
INSERT INTO `ey_region` VALUES ('34404', '安居区', '3', '34376', 'A');
INSERT INTO `ey_region` VALUES ('34426', '蓬溪县', '3', '34376', 'P');
INSERT INTO `ey_region` VALUES ('34458', '射洪县', '3', '34376', 'S');
INSERT INTO `ey_region` VALUES ('34489', '大英县', '3', '34376', 'D');
INSERT INTO `ey_region` VALUES ('34501', '内江市', '2', '33007', 'N');
INSERT INTO `ey_region` VALUES ('34502', '市辖区', '3', '34501', 'S');
INSERT INTO `ey_region` VALUES ('34503', '市中区', '3', '34501', 'S');
INSERT INTO `ey_region` VALUES ('34524', '东兴区', '3', '34501', 'D');
INSERT INTO `ey_region` VALUES ('34554', '威远县', '3', '34501', 'W');
INSERT INTO `ey_region` VALUES ('34575', '资中县', '3', '34501', 'Z');
INSERT INTO `ey_region` VALUES ('34609', '隆昌县', '3', '34501', 'L');
INSERT INTO `ey_region` VALUES ('34628', '乐山市', '2', '33007', 'L');
INSERT INTO `ey_region` VALUES ('34629', '市辖区', '3', '34628', 'S');
INSERT INTO `ey_region` VALUES ('34630', '市中区', '3', '34628', 'S');
INSERT INTO `ey_region` VALUES ('34661', '沙湾区', '3', '34628', 'S');
INSERT INTO `ey_region` VALUES ('34676', '五通桥区', '3', '34628', 'W');
INSERT INTO `ey_region` VALUES ('34689', '金口河区', '3', '34628', 'J');
INSERT INTO `ey_region` VALUES ('34696', '犍为县', '3', '34628', 'Q');
INSERT INTO `ey_region` VALUES ('34727', '井研县', '3', '34628', 'J');
INSERT INTO `ey_region` VALUES ('34755', '夹江县', '3', '34628', 'J');
INSERT INTO `ey_region` VALUES ('34778', '沐川县', '3', '34628', 'M');
INSERT INTO `ey_region` VALUES ('34799', '峨边县', '3', '34628', 'E');
INSERT INTO `ey_region` VALUES ('34819', '马边县', '3', '34628', 'M');
INSERT INTO `ey_region` VALUES ('34840', '峨眉山市', '3', '34628', 'E');
INSERT INTO `ey_region` VALUES ('34859', '南充市', '2', '33007', 'N');
INSERT INTO `ey_region` VALUES ('34860', '市辖区', '3', '34859', 'S');
INSERT INTO `ey_region` VALUES ('34861', '顺庆区', '3', '34859', 'S');
INSERT INTO `ey_region` VALUES ('34890', '高坪区', '3', '34859', 'G');
INSERT INTO `ey_region` VALUES ('34923', '嘉陵区', '3', '34859', 'J');
INSERT INTO `ey_region` VALUES ('34967', '南部县', '3', '34859', 'N');
INSERT INTO `ey_region` VALUES ('35040', '营山县', '3', '34859', 'Y');
INSERT INTO `ey_region` VALUES ('35094', '蓬安县', '3', '34859', 'P');
INSERT INTO `ey_region` VALUES ('35134', '仪陇县', '3', '34859', 'Y');
INSERT INTO `ey_region` VALUES ('35193', '西充县', '3', '34859', 'X');
INSERT INTO `ey_region` VALUES ('35238', '阆中市', '3', '34859', 'L');
INSERT INTO `ey_region` VALUES ('35288', '眉山市', '2', '33007', 'M');
INSERT INTO `ey_region` VALUES ('35289', '市辖区', '3', '35288', 'S');
INSERT INTO `ey_region` VALUES ('35290', '东坡区', '3', '35288', 'D');
INSERT INTO `ey_region` VALUES ('35317', '仁寿县', '3', '35288', 'R');
INSERT INTO `ey_region` VALUES ('35378', '彭山县', '3', '35288', 'P');
INSERT INTO `ey_region` VALUES ('35392', '洪雅县', '3', '35288', 'H');
INSERT INTO `ey_region` VALUES ('35408', '丹棱县', '3', '35288', 'D');
INSERT INTO `ey_region` VALUES ('35416', '青神县', '3', '35288', 'Q');
INSERT INTO `ey_region` VALUES ('35427', '宜宾市', '2', '33007', 'Y');
INSERT INTO `ey_region` VALUES ('35428', '市辖区', '3', '35427', 'S');
INSERT INTO `ey_region` VALUES ('35429', '翠屏区', '3', '35427', 'C');
INSERT INTO `ey_region` VALUES ('35454', '宜宾县', '3', '35427', 'Y');
INSERT INTO `ey_region` VALUES ('35481', '南溪县', '3', '35427', 'N');
INSERT INTO `ey_region` VALUES ('35497', '江安县', '3', '35427', 'J');
INSERT INTO `ey_region` VALUES ('35516', '长宁县', '3', '35427', 'C');
INSERT INTO `ey_region` VALUES ('35535', '高县', '3', '35427', 'G');
INSERT INTO `ey_region` VALUES ('35555', '珙县', '3', '35427', 'G');
INSERT INTO `ey_region` VALUES ('35573', '筠连县', '3', '35427', 'J');
INSERT INTO `ey_region` VALUES ('35592', '兴文县', '3', '35427', 'X');
INSERT INTO `ey_region` VALUES ('35608', '屏山县', '3', '35427', 'P');
INSERT INTO `ey_region` VALUES ('35625', '广安市', '2', '33007', 'G');
INSERT INTO `ey_region` VALUES ('35626', '市辖区', '3', '35625', 'S');
INSERT INTO `ey_region` VALUES ('35627', '广安区', '3', '35625', 'G');
INSERT INTO `ey_region` VALUES ('35677', '岳池县', '3', '35625', 'Y');
INSERT INTO `ey_region` VALUES ('35721', '武胜县', '3', '35625', 'W');
INSERT INTO `ey_region` VALUES ('35753', '邻水县', '3', '35625', 'L');
INSERT INTO `ey_region` VALUES ('35799', '华蓥市', '3', '35625', 'H');
INSERT INTO `ey_region` VALUES ('35813', '达州市', '2', '33007', 'D');
INSERT INTO `ey_region` VALUES ('35814', '市辖区', '3', '35813', 'S');
INSERT INTO `ey_region` VALUES ('35815', '通川区', '3', '35813', 'T');
INSERT INTO `ey_region` VALUES ('35829', '达县', '3', '35813', 'D');
INSERT INTO `ey_region` VALUES ('35894', '宣汉县', '3', '35813', 'X');
INSERT INTO `ey_region` VALUES ('35949', '开江县', '3', '35813', 'K');
INSERT INTO `ey_region` VALUES ('35970', '大竹县', '3', '35813', 'D');
INSERT INTO `ey_region` VALUES ('36021', '渠县', '3', '35813', 'Q');
INSERT INTO `ey_region` VALUES ('36082', '万源市', '3', '35813', 'W');
INSERT INTO `ey_region` VALUES ('36136', '雅安市', '2', '33007', 'Y');
INSERT INTO `ey_region` VALUES ('36137', '市辖区', '3', '36136', 'S');
INSERT INTO `ey_region` VALUES ('36138', '雨城区', '3', '36136', 'Y');
INSERT INTO `ey_region` VALUES ('36161', '名山县', '3', '36136', 'M');
INSERT INTO `ey_region` VALUES ('36182', '荥经县', '3', '36136', 'Y');
INSERT INTO `ey_region` VALUES ('36204', '汉源县', '3', '36136', 'H');
INSERT INTO `ey_region` VALUES ('36245', '石棉县', '3', '36136', 'S');
INSERT INTO `ey_region` VALUES ('36263', '天全县', '3', '36136', 'T');
INSERT INTO `ey_region` VALUES ('36279', '芦山县', '3', '36136', 'L');
INSERT INTO `ey_region` VALUES ('36289', '宝兴县', '3', '36136', 'B');
INSERT INTO `ey_region` VALUES ('36299', '巴中市', '2', '33007', 'B');
INSERT INTO `ey_region` VALUES ('36300', '市辖区', '3', '36299', 'S');
INSERT INTO `ey_region` VALUES ('36301', '巴州区', '3', '36299', 'B');
INSERT INTO `ey_region` VALUES ('36354', '通江县', '3', '36299', 'T');
INSERT INTO `ey_region` VALUES ('36404', '南江县', '3', '36299', 'N');
INSERT INTO `ey_region` VALUES ('36453', '平昌县', '3', '36299', 'P');
INSERT INTO `ey_region` VALUES ('36497', '资阳市', '2', '33007', 'Z');
INSERT INTO `ey_region` VALUES ('36498', '市辖区', '3', '36497', 'S');
INSERT INTO `ey_region` VALUES ('36499', '雁江区', '3', '36497', 'Y');
INSERT INTO `ey_region` VALUES ('36527', '安岳县', '3', '36497', 'A');
INSERT INTO `ey_region` VALUES ('36597', '乐至县', '3', '36497', 'L');
INSERT INTO `ey_region` VALUES ('36623', '简阳市', '3', '36497', 'J');
INSERT INTO `ey_region` VALUES ('36679', '阿坝州', '2', '33007', 'A');
INSERT INTO `ey_region` VALUES ('36680', '汶川县', '3', '36679', 'W');
INSERT INTO `ey_region` VALUES ('36694', '理县', '3', '36679', 'L');
INSERT INTO `ey_region` VALUES ('36708', '茂县', '3', '36679', 'M');
INSERT INTO `ey_region` VALUES ('36731', '松潘县', '3', '36679', 'S');
INSERT INTO `ey_region` VALUES ('36759', '九寨沟县', '3', '36679', 'J');
INSERT INTO `ey_region` VALUES ('36778', '金川县', '3', '36679', 'J');
INSERT INTO `ey_region` VALUES ('36802', '小金县', '3', '36679', 'X');
INSERT INTO `ey_region` VALUES ('36824', '黑水县', '3', '36679', 'H');
INSERT INTO `ey_region` VALUES ('36842', '马尔康县', '3', '36679', 'M');
INSERT INTO `ey_region` VALUES ('36858', '壤塘县', '3', '36679', 'R');
INSERT INTO `ey_region` VALUES ('36871', '阿坝县', '3', '36679', 'A');
INSERT INTO `ey_region` VALUES ('36893', '若尔盖县', '3', '36679', 'R');
INSERT INTO `ey_region` VALUES ('36914', '红原县', '3', '36679', 'H');
INSERT INTO `ey_region` VALUES ('36926', '甘孜州', '2', '33007', 'G');
INSERT INTO `ey_region` VALUES ('36927', '康定县', '3', '36926', 'K');
INSERT INTO `ey_region` VALUES ('36949', '泸定县', '3', '36926', 'L');
INSERT INTO `ey_region` VALUES ('36962', '丹巴县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('36978', '九龙县', '3', '36926', 'J');
INSERT INTO `ey_region` VALUES ('36997', '雅江县', '3', '36926', 'Y');
INSERT INTO `ey_region` VALUES ('37015', '道孚县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37038', '炉霍县', '3', '36926', 'L');
INSERT INTO `ey_region` VALUES ('37055', '甘孜县', '3', '36926', 'G');
INSERT INTO `ey_region` VALUES ('37078', '新龙县', '3', '36926', 'X');
INSERT INTO `ey_region` VALUES ('37098', '德格县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37125', '白玉县', '3', '36926', 'B');
INSERT INTO `ey_region` VALUES ('37143', '石渠县', '3', '36926', 'S');
INSERT INTO `ey_region` VALUES ('37166', '色达县', '3', '36926', 'S');
INSERT INTO `ey_region` VALUES ('37184', '理塘县', '3', '36926', 'L');
INSERT INTO `ey_region` VALUES ('37209', '巴塘县', '3', '36926', 'B');
INSERT INTO `ey_region` VALUES ('37229', '乡城县', '3', '36926', 'X');
INSERT INTO `ey_region` VALUES ('37242', '稻城县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37257', '得荣县', '3', '36926', 'D');
INSERT INTO `ey_region` VALUES ('37270', '凉山州', '2', '33007', 'L');
INSERT INTO `ey_region` VALUES ('37271', '西昌市', '3', '37270', 'X');
INSERT INTO `ey_region` VALUES ('37315', '木里县', '3', '37270', 'M');
INSERT INTO `ey_region` VALUES ('37345', '盐源县', '3', '37270', 'Y');
INSERT INTO `ey_region` VALUES ('37380', '德昌', '3', '37270', 'D');
INSERT INTO `ey_region` VALUES ('37404', '会理县', '3', '37270', 'H');
INSERT INTO `ey_region` VALUES ('37455', '会东县', '3', '37270', 'H');
INSERT INTO `ey_region` VALUES ('37509', '宁南县', '3', '37270', 'N');
INSERT INTO `ey_region` VALUES ('37535', '普格县', '3', '37270', 'P');
INSERT INTO `ey_region` VALUES ('37570', '布拖县', '3', '37270', 'B');
INSERT INTO `ey_region` VALUES ('37601', '金阳县', '3', '37270', 'J');
INSERT INTO `ey_region` VALUES ('37636', '昭觉县', '3', '37270', 'Z');
INSERT INTO `ey_region` VALUES ('37684', '喜德县', '3', '37270', 'X');
INSERT INTO `ey_region` VALUES ('37709', '冕宁县', '3', '37270', 'M');
INSERT INTO `ey_region` VALUES ('37748', '越西县', '3', '37270', 'Y');
INSERT INTO `ey_region` VALUES ('37790', '甘洛县', '3', '37270', 'G');
INSERT INTO `ey_region` VALUES ('37819', '美姑县', '3', '37270', 'M');
INSERT INTO `ey_region` VALUES ('37856', '雷波县', '3', '37270', 'L');
INSERT INTO `ey_region` VALUES ('37906', '贵州省', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('37907', '贵阳市', '2', '37906', 'G');
INSERT INTO `ey_region` VALUES ('37908', '市辖区', '3', '37907', 'S');
INSERT INTO `ey_region` VALUES ('37909', '南明区', '3', '37907', 'N');
INSERT INTO `ey_region` VALUES ('37927', '云岩区', '3', '37907', 'Y');
INSERT INTO `ey_region` VALUES ('37944', '花溪区', '3', '37907', 'H');
INSERT INTO `ey_region` VALUES ('37961', '乌当区', '3', '37907', 'W');
INSERT INTO `ey_region` VALUES ('37977', '白云区', '3', '37907', 'B');
INSERT INTO `ey_region` VALUES ('37987', '小河区', '3', '37907', 'X');
INSERT INTO `ey_region` VALUES ('37991', '开阳县', '3', '37907', 'K');
INSERT INTO `ey_region` VALUES ('38008', '息烽县', '3', '37907', 'X');
INSERT INTO `ey_region` VALUES ('38019', '修文县', '3', '37907', 'X');
INSERT INTO `ey_region` VALUES ('38030', '清镇市', '3', '37907', 'Q');
INSERT INTO `ey_region` VALUES ('38042', '六盘水市', '2', '37906', 'L');
INSERT INTO `ey_region` VALUES ('38043', '钟山区', '3', '38042', 'Z');
INSERT INTO `ey_region` VALUES ('38053', '六枝特区', '3', '38042', 'L');
INSERT INTO `ey_region` VALUES ('38073', '水城县', '3', '38042', 'S');
INSERT INTO `ey_region` VALUES ('38107', '盘县', '3', '38042', 'P');
INSERT INTO `ey_region` VALUES ('38145', '遵义市', '2', '37906', 'Z');
INSERT INTO `ey_region` VALUES ('38146', '市辖区', '3', '38145', 'S');
INSERT INTO `ey_region` VALUES ('38147', '红花岗区', '3', '38145', 'H');
INSERT INTO `ey_region` VALUES ('38164', '汇川区', '3', '38145', 'H');
INSERT INTO `ey_region` VALUES ('38174', '遵义县', '3', '38145', 'Z');
INSERT INTO `ey_region` VALUES ('38206', '桐梓县', '3', '38145', 'T');
INSERT INTO `ey_region` VALUES ('38231', '绥阳县', '3', '38145', 'S');
INSERT INTO `ey_region` VALUES ('38247', '正安县', '3', '38145', 'Z');
INSERT INTO `ey_region` VALUES ('38267', '道真县', '3', '38145', 'D');
INSERT INTO `ey_region` VALUES ('38282', '务川县', '3', '38145', 'W');
INSERT INTO `ey_region` VALUES ('38298', '凤冈县', '3', '38145', 'F');
INSERT INTO `ey_region` VALUES ('38313', '湄潭县', '3', '38145', 'M');
INSERT INTO `ey_region` VALUES ('38329', '余庆县', '3', '38145', 'Y');
INSERT INTO `ey_region` VALUES ('38340', '习水县', '3', '38145', 'X');
INSERT INTO `ey_region` VALUES ('38364', '赤水市', '3', '38145', 'C');
INSERT INTO `ey_region` VALUES ('38382', '仁怀市', '3', '38145', 'R');
INSERT INTO `ey_region` VALUES ('38402', '安顺市', '2', '37906', 'A');
INSERT INTO `ey_region` VALUES ('38403', '市辖区', '3', '38402', 'S');
INSERT INTO `ey_region` VALUES ('38404', '西秀区', '3', '38402', 'X');
INSERT INTO `ey_region` VALUES ('38429', '平坝县', '3', '38402', 'P');
INSERT INTO `ey_region` VALUES ('38440', '普定县', '3', '38402', 'P');
INSERT INTO `ey_region` VALUES ('38452', '镇宁县', '3', '38402', 'Z');
INSERT INTO `ey_region` VALUES ('38469', '关岭县', '3', '38402', 'G');
INSERT INTO `ey_region` VALUES ('38484', '紫云县', '3', '38402', 'Z');
INSERT INTO `ey_region` VALUES ('38497', '铜仁地区', '2', '37906', 'T');
INSERT INTO `ey_region` VALUES ('38498', '铜仁市', '3', '38497', 'T');
INSERT INTO `ey_region` VALUES ('38516', '江口县', '3', '38497', 'J');
INSERT INTO `ey_region` VALUES ('38526', '玉屏县', '3', '38497', 'Y');
INSERT INTO `ey_region` VALUES ('38533', '石阡县', '3', '38497', 'S');
INSERT INTO `ey_region` VALUES ('38552', '思南县　', '3', '38497', 'S');
INSERT INTO `ey_region` VALUES ('38580', '印江县', '3', '38497', 'Y');
INSERT INTO `ey_region` VALUES ('38598', '德江县', '3', '38497', 'D');
INSERT INTO `ey_region` VALUES ('38619', '沿河县', '3', '38497', 'Y');
INSERT INTO `ey_region` VALUES ('38642', '松桃县', '3', '38497', 'S');
INSERT INTO `ey_region` VALUES ('38671', '万山特区', '3', '38497', 'W');
INSERT INTO `ey_region` VALUES ('38677', '黔西南州', '2', '37906', 'Q');
INSERT INTO `ey_region` VALUES ('38678', '兴义市', '3', '38677', 'X');
INSERT INTO `ey_region` VALUES ('38705', '兴仁县', '3', '38677', 'X');
INSERT INTO `ey_region` VALUES ('38722', '普安县', '3', '38677', 'P');
INSERT INTO `ey_region` VALUES ('38737', '晴隆县', '3', '38677', 'Q');
INSERT INTO `ey_region` VALUES ('38752', '贞丰县', '3', '38677', 'Z');
INSERT INTO `ey_region` VALUES ('38766', '望谟县', '3', '38677', 'W');
INSERT INTO `ey_region` VALUES ('38784', '册亨县', '3', '38677', 'C');
INSERT INTO `ey_region` VALUES ('38799', '安龙县', '3', '38677', 'A');
INSERT INTO `ey_region` VALUES ('38816', '毕节地区', '2', '37906', 'B');
INSERT INTO `ey_region` VALUES ('38817', '毕节市', '3', '38816', 'B');
INSERT INTO `ey_region` VALUES ('38859', '大方县', '3', '38816', 'D');
INSERT INTO `ey_region` VALUES ('38896', '黔西县', '3', '38816', 'Q');
INSERT INTO `ey_region` VALUES ('38925', '金沙县', '3', '38816', 'J');
INSERT INTO `ey_region` VALUES ('38952', '织金县', '3', '38816', 'Z');
INSERT INTO `ey_region` VALUES ('38985', '纳雍县', '3', '38816', 'N');
INSERT INTO `ey_region` VALUES ('39011', '威宁县', '3', '38816', 'W');
INSERT INTO `ey_region` VALUES ('39047', '赫章县', '3', '38816', 'H');
INSERT INTO `ey_region` VALUES ('39075', '黔东南州', '2', '37906', 'Q');
INSERT INTO `ey_region` VALUES ('39076', '凯里市', '3', '39075', 'K');
INSERT INTO `ey_region` VALUES ('39092', '黄平县', '3', '39075', 'H');
INSERT INTO `ey_region` VALUES ('39107', '施秉县', '3', '39075', 'S');
INSERT INTO `ey_region` VALUES ('39116', '三穗县', '3', '39075', 'S');
INSERT INTO `ey_region` VALUES ('39126', '镇远县', '3', '39075', 'Z');
INSERT INTO `ey_region` VALUES ('39139', '岑巩县', '3', '39075', 'C');
INSERT INTO `ey_region` VALUES ('39151', '天柱县', '3', '39075', 'T');
INSERT INTO `ey_region` VALUES ('39168', '锦屏县', '3', '39075', 'J');
INSERT INTO `ey_region` VALUES ('39184', '剑河县', '3', '39075', 'J');
INSERT INTO `ey_region` VALUES ('39197', '台江县', '3', '39075', 'T');
INSERT INTO `ey_region` VALUES ('39206', '黎平县', '3', '39075', 'L');
INSERT INTO `ey_region` VALUES ('39232', '榕江县', '3', '39075', 'R');
INSERT INTO `ey_region` VALUES ('39252', '从江县', '3', '39075', 'C');
INSERT INTO `ey_region` VALUES ('39274', '雷山县', '3', '39075', 'L');
INSERT INTO `ey_region` VALUES ('39284', '麻江县', '3', '39075', 'M');
INSERT INTO `ey_region` VALUES ('39294', '丹寨县', '3', '39075', 'D');
INSERT INTO `ey_region` VALUES ('39302', '黔南州', '2', '37906', 'Q');
INSERT INTO `ey_region` VALUES ('39303', '都匀市', '3', '39302', 'D');
INSERT INTO `ey_region` VALUES ('39327', '福泉市', '3', '39302', 'F');
INSERT INTO `ey_region` VALUES ('39345', '荔波县', '3', '39302', 'L');
INSERT INTO `ey_region` VALUES ('39363', '贵定县', '3', '39302', 'G');
INSERT INTO `ey_region` VALUES ('39384', '瓮安县', '3', '39302', 'W');
INSERT INTO `ey_region` VALUES ('39408', '独山县', '3', '39302', 'D');
INSERT INTO `ey_region` VALUES ('39427', '平塘县', '3', '39302', 'P');
INSERT INTO `ey_region` VALUES ('39447', '罗甸县', '3', '39302', 'L');
INSERT INTO `ey_region` VALUES ('39474', '长顺县', '3', '39302', 'C');
INSERT INTO `ey_region` VALUES ('39493', '龙里县', '3', '39302', 'L');
INSERT INTO `ey_region` VALUES ('39508', '惠水县', '3', '39302', 'H');
INSERT INTO `ey_region` VALUES ('39534', '三都县', '3', '39302', 'S');
INSERT INTO `ey_region` VALUES ('39556', '云南省', '1', '0', 'Y');
INSERT INTO `ey_region` VALUES ('39557', '昆明市', '2', '39556', 'K');
INSERT INTO `ey_region` VALUES ('39558', '市辖区', '3', '39557', 'S');
INSERT INTO `ey_region` VALUES ('39559', '五华区', '3', '39557', 'W');
INSERT INTO `ey_region` VALUES ('39571', '盘龙区', '3', '39557', 'P');
INSERT INTO `ey_region` VALUES ('39582', '官渡区', '3', '39557', 'G');
INSERT INTO `ey_region` VALUES ('39594', '西山区', '3', '39557', 'X');
INSERT INTO `ey_region` VALUES ('39605', '东川区', '3', '39557', 'D');
INSERT INTO `ey_region` VALUES ('39614', '呈贡县', '3', '39557', 'C');
INSERT INTO `ey_region` VALUES ('39622', '晋宁县', '3', '39557', 'J');
INSERT INTO `ey_region` VALUES ('39632', '富民县', '3', '39557', 'F');
INSERT INTO `ey_region` VALUES ('39640', '宜良县', '3', '39557', 'Y');
INSERT INTO `ey_region` VALUES ('39650', '石林县', '3', '39557', 'S');
INSERT INTO `ey_region` VALUES ('39659', '嵩明县', '3', '39557', 'S');
INSERT INTO `ey_region` VALUES ('39667', '禄劝县', '3', '39557', 'L');
INSERT INTO `ey_region` VALUES ('39684', '寻甸县', '3', '39557', 'X');
INSERT INTO `ey_region` VALUES ('39701', '安宁市', '3', '39557', 'A');
INSERT INTO `ey_region` VALUES ('39710', '曲靖市', '2', '39556', 'Q');
INSERT INTO `ey_region` VALUES ('39711', '市辖区', '3', '39710', 'S');
INSERT INTO `ey_region` VALUES ('39712', '麒麟区', '3', '39710', 'Q');
INSERT INTO `ey_region` VALUES ('39724', '马龙县', '3', '39710', 'M');
INSERT INTO `ey_region` VALUES ('39733', '陆良县', '3', '39710', 'L');
INSERT INTO `ey_region` VALUES ('39744', '师宗县', '3', '39710', 'S');
INSERT INTO `ey_region` VALUES ('39753', '罗平县', '3', '39710', 'L');
INSERT INTO `ey_region` VALUES ('39766', '富源县', '3', '39710', 'F');
INSERT INTO `ey_region` VALUES ('39778', '会泽县', '3', '39710', 'H');
INSERT INTO `ey_region` VALUES ('39800', '沾益县', '3', '39710', 'Z');
INSERT INTO `ey_region` VALUES ('39809', '宣威市', '3', '39710', 'X');
INSERT INTO `ey_region` VALUES ('39836', '玉溪市', '2', '39556', 'Y');
INSERT INTO `ey_region` VALUES ('39837', '市辖区', '3', '39836', 'S');
INSERT INTO `ey_region` VALUES ('39838', '红塔区', '3', '39836', 'H');
INSERT INTO `ey_region` VALUES ('39850', '江川县', '3', '39836', 'J');
INSERT INTO `ey_region` VALUES ('39858', '澄江县', '3', '39836', 'C');
INSERT INTO `ey_region` VALUES ('39865', '通海县', '3', '39836', 'T');
INSERT INTO `ey_region` VALUES ('39875', '华宁县', '3', '39836', 'H');
INSERT INTO `ey_region` VALUES ('39881', '易门县', '3', '39836', 'Y');
INSERT INTO `ey_region` VALUES ('39889', '峨山县', '3', '39836', 'E');
INSERT INTO `ey_region` VALUES ('39899', '新平县', '3', '39836', 'X');
INSERT INTO `ey_region` VALUES ('39912', '元江县', '3', '39836', 'Y');
INSERT INTO `ey_region` VALUES ('39923', '保山市', '2', '39556', 'B');
INSERT INTO `ey_region` VALUES ('39924', '市辖区', '3', '39923', 'S');
INSERT INTO `ey_region` VALUES ('39925', '隆阳区', '3', '39923', 'L');
INSERT INTO `ey_region` VALUES ('39946', '施甸县', '3', '39923', 'S');
INSERT INTO `ey_region` VALUES ('39960', '腾冲县', '3', '39923', 'T');
INSERT INTO `ey_region` VALUES ('39979', '龙陵县', '3', '39923', 'L');
INSERT INTO `ey_region` VALUES ('39990', '昌宁县', '3', '39923', 'C');
INSERT INTO `ey_region` VALUES ('40004', '昭通市', '2', '39556', 'Z');
INSERT INTO `ey_region` VALUES ('40005', '市辖区', '3', '40004', 'S');
INSERT INTO `ey_region` VALUES ('40006', '昭阳区', '3', '40004', 'Z');
INSERT INTO `ey_region` VALUES ('40027', '鲁甸县', '3', '40004', 'L');
INSERT INTO `ey_region` VALUES ('40040', '巧家县', '3', '40004', 'Q');
INSERT INTO `ey_region` VALUES ('40057', '盐津县', '3', '40004', 'Y');
INSERT INTO `ey_region` VALUES ('40068', '大关县', '3', '40004', 'D');
INSERT INTO `ey_region` VALUES ('40078', '永善县', '3', '40004', 'Y');
INSERT INTO `ey_region` VALUES ('40094', '绥江县', '3', '40004', 'S');
INSERT INTO `ey_region` VALUES ('40100', '镇雄县', '3', '40004', 'Z');
INSERT INTO `ey_region` VALUES ('40129', '彝良县', '3', '40004', 'Y');
INSERT INTO `ey_region` VALUES ('40145', '威信县', '3', '40004', 'W');
INSERT INTO `ey_region` VALUES ('40156', '水富县', '3', '40004', 'S');
INSERT INTO `ey_region` VALUES ('40160', '丽江市', '2', '39556', 'L');
INSERT INTO `ey_region` VALUES ('40161', '市辖区', '3', '40160', 'S');
INSERT INTO `ey_region` VALUES ('40162', '古城区', '3', '40160', 'G');
INSERT INTO `ey_region` VALUES ('40172', '玉龙县', '3', '40160', 'Y');
INSERT INTO `ey_region` VALUES ('40189', '永胜县', '3', '40160', 'Y');
INSERT INTO `ey_region` VALUES ('40205', '华坪县', '3', '40160', 'H');
INSERT INTO `ey_region` VALUES ('40214', '宁蒗县', '3', '40160', 'N');
INSERT INTO `ey_region` VALUES ('40230', '思茅市', '2', '39556', 'S');
INSERT INTO `ey_region` VALUES ('40231', '市辖区', '3', '40230', 'S');
INSERT INTO `ey_region` VALUES ('40232', '翠云区', '3', '40230', 'C');
INSERT INTO `ey_region` VALUES ('40240', '普洱县', '3', '40230', 'P');
INSERT INTO `ey_region` VALUES ('40250', '墨江县', '3', '40230', 'M');
INSERT INTO `ey_region` VALUES ('40266', '景东县', '3', '40230', 'J');
INSERT INTO `ey_region` VALUES ('40280', '景谷县', '3', '40230', 'J');
INSERT INTO `ey_region` VALUES ('40291', '镇沅县', '3', '40230', 'Z');
INSERT INTO `ey_region` VALUES ('40301', '江城县', '3', '40230', 'J');
INSERT INTO `ey_region` VALUES ('40310', '孟连县', '3', '40230', 'M');
INSERT INTO `ey_region` VALUES ('40318', '澜沧县', '3', '40230', 'L');
INSERT INTO `ey_region` VALUES ('40340', '西盟县', '3', '40230', 'X');
INSERT INTO `ey_region` VALUES ('40348', '临沧市', '2', '39556', 'L');
INSERT INTO `ey_region` VALUES ('40349', '市辖区', '3', '40348', 'S');
INSERT INTO `ey_region` VALUES ('40350', '临翔区', '3', '40348', 'L');
INSERT INTO `ey_region` VALUES ('40361', '凤庆县', '3', '40348', 'F');
INSERT INTO `ey_region` VALUES ('40375', '云县', '3', '40348', 'Y');
INSERT INTO `ey_region` VALUES ('40388', '永德县', '3', '40348', 'Y');
INSERT INTO `ey_region` VALUES ('40400', '镇康县', '3', '40348', 'Z');
INSERT INTO `ey_region` VALUES ('40408', '双江县', '3', '40348', 'S');
INSERT INTO `ey_region` VALUES ('40417', '耿马县', '3', '40348', 'G');
INSERT INTO `ey_region` VALUES ('40429', '沧源县', '3', '40348', 'C');
INSERT INTO `ey_region` VALUES ('40441', '楚雄州', '2', '39556', 'C');
INSERT INTO `ey_region` VALUES ('40442', '楚雄市', '3', '40441', 'C');
INSERT INTO `ey_region` VALUES ('40458', '双柏县', '3', '40441', 'S');
INSERT INTO `ey_region` VALUES ('40467', '牟定县', '3', '40441', 'M');
INSERT INTO `ey_region` VALUES ('40475', '南华县', '3', '40441', 'N');
INSERT INTO `ey_region` VALUES ('40486', '姚安县', '3', '40441', 'Y');
INSERT INTO `ey_region` VALUES ('40496', '大姚县', '3', '40441', 'D');
INSERT INTO `ey_region` VALUES ('40509', '永仁县', '3', '40441', 'Y');
INSERT INTO `ey_region` VALUES ('40517', '元谋县', '3', '40441', 'Y');
INSERT INTO `ey_region` VALUES ('40528', '武定县', '3', '40441', 'W');
INSERT INTO `ey_region` VALUES ('40540', '禄丰县', '3', '40441', 'L');
INSERT INTO `ey_region` VALUES ('40555', '红河州', '2', '39556', 'H');
INSERT INTO `ey_region` VALUES ('40556', '个旧市', '3', '40555', 'G');
INSERT INTO `ey_region` VALUES ('40567', '开远市', '3', '40555', 'K');
INSERT INTO `ey_region` VALUES ('40576', '蒙自县', '3', '40555', 'M');
INSERT INTO `ey_region` VALUES ('40588', '屏边县', '3', '40555', 'P');
INSERT INTO `ey_region` VALUES ('40596', '建水县', '3', '40555', 'J');
INSERT INTO `ey_region` VALUES ('40611', '石屏县', '3', '40555', 'S');
INSERT INTO `ey_region` VALUES ('40621', '弥勒县', '3', '40555', 'M');
INSERT INTO `ey_region` VALUES ('40635', '泸西县', '3', '40555', 'L');
INSERT INTO `ey_region` VALUES ('40644', '元阳县', '3', '40555', 'Y');
INSERT INTO `ey_region` VALUES ('40659', '红河县', '3', '40555', 'H');
INSERT INTO `ey_region` VALUES ('40673', '金平县', '3', '40555', 'J');
INSERT INTO `ey_region` VALUES ('40688', '绿春县', '3', '40555', 'L');
INSERT INTO `ey_region` VALUES ('40698', '河口县', '3', '40555', 'H');
INSERT INTO `ey_region` VALUES ('40705', '文山州', '2', '39556', 'W');
INSERT INTO `ey_region` VALUES ('40706', '文山县', '3', '40705', 'W');
INSERT INTO `ey_region` VALUES ('40722', '砚山县', '3', '40705', 'Y');
INSERT INTO `ey_region` VALUES ('40734', '西畴县', '3', '40705', 'X');
INSERT INTO `ey_region` VALUES ('40744', '麻栗坡县', '3', '40705', 'M');
INSERT INTO `ey_region` VALUES ('40756', '马关县', '3', '40705', 'M');
INSERT INTO `ey_region` VALUES ('40770', '丘北县', '3', '40705', 'Q');
INSERT INTO `ey_region` VALUES ('40783', '广南县', '3', '40705', 'G');
INSERT INTO `ey_region` VALUES ('40802', '富宁县', '3', '40705', 'F');
INSERT INTO `ey_region` VALUES ('40816', '西双版纳州', '2', '39556', 'X');
INSERT INTO `ey_region` VALUES ('40817', '景洪市', '3', '40816', 'J');
INSERT INTO `ey_region` VALUES ('40829', '勐海县', '3', '40816', 'M');
INSERT INTO `ey_region` VALUES ('40841', '勐腊县', '3', '40816', 'M');
INSERT INTO `ey_region` VALUES ('40852', '大理州', '2', '39556', 'D');
INSERT INTO `ey_region` VALUES ('40853', '大理市', '3', '40852', 'D');
INSERT INTO `ey_region` VALUES ('40866', '漾濞县', '3', '40852', 'Y');
INSERT INTO `ey_region` VALUES ('40876', '祥云县', '3', '40852', 'X');
INSERT INTO `ey_region` VALUES ('40887', '宾川县', '3', '40852', 'B');
INSERT INTO `ey_region` VALUES ('40901', '弥渡县', '3', '40852', 'M');
INSERT INTO `ey_region` VALUES ('40910', '南涧县', '3', '40852', 'N');
INSERT INTO `ey_region` VALUES ('40919', '巍山县', '3', '40852', 'W');
INSERT INTO `ey_region` VALUES ('40930', '永平县', '3', '40852', 'Y');
INSERT INTO `ey_region` VALUES ('40938', '云龙县', '3', '40852', 'Y');
INSERT INTO `ey_region` VALUES ('40950', '洱源县', '3', '40852', 'E');
INSERT INTO `ey_region` VALUES ('40960', '剑川县', '3', '40852', 'J');
INSERT INTO `ey_region` VALUES ('40969', '鹤庆县', '3', '40852', 'H');
INSERT INTO `ey_region` VALUES ('40979', '德宏州', '2', '39556', 'D');
INSERT INTO `ey_region` VALUES ('40980', '瑞丽市', '3', '40979', 'R');
INSERT INTO `ey_region` VALUES ('40988', '潞西市', '3', '40979', 'L');
INSERT INTO `ey_region` VALUES ('41000', '梁河县', '3', '40979', 'L');
INSERT INTO `ey_region` VALUES ('41010', '盈江县', '3', '40979', 'Y');
INSERT INTO `ey_region` VALUES ('41026', '陇川县', '3', '40979', 'L');
INSERT INTO `ey_region` VALUES ('41036', '怒江州', '2', '39556', 'N');
INSERT INTO `ey_region` VALUES ('41037', '泸水县', '3', '41036', 'L');
INSERT INTO `ey_region` VALUES ('41047', '福贡县', '3', '41036', 'F');
INSERT INTO `ey_region` VALUES ('41055', '贡山县', '3', '41036', 'G');
INSERT INTO `ey_region` VALUES ('41061', '兰坪县', '3', '41036', 'L');
INSERT INTO `ey_region` VALUES ('41070', '迪庆州', '2', '39556', 'D');
INSERT INTO `ey_region` VALUES ('41071', '香格里拉县', '3', '41070', 'X');
INSERT INTO `ey_region` VALUES ('41083', '德钦县', '3', '41070', 'D');
INSERT INTO `ey_region` VALUES ('41092', '维西县', '3', '41070', 'W');
INSERT INTO `ey_region` VALUES ('41103', '西藏', '1', '0', 'X');
INSERT INTO `ey_region` VALUES ('41104', '拉萨市', '2', '41103', 'L');
INSERT INTO `ey_region` VALUES ('41105', '市辖区', '3', '41104', 'S');
INSERT INTO `ey_region` VALUES ('41106', '城关区', '3', '41104', 'C');
INSERT INTO `ey_region` VALUES ('41118', '林周县', '3', '41104', 'L');
INSERT INTO `ey_region` VALUES ('41129', '当雄县', '3', '41104', 'D');
INSERT INTO `ey_region` VALUES ('41138', '尼木县', '3', '41104', 'N');
INSERT INTO `ey_region` VALUES ('41147', '曲水县', '3', '41104', 'Q');
INSERT INTO `ey_region` VALUES ('41154', '堆龙德庆', '3', '41104', 'D');
INSERT INTO `ey_region` VALUES ('41162', '达孜县', '3', '41104', 'D');
INSERT INTO `ey_region` VALUES ('41169', '墨竹工卡县', '3', '41104', 'M');
INSERT INTO `ey_region` VALUES ('41178', '昌都地区', '2', '41103', 'C');
INSERT INTO `ey_region` VALUES ('41179', '昌都县', '3', '41178', 'C');
INSERT INTO `ey_region` VALUES ('41195', '江达县', '3', '41178', 'J');
INSERT INTO `ey_region` VALUES ('41209', '贡觉县', '3', '41178', 'G');
INSERT INTO `ey_region` VALUES ('41222', '类乌齐县', '3', '41178', 'L');
INSERT INTO `ey_region` VALUES ('41233', '丁青县', '3', '41178', 'D');
INSERT INTO `ey_region` VALUES ('41247', '察亚县', '3', '41178', 'C');
INSERT INTO `ey_region` VALUES ('41261', '八宿县', '3', '41178', 'B');
INSERT INTO `ey_region` VALUES ('41276', '左贡县', '3', '41178', 'Z');
INSERT INTO `ey_region` VALUES ('41287', '芒康县', '3', '41178', 'M');
INSERT INTO `ey_region` VALUES ('41304', '洛隆县', '3', '41178', 'L');
INSERT INTO `ey_region` VALUES ('41316', '边坝县', '3', '41178', 'B');
INSERT INTO `ey_region` VALUES ('41328', '山南地区', '2', '41103', 'S');
INSERT INTO `ey_region` VALUES ('41329', '乃东县', '3', '41328', 'N');
INSERT INTO `ey_region` VALUES ('41337', '扎囊县', '3', '41328', 'Z');
INSERT INTO `ey_region` VALUES ('41343', '贡嘎县', '3', '41328', 'G');
INSERT INTO `ey_region` VALUES ('41352', '桑日县', '3', '41328', 'S');
INSERT INTO `ey_region` VALUES ('41357', '琼结县', '3', '41328', 'Q');
INSERT INTO `ey_region` VALUES ('41362', '曲松县', '3', '41328', 'Q');
INSERT INTO `ey_region` VALUES ('41368', '措美县', '3', '41328', 'C');
INSERT INTO `ey_region` VALUES ('41373', '洛扎县', '3', '41328', 'L');
INSERT INTO `ey_region` VALUES ('41381', '加查县', '3', '41328', 'J');
INSERT INTO `ey_region` VALUES ('41389', '隆子县', '3', '41328', 'L');
INSERT INTO `ey_region` VALUES ('41401', '错那县', '3', '41328', 'C');
INSERT INTO `ey_region` VALUES ('41412', '浪卡子县', '3', '41328', 'L');
INSERT INTO `ey_region` VALUES ('41423', '日喀则地区', '2', '41103', 'R');
INSERT INTO `ey_region` VALUES ('41424', '日喀则市', '3', '41423', 'R');
INSERT INTO `ey_region` VALUES ('41437', '南木林县', '3', '41423', 'N');
INSERT INTO `ey_region` VALUES ('41455', '江孜县', '3', '41423', 'J');
INSERT INTO `ey_region` VALUES ('41475', '定日县', '3', '41423', 'D');
INSERT INTO `ey_region` VALUES ('41489', '萨迦县', '3', '41423', 'S');
INSERT INTO `ey_region` VALUES ('41501', '拉孜县', '3', '41423', 'L');
INSERT INTO `ey_region` VALUES ('41513', '昂仁县', '3', '41423', 'A');
INSERT INTO `ey_region` VALUES ('41531', '谢通门县', '3', '41423', 'X');
INSERT INTO `ey_region` VALUES ('41551', '白朗县', '3', '41423', 'B');
INSERT INTO `ey_region` VALUES ('41563', '仁布县', '3', '41423', 'R');
INSERT INTO `ey_region` VALUES ('41573', '康马县', '3', '41423', 'K');
INSERT INTO `ey_region` VALUES ('41583', '定结县', '3', '41423', 'D');
INSERT INTO `ey_region` VALUES ('41594', '仲巴县', '3', '41423', 'Z');
INSERT INTO `ey_region` VALUES ('41608', '亚东县', '3', '41423', 'Y');
INSERT INTO `ey_region` VALUES ('41616', '吉隆县', '3', '41423', 'J');
INSERT INTO `ey_region` VALUES ('41622', '聂拉木县', '3', '41423', 'N');
INSERT INTO `ey_region` VALUES ('41630', '萨嘎县', '3', '41423', 'S');
INSERT INTO `ey_region` VALUES ('41639', '岗巴县', '3', '41423', 'G');
INSERT INTO `ey_region` VALUES ('41645', '那曲地区', '2', '41103', 'N');
INSERT INTO `ey_region` VALUES ('41646', '那曲县', '3', '41645', 'N');
INSERT INTO `ey_region` VALUES ('41659', '嘉黎县', '3', '41645', 'J');
INSERT INTO `ey_region` VALUES ('41670', '比如县', '3', '41645', 'B');
INSERT INTO `ey_region` VALUES ('41681', '聂荣县', '3', '41645', 'N');
INSERT INTO `ey_region` VALUES ('41692', '安多县', '3', '41645', 'A');
INSERT INTO `ey_region` VALUES ('41706', '申扎县', '3', '41645', 'S');
INSERT INTO `ey_region` VALUES ('41715', '索县', '3', '41645', 'S');
INSERT INTO `ey_region` VALUES ('41726', '班戈县', '3', '41645', 'B');
INSERT INTO `ey_region` VALUES ('41737', '巴青县', '3', '41645', 'B');
INSERT INTO `ey_region` VALUES ('41748', '尼玛县', '3', '41645', 'N');
INSERT INTO `ey_region` VALUES ('41770', '阿里地区', '2', '41103', 'A');
INSERT INTO `ey_region` VALUES ('41771', '普兰县', '3', '41770', 'P');
INSERT INTO `ey_region` VALUES ('41775', '札达县', '3', '41770', 'Z');
INSERT INTO `ey_region` VALUES ('41782', '噶尔县', '3', '41770', 'G');
INSERT INTO `ey_region` VALUES ('41788', '日土县', '3', '41770', 'R');
INSERT INTO `ey_region` VALUES ('41794', '革吉县', '3', '41770', 'G');
INSERT INTO `ey_region` VALUES ('41800', '改则县', '3', '41770', 'G');
INSERT INTO `ey_region` VALUES ('41808', '措勤县', '3', '41770', 'C');
INSERT INTO `ey_region` VALUES ('41814', '林芝地区', '2', '41103', 'L');
INSERT INTO `ey_region` VALUES ('41815', '林芝县', '3', '41814', 'L');
INSERT INTO `ey_region` VALUES ('41823', '工布江达县', '3', '41814', 'G');
INSERT INTO `ey_region` VALUES ('41833', '米林县', '3', '41814', 'M');
INSERT INTO `ey_region` VALUES ('41842', '墨脱县', '3', '41814', 'M');
INSERT INTO `ey_region` VALUES ('41851', '波密县', '3', '41814', 'B');
INSERT INTO `ey_region` VALUES ('41863', '察隅县', '3', '41814', 'C');
INSERT INTO `ey_region` VALUES ('41870', '朗县', '3', '41814', 'L');
INSERT INTO `ey_region` VALUES ('41877', '陕西省', '1', '0', 'S');
INSERT INTO `ey_region` VALUES ('41878', '西安市', '2', '41877', 'X');
INSERT INTO `ey_region` VALUES ('41879', '市辖区', '3', '41878', 'S');
INSERT INTO `ey_region` VALUES ('41880', '新城区', '3', '41878', 'X');
INSERT INTO `ey_region` VALUES ('41890', '碑林区', '3', '41878', 'B');
INSERT INTO `ey_region` VALUES ('41899', '莲湖区', '3', '41878', 'L');
INSERT INTO `ey_region` VALUES ('41909', '灞桥区', '3', '41878', 'B');
INSERT INTO `ey_region` VALUES ('41919', '未央区', '3', '41878', 'W');
INSERT INTO `ey_region` VALUES ('41930', '雁塔区', '3', '41878', 'Y');
INSERT INTO `ey_region` VALUES ('41939', '阎良区', '3', '41878', 'Y');
INSERT INTO `ey_region` VALUES ('41947', '临潼区', '3', '41878', 'L');
INSERT INTO `ey_region` VALUES ('41971', '长安区', '3', '41878', 'C');
INSERT INTO `ey_region` VALUES ('41997', '蓝田县', '3', '41878', 'L');
INSERT INTO `ey_region` VALUES ('42020', '周至县', '3', '41878', 'Z');
INSERT INTO `ey_region` VALUES ('42043', '户县', '3', '41878', 'H');
INSERT INTO `ey_region` VALUES ('42060', '高陵县', '3', '41878', 'G');
INSERT INTO `ey_region` VALUES ('42069', '铜川市', '2', '41877', 'T');
INSERT INTO `ey_region` VALUES ('42070', '市辖区', '3', '42069', 'S');
INSERT INTO `ey_region` VALUES ('42071', '王益区', '3', '42069', 'W');
INSERT INTO `ey_region` VALUES ('42079', '印台区', '3', '42069', 'Y');
INSERT INTO `ey_region` VALUES ('42091', '耀州区', '3', '42069', 'Y');
INSERT INTO `ey_region` VALUES ('42108', '宜君县', '3', '42069', 'Y');
INSERT INTO `ey_region` VALUES ('42119', '宝鸡市', '2', '41877', 'B');
INSERT INTO `ey_region` VALUES ('42120', '市辖区', '3', '42119', 'S');
INSERT INTO `ey_region` VALUES ('42121', '渭滨区', '3', '42119', 'W');
INSERT INTO `ey_region` VALUES ('42133', '金台区', '3', '42119', 'J');
INSERT INTO `ey_region` VALUES ('42146', '陈仓区', '3', '42119', 'C');
INSERT INTO `ey_region` VALUES ('42165', '凤翔县', '3', '42119', 'F');
INSERT INTO `ey_region` VALUES ('42183', '岐山县', '3', '42119', 'Q');
INSERT INTO `ey_region` VALUES ('42198', '扶风县', '3', '42119', 'F');
INSERT INTO `ey_region` VALUES ('42211', '眉县', '3', '42119', 'M');
INSERT INTO `ey_region` VALUES ('42224', '陇县', '3', '42119', 'L');
INSERT INTO `ey_region` VALUES ('42240', '千阳县', '3', '42119', 'Q');
INSERT INTO `ey_region` VALUES ('42252', '麟游县', '3', '42119', 'L');
INSERT INTO `ey_region` VALUES ('42263', '凤县', '3', '42119', 'F');
INSERT INTO `ey_region` VALUES ('42278', '太白县', '3', '42119', 'T');
INSERT INTO `ey_region` VALUES ('42287', '咸阳市', '2', '41877', 'X');
INSERT INTO `ey_region` VALUES ('42288', '市辖区', '3', '42287', 'S');
INSERT INTO `ey_region` VALUES ('42289', '秦都区', '3', '42287', 'Q');
INSERT INTO `ey_region` VALUES ('42302', '杨凌区', '3', '42287', 'Y');
INSERT INTO `ey_region` VALUES ('42308', '渭城区', '3', '42287', 'W');
INSERT INTO `ey_region` VALUES ('42319', '三原县', '3', '42287', 'S');
INSERT INTO `ey_region` VALUES ('42334', '泾阳县', '3', '42287', 'J');
INSERT INTO `ey_region` VALUES ('42351', '乾县', '3', '42287', 'Q');
INSERT INTO `ey_region` VALUES ('42372', '礼泉县', '3', '42287', 'L');
INSERT INTO `ey_region` VALUES ('42388', '永寿县', '3', '42287', 'Y');
INSERT INTO `ey_region` VALUES ('42402', '彬县', '3', '42287', 'B');
INSERT INTO `ey_region` VALUES ('42419', '长武县', '3', '42287', 'C');
INSERT INTO `ey_region` VALUES ('42431', '旬邑县', '3', '42287', 'X');
INSERT INTO `ey_region` VALUES ('42446', '淳化县', '3', '42287', 'C');
INSERT INTO `ey_region` VALUES ('42462', '武功县', '3', '42287', 'W');
INSERT INTO `ey_region` VALUES ('42475', '兴平市', '3', '42287', 'X');
INSERT INTO `ey_region` VALUES ('42490', '渭南市', '2', '41877', 'W');
INSERT INTO `ey_region` VALUES ('42491', '市辖区', '3', '42490', 'S');
INSERT INTO `ey_region` VALUES ('42492', '临渭区', '3', '42490', 'L');
INSERT INTO `ey_region` VALUES ('42523', '华县', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42538', '潼关县', '3', '42490', 'T');
INSERT INTO `ey_region` VALUES ('42547', '大荔县', '3', '42490', 'D');
INSERT INTO `ey_region` VALUES ('42577', '合阳县', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42594', '澄城县', '3', '42490', 'C');
INSERT INTO `ey_region` VALUES ('42609', '蒲城县', '3', '42490', 'P');
INSERT INTO `ey_region` VALUES ('42634', '白水县', '3', '42490', 'B');
INSERT INTO `ey_region` VALUES ('42649', '富平县', '3', '42490', 'F');
INSERT INTO `ey_region` VALUES ('42674', '韩城市', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42691', '华阴市', '3', '42490', 'H');
INSERT INTO `ey_region` VALUES ('42703', '延安市', '2', '41877', 'Y');
INSERT INTO `ey_region` VALUES ('42704', '市辖区', '3', '42703', 'S');
INSERT INTO `ey_region` VALUES ('42705', '宝塔区', '3', '42703', 'B');
INSERT INTO `ey_region` VALUES ('42729', '延长县', '3', '42703', 'Y');
INSERT INTO `ey_region` VALUES ('42742', '延川县', '3', '42703', 'Y');
INSERT INTO `ey_region` VALUES ('42757', '子长县', '3', '42703', 'Z');
INSERT INTO `ey_region` VALUES ('42771', '安塞县', '3', '42703', 'A');
INSERT INTO `ey_region` VALUES ('42784', '志丹县', '3', '42703', 'Z');
INSERT INTO `ey_region` VALUES ('42796', '吴起县', '3', '42703', 'W');
INSERT INTO `ey_region` VALUES ('42809', '甘泉县', '3', '42703', 'G');
INSERT INTO `ey_region` VALUES ('42818', '富县', '3', '42703', 'F');
INSERT INTO `ey_region` VALUES ('42833', '洛川县', '3', '42703', 'L');
INSERT INTO `ey_region` VALUES ('42850', '宜川县', '3', '42703', 'Y');
INSERT INTO `ey_region` VALUES ('42863', '黄龙县', '3', '42703', 'H');
INSERT INTO `ey_region` VALUES ('42874', '黄陵县', '3', '42703', 'H');
INSERT INTO `ey_region` VALUES ('42888', '汉中市', '2', '41877', 'H');
INSERT INTO `ey_region` VALUES ('42889', '市辖区', '3', '42888', 'S');
INSERT INTO `ey_region` VALUES ('42890', '汉台区', '3', '42888', 'H');
INSERT INTO `ey_region` VALUES ('42908', '南郑县', '3', '42888', 'N');
INSERT INTO `ey_region` VALUES ('42939', '城固县', '3', '42888', 'C');
INSERT INTO `ey_region` VALUES ('42965', '洋县', '3', '42888', 'Y');
INSERT INTO `ey_region` VALUES ('42992', '西乡县', '3', '42888', 'X');
INSERT INTO `ey_region` VALUES ('43016', '勉县', '3', '42888', 'M');
INSERT INTO `ey_region` VALUES ('43042', '宁强县', '3', '42888', 'N');
INSERT INTO `ey_region` VALUES ('43069', '略阳县', '3', '42888', 'L');
INSERT INTO `ey_region` VALUES ('43091', '镇巴县', '3', '42888', 'Z');
INSERT INTO `ey_region` VALUES ('43116', '留坝县', '3', '42888', 'L');
INSERT INTO `ey_region` VALUES ('43126', '佛坪县', '3', '42888', 'F');
INSERT INTO `ey_region` VALUES ('43136', '榆林市', '2', '41877', 'Y');
INSERT INTO `ey_region` VALUES ('43137', '市辖区', '3', '43136', 'S');
INSERT INTO `ey_region` VALUES ('43138', '榆阳区', '3', '43136', 'Y');
INSERT INTO `ey_region` VALUES ('43170', '神木县', '3', '43136', 'S');
INSERT INTO `ey_region` VALUES ('43190', '府谷县', '3', '43136', 'F');
INSERT INTO `ey_region` VALUES ('43211', '横山县', '3', '43136', 'H');
INSERT INTO `ey_region` VALUES ('43230', '靖边县', '3', '43136', 'J');
INSERT INTO `ey_region` VALUES ('43253', '定边县', '3', '43136', 'D');
INSERT INTO `ey_region` VALUES ('43279', '绥德县', '3', '43136', 'S');
INSERT INTO `ey_region` VALUES ('43300', '米脂县', '3', '43136', 'M');
INSERT INTO `ey_region` VALUES ('43314', '佳县', '3', '43136', 'J');
INSERT INTO `ey_region` VALUES ('43335', '吴堡县', '3', '43136', 'W');
INSERT INTO `ey_region` VALUES ('43344', '清涧县', '3', '43136', 'Q');
INSERT INTO `ey_region` VALUES ('43360', '子洲县', '3', '43136', 'Z');
INSERT INTO `ey_region` VALUES ('43379', '安康市', '2', '41877', 'A');
INSERT INTO `ey_region` VALUES ('43380', '市辖区', '3', '43379', 'S');
INSERT INTO `ey_region` VALUES ('43381', '汉滨区', '3', '43379', 'H');
INSERT INTO `ey_region` VALUES ('43428', '汉阴县', '3', '43379', 'H');
INSERT INTO `ey_region` VALUES ('43447', '石泉县', '3', '43379', 'S');
INSERT INTO `ey_region` VALUES ('43463', '宁陕县', '3', '43379', 'N');
INSERT INTO `ey_region` VALUES ('43478', '紫阳县', '3', '43379', 'Z');
INSERT INTO `ey_region` VALUES ('43504', '岚皋县', '3', '43379', 'L');
INSERT INTO `ey_region` VALUES ('43522', '平利县', '3', '43379', 'P');
INSERT INTO `ey_region` VALUES ('43535', '镇坪县', '3', '43379', 'Z');
INSERT INTO `ey_region` VALUES ('43546', '旬阳县', '3', '43379', 'X');
INSERT INTO `ey_region` VALUES ('43575', '白河县', '3', '43379', 'B');
INSERT INTO `ey_region` VALUES ('43592', '商洛市', '2', '41877', 'S');
INSERT INTO `ey_region` VALUES ('43593', '市辖区', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43594', '商州区', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43628', '洛南县', '3', '43592', 'L');
INSERT INTO `ey_region` VALUES ('43654', '丹凤县', '3', '43592', 'D');
INSERT INTO `ey_region` VALUES ('43676', '商南县', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43699', '山阳县', '3', '43592', 'S');
INSERT INTO `ey_region` VALUES ('43730', '镇安县', '3', '43592', 'Z');
INSERT INTO `ey_region` VALUES ('43759', '柞水县', '3', '43592', 'Z');
INSERT INTO `ey_region` VALUES ('43776', '甘肃省', '1', '0', 'G');
INSERT INTO `ey_region` VALUES ('43777', '兰州市', '2', '43776', 'L');
INSERT INTO `ey_region` VALUES ('43778', '市辖区', '3', '43777', 'S');
INSERT INTO `ey_region` VALUES ('43779', '城关区', '3', '43777', 'C');
INSERT INTO `ey_region` VALUES ('43804', '七里河区', '3', '43777', 'Q');
INSERT INTO `ey_region` VALUES ('43820', '兰州市西固区', '3', '43777', 'L');
INSERT INTO `ey_region` VALUES ('43836', '安宁区', '3', '43777', 'A');
INSERT INTO `ey_region` VALUES ('43845', '红古区', '3', '43777', 'H');
INSERT INTO `ey_region` VALUES ('43853', '永登县', '3', '43777', 'Y');
INSERT INTO `ey_region` VALUES ('43872', '皋兰县', '3', '43777', 'G');
INSERT INTO `ey_region` VALUES ('43880', '榆中县', '3', '43777', 'Y');
INSERT INTO `ey_region` VALUES ('43904', '嘉峪关市', '2', '43776', 'J');
INSERT INTO `ey_region` VALUES ('43905', '市辖', '3', '43904', 'S');
INSERT INTO `ey_region` VALUES ('43914', '金昌市', '2', '43776', 'J');
INSERT INTO `ey_region` VALUES ('43915', '市辖区', '3', '43914', 'S');
INSERT INTO `ey_region` VALUES ('43916', '金川区', '3', '43914', 'J');
INSERT INTO `ey_region` VALUES ('43925', '永昌县', '3', '43914', 'Y');
INSERT INTO `ey_region` VALUES ('43936', '白银市', '2', '43776', 'B');
INSERT INTO `ey_region` VALUES ('43937', '市辖区', '3', '43936', 'S');
INSERT INTO `ey_region` VALUES ('43938', '白银区', '3', '43936', 'B');
INSERT INTO `ey_region` VALUES ('43949', '平川区', '3', '43936', 'P');
INSERT INTO `ey_region` VALUES ('43961', '靖远县', '3', '43936', 'J');
INSERT INTO `ey_region` VALUES ('43980', '会宁县', '3', '43936', 'H');
INSERT INTO `ey_region` VALUES ('44009', '景泰县', '3', '43936', 'J');
INSERT INTO `ey_region` VALUES ('44022', '天水市', '2', '43776', 'T');
INSERT INTO `ey_region` VALUES ('44023', '市辖区', '3', '44022', 'S');
INSERT INTO `ey_region` VALUES ('44024', '秦州区', '3', '44022', 'Q');
INSERT INTO `ey_region` VALUES ('44048', '麦积区', '3', '44022', 'M');
INSERT INTO `ey_region` VALUES ('44069', '清水县', '3', '44022', 'Q');
INSERT INTO `ey_region` VALUES ('44088', '秦安县', '3', '44022', 'Q');
INSERT INTO `ey_region` VALUES ('44106', '甘谷县', '3', '44022', 'G');
INSERT INTO `ey_region` VALUES ('44122', '武山县', '3', '44022', 'W');
INSERT INTO `ey_region` VALUES ('44138', '张家川县', '3', '44022', 'Z');
INSERT INTO `ey_region` VALUES ('44154', '武威市', '2', '43776', 'W');
INSERT INTO `ey_region` VALUES ('44155', '市辖区', '3', '44154', 'S');
INSERT INTO `ey_region` VALUES ('44156', '凉州区', '3', '44154', 'L');
INSERT INTO `ey_region` VALUES ('44202', '民勤县', '3', '44154', 'M');
INSERT INTO `ey_region` VALUES ('44221', '古浪县', '3', '44154', 'G');
INSERT INTO `ey_region` VALUES ('44242', '天祝县', '3', '44154', 'T');
INSERT INTO `ey_region` VALUES ('44265', '张掖市', '2', '43776', 'Z');
INSERT INTO `ey_region` VALUES ('44266', '市辖区', '3', '44265', 'S');
INSERT INTO `ey_region` VALUES ('44267', '甘州区', '3', '44265', 'G');
INSERT INTO `ey_region` VALUES ('44294', '肃南县', '3', '44265', 'S');
INSERT INTO `ey_region` VALUES ('44305', '民乐县', '3', '44265', 'M');
INSERT INTO `ey_region` VALUES ('44317', '临泽县', '3', '44265', 'L');
INSERT INTO `ey_region` VALUES ('44331', '高台县', '3', '44265', 'G');
INSERT INTO `ey_region` VALUES ('44341', '山丹县', '3', '44265', 'S');
INSERT INTO `ey_region` VALUES ('44352', '平凉市', '2', '43776', 'P');
INSERT INTO `ey_region` VALUES ('44353', '市辖区', '3', '44352', 'S');
INSERT INTO `ey_region` VALUES ('44354', '崆峒区', '3', '44352', 'K');
INSERT INTO `ey_region` VALUES ('44375', '泾川县', '3', '44352', 'J');
INSERT INTO `ey_region` VALUES ('44392', '灵台县', '3', '44352', 'L');
INSERT INTO `ey_region` VALUES ('44408', '崇信县', '3', '44352', 'C');
INSERT INTO `ey_region` VALUES ('44418', '华亭县', '3', '44352', 'H');
INSERT INTO `ey_region` VALUES ('44431', '庄浪县', '3', '44352', 'Z');
INSERT INTO `ey_region` VALUES ('44451', '静宁县', '3', '44352', 'J');
INSERT INTO `ey_region` VALUES ('44477', '酒泉市', '2', '43776', 'J');
INSERT INTO `ey_region` VALUES ('44478', '市辖区', '3', '44477', 'S');
INSERT INTO `ey_region` VALUES ('44479', '肃州区', '3', '44477', 'S');
INSERT INTO `ey_region` VALUES ('44504', '金塔县', '3', '44477', 'J');
INSERT INTO `ey_region` VALUES ('44516', '瓜州县', '3', '44477', 'G');
INSERT INTO `ey_region` VALUES ('44531', '肃北县', '3', '44477', 'S');
INSERT INTO `ey_region` VALUES ('44535', '阿克塞县', '3', '44477', 'A');
INSERT INTO `ey_region` VALUES ('44539', '玉门市', '3', '44477', 'Y');
INSERT INTO `ey_region` VALUES ('44557', '敦煌市', '3', '44477', 'D');
INSERT INTO `ey_region` VALUES ('44569', '庆阳市', '2', '43776', 'Q');
INSERT INTO `ey_region` VALUES ('44570', '市辖区', '3', '44569', 'S');
INSERT INTO `ey_region` VALUES ('44571', '西峰区', '3', '44569', 'X');
INSERT INTO `ey_region` VALUES ('44582', '庆城县', '3', '44569', 'Q');
INSERT INTO `ey_region` VALUES ('44598', '环县', '3', '44569', 'H');
INSERT INTO `ey_region` VALUES ('44620', '华池县', '3', '44569', 'H');
INSERT INTO `ey_region` VALUES ('44636', '合水县', '3', '44569', 'H');
INSERT INTO `ey_region` VALUES ('44649', '正宁县', '3', '44569', 'Z');
INSERT INTO `ey_region` VALUES ('44660', '宁县', '3', '44569', 'N');
INSERT INTO `ey_region` VALUES ('44679', '镇原县', '3', '44569', 'Z');
INSERT INTO `ey_region` VALUES ('44699', '定西市', '2', '43776', 'D');
INSERT INTO `ey_region` VALUES ('44700', '市辖区', '3', '44699', 'S');
INSERT INTO `ey_region` VALUES ('44701', '安定区', '3', '44699', 'A');
INSERT INTO `ey_region` VALUES ('44723', '通渭县', '3', '44699', 'T');
INSERT INTO `ey_region` VALUES ('44742', '陇西县', '3', '44699', 'L');
INSERT INTO `ey_region` VALUES ('44760', '渭源县', '3', '44699', 'W');
INSERT INTO `ey_region` VALUES ('44777', '临洮县', '3', '44699', 'L');
INSERT INTO `ey_region` VALUES ('44796', '漳县', '3', '44699', 'Z');
INSERT INTO `ey_region` VALUES ('44810', '岷县', '3', '44699', 'M');
INSERT INTO `ey_region` VALUES ('44829', '陇南市', '2', '43776', 'L');
INSERT INTO `ey_region` VALUES ('44830', '市辖区', '3', '44829', 'S');
INSERT INTO `ey_region` VALUES ('44831', '武都区', '3', '44829', 'W');
INSERT INTO `ey_region` VALUES ('44868', '成县', '3', '44829', 'C');
INSERT INTO `ey_region` VALUES ('44886', '文县', '3', '44829', 'W');
INSERT INTO `ey_region` VALUES ('44907', '宕昌县', '3', '44829', 'D');
INSERT INTO `ey_region` VALUES ('44933', '康县', '3', '44829', 'K');
INSERT INTO `ey_region` VALUES ('44955', '西和县', '3', '44829', 'X');
INSERT INTO `ey_region` VALUES ('44976', '礼县', '3', '44829', 'L');
INSERT INTO `ey_region` VALUES ('45006', '徽县', '3', '44829', 'H');
INSERT INTO `ey_region` VALUES ('45022', '两当县', '3', '44829', 'L');
INSERT INTO `ey_region` VALUES ('45035', '临夏州', '2', '43776', 'L');
INSERT INTO `ey_region` VALUES ('45036', '临夏市', '3', '45035', 'L');
INSERT INTO `ey_region` VALUES ('45047', '临夏县', '3', '45035', 'L');
INSERT INTO `ey_region` VALUES ('45073', '康乐县', '3', '45035', 'K');
INSERT INTO `ey_region` VALUES ('45089', '永靖县', '3', '45035', 'Y');
INSERT INTO `ey_region` VALUES ('45107', '广河县', '3', '45035', 'G');
INSERT INTO `ey_region` VALUES ('45117', '和政县', '3', '45035', 'H');
INSERT INTO `ey_region` VALUES ('45131', '东乡县', '3', '45035', 'D');
INSERT INTO `ey_region` VALUES ('45156', '积石山县', '3', '45035', 'J');
INSERT INTO `ey_region` VALUES ('45174', '甘南州', '2', '43776', 'G');
INSERT INTO `ey_region` VALUES ('45175', '合作市', '3', '45174', 'H');
INSERT INTO `ey_region` VALUES ('45186', '临潭县', '3', '45174', 'L');
INSERT INTO `ey_region` VALUES ('45203', '卓尼县', '3', '45174', 'Z');
INSERT INTO `ey_region` VALUES ('45219', '舟曲县', '3', '45174', 'Z');
INSERT INTO `ey_region` VALUES ('45239', '迭部县', '3', '45174', 'D');
INSERT INTO `ey_region` VALUES ('45251', '玛曲县', '3', '45174', 'M');
INSERT INTO `ey_region` VALUES ('45263', '碌曲县', '3', '45174', 'L');
INSERT INTO `ey_region` VALUES ('45272', '夏河县', '3', '45174', 'X');
INSERT INTO `ey_region` VALUES ('45286', '青海省', '1', '0', 'Q');
INSERT INTO `ey_region` VALUES ('45287', '西宁市', '2', '45286', 'X');
INSERT INTO `ey_region` VALUES ('45288', '市辖区', '3', '45287', 'S');
INSERT INTO `ey_region` VALUES ('45289', '城东区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45299', '城中区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45306', '城西区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45314', '城北区', '3', '45287', 'C');
INSERT INTO `ey_region` VALUES ('45320', '大通县', '3', '45287', 'D');
INSERT INTO `ey_region` VALUES ('45341', '湟中县', '3', '45287', 'H');
INSERT INTO `ey_region` VALUES ('45358', '湟源县', '3', '45287', 'H');
INSERT INTO `ey_region` VALUES ('45368', '海东地区', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45369', '平安县', '3', '45368', 'P');
INSERT INTO `ey_region` VALUES ('45378', '民和县', '3', '45368', 'M');
INSERT INTO `ey_region` VALUES ('45401', '乐都县', '3', '45368', 'L');
INSERT INTO `ey_region` VALUES ('45421', '互助县', '3', '45368', 'H');
INSERT INTO `ey_region` VALUES ('45441', '化隆县', '3', '45368', 'H');
INSERT INTO `ey_region` VALUES ('45461', '循化县', '3', '45368', 'X');
INSERT INTO `ey_region` VALUES ('45471', '海北州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45472', '门源县', '3', '45471', 'M');
INSERT INTO `ey_region` VALUES ('45487', '祁连县', '3', '45471', 'Q');
INSERT INTO `ey_region` VALUES ('45495', '海晏县', '3', '45471', 'H');
INSERT INTO `ey_region` VALUES ('45502', '刚察县', '3', '45471', 'G');
INSERT INTO `ey_region` VALUES ('45510', '黄南州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45511', '同仁县', '3', '45510', 'T');
INSERT INTO `ey_region` VALUES ('45523', '尖扎县', '3', '45510', 'J');
INSERT INTO `ey_region` VALUES ('45533', '泽库县', '3', '45510', 'Z');
INSERT INTO `ey_region` VALUES ('45542', '河南县', '3', '45510', 'H');
INSERT INTO `ey_region` VALUES ('45548', '海南州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45549', '共和县', '3', '45548', 'G');
INSERT INTO `ey_region` VALUES ('45566', '同德县', '3', '45548', 'T');
INSERT INTO `ey_region` VALUES ('45573', '贵德县', '3', '45548', 'G');
INSERT INTO `ey_region` VALUES ('45581', '兴海县', '3', '45548', 'X');
INSERT INTO `ey_region` VALUES ('45589', '贵南县', '3', '45548', 'G');
INSERT INTO `ey_region` VALUES ('45597', '果洛州', '2', '45286', 'G');
INSERT INTO `ey_region` VALUES ('45598', '玛沁县', '3', '45597', 'M');
INSERT INTO `ey_region` VALUES ('45607', '班玛县', '3', '45597', 'B');
INSERT INTO `ey_region` VALUES ('45617', '甘德县', '3', '45597', 'G');
INSERT INTO `ey_region` VALUES ('45625', '达日县', '3', '45597', 'D');
INSERT INTO `ey_region` VALUES ('45636', '久治县', '3', '45597', 'J');
INSERT INTO `ey_region` VALUES ('45643', '玛多县', '3', '45597', 'M');
INSERT INTO `ey_region` VALUES ('45648', '玉树州', '2', '45286', 'Y');
INSERT INTO `ey_region` VALUES ('45649', '玉树县', '3', '45648', 'Y');
INSERT INTO `ey_region` VALUES ('45659', '杂多县', '3', '45648', 'Z');
INSERT INTO `ey_region` VALUES ('45668', '称多县', '3', '45648', 'C');
INSERT INTO `ey_region` VALUES ('45676', '治多县', '3', '45648', 'Z');
INSERT INTO `ey_region` VALUES ('45683', '囊谦县', '3', '45648', 'N');
INSERT INTO `ey_region` VALUES ('45694', '曲麻莱县', '3', '45648', 'Q');
INSERT INTO `ey_region` VALUES ('45701', '海西州', '2', '45286', 'H');
INSERT INTO `ey_region` VALUES ('45702', '格尔木市', '3', '45701', 'G');
INSERT INTO `ey_region` VALUES ('45714', '德令哈市', '3', '45701', 'D');
INSERT INTO `ey_region` VALUES ('45727', '乌兰县', '3', '45701', 'W');
INSERT INTO `ey_region` VALUES ('45733', '都兰县', '3', '45701', 'D');
INSERT INTO `ey_region` VALUES ('45742', '天峻县', '3', '45701', 'T');
INSERT INTO `ey_region` VALUES ('45753', '宁夏', '1', '0', 'N');
INSERT INTO `ey_region` VALUES ('45754', '银川市', '2', '45753', 'Y');
INSERT INTO `ey_region` VALUES ('45755', '市辖区', '3', '45754', 'S');
INSERT INTO `ey_region` VALUES ('45756', '兴庆区', '3', '45754', 'X');
INSERT INTO `ey_region` VALUES ('45772', '西夏区', '3', '45754', 'X');
INSERT INTO `ey_region` VALUES ('45784', '金凤区', '3', '45754', 'J');
INSERT INTO `ey_region` VALUES ('45794', '永宁县', '3', '45754', 'Y');
INSERT INTO `ey_region` VALUES ('45803', '贺兰县', '3', '45754', 'H');
INSERT INTO `ey_region` VALUES ('45813', '灵武市', '3', '45754', 'L');
INSERT INTO `ey_region` VALUES ('45825', '石嘴山市', '2', '45753', 'S');
INSERT INTO `ey_region` VALUES ('45826', '市辖区', '3', '45825', 'S');
INSERT INTO `ey_region` VALUES ('45827', '大武口区', '3', '45825', 'D');
INSERT INTO `ey_region` VALUES ('45839', '惠农区', '3', '45825', 'H');
INSERT INTO `ey_region` VALUES ('45856', '平罗县', '3', '45825', 'P');
INSERT INTO `ey_region` VALUES ('45871', '吴忠市', '2', '45753', 'W');
INSERT INTO `ey_region` VALUES ('45872', '市辖区', '3', '45871', 'S');
INSERT INTO `ey_region` VALUES ('45877', '利通区', '3', '45871', 'L');
INSERT INTO `ey_region` VALUES ('45892', '盐池县', '3', '45871', 'Y');
INSERT INTO `ey_region` VALUES ('45903', '同心县', '3', '45871', 'T');
INSERT INTO `ey_region` VALUES ('45914', '青铜峡市', '3', '45871', 'Q');
INSERT INTO `ey_region` VALUES ('45926', '固原市', '2', '45753', 'G');
INSERT INTO `ey_region` VALUES ('45927', '市辖区', '3', '45926', 'S');
INSERT INTO `ey_region` VALUES ('45928', '原州区', '3', '45926', 'Y');
INSERT INTO `ey_region` VALUES ('45944', '西吉县', '3', '45926', 'X');
INSERT INTO `ey_region` VALUES ('45964', '隆德县', '3', '45926', 'L');
INSERT INTO `ey_region` VALUES ('45978', '泾源县', '3', '45926', 'J');
INSERT INTO `ey_region` VALUES ('45986', '彭阳县', '3', '45926', 'P');
INSERT INTO `ey_region` VALUES ('45999', '中卫市', '2', '45753', 'Z');
INSERT INTO `ey_region` VALUES ('46000', '市辖区', '3', '45999', 'S');
INSERT INTO `ey_region` VALUES ('46012', '沙坡头区', '3', '45999', 'S');
INSERT INTO `ey_region` VALUES ('46013', '中宁县', '3', '45999', 'Z');
INSERT INTO `ey_region` VALUES ('46026', '海原县', '3', '45999', 'H');
INSERT INTO `ey_region` VALUES ('46047', '新疆', '1', '0', 'X');
INSERT INTO `ey_region` VALUES ('46048', '乌鲁木齐市', '2', '46047', 'W');
INSERT INTO `ey_region` VALUES ('46049', '市辖区', '3', '46048', 'S');
INSERT INTO `ey_region` VALUES ('46050', '天山区', '3', '46048', 'T');
INSERT INTO `ey_region` VALUES ('46065', '沙依巴克区', '3', '46048', 'S');
INSERT INTO `ey_region` VALUES ('46079', '新市区', '3', '46048', 'X');
INSERT INTO `ey_region` VALUES ('46095', '水磨沟区', '3', '46048', 'S');
INSERT INTO `ey_region` VALUES ('46104', '头屯河区', '3', '46048', 'T');
INSERT INTO `ey_region` VALUES ('46114', '达坂城区', '3', '46048', 'D');
INSERT INTO `ey_region` VALUES ('46123', '东山区', '3', '46048', 'D');
INSERT INTO `ey_region` VALUES ('46128', '乌鲁木齐县', '3', '46048', 'W');
INSERT INTO `ey_region` VALUES ('46138', '克拉玛依市', '2', '46047', 'K');
INSERT INTO `ey_region` VALUES ('46139', '市辖区', '3', '46138', 'S');
INSERT INTO `ey_region` VALUES ('46140', '独山子区', '3', '46138', 'D');
INSERT INTO `ey_region` VALUES ('46144', '克拉玛依区', '3', '46138', 'K');
INSERT INTO `ey_region` VALUES ('46155', '白碱滩区', '3', '46138', 'B');
INSERT INTO `ey_region` VALUES ('46158', '乌尔禾区', '3', '46138', 'W');
INSERT INTO `ey_region` VALUES ('46162', '吐鲁番地区', '2', '46047', 'T');
INSERT INTO `ey_region` VALUES ('46163', '吐鲁番市', '3', '46162', 'T');
INSERT INTO `ey_region` VALUES ('46178', '鄯善县', '3', '46162', 'S');
INSERT INTO `ey_region` VALUES ('46189', '托克逊县', '3', '46162', 'T');
INSERT INTO `ey_region` VALUES ('46197', '哈密地区', '2', '46047', 'H');
INSERT INTO `ey_region` VALUES ('46198', '哈密市', '3', '46197', 'H');
INSERT INTO `ey_region` VALUES ('46230', '巴里坤县', '3', '46197', 'B');
INSERT INTO `ey_region` VALUES ('46246', '伊吾县', '3', '46197', 'Y');
INSERT INTO `ey_region` VALUES ('46255', '昌吉州', '2', '46047', 'C');
INSERT INTO `ey_region` VALUES ('46256', '昌吉市', '3', '46255', 'C');
INSERT INTO `ey_region` VALUES ('46275', '阜康市', '3', '46255', 'F');
INSERT INTO `ey_region` VALUES ('46289', '米泉市', '3', '46255', 'M');
INSERT INTO `ey_region` VALUES ('46299', '呼图壁县', '3', '46255', 'H');
INSERT INTO `ey_region` VALUES ('46316', '玛纳斯', '3', '46255', 'M');
INSERT INTO `ey_region` VALUES ('46337', '奇台县', '3', '46255', 'Q');
INSERT INTO `ey_region` VALUES ('46355', '吉木萨尔县', '3', '46255', 'J');
INSERT INTO `ey_region` VALUES ('46366', '木垒县', '3', '46255', 'M');
INSERT INTO `ey_region` VALUES ('46380', '博州', '2', '46047', 'B');
INSERT INTO `ey_region` VALUES ('46381', '博乐市', '3', '46380', 'B');
INSERT INTO `ey_region` VALUES ('46399', '精河县', '3', '46380', 'J');
INSERT INTO `ey_region` VALUES ('46410', '温泉县', '3', '46380', 'W');
INSERT INTO `ey_region` VALUES ('46422', '巴州', '2', '46047', 'B');
INSERT INTO `ey_region` VALUES ('46423', '库尔勒市', '3', '46422', 'K');
INSERT INTO `ey_region` VALUES ('46451', '轮台县', '3', '46422', 'L');
INSERT INTO `ey_region` VALUES ('46463', '尉犁县', '3', '46422', 'W');
INSERT INTO `ey_region` VALUES ('46476', '若羌县', '3', '46422', 'R');
INSERT INTO `ey_region` VALUES ('46486', '且末县', '3', '46422', 'Q');
INSERT INTO `ey_region` VALUES ('46500', '焉耆县', '3', '46422', 'Y');
INSERT INTO `ey_region` VALUES ('46512', '和静县', '3', '46422', 'H');
INSERT INTO `ey_region` VALUES ('46531', '和硕县', '3', '46422', 'H');
INSERT INTO `ey_region` VALUES ('46542', '博湖县', '3', '46422', 'B');
INSERT INTO `ey_region` VALUES ('46551', '阿克苏地区', '2', '46047', 'A');
INSERT INTO `ey_region` VALUES ('46552', '阿克苏市', '3', '46551', 'A');
INSERT INTO `ey_region` VALUES ('46571', '温宿县', '3', '46551', 'W');
INSERT INTO `ey_region` VALUES ('46592', '库车县', '3', '46551', 'K');
INSERT INTO `ey_region` VALUES ('46617', '沙雅县', '3', '46551', 'S');
INSERT INTO `ey_region` VALUES ('46630', '新和县', '3', '46551', 'X');
INSERT INTO `ey_region` VALUES ('46640', '拜城县', '3', '46551', 'B');
INSERT INTO `ey_region` VALUES ('46657', '乌什县', '3', '46551', 'W');
INSERT INTO `ey_region` VALUES ('46668', '阿瓦提县', '3', '46551', 'A');
INSERT INTO `ey_region` VALUES ('46682', '柯坪县', '3', '46551', 'K');
INSERT INTO `ey_region` VALUES ('46688', '克州', '2', '46047', 'K');
INSERT INTO `ey_region` VALUES ('46689', '阿图什市', '3', '46688', 'A');
INSERT INTO `ey_region` VALUES ('46704', '阿克陶县', '3', '46688', 'A');
INSERT INTO `ey_region` VALUES ('46723', '阿合奇县', '3', '46688', 'A');
INSERT INTO `ey_region` VALUES ('46733', '乌恰县', '3', '46688', 'W');
INSERT INTO `ey_region` VALUES ('46747', '喀什地区', '2', '46047', 'K');
INSERT INTO `ey_region` VALUES ('46748', '喀什市', '3', '46747', 'K');
INSERT INTO `ey_region` VALUES ('46761', '疏附县', '3', '46747', 'S');
INSERT INTO `ey_region` VALUES ('46780', '疏勒县', '3', '46747', 'S');
INSERT INTO `ey_region` VALUES ('46797', '英吉沙县', '3', '46747', 'Y');
INSERT INTO `ey_region` VALUES ('46813', '泽普县', '3', '46747', 'Z');
INSERT INTO `ey_region` VALUES ('46830', '莎车县', '3', '46747', 'S');
INSERT INTO `ey_region` VALUES ('46863', '叶城县', '3', '46747', 'Y');
INSERT INTO `ey_region` VALUES ('46885', '麦盖提县', '3', '46747', 'M');
INSERT INTO `ey_region` VALUES ('46902', '岳普湖县', '3', '46747', 'Y');
INSERT INTO `ey_region` VALUES ('46913', '伽师县', '3', '46747', 'Q');
INSERT INTO `ey_region` VALUES ('46928', '巴楚县', '3', '46747', 'B');
INSERT INTO `ey_region` VALUES ('46942', '塔什库尔干县', '3', '46747', 'T');
INSERT INTO `ey_region` VALUES ('46957', '和田地区', '2', '46047', 'H');
INSERT INTO `ey_region` VALUES ('46958', '和田市', '3', '46957', 'H');
INSERT INTO `ey_region` VALUES ('46971', '和田县', '3', '46957', 'H');
INSERT INTO `ey_region` VALUES ('46983', '墨玉县', '3', '46957', 'M');
INSERT INTO `ey_region` VALUES ('47002', '皮山县', '3', '46957', 'P');
INSERT INTO `ey_region` VALUES ('47020', '洛浦县', '3', '46957', 'L');
INSERT INTO `ey_region` VALUES ('47032', '策勒县', '3', '46957', 'C');
INSERT INTO `ey_region` VALUES ('47042', '于田县', '3', '46957', 'Y');
INSERT INTO `ey_region` VALUES ('47061', '民丰县', '3', '46957', 'M');
INSERT INTO `ey_region` VALUES ('47069', '伊犁州', '2', '46047', 'Y');
INSERT INTO `ey_region` VALUES ('47070', '伊宁市', '3', '47069', 'Y');
INSERT INTO `ey_region` VALUES ('47091', '奎屯市', '3', '47069', 'K');
INSERT INTO `ey_region` VALUES ('47099', '伊宁县', '3', '47069', 'Y');
INSERT INTO `ey_region` VALUES ('47121', '察布查尔县', '3', '47069', 'C');
INSERT INTO `ey_region` VALUES ('47143', '霍城县', '3', '47069', 'H');
INSERT INTO `ey_region` VALUES ('47164', '巩留县', '3', '47069', 'G');
INSERT INTO `ey_region` VALUES ('47180', '新源县', '3', '47069', 'X');
INSERT INTO `ey_region` VALUES ('47196', '昭苏县', '3', '47069', 'Z');
INSERT INTO `ey_region` VALUES ('47214', '特克斯县', '3', '47069', 'T');
INSERT INTO `ey_region` VALUES ('47226', '尼勒克县', '3', '47069', 'N');
INSERT INTO `ey_region` VALUES ('47241', '塔城地区', '2', '46047', 'T');
INSERT INTO `ey_region` VALUES ('47242', '塔城市', '3', '47241', 'T');
INSERT INTO `ey_region` VALUES ('47258', '乌苏市', '3', '47241', 'W');
INSERT INTO `ey_region` VALUES ('47291', '额敏县', '3', '47241', 'E');
INSERT INTO `ey_region` VALUES ('47315', '沙湾县', '3', '47241', 'S');
INSERT INTO `ey_region` VALUES ('47338', '托里县', '3', '47241', 'T');
INSERT INTO `ey_region` VALUES ('47351', '裕民县', '3', '47241', 'Y');
INSERT INTO `ey_region` VALUES ('47360', '和布县', '3', '47241', 'H');
INSERT INTO `ey_region` VALUES ('47374', '阿勒泰地区', '2', '46047', 'A');
INSERT INTO `ey_region` VALUES ('47375', '阿勒泰市', '3', '47374', 'A');
INSERT INTO `ey_region` VALUES ('47393', '布尔津县', '3', '47374', 'B');
INSERT INTO `ey_region` VALUES ('47401', '富蕴县', '3', '47374', 'F');
INSERT INTO `ey_region` VALUES ('47411', '福海县', '3', '47374', 'F');
INSERT INTO `ey_region` VALUES ('47424', '哈巴河县', '3', '47374', 'H');
INSERT INTO `ey_region` VALUES ('47433', '青河县', '3', '47374', 'Q');
INSERT INTO `ey_region` VALUES ('47441', '吉木乃县', '3', '47374', 'J');
INSERT INTO `ey_region` VALUES ('47450', '省直辖行政单位', '2', '46047', 'S');
INSERT INTO `ey_region` VALUES ('47451', '石河子市', '3', '47450', 'S');
INSERT INTO `ey_region` VALUES ('47460', '阿拉尔市', '3', '47450', 'A');
INSERT INTO `ey_region` VALUES ('47477', '图木舒克市', '3', '47450', 'T');
INSERT INTO `ey_region` VALUES ('47486', '五家渠市', '3', '47450', 'W');
INSERT INTO `ey_region` VALUES ('47493', '台湾', '1', '0', 'T');
INSERT INTO `ey_region` VALUES ('47494', '香港', '1', '0', 'X');
INSERT INTO `ey_region` VALUES ('47495', '澳门', '1', '0', 'A');
INSERT INTO `ey_region` VALUES ('47496', '龙华新区', '3', '28558', 'L');
INSERT INTO `ey_region` VALUES ('47497', '光明新区', '3', '28558', 'G');
INSERT INTO `ey_region` VALUES ('47500', '新界', '2', '47494', 'X');
INSERT INTO `ey_region` VALUES ('47501', '观塘区', '3', '47498', 'G');
INSERT INTO `ey_region` VALUES ('47502', '黄大仙区', '3', '47498', 'H');
INSERT INTO `ey_region` VALUES ('47503', '九龙城区', '3', '47498', 'J');
INSERT INTO `ey_region` VALUES ('47504', '深水埗区', '3', '47498', 'S');
INSERT INTO `ey_region` VALUES ('47505', '油尖旺区', '3', '47498', 'Y');
INSERT INTO `ey_region` VALUES ('47506', '东区', '3', '47499', 'D');
INSERT INTO `ey_region` VALUES ('47507', '南区', '3', '47499', 'N');
INSERT INTO `ey_region` VALUES ('47508', '湾仔', '3', '47499', 'W');
INSERT INTO `ey_region` VALUES ('47509', '中西区', '3', '47499', 'Z');
INSERT INTO `ey_region` VALUES ('47510', '北区', '3', '47500', 'B');
INSERT INTO `ey_region` VALUES ('47511', '大埔区', '3', '47500', 'D');
INSERT INTO `ey_region` VALUES ('47512', '葵青区', '3', '47500', 'K');
INSERT INTO `ey_region` VALUES ('47513', '离岛区', '3', '47500', 'L');
INSERT INTO `ey_region` VALUES ('47514', '荃湾区', '3', '47500', 'Q');
INSERT INTO `ey_region` VALUES ('47515', '沙田区', '3', '47500', 'S');
INSERT INTO `ey_region` VALUES ('47516', '屯门区', '3', '47500', 'T');
INSERT INTO `ey_region` VALUES ('47517', '西贡区', '3', '47500', 'X');
INSERT INTO `ey_region` VALUES ('47518', '元朗区', '3', '47500', 'Y');
INSERT INTO `ey_region` VALUES ('47519', '澳门半岛', '2', '47495', 'A');
INSERT INTO `ey_region` VALUES ('47520', '离岛', '2', '47495', 'L');
INSERT INTO `ey_region` VALUES ('47521', '大堂区', '3', '47519', 'D');
INSERT INTO `ey_region` VALUES ('47522', '风顺堂区', '3', '47519', 'F');
INSERT INTO `ey_region` VALUES ('47523', '花地玛堂区', '3', '47519', 'H');
INSERT INTO `ey_region` VALUES ('47524', '花王堂区', '3', '47519', 'H');
INSERT INTO `ey_region` VALUES ('47525', '望德堂区', '3', '47519', 'W');
INSERT INTO `ey_region` VALUES ('47526', '嘉模堂区', '3', '47520', 'J');
INSERT INTO `ey_region` VALUES ('47527', '路氹填海区', '3', '47520', 'L');
INSERT INTO `ey_region` VALUES ('47528', '圣方济各堂区', '3', '47520', 'S');
INSERT INTO `ey_region` VALUES ('47529', '高雄市', '2', '47493', 'G');
INSERT INTO `ey_region` VALUES ('47530', '花莲县', '2', '47493', 'H');
INSERT INTO `ey_region` VALUES ('47531', '基隆市', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47532', '嘉义市', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47533', '嘉义县', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47534', '金门县', '2', '47493', 'J');
INSERT INTO `ey_region` VALUES ('47535', '连江县', '2', '47493', 'L');
INSERT INTO `ey_region` VALUES ('47536', '苗栗县', '2', '47493', 'M');
INSERT INTO `ey_region` VALUES ('47537', '南投县', '2', '47493', 'N');
INSERT INTO `ey_region` VALUES ('47538', '澎湖县', '2', '47493', 'P');
INSERT INTO `ey_region` VALUES ('47539', '屏东县', '2', '47493', 'P');
INSERT INTO `ey_region` VALUES ('47540', '台北市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47541', '台东县', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47542', '台南市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47543', '台中市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47544', '桃园市', '2', '47493', 'T');
INSERT INTO `ey_region` VALUES ('47545', '新北市', '2', '47493', 'X');
INSERT INTO `ey_region` VALUES ('47546', '新竹市', '2', '47493', 'X');
INSERT INTO `ey_region` VALUES ('47547', '新竹县', '2', '47493', 'X');
INSERT INTO `ey_region` VALUES ('47548', '宜兰县', '2', '47493', 'Y');
INSERT INTO `ey_region` VALUES ('47549', '云林县', '2', '47493', 'Y');
INSERT INTO `ey_region` VALUES ('47550', '彰化县', '2', '47493', 'Z');
INSERT INTO `ey_region` VALUES ('47551', '阿莲区', '3', '47529', 'A');
INSERT INTO `ey_region` VALUES ('47552', '大寮区', '3', '47529', 'D');
INSERT INTO `ey_region` VALUES ('47553', '大社区', '3', '47529', 'D');
INSERT INTO `ey_region` VALUES ('47554', '大树区', '3', '47529', 'D');
INSERT INTO `ey_region` VALUES ('47555', '凤山区', '3', '47529', 'F');
INSERT INTO `ey_region` VALUES ('47556', '冈山区', '3', '47529', 'G');
INSERT INTO `ey_region` VALUES ('47557', '鼓山区', '3', '47529', 'G');
INSERT INTO `ey_region` VALUES ('47558', '湖内区', '3', '47529', 'H');
INSERT INTO `ey_region` VALUES ('47559', '甲仙区', '3', '47529', 'J');
INSERT INTO `ey_region` VALUES ('47560', '林园区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47561', '苓雅区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47562', '六龟区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47563', '路竹区', '3', '47529', 'L');
INSERT INTO `ey_region` VALUES ('47564', '茂林区', '3', '47529', 'M');
INSERT INTO `ey_region` VALUES ('47565', '美浓区', '3', '47529', 'M');
INSERT INTO `ey_region` VALUES ('47566', '弥陀区', '3', '47529', 'M');
INSERT INTO `ey_region` VALUES ('47567', '楠梓区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47568', '那玛夏区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47569', '内门区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47570', '鸟松区', '3', '47529', 'N');
INSERT INTO `ey_region` VALUES ('47571', '旗津区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47572', '旗门区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47573', '其它区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47574', '前金区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47575', '前镇区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47576', '桥头区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47577', '茄萣区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47578', '芩雅区', '3', '47529', 'Q');
INSERT INTO `ey_region` VALUES ('47579', '仁武区', '3', '47529', 'R');
INSERT INTO `ey_region` VALUES ('47580', '三民区', '3', '47529', 'S');
INSERT INTO `ey_region` VALUES ('47581', '杉林区', '3', '47529', 'S');
INSERT INTO `ey_region` VALUES ('47582', '桃源区', '3', '47529', 'T');
INSERT INTO `ey_region` VALUES ('47583', '田寮区', '3', '47529', 'T');
INSERT INTO `ey_region` VALUES ('47584', '小港区', '3', '47529', 'X');
INSERT INTO `ey_region` VALUES ('47585', '新兴区', '3', '47529', 'X');
INSERT INTO `ey_region` VALUES ('47586', '燕巢区', '3', '47529', 'Y');
INSERT INTO `ey_region` VALUES ('47587', '盐埕区', '3', '47529', 'Y');
INSERT INTO `ey_region` VALUES ('47588', '永安区', '3', '47529', 'Y');
INSERT INTO `ey_region` VALUES ('47589', '梓官区', '3', '47529', 'Z');
INSERT INTO `ey_region` VALUES ('47590', '左营区', '3', '47529', 'Z');
INSERT INTO `ey_region` VALUES ('47591', '丰滨乡', '3', '47530', 'F');
INSERT INTO `ey_region` VALUES ('47592', '凤林镇', '3', '47530', 'F');
INSERT INTO `ey_region` VALUES ('47593', '富里乡', '3', '47530', 'F');
INSERT INTO `ey_region` VALUES ('47594', '光复乡', '3', '47530', 'G');
INSERT INTO `ey_region` VALUES ('47595', '花莲市', '3', '47530', 'H');
INSERT INTO `ey_region` VALUES ('47596', '吉安乡', '3', '47530', 'J');
INSERT INTO `ey_region` VALUES ('47597', '瑞穗乡', '3', '47530', 'R');
INSERT INTO `ey_region` VALUES ('47598', '寿丰乡', '3', '47530', 'S');
INSERT INTO `ey_region` VALUES ('47599', '太鲁阁', '3', '47530', 'T');
INSERT INTO `ey_region` VALUES ('47600', '万荣乡', '3', '47530', 'W');
INSERT INTO `ey_region` VALUES ('47601', '新城乡', '3', '47530', 'X');
INSERT INTO `ey_region` VALUES ('47602', '秀林乡', '3', '47530', 'X');
INSERT INTO `ey_region` VALUES ('47603', '玉里镇', '3', '47530', 'Y');
INSERT INTO `ey_region` VALUES ('47604', '卓溪乡', '3', '47530', 'Z');
INSERT INTO `ey_region` VALUES ('47605', '安乐区', '3', '47531', 'A');
INSERT INTO `ey_region` VALUES ('47606', '暖暖区', '3', '47531', 'N');
INSERT INTO `ey_region` VALUES ('47607', '七堵区', '3', '47531', 'Q');
INSERT INTO `ey_region` VALUES ('47608', '其它区', '3', '47531', 'Q');
INSERT INTO `ey_region` VALUES ('47609', '仁爱区', '3', '47531', 'R');
INSERT INTO `ey_region` VALUES ('47610', '信义区', '3', '47531', 'X');
INSERT INTO `ey_region` VALUES ('47611', '中山区', '3', '47531', 'Z');
INSERT INTO `ey_region` VALUES ('47612', '中正区', '3', '47531', 'Z');
INSERT INTO `ey_region` VALUES ('47613', '东区', '3', '47532', 'D');
INSERT INTO `ey_region` VALUES ('47614', '西区', '3', '47532', 'X');
INSERT INTO `ey_region` VALUES ('47615', '其它区', '3', '47532', 'Q');
INSERT INTO `ey_region` VALUES ('47616', '阿里山乡', '3', '47533', 'A');
INSERT INTO `ey_region` VALUES ('47617', '布袋镇', '3', '47533', 'B');
INSERT INTO `ey_region` VALUES ('47618', '大林镇', '3', '47533', 'D');
INSERT INTO `ey_region` VALUES ('47619', '大埔乡', '3', '47533', 'D');
INSERT INTO `ey_region` VALUES ('47620', '东石乡', '3', '47533', 'D');
INSERT INTO `ey_region` VALUES ('47621', '番路乡', '3', '47533', 'F');
INSERT INTO `ey_region` VALUES ('47622', '六脚乡', '3', '47533', 'L');
INSERT INTO `ey_region` VALUES ('47623', '鹿草乡', '3', '47533', 'L');
INSERT INTO `ey_region` VALUES ('47624', '梅山乡', '3', '47533', 'M');
INSERT INTO `ey_region` VALUES ('47625', '民雄乡', '3', '47533', 'M');
INSERT INTO `ey_region` VALUES ('47626', '朴子市', '3', '47533', 'P');
INSERT INTO `ey_region` VALUES ('47627', '水上乡', '3', '47533', 'S');
INSERT INTO `ey_region` VALUES ('47628', '太保市', '3', '47533', 'T');
INSERT INTO `ey_region` VALUES ('47629', '溪口乡', '3', '47533', 'X');
INSERT INTO `ey_region` VALUES ('47630', '新港乡', '3', '47533', 'X');
INSERT INTO `ey_region` VALUES ('47631', '义竹乡', '3', '47533', 'Y');
INSERT INTO `ey_region` VALUES ('47632', '中埔乡', '3', '47533', 'Z');
INSERT INTO `ey_region` VALUES ('47633', '竹崎乡', '3', '47533', 'Z');
INSERT INTO `ey_region` VALUES ('47634', '金城镇', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47635', '金湖镇', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47636', '金宁乡', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47637', '金沙镇', '3', '47534', 'J');
INSERT INTO `ey_region` VALUES ('47638', '烈屿乡', '3', '47534', 'L');
INSERT INTO `ey_region` VALUES ('47639', '乌邱乡', '3', '47534', 'W');
INSERT INTO `ey_region` VALUES ('47640', '北竿乡', '3', '47535', 'B');
INSERT INTO `ey_region` VALUES ('47641', '东引乡', '3', '47535', 'D');
INSERT INTO `ey_region` VALUES ('47642', '莒光乡', '3', '47535', 'J');
INSERT INTO `ey_region` VALUES ('47643', '南竿乡', '3', '47535', 'N');
INSERT INTO `ey_region` VALUES ('47644', '大湖乡', '3', '47536', 'D');
INSERT INTO `ey_region` VALUES ('47645', '公馆乡', '3', '47536', 'G');
INSERT INTO `ey_region` VALUES ('47646', '后龙镇', '3', '47536', 'H');
INSERT INTO `ey_region` VALUES ('47647', '苗栗市', '3', '47536', 'M');
INSERT INTO `ey_region` VALUES ('47648', '南庄乡', '3', '47536', 'N');
INSERT INTO `ey_region` VALUES ('47649', '三湾乡', '3', '47536', 'S');
INSERT INTO `ey_region` VALUES ('47650', '三义乡', '3', '47536', 'S');
INSERT INTO `ey_region` VALUES ('47651', '狮潭乡', '3', '47536', 'S');
INSERT INTO `ey_region` VALUES ('47652', '泰安乡', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47653', '铜锣乡', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47654', '通宵镇', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47655', '头份镇', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47656', '头屋乡', '3', '47536', 'T');
INSERT INTO `ey_region` VALUES ('47657', '西湖乡', '3', '47536', 'X');
INSERT INTO `ey_region` VALUES ('47658', '苑里镇', '3', '47536', 'Y');
INSERT INTO `ey_region` VALUES ('47659', '造桥乡', '3', '47536', 'Z');
INSERT INTO `ey_region` VALUES ('47660', '竹南镇', '3', '47536', 'Z');
INSERT INTO `ey_region` VALUES ('47661', '卓兰镇', '3', '47536', 'Z');
INSERT INTO `ey_region` VALUES ('47662', '草屯镇', '3', '47537', 'C');
INSERT INTO `ey_region` VALUES ('47663', '国姓乡', '3', '47537', 'G');
INSERT INTO `ey_region` VALUES ('47664', '集集镇', '3', '47537', 'J');
INSERT INTO `ey_region` VALUES ('47665', '鹿谷乡', '3', '47537', 'L');
INSERT INTO `ey_region` VALUES ('47666', '名间乡', '3', '47537', 'M');
INSERT INTO `ey_region` VALUES ('47667', '南投市', '3', '47537', 'N');
INSERT INTO `ey_region` VALUES ('47668', '埔里镇', '3', '47537', 'P');
INSERT INTO `ey_region` VALUES ('47669', '仁爱乡', '3', '47537', 'R');
INSERT INTO `ey_region` VALUES ('47670', '水里乡', '3', '47537', 'S');
INSERT INTO `ey_region` VALUES ('47671', '信义乡', '3', '47537', 'X');
INSERT INTO `ey_region` VALUES ('47672', '鱼池乡', '3', '47537', 'Y');
INSERT INTO `ey_region` VALUES ('47673', '中寮乡', '3', '47537', 'Z');
INSERT INTO `ey_region` VALUES ('47674', '竹山镇', '3', '47537', 'Z');
INSERT INTO `ey_region` VALUES ('47675', '白沙乡', '3', '47538', 'B');
INSERT INTO `ey_region` VALUES ('47676', '湖西乡', '3', '47538', 'H');
INSERT INTO `ey_region` VALUES ('47677', '马公市', '3', '47538', 'M');
INSERT INTO `ey_region` VALUES ('47678', '七美乡', '3', '47538', 'Q');
INSERT INTO `ey_region` VALUES ('47679', '望安乡', '3', '47538', 'W');
INSERT INTO `ey_region` VALUES ('47680', '西屿乡', '3', '47538', 'X');
INSERT INTO `ey_region` VALUES ('47681', '长治乡', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47682', '潮州镇', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47683', '车城乡', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47684', '春日乡', '3', '47539', 'C');
INSERT INTO `ey_region` VALUES ('47685', '东港镇', '3', '47539', 'D');
INSERT INTO `ey_region` VALUES ('47686', '枋寮乡', '3', '47539', 'F');
INSERT INTO `ey_region` VALUES ('47687', '枋山乡', '3', '47539', 'F');
INSERT INTO `ey_region` VALUES ('47688', '高树乡', '3', '47539', 'G');
INSERT INTO `ey_region` VALUES ('47689', '恒春镇', '3', '47539', 'H');
INSERT INTO `ey_region` VALUES ('47690', '佳冬乡', '3', '47539', 'J');
INSERT INTO `ey_region` VALUES ('47691', '九如乡', '3', '47539', 'J');
INSERT INTO `ey_region` VALUES ('47692', '崁顶乡', '3', '47539', 'K');
INSERT INTO `ey_region` VALUES ('47693', '来义乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47694', '里港乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47695', '林边乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47696', '麟洛乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47697', '琉球乡', '3', '47539', 'L');
INSERT INTO `ey_region` VALUES ('47698', '玛家乡', '3', '47539', 'M');
INSERT INTO `ey_region` VALUES ('47699', '满州乡', '3', '47539', 'M');
INSERT INTO `ey_region` VALUES ('47700', '牡丹乡', '3', '47539', 'M');
INSERT INTO `ey_region` VALUES ('47701', '南州乡', '3', '47539', 'N');
INSERT INTO `ey_region` VALUES ('47702', '内埔乡', '3', '47539', 'N');
INSERT INTO `ey_region` VALUES ('47703', '屏东市', '3', '47539', 'P');
INSERT INTO `ey_region` VALUES ('47704', '三地门乡', '3', '47539', 'S');
INSERT INTO `ey_region` VALUES ('47705', '狮子乡', '3', '47539', 'S');
INSERT INTO `ey_region` VALUES ('47706', '泰武乡', '3', '47539', 'T');
INSERT INTO `ey_region` VALUES ('47707', '万丹乡', '3', '47539', 'W');
INSERT INTO `ey_region` VALUES ('47708', '万峦乡', '3', '47539', 'W');
INSERT INTO `ey_region` VALUES ('47709', '雾台乡', '3', '47539', 'W');
INSERT INTO `ey_region` VALUES ('47710', '新埤乡', '3', '47539', 'X');
INSERT INTO `ey_region` VALUES ('47711', '新园乡', '3', '47539', 'X');
INSERT INTO `ey_region` VALUES ('47712', '盐埔乡', '3', '47539', 'Y');
INSERT INTO `ey_region` VALUES ('47713', '竹田乡', '3', '47539', 'Z');
INSERT INTO `ey_region` VALUES ('47714', '北投区', '3', '47540', 'B');
INSERT INTO `ey_region` VALUES ('47715', '大安区', '3', '47540', 'D');
INSERT INTO `ey_region` VALUES ('47716', '大同区', '3', '47540', 'D');
INSERT INTO `ey_region` VALUES ('47717', '南港区', '3', '47540', 'N');
INSERT INTO `ey_region` VALUES ('47718', '内湖区', '3', '47540', 'N');
INSERT INTO `ey_region` VALUES ('47719', '士林区', '3', '47540', 'S');
INSERT INTO `ey_region` VALUES ('47720', '松山区', '3', '47540', 'S');
INSERT INTO `ey_region` VALUES ('47721', '万华区', '3', '47540', 'W');
INSERT INTO `ey_region` VALUES ('47722', '文山区', '3', '47540', 'W');
INSERT INTO `ey_region` VALUES ('47723', '信义区', '3', '47540', 'X');
INSERT INTO `ey_region` VALUES ('47724', '中山区', '3', '47540', 'Z');
INSERT INTO `ey_region` VALUES ('47725', '中正区', '3', '47540', 'Z');
INSERT INTO `ey_region` VALUES ('47726', '其它区', '3', '47540', 'Q');
INSERT INTO `ey_region` VALUES ('47727', '卑南乡', '3', '47541', 'B');
INSERT INTO `ey_region` VALUES ('47728', '长滨乡', '3', '47541', 'C');
INSERT INTO `ey_region` VALUES ('47729', '成功镇', '3', '47541', 'C');
INSERT INTO `ey_region` VALUES ('47730', '池上乡', '3', '47541', 'C');
INSERT INTO `ey_region` VALUES ('47731', '达仁乡', '3', '47541', 'D');
INSERT INTO `ey_region` VALUES ('47732', '大武乡', '3', '47541', 'D');
INSERT INTO `ey_region` VALUES ('47733', '东河乡', '3', '47541', 'D');
INSERT INTO `ey_region` VALUES ('47734', '关山镇', '3', '47541', 'G');
INSERT INTO `ey_region` VALUES ('47735', '海端乡', '3', '47541', 'H');
INSERT INTO `ey_region` VALUES ('47736', '金峰乡', '3', '47541', 'J');
INSERT INTO `ey_region` VALUES ('47737', '兰屿乡', '3', '47541', 'L');
INSERT INTO `ey_region` VALUES ('47738', '鹿野乡', '3', '47541', 'L');
INSERT INTO `ey_region` VALUES ('47739', '绿岛乡', '3', '47541', 'L');
INSERT INTO `ey_region` VALUES ('47740', '台东市', '3', '47541', 'T');
INSERT INTO `ey_region` VALUES ('47741', '太麻里乡', '3', '47541', 'T');
INSERT INTO `ey_region` VALUES ('47742', '延平乡', '3', '47541', 'Y');
INSERT INTO `ey_region` VALUES ('47743', '中西区', '3', '47542', 'Z');
INSERT INTO `ey_region` VALUES ('47744', '东区', '3', '47542', 'D');
INSERT INTO `ey_region` VALUES ('47745', '南区', '3', '47542', 'N');
INSERT INTO `ey_region` VALUES ('47746', '北区', '3', '47542', 'B');
INSERT INTO `ey_region` VALUES ('47747', '安平区', '3', '47542', 'A');
INSERT INTO `ey_region` VALUES ('47748', '安南区', '3', '47542', 'A');
INSERT INTO `ey_region` VALUES ('47749', '其它区', '3', '47542', 'Q');
INSERT INTO `ey_region` VALUES ('47750', '永康区', '3', '47542', 'Y');
INSERT INTO `ey_region` VALUES ('47751', '归仁区', '3', '47542', 'G');
INSERT INTO `ey_region` VALUES ('47752', '新化区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47753', '左镇区', '3', '47542', 'Z');
INSERT INTO `ey_region` VALUES ('47754', '玉井区', '3', '47542', 'Y');
INSERT INTO `ey_region` VALUES ('47755', '楠西区', '3', '47542', 'N');
INSERT INTO `ey_region` VALUES ('47756', '南化区', '3', '47542', 'N');
INSERT INTO `ey_region` VALUES ('47757', '仁德区', '3', '47542', 'R');
INSERT INTO `ey_region` VALUES ('47758', '关庙区', '3', '47542', 'G');
INSERT INTO `ey_region` VALUES ('47759', '龙崎区', '3', '47542', 'L');
INSERT INTO `ey_region` VALUES ('47760', '官田区', '3', '47542', 'G');
INSERT INTO `ey_region` VALUES ('47761', '麻豆区', '3', '47542', 'M');
INSERT INTO `ey_region` VALUES ('47762', '佳里区', '3', '47542', 'J');
INSERT INTO `ey_region` VALUES ('47763', '西港区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47764', '七股区', '3', '47542', 'Q');
INSERT INTO `ey_region` VALUES ('47765', '将军区', '3', '47542', 'J');
INSERT INTO `ey_region` VALUES ('47766', '学甲区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47767', '北门区', '3', '47542', 'B');
INSERT INTO `ey_region` VALUES ('47768', '新营区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47769', '后壁区', '3', '47542', 'H');
INSERT INTO `ey_region` VALUES ('47770', '白河区', '3', '47542', 'B');
INSERT INTO `ey_region` VALUES ('47771', '东山区', '3', '47542', 'D');
INSERT INTO `ey_region` VALUES ('47772', '六甲区', '3', '47542', 'L');
INSERT INTO `ey_region` VALUES ('47773', '下营区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47774', '柳营区', '3', '47542', 'L');
INSERT INTO `ey_region` VALUES ('47775', '盐水区', '3', '47542', 'Y');
INSERT INTO `ey_region` VALUES ('47776', '善化区', '3', '47542', 'S');
INSERT INTO `ey_region` VALUES ('47777', '大内区', '3', '47542', 'D');
INSERT INTO `ey_region` VALUES ('47778', '山上区', '3', '47542', 'S');
INSERT INTO `ey_region` VALUES ('47779', '新市区', '3', '47542', 'X');
INSERT INTO `ey_region` VALUES ('47780', '安定区', '3', '47542', 'A');
INSERT INTO `ey_region` VALUES ('47781', '中区', '3', '47543', 'Z');
INSERT INTO `ey_region` VALUES ('47782', '东区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47783', '南区', '3', '47543', 'N');
INSERT INTO `ey_region` VALUES ('47784', '西区', '3', '47543', 'X');
INSERT INTO `ey_region` VALUES ('47785', '北区', '3', '47543', 'B');
INSERT INTO `ey_region` VALUES ('47786', '北屯区', '3', '47543', 'B');
INSERT INTO `ey_region` VALUES ('47787', '西屯区', '3', '47543', 'X');
INSERT INTO `ey_region` VALUES ('47788', '南屯区', '3', '47543', 'N');
INSERT INTO `ey_region` VALUES ('47789', '其它区', '3', '47543', 'Q');
INSERT INTO `ey_region` VALUES ('47790', '太平区', '3', '47543', 'T');
INSERT INTO `ey_region` VALUES ('47791', '大里区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47792', '雾峰区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47793', '乌日区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47794', '丰原区', '3', '47543', 'F');
INSERT INTO `ey_region` VALUES ('47795', '后里区', '3', '47543', 'H');
INSERT INTO `ey_region` VALUES ('47796', '石冈区', '3', '47543', 'S');
INSERT INTO `ey_region` VALUES ('47797', '东势区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47798', '和平区', '3', '47543', 'H');
INSERT INTO `ey_region` VALUES ('47799', '新社区', '3', '47543', 'X');
INSERT INTO `ey_region` VALUES ('47800', '潭子区', '3', '47543', 'T');
INSERT INTO `ey_region` VALUES ('47801', '大雅区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47802', '神冈区', '3', '47543', 'S');
INSERT INTO `ey_region` VALUES ('47803', '大肚区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47804', '沙鹿区', '3', '47543', 'S');
INSERT INTO `ey_region` VALUES ('47805', '龙井区', '3', '47543', 'L');
INSERT INTO `ey_region` VALUES ('47806', '梧栖区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47807', '清水区', '3', '47543', 'Q');
INSERT INTO `ey_region` VALUES ('47808', '大甲区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47809', '外埔区', '3', '47543', 'W');
INSERT INTO `ey_region` VALUES ('47810', '大安区', '3', '47543', 'D');
INSERT INTO `ey_region` VALUES ('47811', '中坜区', '3', '47544', 'Z');
INSERT INTO `ey_region` VALUES ('47812', '平镇区', '3', '47544', 'P');
INSERT INTO `ey_region` VALUES ('47813', '龙潭区', '3', '47544', 'L');
INSERT INTO `ey_region` VALUES ('47814', '杨梅区', '3', '47544', 'Y');
INSERT INTO `ey_region` VALUES ('47815', '新屋区', '3', '47544', 'X');
INSERT INTO `ey_region` VALUES ('47816', '观音区', '3', '47544', 'G');
INSERT INTO `ey_region` VALUES ('47817', '桃园区', '3', '47544', 'T');
INSERT INTO `ey_region` VALUES ('47818', '龟山区', '3', '47544', 'G');
INSERT INTO `ey_region` VALUES ('47819', '八德区', '3', '47544', 'B');
INSERT INTO `ey_region` VALUES ('47820', '大溪区', '3', '47544', 'D');
INSERT INTO `ey_region` VALUES ('47821', '复兴区', '3', '47544', 'F');
INSERT INTO `ey_region` VALUES ('47822', '大园区', '3', '47544', 'D');
INSERT INTO `ey_region` VALUES ('47823', '芦竹区', '3', '47544', 'L');
INSERT INTO `ey_region` VALUES ('47824', '万里区', '3', '47545', 'W');
INSERT INTO `ey_region` VALUES ('47825', '金山区', '3', '47545', 'J');
INSERT INTO `ey_region` VALUES ('47826', '板桥区', '3', '47545', 'B');
INSERT INTO `ey_region` VALUES ('47827', '汐止区', '3', '47545', 'X');
INSERT INTO `ey_region` VALUES ('47828', '深坑区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47829', '石碇区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47830', '瑞芳区', '3', '47545', 'R');
INSERT INTO `ey_region` VALUES ('47831', '平溪区', '3', '47545', 'P');
INSERT INTO `ey_region` VALUES ('47832', '双溪区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47833', '贡寮区', '3', '47545', 'G');
INSERT INTO `ey_region` VALUES ('47834', '新店区', '3', '47545', 'X');
INSERT INTO `ey_region` VALUES ('47835', '坪林区', '3', '47545', 'P');
INSERT INTO `ey_region` VALUES ('47836', '乌来区', '3', '47545', 'W');
INSERT INTO `ey_region` VALUES ('47837', '永和区', '3', '47545', 'Y');
INSERT INTO `ey_region` VALUES ('47838', '中和区', '3', '47545', 'Z');
INSERT INTO `ey_region` VALUES ('47839', '土城区', '3', '47545', 'T');
INSERT INTO `ey_region` VALUES ('47840', '三峡区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47841', '树林区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47842', '莺歌区', '3', '47545', 'Y');
INSERT INTO `ey_region` VALUES ('47843', '三重区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47844', '新庄区', '3', '47545', 'X');
INSERT INTO `ey_region` VALUES ('47845', '泰山区', '3', '47545', 'T');
INSERT INTO `ey_region` VALUES ('47846', '林口区', '3', '47545', 'L');
INSERT INTO `ey_region` VALUES ('47847', '芦洲区', '3', '47545', 'L');
INSERT INTO `ey_region` VALUES ('47848', '五股区', '3', '47545', 'W');
INSERT INTO `ey_region` VALUES ('47849', '八里区', '3', '47545', 'B');
INSERT INTO `ey_region` VALUES ('47850', '淡水区', '3', '47545', 'D');
INSERT INTO `ey_region` VALUES ('47851', '三芝区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47852', '石门区', '3', '47545', 'S');
INSERT INTO `ey_region` VALUES ('47853', '东区', '3', '47546', 'D');
INSERT INTO `ey_region` VALUES ('47854', '北区', '3', '47546', 'B');
INSERT INTO `ey_region` VALUES ('47855', '香山区', '3', '47546', 'X');
INSERT INTO `ey_region` VALUES ('47856', '其它区', '3', '47546', 'Q');
INSERT INTO `ey_region` VALUES ('47857', '竹北市', '3', '47547', 'Z');
INSERT INTO `ey_region` VALUES ('47858', '湖口乡', '3', '47547', 'H');
INSERT INTO `ey_region` VALUES ('47859', '新丰乡', '3', '47547', 'X');
INSERT INTO `ey_region` VALUES ('47860', '新埔镇', '3', '47547', 'X');
INSERT INTO `ey_region` VALUES ('47861', '关西镇', '3', '47547', 'G');
INSERT INTO `ey_region` VALUES ('47862', '芎林乡', '3', '47547', 'X');
INSERT INTO `ey_region` VALUES ('47863', '宝山乡', '3', '47547', 'B');
INSERT INTO `ey_region` VALUES ('47864', '竹东镇', '3', '47547', 'Z');
INSERT INTO `ey_region` VALUES ('47865', '五峰乡', '3', '47547', 'W');
INSERT INTO `ey_region` VALUES ('47866', '横山乡', '3', '47547', 'H');
INSERT INTO `ey_region` VALUES ('47867', '尖石乡', '3', '47547', 'J');
INSERT INTO `ey_region` VALUES ('47868', '北埔乡', '3', '47547', 'B');
INSERT INTO `ey_region` VALUES ('47869', '峨眉乡', '3', '47547', 'E');
INSERT INTO `ey_region` VALUES ('47870', '宜兰市', '3', '47548', 'Y');
INSERT INTO `ey_region` VALUES ('47871', '头城镇', '3', '47548', 'T');
INSERT INTO `ey_region` VALUES ('47872', '礁溪乡', '3', '47548', 'J');
INSERT INTO `ey_region` VALUES ('47873', '壮围乡', '3', '47548', 'Z');
INSERT INTO `ey_region` VALUES ('47874', '员山乡', '3', '47548', 'Y');
INSERT INTO `ey_region` VALUES ('47875', '罗东镇', '3', '47548', 'L');
INSERT INTO `ey_region` VALUES ('47876', '三星乡', '3', '47548', 'S');
INSERT INTO `ey_region` VALUES ('47877', '大同乡', '3', '47548', 'D');
INSERT INTO `ey_region` VALUES ('47878', '五结乡', '3', '47548', 'W');
INSERT INTO `ey_region` VALUES ('47879', '冬山乡', '3', '47548', 'D');
INSERT INTO `ey_region` VALUES ('47880', '苏澳镇', '3', '47548', 'S');
INSERT INTO `ey_region` VALUES ('47881', '南澳乡', '3', '47548', 'N');
INSERT INTO `ey_region` VALUES ('47882', '钓鱼台', '3', '47548', 'D');
INSERT INTO `ey_region` VALUES ('47883', '斗南镇', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47884', '大埤乡', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47885', '虎尾镇', '3', '47549', 'H');
INSERT INTO `ey_region` VALUES ('47886', '土库镇', '3', '47549', 'T');
INSERT INTO `ey_region` VALUES ('47887', '褒忠乡', '3', '47549', 'B');
INSERT INTO `ey_region` VALUES ('47888', '东势乡', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47889', '台西乡', '3', '47549', 'T');
INSERT INTO `ey_region` VALUES ('47890', '仑背乡', '3', '47549', 'L');
INSERT INTO `ey_region` VALUES ('47891', '麦寮乡', '3', '47549', 'M');
INSERT INTO `ey_region` VALUES ('47892', '斗六市', '3', '47549', 'D');
INSERT INTO `ey_region` VALUES ('47893', '林内乡', '3', '47549', 'L');
INSERT INTO `ey_region` VALUES ('47894', '古坑乡', '3', '47549', 'G');
INSERT INTO `ey_region` VALUES ('47895', '莿桐乡', '3', '47549', 'C');
INSERT INTO `ey_region` VALUES ('47896', '西螺镇', '3', '47549', 'X');
INSERT INTO `ey_region` VALUES ('47897', '二仑乡', '3', '47549', 'E');
INSERT INTO `ey_region` VALUES ('47898', '北港镇', '3', '47549', 'B');
INSERT INTO `ey_region` VALUES ('47899', '水林乡', '3', '47549', 'S');
INSERT INTO `ey_region` VALUES ('47900', '口湖乡', '3', '47549', 'K');
INSERT INTO `ey_region` VALUES ('47901', '四湖乡', '3', '47549', 'S');
INSERT INTO `ey_region` VALUES ('47902', '元长乡', '3', '47549', 'Y');
INSERT INTO `ey_region` VALUES ('47903', '彰化市', '3', '47550', 'Z');
INSERT INTO `ey_region` VALUES ('47904', '芬园乡', '3', '47550', 'F');
INSERT INTO `ey_region` VALUES ('47905', '花坛乡', '3', '47550', 'H');
INSERT INTO `ey_region` VALUES ('47906', '秀水乡', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47907', '鹿港镇', '3', '47550', 'L');
INSERT INTO `ey_region` VALUES ('47908', '福兴乡', '3', '47550', 'F');
INSERT INTO `ey_region` VALUES ('47909', '线西乡', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47910', '和美镇', '3', '47550', 'H');
INSERT INTO `ey_region` VALUES ('47911', '伸港乡', '3', '47550', 'S');
INSERT INTO `ey_region` VALUES ('47912', '员林镇', '3', '47550', 'Y');
INSERT INTO `ey_region` VALUES ('47913', '社头乡', '3', '47550', 'S');
INSERT INTO `ey_region` VALUES ('47914', '永靖乡', '3', '47550', 'Y');
INSERT INTO `ey_region` VALUES ('47915', '埔心乡', '3', '47550', 'P');
INSERT INTO `ey_region` VALUES ('47916', '溪湖镇', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47917', '大村乡', '3', '47550', 'D');
INSERT INTO `ey_region` VALUES ('47918', '埔盐乡', '3', '47550', 'P');
INSERT INTO `ey_region` VALUES ('47919', '田中镇', '3', '47550', 'T');
INSERT INTO `ey_region` VALUES ('47920', '北斗镇', '3', '47550', 'B');
INSERT INTO `ey_region` VALUES ('47921', '田尾乡', '3', '47550', 'T');
INSERT INTO `ey_region` VALUES ('47922', '埤头乡', '3', '47550', 'P');
INSERT INTO `ey_region` VALUES ('47923', '溪州乡', '3', '47550', 'X');
INSERT INTO `ey_region` VALUES ('47924', '竹塘乡', '3', '47550', 'Z');
INSERT INTO `ey_region` VALUES ('47925', '二林镇', '3', '47550', 'E');
INSERT INTO `ey_region` VALUES ('47926', '大城乡', '3', '47550', 'D');
INSERT INTO `ey_region` VALUES ('47927', '芳苑乡', '3', '47550', 'F');
INSERT INTO `ey_region` VALUES ('47928', '二水乡', '3', '47550', 'E');
INSERT INTO `ey_region` VALUES ('47929', '莲池区', '3', '1772', 'L');
INSERT INTO `ey_region` VALUES ('47930', '竞秀区', '3', '1772', 'J');
INSERT INTO `ey_region` VALUES ('47931', '常平镇', '3', '29855', 'C');
INSERT INTO `ey_region` VALUES ('47932', '茶山镇', '3', '29855', 'C');
INSERT INTO `ey_region` VALUES ('47933', '大朗镇', '3', '29855', 'D');
INSERT INTO `ey_region` VALUES ('47934', '大岭山镇', '3', '29855', 'D');
INSERT INTO `ey_region` VALUES ('47935', '道滘镇', '3', '29855', 'D');
INSERT INTO `ey_region` VALUES ('47936', '东城街道', '3', '29855', 'D');
INSERT INTO `ey_region` VALUES ('47937', '东坑镇', '3', '29855', 'D');
INSERT INTO `ey_region` VALUES ('47938', '凤岗镇', '3', '29855', 'F');
INSERT INTO `ey_region` VALUES ('47939', '高埗镇', '3', '29855', 'G');
INSERT INTO `ey_region` VALUES ('47940', '莞城街道', '3', '29855', 'G');
INSERT INTO `ey_region` VALUES ('47941', '横沥镇', '3', '29855', 'H');
INSERT INTO `ey_region` VALUES ('47942', '洪梅镇', '3', '29855', 'H');
INSERT INTO `ey_region` VALUES ('47943', '厚街镇', '3', '29855', 'H');
INSERT INTO `ey_region` VALUES ('47944', '黄江镇', '3', '29855', 'H');
INSERT INTO `ey_region` VALUES ('47945', '虎门镇', '3', '29855', 'H');
INSERT INTO `ey_region` VALUES ('47946', '寮步镇', '3', '29855', 'L');
INSERT INTO `ey_region` VALUES ('47947', '麻涌镇', '3', '29855', 'M');
INSERT INTO `ey_region` VALUES ('47948', '南城街道', '3', '29855', 'N');
INSERT INTO `ey_region` VALUES ('47949', '桥头镇', '3', '29855', 'Q');
INSERT INTO `ey_region` VALUES ('47950', '清溪镇', '3', '29855', 'Q');
INSERT INTO `ey_region` VALUES ('47951', '企石镇', '3', '29855', 'Q');
INSERT INTO `ey_region` VALUES ('47952', '沙田镇', '3', '29855', 'S');
INSERT INTO `ey_region` VALUES ('47953', '石碣镇', '3', '29855', 'S');
INSERT INTO `ey_region` VALUES ('47954', '石龙镇', '3', '29855', 'S');
INSERT INTO `ey_region` VALUES ('47955', '石排镇', '3', '29855', 'S');
INSERT INTO `ey_region` VALUES ('47956', '松山湖管委会', '3', '29855', 'S');
INSERT INTO `ey_region` VALUES ('47957', '塘厦镇', '3', '29855', 'T');
INSERT INTO `ey_region` VALUES ('47958', '望牛墩镇', '3', '29855', 'W');
INSERT INTO `ey_region` VALUES ('47959', '万江街道', '3', '29855', 'W');
INSERT INTO `ey_region` VALUES ('47960', '谢岗镇', '3', '29855', 'X');
INSERT INTO `ey_region` VALUES ('47961', '长安镇', '3', '29855', 'Z');
INSERT INTO `ey_region` VALUES ('47962', '樟木头镇', '3', '29855', 'Z');
INSERT INTO `ey_region` VALUES ('47963', '中堂镇', '3', '29855', 'Z');

-- -----------------------------
-- Table structure for `ey_search_word`
-- -----------------------------
DROP TABLE IF EXISTS `ey_search_word`;
CREATE TABLE `ey_search_word` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) DEFAULT '' COMMENT '关键词',
  `searchNum` int(10) DEFAULT '1' COMMENT '搜索次数',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索词统计表';


-- -----------------------------
-- Table structure for `ey_setting`
-- -----------------------------
DROP TABLE IF EXISTS `ey_setting`;
CREATE TABLE `ey_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '配置的key键名',
  `value` text,
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `inc_type` (`inc_type`,`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='系统非全局配置表';

-- -----------------------------
-- Records of `ey_setting`
-- -----------------------------
INSERT INTO `ey_setting` VALUES ('1', 'ask_ques_steps', '1、写问题标题，描述具体现象。杜绝 “求救，大佬，小白…” 等和问题无关的词汇。\r\n2、选择问题的分类，选择正确的内容分类，能更快的得到其他人的回复。\r\n3、遇到的问题比较急需解决，可以给问题悬赏一定的金额报酬，能让更多同行参与进来出谋策划，从中选择自己心仪的答案。\r\n4、写问题内容详细描述你碰到的困难，写清楚你尝试了什么方法，错误代码，软件的版本等，更容易得到答案。\r\n5、点击发布。', 'ask', 'cn', '1623814141');
INSERT INTO `ey_setting` VALUES ('2', 'system_old_product_attr', '0', 'system', 'cn', '1634095663');
INSERT INTO `ey_setting` VALUES ('3', 'syn_admin_logic_1623377269', '1', 'syn', 'cn', '1634095663');
INSERT INTO `ey_setting` VALUES ('4', 'syn_admin_logic_1625725290', '1', 'syn', 'cn', '1634095663');
INSERT INTO `ey_setting` VALUES ('5', 'syn_admin_logic_1629252424', '1', 'syn', 'cn', '1634095663');
INSERT INTO `ey_setting` VALUES ('6', 'admin_logic_1634204189', '1', 'syn', 'cn', '1641861890');
INSERT INTO `ey_setting` VALUES ('7', 'admin_logic_1634280892', '1', 'syn', 'cn', '1641861890');
INSERT INTO `ey_setting` VALUES ('8', 'admin_logic_1635326854', '1', 'syn', 'cn', '1641861890');
INSERT INTO `ey_setting` VALUES ('9', 'admin_logic_1635389623', '1', 'syn', 'cn', '1641861890');
INSERT INTO `ey_setting` VALUES ('10', 'admin_logic_1636875693', '1', 'syn', 'cn', '1641862059');
INSERT INTO `ey_setting` VALUES ('11', 'admin_logic_1637033990', '1', 'syn', 'cn', '1641862059');
INSERT INTO `ey_setting` VALUES ('12', 'admin_logic_1640918327', '1', 'syn', 'cn', '1641862059');
INSERT INTO `ey_setting` VALUES ('13', 'admin_logic_1638857408', '1', 'syn', 'cn', '1641862059');
INSERT INTO `ey_setting` VALUES ('14', 'admin_logic_1643352860', '2', 'syn', 'cn', '1648864505');
INSERT INTO `ey_setting` VALUES ('15', 'admin_logic_1643352862', '1', 'syn', 'cn', '1648864505');
INSERT INTO `ey_setting` VALUES ('16', 'system_initialize_admin_menu', '1', 'system', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('17', 'admin_logic_1643352863', '1', 'syn', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('18', 'security_askanswer_list', '[\"\\u60a8\\u5e38\\u7528\\u7684\\u624b\\u673a\\u53f7\\u7801\\u662f\\uff1f\",\"\\u60a8\\u5e38\\u7528\\u7684\\u7535\\u5b50\\u90ae\\u7bb1\\u662f\\uff1f\",\"\\u60a8\\u771f\\u5b9e\\u7684\\u59d3\\u540d\\u662f\\uff1f\",\"\\u60a8\\u521d\\u4e2d\\u5b66\\u6821\\u540d\\u662f\\uff1f\",\"\\u60a8\\u7684\\u51fa\\u751f\\u5730\\u540d\\u662f\\uff1f\",\"\\u60a8\\u914d\\u5076\\u7684\\u59d3\\u540d\\u662f\\uff1f\",\"\\u60a8\\u7684\\u8eab\\u4efd\\u8bc1\\u53f7\\u540e\\u516b\\u4f4d\\u662f\\uff1f\",\"\\u60a8\\u9ad8\\u4e2d\\u73ed\\u4e3b\\u4efb\\u7684\\u540d\\u5b57\\u662f\\uff1f\",\"\\u60a8\\u521d\\u4e2d\\u73ed\\u4e3b\\u4efb\\u7684\\u540d\\u5b57\\u662f\\uff1f\",\"\\u60a8\\u6700\\u559c\\u6b22\\u7684\\u660e\\u661f\\u540d\\u5b57\\u662f\\uff1f\",\"\\u5bf9\\u60a8\\u5f71\\u54cd\\u6700\\u5927\\u7684\\u4eba\\u540d\\u5b57\\u662f\\uff1f\"]', 'security', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('19', 'admin_logic_1643352864', '1', 'syn', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('20', 'admin_logic_1647918733', '1', 'syn', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('21', 'system_originlist', '[\"\\u7f51\\u7edc\"]', 'system', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('22', 'admin_logic_1648435161', '1', 'syn', 'cn', '1648864596');
INSERT INTO `ey_setting` VALUES ('23', 'adminlogin_427d1aac31a93d744edd637f1fbbf00c', '0', 'adminlogin', 'cn', '1653987073');
INSERT INTO `ey_setting` VALUES ('24', 'adminlogin_a62896d354440964bb1db242596917b1', '0', 'adminlogin', 'cn', '1653987073');
INSERT INTO `ey_setting` VALUES ('25', 'adminlogin_99ae1cc546e0ed202a83693c75f1afe0', '0', 'adminlogin', 'cn', '1653987073');
INSERT INTO `ey_setting` VALUES ('26', 'admin_logic_1649299958', '1', 'syn', 'cn', '1653987073');
INSERT INTO `ey_setting` VALUES ('27', 'admin_logic_1648882158', '1', 'syn', 'cn', '1653987074');
INSERT INTO `ey_setting` VALUES ('28', 'admin_logic_1649399344', '1', 'syn', 'cn', '1653987074');
INSERT INTO `ey_setting` VALUES ('29', 'recycle_switch', '0', 'recycle', 'cn', '1653987098');
INSERT INTO `ey_setting` VALUES ('30', 'dedetoeyou_del_all', '1', 'dedetoeyou', 'cn', '1653996664');
INSERT INTO `ey_setting` VALUES ('31', 'system_codelogic_1638857408', '074aVggJAQNVVAEICAIBWgUBUgFQBQYBAAJXVgU9RFQHVQEkfmx7cTQuZ3pUYWEjV3VhfBMDbyRXZnAxWiskdCIrZSR+dHRmMwxhf21Xdip2YmB8VHx0JGIGcyEHPARgJSh9IlR4dncwPmd+CVhiIHZQU2o2ZHw9ZQN1J0EFJXMxVFI0bmtrZDApZH1ffVM0cUdpeyJ/fCFcdW4hcA43ZlVUUDFUAXhyJC1nbFNhYTNbAHx9JVNzTkBdYzoZNhxtCy5dLlBpW1YUPkdqUmlZMwN9X1wKVXM0BmsbAGEMP309CVELd1QFYCJSBXRuSmtNQmcIcSxiWS9CZV9RdSIBbzwDAS1vdAFpOUtiUldVYFBWQ2R8E3xzMlt+dSR3CiBgISdyNW1WfnRVFH5pU2V7N0gEempVYFY3clRzJWANBXATWHw3CFZkazQAYX8IdWUxYUBpewgHZiFKR2IlQSA+VDYgbDJpaGRmVD1pYFBlQSBHAWd8IntkIQkBAwxSLg9SEFN6Ohd3bRwPUmAMYmVQCXZnVnIAZGFVEmo', 'system', 'cn', '1654004767');

-- -----------------------------
-- Table structure for `ey_sharp_active`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sharp_active`;
CREATE TABLE `ey_sharp_active` (
  `active_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动会场ID',
  `active_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动日期',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态(0禁用 1启用)',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`active_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='整点秒杀-活动会场表';


-- -----------------------------
-- Table structure for `ey_sharp_active_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sharp_active_goods`;
CREATE TABLE `ey_sharp_active_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `active_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动会场ID',
  `active_time_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动场次ID',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '文档id',
  `sharp_goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀商品ID',
  `sales_actual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际销量',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='整点秒杀-活动会场与商品关联表';


-- -----------------------------
-- Table structure for `ey_sharp_active_time`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sharp_active_time`;
CREATE TABLE `ey_sharp_active_time` (
  `active_time_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '场次ID',
  `active_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动会场ID',
  `active_time` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '场次时间(0点-23点)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态(0禁用 1启用)',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`active_time_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='整点秒杀-活动会场场次表';


-- -----------------------------
-- Table structure for `ey_sharp_goods`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sharp_goods`;
CREATE TABLE `ey_sharp_goods` (
  `sharp_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀商品ID',
  `aid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID->aid',
  `limit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限购数量',
  `seckill_stock` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀商品库存总量',
  `seckill_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '秒杀价格',
  `sales` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '累积销量',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '商品排序(数字越小越靠前)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品状态(0下架 1上架)',
  `is_del` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_sku` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-多规格商品',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`sharp_goods_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='整点秒杀-商品表';


-- -----------------------------
-- Table structure for `ey_sharp_setting`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sharp_setting`;
CREATE TABLE `ey_sharp_setting` (
  `key` varchar(30) NOT NULL DEFAULT '' COMMENT '设置项标示',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '设置项描述',
  `values` mediumtext NOT NULL COMMENT '设置内容(json格式)',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  UNIQUE KEY `unique_key` (`key`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='整点秒杀设置表';


-- -----------------------------
-- Table structure for `ey_shop_address`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_address`;
CREATE TABLE `ey_shop_address` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zipcode` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认，0否，1是。',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`addr_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收货地址表';


-- -----------------------------
-- Table structure for `ey_shop_cart`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_cart`;
CREATE TABLE `ey_shop_cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `users_id` int(10) unsigned DEFAULT '0' COMMENT '会员id',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT '产品id',
  `product_num` int(10) unsigned DEFAULT '0' COMMENT '购买数量',
  `spec_value_id` varchar(100) DEFAULT '' COMMENT '规格值ID',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态：0未选中，1选中',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '加入购物车的时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`cart_id`),
  KEY `users_id` (`users_id`,`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车表';


-- -----------------------------
-- Table structure for `ey_shop_coupon`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_coupon`;
CREATE TABLE `ey_shop_coupon` (
  `coupon_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `coupon_code` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券编号',
  `coupon_name` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `coupon_color` varchar(25) NOT NULL DEFAULT '' COMMENT '优惠券颜色',
  `coupon_form` tinyint(1) NOT NULL DEFAULT '1' COMMENT '优惠券类型 1-满减券',
  `coupon_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '可使用商品(1全站通用，2指定商品，3指定商品分类)',
  `product_id` varchar(255) NOT NULL DEFAULT '' COMMENT '指定商品ID，在coupon_type=2时使用',
  `arctype_id` varchar(255) NOT NULL DEFAULT '' COMMENT '指定商品分类ID，在coupon_type=3时使用',
  `coupon_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '优惠券金额，例如10',
  `conditions_use` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '优惠券使用条件，例如300',
  `coupon_stock` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券库存，例如100',
  `redeem_points` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '兑换优惠券所需积分，为0则表示免费兑换',
  `redeem_authority` varchar(10) NOT NULL DEFAULT '' COMMENT '兑换权限，存入多个会员等级组ID',
  `valid_days` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效天数，例如30',
  `start_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券开放领取时间',
  `end_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券结束领取时间',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '规格排序号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券状态(0=关闭，1=开启)',
  `use_type` int(1) NOT NULL DEFAULT '1' COMMENT '使用期限 \r\n1-固定日期\r\n 2-领取后当天开始N(valid_days)天内有效\r\n 2-领取后次日开始N(valid_days)天内有效',
  `use_start_time` int(11) NOT NULL COMMENT '使用期限开始时间',
  `use_end_time` int(11) NOT NULL COMMENT '使用期限结束时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '0-未删除 1-已删除',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`coupon_id`),
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `arctype_id` (`arctype_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券主表';


-- -----------------------------
-- Table structure for `ey_shop_coupon_use`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_coupon_use`;
CREATE TABLE `ey_shop_coupon_use` (
  `use_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `users_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_code` varchar(100) NOT NULL DEFAULT '' COMMENT '优惠券编号',
  `get_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '领取时的IP地址',
  `get_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券领取时的时间',
  `use_status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券使用状态(0未使用，1已使用，2已过期，3已冻结)',
  `use_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券使用时的时间',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '优惠券有效开始时间',
  `end_time` int(10) NOT NULL DEFAULT '0' COMMENT '优惠券有效结束时间',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`use_id`),
  KEY `coupon_id` (`coupon_id`) USING BTREE,
  KEY `coupon_code` (`coupon_code`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='优惠券-领取记录表';


-- -----------------------------
-- Table structure for `ey_shop_express`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_express`;
CREATE TABLE `ey_shop_express` (
  `express_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `express_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流code',
  `express_name` varchar(32) NOT NULL DEFAULT '' COMMENT '物流名称',
  `express_lnitials` varchar(5) NOT NULL DEFAULT '' COMMENT '首字母',
  `is_choose` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '快递公司是否选中(0=否，1=是)',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`express_id`)
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=utf8 COMMENT='快递公司表';

-- -----------------------------
-- Records of `ey_shop_express`
-- -----------------------------
INSERT INTO `ey_shop_express` VALUES ('1', 'yuantong', '圆通快递', 'Y', '1', '97', '1553911076', '1554974797');
INSERT INTO `ey_shop_express` VALUES ('2', 'shentong', '申通快递', 'S', '1', '98', '1553911076', '1554974707');
INSERT INTO `ey_shop_express` VALUES ('3', 'shunfeng', '顺丰快递', 'S', '1', '98', '1553911076', '1554974710');
INSERT INTO `ey_shop_express` VALUES ('4', 'yunda', '韵达快递', 'Y', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('5', 'debangwuliu', '德邦快递', 'D', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('6', 'zhongtong', '中通快递', 'Z', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('7', 'huitongkuaidi', '百世快递', 'B', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('8', 'youzhengguonei', '邮政包裹', 'Y', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('9', 'ems', 'EMS', 'E', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('10', 'youzhengguoji', '邮政国际', 'Y', '1', '99', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('11', 'aolau', 'AOL澳通速递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('12', 'a2u', 'A2U速递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('13', 'aae', 'AAE快递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('14', 'annengwuliu', '安能物流', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('15', 'anxl', '安迅物流', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('16', 'auexpress', '澳邮中国快运', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('17', 'exfresh', '安鲜达', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('18', 'anjie88', '安捷物流', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('19', 'adodoxm', '澳多多国际速递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('20', 'ariesfar', '艾瑞斯远', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('21', 'qdants', 'ANTS EXPRESS', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('22', 'astexpress', '安世通快递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('23', 'gda', '安的快递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('24', 'ausexpress', '澳世速递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('25', 'ibuy8', '爱拜物流', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('26', 'aplusex', 'Aplus物流', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('27', 'adapost', '安达速递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('28', 'adiexpress', '安达易国际速递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('29', 'maxeedexpress', '澳洲迈速快递', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('30', 'onway', '昂威物流', 'A', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('31', 'bcwelt', 'BCWELT', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('32', 'balunzhi', '巴伦支快递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('33', 'xiaohongmao', '北青小红帽', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('34', 'bfdf', '百福东方物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('35', 'bangsongwuliu', '邦送物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('36', 'lbbk', '宝凯物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('37', 'bqcwl', '百千诚物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('38', 'idada', '百成大达物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('39', 'baishiwuliu', '百世快运', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('40', 'baitengwuliu', '百腾物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('41', 'birdex', '笨鸟海淘', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('42', 'bsht', '百事亨通', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('43', 'benteng', '奔腾物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('44', 'cuckooexpess', '布谷鸟速递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('45', 'bgky100', '邦工快运', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('46', 'bosind', '堡昕德速递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('47', 'banma', '斑马物联网', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('48', 'polarisexpress', '北极星快运', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('49', 'beijingfengyue', '北京丰越供应链', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('50', 'europe8', '败欧洲', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('51', 'bmlchina', '标杆物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('52', 'comexpress', '邦通国际', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('53', 'baotongkd', '宝通快递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('54', 'beckygo', '佰麒快递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('55', 'boyol', '贝业物流', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('56', 'bdatong', '八达通快递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('57', 'bangbangpost', '帮帮发', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('58', 'baoxianda', '报通快递', 'B', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('59', 'coe', '中国东方(COE)', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('60', 'cloudexpress', 'CE易欧通国际速递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('61', 'city100', '城市100', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('62', 'chuanxiwuliu', '传喜物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('63', 'chengjisudi', '城际速递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('64', 'lijisong', '立即送', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('65', 'chukou1', '出口易', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('66', 'nanjingshengbang', '晟邦物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('67', 'flyway', '程光快递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('68', 'cbo56', '钏博物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('69', 'cex', '城铁速递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('70', 'cnup', 'CNUP 中联邮', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('71', 'clsp', 'CL日中速运', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('72', 'cnair', 'CNAIR', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('73', 'cangspeed', '仓鼠快递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('74', 'spring56', '春风物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('75', 'cunto', '村通快递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('76', 'longvast', '长风物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('77', 'changjiang', '长江国际速递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('78', 'cncexp', 'C&C国际速递', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('79', 'parcelchina', '诚一物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('80', 'chengtong', '城通物流', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('81', 'otpexpress', '承诺达', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('82', 'sfpost', '曹操到', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('83', 'changwooair', '昌宇国际', 'C', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('84', 'dhl', 'DHL快递（中国件）', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('85', 'dhlen', 'DHL（国际件）', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('86', 'dhlde', 'DHL（德国件）', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('87', 'dtwl', '大田物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('88', 'disifang', '递四方', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('89', 'dayangwuliu', '大洋物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('90', 'dechuangwuliu', '德创物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('91', 'dskd', 'D速物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('92', 'donghanwl', '东瀚物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('93', 'dfpost', '达方物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('94', 'dongjun', '东骏快捷物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('95', 'dindon', '叮咚澳洲转运', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('96', 'dazhong', '大众佐川急便', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('97', 'ahdf', '德方物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('98', 'dehaoyi', '德豪驿', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('99', 'dhlpaket', 'DHL Paket', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('100', 'ubuy', '德国优拜物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('101', 'adlerlogi', '德国雄鹰速递', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('102', 'yunexpress', '德国云快递', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('103', 'di5pll', '递五方云仓', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('104', 'deguo8elog', '德国八易转运', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('105', 'camekong', '到了港', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('106', 'dbstation', 'db-station', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('107', 'dadaoex', '大道物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('108', 'dekuncn', '德坤物流', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('109', 'twkd56', '缔惠盛合', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('110', 'gslexpress', '德尚国际速递', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('111', 'eucpost', '德国 EUC POST', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('112', 'est365', '东方汇', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('113', 'ecotransite', '东西E全运', 'D', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('114', 'euexpress', 'EU-EXPRESS', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('115', 'emsguoji', 'EMS国际快递查询', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('116', 'eshunda', '俄顺达', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('117', 'ewe', 'EWE全球快递', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('118', 'easyexpress', 'EASYEXPRESS国际速递', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('119', 'edtexpress', 'e直运', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('120', 'ecallturn', 'E跨通', 'E', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('121', 'fedex', 'FedEx快递查询', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('122', 'fedexus', 'FedEx（美国）', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('123', 'fox', 'FOX国际速递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('124', 'rufengda', '如风达快递', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('125', 'fkd', '飞康达物流', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('126', 'feibaokuaidi', '飞豹快递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('127', 'fandaguoji', '颿达国际', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('128', 'feiyuanvipshop', '飞远配送', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('129', 'hnfy', '飞鹰物流', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('130', 'fengxingtianxia', '风行天下', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('131', 'flysman', '飞力士物流', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('132', 'fbkd', '飞邦快递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('133', 'sccod', '丰程物流', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('134', 'crazyexpress', '疯狂快递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('135', 'ftlexpress', '法翔速运', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('136', 'ftd', '富腾达快递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('137', 'arkexpress', '方舟国际速递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('138', 'fedroad', 'FedRoad 联邦转运', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('139', 'freakyquick', 'FQ狂派速递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('140', 'fecobv', '丰客物流', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('141', 'fyex', '飞云快递系统', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('142', 'beebird', '锋鸟物流', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('143', 'shipgce', '飞洋快递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('144', 'koali', '番薯国际货运', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('145', 'epanex', '泛捷国际速递', 'F', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('146', 'gaticn', 'GATI快递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('147', 'gts', 'GTS快递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('148', 'guotongkuaidi', '国通快递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('149', 'ndkd', '能达速递', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('150', 'gongsuda', '共速达', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('151', 'gtongsudi', '广通速递（山东）', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('152', 'suteng', '速腾物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('153', 'gdkd', '港快速递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('154', 'hre', '高铁速递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('155', 'gscq365', '哥士传奇速递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('156', 'gjwl', '冠捷物流', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('157', 'xdshipping', '国晶物流', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('158', 'ge2d', 'GE2D跨境物流', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('159', 'gaotieex', '高铁快运', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('160', 'gansuandi', '甘肃安的快递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('161', 'gdct56', '广东诚通物流', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('162', 'ghtexpress', 'GHT物流', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('163', 'goldjet', '高捷快运', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('164', 'gtgogo', 'GT国际快运', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('165', 'gxwl', '光线速递', 'G', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('166', 'tdhy', '华宇物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('167', 'hl', '恒路物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('168', 'hlyex', '好来运快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('169', 'hebeijianhua', '河北建华', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('170', 'huaqikuaiyun', '华企快运', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('171', 'haosheng', '昊盛物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('172', 'hutongwuliu', '户通物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('173', 'hzpl', '华航快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('174', 'huangmajia', '黄马甲快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('175', 'ucs', '合众速递（UCS）', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('176', 'pfcexpress', '皇家物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('177', 'huoban', '伙伴物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('178', 'nedahm', '红马速递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('179', 'huiwen', '汇文配送', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('180', 'nmhuahe', '华赫物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('181', 'hjs', '猴急送', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('182', 'hangyu', '航宇快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('183', 'huilian', '辉联物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('184', 'huanqiu', '环球速运', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('185', 'htwd', '华通务达物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('186', 'hipito', '海派通', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('187', 'hqtd', '环球通达', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('188', 'airgtc', '航空快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('189', 'haoyoukuai', '好又快物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('190', 'ccd', '河南次晨达', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('191', 'hfwuxi', '和丰同城', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('192', 'higo', '黑狗物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('193', 'hyytes', '恒宇运通', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('194', 'hengrui56', '恒瑞物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('195', 'hangrui', '上海航瑞货运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('196', 'ghl', '环创物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('197', 'hnqst', '河南全速通', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('198', 'hitaoe', 'Hi淘易快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('199', 'hhair56', '华瀚快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('200', 'haimibuy', '海米派物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('201', 'ht22', '海淘物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('202', 'hivewms', '海沧无忧', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('203', 'hnht56', '鸿泰物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('204', 'hsgtsd', '海硕高铁速递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('205', 'hltop', '海联快递', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('206', 'hlkytj', '互联快运', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('207', 'haidaibao', '海带宝转运', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('208', 'flowerkd', '花瓣转运', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('209', 'heimao56', '黑猫速运', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('210', 'logistics', '華信物流WTO', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('211', 'hgy56', '环国运物流', 'H', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('212', 'iparcel', 'i-parcel', 'I', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('213', 'jjwl', '佳吉物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('214', 'jywl', '佳怡物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('215', 'jymwl', '加运美快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('216', 'jxd', '急先达物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('217', 'jgsd', '京广速递快件', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('218', 'jykd', '晋越快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('219', 'jd', '京东物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('220', 'jietekuaidi', '捷特快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('221', 'jiuyicn', '久易快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('222', 'jiuyescm', '九曳供应链', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('223', 'junfengguoji', '骏丰国际速递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('224', 'jiajiatong56', '佳家通', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('225', 'jrypex', '吉日优派', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('226', 'jinchengwuliu', '锦程国际物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('227', 'jgwl', '景光物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('228', 'pzhjst', '急顺通', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('229', 'ruexp', '捷网俄全通', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('230', 'jialidatong', '嘉里大通', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('231', 'jmjss', '金马甲', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('232', 'jiacheng', '佳成快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('233', 'jsexpress', '骏绅物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('234', 'hrex', '锦程快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('235', 'jieanda', '捷安达国际速递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('236', 'newsway', '家家通快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('237', 'mapleexpress', '今枫国际快运', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('238', 'jixiangyouau', '吉祥邮（澳洲）', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('239', 'jjx888', '佳捷翔物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('240', 'polarexpress', '极地快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('241', 'jiazhoumao', '加州猫速递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('242', 'juzhongda', '聚中大', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('243', 'jieborne', '捷邦物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('244', 'jxfex', '集先锋速递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('245', 'jiugong', '九宫物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('246', 'jiujiuwl', '久久物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('247', 'jintongkd', '劲通快递', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('248', 'jcsuda', '嘉诚速达', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('249', 'jingshun', '景顺物流', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('250', 'fastontime', '加拿大联通快运', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('251', 'khzto', '柬埔寨中通', 'J', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('252', 'kjkd', '快捷快递', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('253', 'kangliwuliu', '康力物流', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('254', 'kuayue', '跨越速运', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('255', 'kuaiyouda', '快优达速递', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('256', 'happylink', '开心快递', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('257', 'ksudi', '快速递', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('258', 'kyue', '跨跃国际', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('259', 'kfwnet', '快服务', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('260', 'kuai8', '快8速运', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('261', 'kuaidawuliu', '快达物流', 'K', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('262', 'lianb', '联邦快递（国内）', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('263', 'lhtwl', '联昊通物流', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('264', 'lb', '龙邦速递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('265', 'lejiedi', '乐捷递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('266', 'lanhukuaidi', '蓝弧快递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('267', 'ltexp', '乐天速递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('268', 'lutong', '鲁通快运', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('269', 'ledii', '乐递供应链', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('270', 'lundao', '论道国际物流', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('271', 'lasy56', '林安物流', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('272', 'lsexpress', '6LS EXPRESS', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('273', 'szuem', '联运通物流', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('274', 'blueskyexpress', '蓝天国际航空快递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('275', 'lfexpress', '龙枫国际速递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('276', 'gslhkd', '联合快递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('277', 'longfx', '龙飞祥快递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('278', 'luben', '陆本速递 LUBEN EXPRESS', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('279', 'unitedex', '联合速运', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('280', 'lbex', '龙邦物流', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('281', 'ltparcel', '联通快递', 'L', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('282', 'macroexpressco', 'ME物流', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('283', 'mh', '民航快递', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('284', 'meiguokuaidi', '美国快递', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('285', 'menduimen', '门对门', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('286', 'mingliangwuliu', '明亮物流', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('287', 'minbangsudi', '民邦速递', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('288', 'minshengkuaidi', '闽盛快递', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('289', 'yundaexus', '美国韵达', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('290', 'mchy', '木春货运', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('291', 'meiquick', '美快国际物流', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('292', 'valueway', '美通快递', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('293', 'cnmcpl', '马珂博逻', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('294', 'mailongdy', '迈隆递运', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('295', 'zsmhwl', '明辉物流', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('296', 'mosuda', '魔速达', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('297', 'meibang', '美邦国际快递', 'M', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('298', 'nuoyaao', '偌亚奥国际', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('299', 'nuoer', '诺尔国际物流', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('300', 'nell', '尼尔快递', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('301', 'ndwl', '南方传媒物流', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('302', 'canhold', '能装能送', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('303', 'wanjiatong', '宁夏万家通', 'N', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('304', 'nlebv', '欧亚专线', 'O', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('305', 'oborexpress', 'OBOR Express', 'O', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('306', 'pcaexpress', 'PCA Express', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('307', 'pingandatengfei', '平安达腾飞', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('308', 'peixingwuliu', '陪行物流', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('309', 'pengyuanexpress', '鹏远国际速递', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('310', 'postelbe', 'PostElbe', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('311', 'papascm', '啪啪供应链', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('312', 'bazirim', '皮牙子快递', 'P', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('313', 'qfkd', '全峰快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('314', 'qy', '全一快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('315', 'qrt', '全日通快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('316', 'qckd', '全晨快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('317', 'sevendays', '7天连锁物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('318', 'qbexpress', '秦邦快运', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('319', 'quanxintong', '全信通快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('320', 'quansutong', '全速通国际快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('321', 'qinyuan', '秦远物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('322', 'qichen', '启辰国际物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('323', 'quansu', '全速快运', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('324', 'qzx56', '全之鑫物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('325', 'qskdyxgs', '千顺快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('326', 'zqlwl', '青旅物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('327', 'quanchuan56', '全川物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('328', 'quantwl', '全通快运', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('329', 'yatexpress', '乾坤物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('330', 'guexp', '全联速运', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('331', 'bjqywl', '青云物流', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('332', 'signedexpress', '签收快递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('333', 'express7th', '7号速递', 'Q', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('334', 'riyuwuliu', '日昱物流', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('335', 'rfsd', '瑞丰速递', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('336', 'rrs', '日日顺物流', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('337', 'rytsd', '日益通速递', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('338', 'rrskx', '日日顺快线', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('339', 'gdrz58', '容智快运', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('340', 'rrthk', '日日通国际', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('341', 'homecourier', '如家国际快递', 'R', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('342', 'sewl', '速尔快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('343', 'haihongwangsong', '山东海红', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('344', 'sh', '盛辉物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('345', 'sfwl', '盛丰物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('346', 'shiyunkuaidi', '世运快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('347', 'shangda', '上大物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('348', 'stsd', '三态速递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('349', 'saiaodi', '赛澳递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('350', 'ewl', '申通E物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('351', 'shenganwuliu', '圣安物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('352', 'sxhongmajia', '山西红马甲', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('353', 'suijiawuliu', '穗佳物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('354', 'syjiahuier', '沈阳佳惠尔', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('355', 'shlindao', '上海林道货运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('356', 'sfift', '十方通物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('357', 'shunjiefengda', '顺捷丰达', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('358', 'subida', '速必达物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('359', 'stcd', '速通成达物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('360', 'stkd', '顺通快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('361', 'sendtochina', '速递中国', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('362', 'sihaiet', '四海快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('363', 'staky', '首通快运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('364', 'hnssd56', '顺时达物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('365', 'superb', 'Superb Grace', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('366', 'sfjhd', '圣飞捷快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('367', 'sofast56', '嗖一下同城快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('368', 's2c', 'S2C', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('369', 'chinasqk', 'SQK国际速递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('370', 'shunshid', '顺士达速运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('371', 'synship', 'SYNSHIP快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('372', 'shandiantu', '闪电兔', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('373', 'sdsy888', '首达速运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('374', 'sczpds', '速呈宅配', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('375', 'sureline', 'Sureline冠泰', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('376', 'stosolution', '申通国际', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('377', 'sycawl', '狮爱高铁物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('378', 'sxexpress', '三象速递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('379', 'shangqiao56', '商桥物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('380', 'shd56', '商海德物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('381', 'shenma', '神马快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('382', 'sihiexpress', '四海捷运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('383', 'superoz', '速配鸥翼', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('384', 'fastgoexpress', '速派快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('385', 'zjstky', '苏通快运', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('386', 'suning', '苏宁物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('387', 'shaoke', '捎客物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('388', 'sdto', '速达通跨境物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('389', 'sut56', '速通物流', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('390', 'sundarexpress', '顺达快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('391', 'sxjdfreight', '顺心捷达', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('392', 'shengtongscm', '盛通快递', 'S', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('393', 'tnt', 'TNT快递', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('394', 'tt', '天天快递', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('395', 'tianzong', '天纵物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('396', 'chinatzx', '同舟行物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('397', 'nntengda', '腾达速递', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('398', 'sd138', '泰国138', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('399', 'tongdaxing', '通达兴物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('400', 'tlky', '天联快运', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('401', 'ibenben', '途鲜物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('402', 'krtao', '淘韩国际快递', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('403', 'lntjs', '特急送', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('404', 'tny', 'TNY物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('405', 'djy56', '天翔东捷运', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('406', 'guoeryue', '天天快物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('407', 'tianma', '天马迅达', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('408', 'surpassgo', '天越物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('409', 'tianxiang', '天翔快递', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('410', 'tywl99', '天翼物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('411', 'shpost', '同城快寄', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('412', 'humpline', '驼峰国际', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('413', 'transrush', 'TransRush', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('414', 'tstexp', 'TST速运通', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('415', 'ctoexp', '泰国中通CTO', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('416', 'thaizto', '泰国中通ZTO', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('417', 'tswlcloud', '天使物流云', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('418', 'tzky', '铁中快运', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('419', 'tcxbthai', 'TCXB国际物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('420', 'taimek', '天美快递', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('421', 'taoplus', '淘布斯国际物流', 'T', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('422', 'ups', 'UPS快递查询', 'U', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('423', 'yskd', '优速快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('424', 'usps', 'USPS美国邮政', 'U', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('425', 'ueq', 'UEQ快递', 'U', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('426', 'uex', 'UEX国际物流', 'U', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('427', 'utaoscm', 'UTAO 优到', 'U', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('428', 'wxwl', '万象物流', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('429', 'weitepai', '微特派', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('430', 'wjwl', '万家物流', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('431', 'wanboex', '万博快递', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('432', 'wtdchina', '威时沛运', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('433', 'wzhaunyun', '微转运', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('434', 'gswtkd', '万通快递', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('435', 'wandougongzhu', '豌豆物流', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('436', 'wjkwl', '万家康物流', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('437', 'vps', '维普恩物流', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('438', 'wykjt', '51跨境通', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('439', 'wherexpess', '威盛快递', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('440', 'weilaimingtian', '未来明天快递', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('441', 'wdm', '万达美', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('442', 'wto56kj', '温通物流', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('443', '56kuaiyun', '五六快运', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('444', 'wowvip', '沃埃家', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('445', 'grivertek', '潍鸿', 'W', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('446', 'xbwl', '新邦物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('447', 'xfwl', '信丰物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('448', 'newegg', '新蛋物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('449', 'xianglongyuntong', '祥龙运通物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('450', 'xianchengliansudi', '西安城联速递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('451', 'xilaikd', '喜来快递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('452', 'xsrd', '鑫世锐达', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('453', 'xtb', '鑫通宝物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('454', 'xintianjie', '信天捷快递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('455', 'xaetc', '西安胜峰', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('456', 'xianfeng', '先锋快递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('457', 'sunspeedy', '新速航', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('458', 'xipost', '西邮寄', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('459', 'sinatone', '信联通', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('460', 'sunjex', '新杰物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('461', 'alog', '心怡物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('462', 'csxss', '新时速物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('463', 'xiangteng', '翔腾物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('464', 'westwing', '西翼物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('465', 'littlebearbear', '小熊物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('466', 'huanqiuabc', '中国香港环球快运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('467', 'xinning', '新宁物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('468', 'wlwex', '星空国际', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('469', 'yyexp', '西安运逸快递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('470', 'xiyoug', '西游寄', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('471', 'xlobo', 'xLobo', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('472', 'xunsuexpress', '迅速快递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('473', 'whgjkd', '香港伟豪国际物流', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('474', 'xyd666', '鑫远东速运', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('475', 'xdexpress', '迅达速递', 'X', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('476', 'ytkd', '运通快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('477', 'ycwl', '远成物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('478', 'yfsd', '亚风速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('479', 'yishunhang', '亿顺航', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('480', 'yfwl', '越丰物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('481', 'yad', '源安达快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('482', 'yfh', '原飞航物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('483', 'yinjiesudi', '银捷速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('484', 'yitongfeihong', '一统飞鸿', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('485', 'yuxinwuliu', '宇鑫物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('486', 'yitongda', '易通达', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('487', 'youbijia', '邮必佳', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('488', 'yiqiguojiwuliu', '一柒物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('489', 'yinsu', '音素快运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('490', 'yilingsuyun', '亿领速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('491', 'yujiawuliu', '煜嘉物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('492', 'gml', '英脉物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('493', 'leopard', '云豹国际货运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('494', 'czwlyn', '云南中诚', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('495', 'sdyoupei', '优配速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('496', 'yongchang', '永昌物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('497', 'yufeng', '御风速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('498', 'yousutongda', '优速通达', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('499', 'yongwangda', '永旺达快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('500', 'yingchao', '英超物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('501', 'edlogistics', '益递物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('502', 'yjxlm', '宜家行', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('503', 'onehcang', '一号仓', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('504', 'ycgky', '远成快运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('505', 'yunfeng56', '韵丰物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('506', 'iyoungspeed', '驿扬国际速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('507', 'zgyzt', '一站通快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('508', 'eupackage', '易优包裹', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('509', 'ydglobe', '云达通', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('510', 'el56', 'YLTD', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('511', 'yundx', '运东西', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('512', 'yangbaoguo', '洋包裹', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('513', 'uluckex', '优联吉运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('514', 'ecmscn', '易客满', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('515', 'ubonex', '优邦速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('516', 'yue777', '玥玛速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('517', 'ywexpress', '远为快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('518', 'ezhuanyuan', '易转运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('519', 'yiqisong', '一起送', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('520', 'yongbangwuliu', '永邦国际物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('521', 'yyox', '邮客全球速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('522', 'yihangmall', '易航物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('523', 'yiouzhou', '易欧洲国际物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('524', 'ykouan', '洋口岸', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('525', 'youyou', '优优速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('526', 'ytky168', '运通快运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('527', 'sixroad', '易普递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('528', 'yourscm', '雅澳物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('529', 'euguoji', '易邮国际', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('530', 'uscbexpress', '易境达国际物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('531', 'yfsuyun', '驭丰速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('532', 'yimidida', '壹米滴答', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('533', 'ugoexpress', '邮鸽速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('534', 'youban', '邮邦国际', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('535', 'hkems', '云邮跨境快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('536', 'youlai', '邮来速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('537', 'eta100', '易达国际速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('538', 'yatfai', '一辉物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('539', 'yzswuliu', '亚洲顺物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('540', 'yifankd', '艺凡快递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('541', 'mantoo', '优能物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('542', 'vctrans', '越中国际物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('543', 'yhtlogistics', '宇航通物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('544', 'ycgglobal', 'YCG物流', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('545', 'yidihui', '驿递汇速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('546', 'yuanhhk', '远航国际快运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('547', 'yiyou', '易邮速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('548', 'eusacn', '优莎速运', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('549', 'uhi', '优海国际速递', 'Y', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('550', 'zjs', '宅急送', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('551', 'ztky', '中铁快运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('552', 'ztwl', '中铁物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('553', 'zywl', '中邮物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('554', 'zhimakaimen', '芝麻开门', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('555', 'zhengzhoujianhua', '郑州建华', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('556', 'zhongsukuaidi', '中速快件', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('557', 'zhongtianwanyun', '中天万运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('558', 'zhongruisudi', '中睿速递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('559', 'zhongwaiyun', '中外运速递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('560', 'zengyisudi', '增益速递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('561', 'sujievip', '郑州速捷', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('562', 'ztong', '智通物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('563', 'zhichengtongda', '至诚通达快递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('564', 'zhdwl', '众辉达物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('565', 'kuachangwuliu', '直邮易', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('566', 'topspeedex', '中运全速', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('567', 'otobv', '中欧快运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('568', 'zsky123', '准实快运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('569', 'cnws', '中国翼', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('570', 'zytdscm', '中宇天地', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('571', 'zhuanyunsifang', '转运四方', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('572', 'hrbzykd', '卓烨快递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('573', 'zhuoshikuaiyun', '卓实快运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('574', 'chinaicip', '卓志速运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('575', 'ynztsy', '纵通速运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('576', 'zdepost', '直德邮', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('577', 'chinapostcb', '中邮电商', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('578', 'chunghwa56', '中骅物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('579', 'cosco', '中远e环球', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('580', 'zf365', '珠峰速运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('581', 'zhongtongkuaiyun', '中通快运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('582', 'eucnrail', '中欧国际物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('583', 'chnexp', '中翼国际物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('584', 'cccc58', '中集冷云', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('585', 'auvanda', '中联速递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('586', 'zyzoom', '增速跨境', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('587', 'zhpex', '众派速递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('588', 'byht', '展勤快递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('589', 'zhongchuan', '众川国际', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('590', 'zhonghuanus', '中环转运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('591', 'zhonghuan', '中环快递', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('592', 'uszcn', '转运中国', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('593', 'zhitengwuliu', '志腾物流', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('594', 'zsda56', '转瞬达集运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('595', 'zjgj56', '振捷国际货运', 'Z', '1', '100', '1553911076', '1553911076');
INSERT INTO `ey_shop_express` VALUES ('596', 'jtexpress', '极兔速递', 'J', '1', '100', '1553911076', '1553911076');

-- -----------------------------
-- Table structure for `ey_shop_order`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order`;
CREATE TABLE `ey_shop_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `users_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0未付款(已下单)，1已付款(待发货)，2已发货(待收货)，3已完成(确认收货)，-1订单取消(已关闭)，4订单过期',
  `payment_method` tinyint(1) DEFAULT '0' COMMENT '订单支付方式，0为在线支付，1为货到付款，默认0',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_name` varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `wechat_pay_type` varchar(20) NOT NULL DEFAULT '' COMMENT '微信支付时，标记使用的支付类型（扫码支付，微信内部，微信H5页面）',
  `order_terminal` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单终端(1=电脑端、2=手机端、3微信小程序)',
  `contains_virtual` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '订单是否包含虚拟商品(1=不包含、2=包含)',
  `manual_refund` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单是否被手动关闭并退款',
  `refund_note` varchar(500) NOT NULL DEFAULT '' COMMENT '订单手动退款原因',
  `pay_details` text COMMENT '支付时返回的数据，以serialize序列化后存入，用于后续查询。',
  `express_order` varchar(50) DEFAULT '' COMMENT '发货物流单号',
  `express_name` varchar(32) DEFAULT '' COMMENT '发货物流名称',
  `express_code` varchar(32) DEFAULT '' COMMENT '发货物流code',
  `express_time` int(11) DEFAULT '0' COMMENT '发货时间',
  `consignee` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人',
  `confirm_time` int(11) DEFAULT '0' COMMENT '收货确认时间',
  `shipping_fee` decimal(10,2) DEFAULT '0.00' COMMENT '订单运费',
  `order_total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `order_total_num` int(10) DEFAULT '0' COMMENT '订单总数',
  `country` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '国家',
  `province` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '省份',
  `city` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市',
  `district` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '县区',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '收货地址',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `prom_type` tinyint(1) unsigned DEFAULT '0' COMMENT '订单类型：0普通订单，1虚拟订单',
  `virtual_delivery` text COMMENT '虚拟订单时，卖家发货给买家的回复',
  `admin_note` text COMMENT '管理员操作备注',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已评论，0为否，1为是，默认0',
  `user_note` text COMMENT '会员备注',
  `group` varchar(50) DEFAULT '' COMMENT '订单分组',
  `order_md5` varchar(50) DEFAULT '' COMMENT '订单标识串，删除未付款的重复订单',
  `order_source` tinyint(3) DEFAULT '10' COMMENT '10-普通订单 20-秒杀订单',
  `order_source_id` int(10) DEFAULT '0' COMMENT '来源id(秒杀订单:active_time_id)',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券数据表ID',
  `use_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员的优惠券数据表ID',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用的优惠券金额',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_code` (`order_code`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单主表';


-- -----------------------------
-- Table structure for `ey_shop_order_comment`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_comment`;
CREATE TABLE `ey_shop_order_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `details_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单明细表ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `total_score` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '总评分，1：好评，2中评，3差评',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评论内容',
  `upload_img` varchar(3000) NOT NULL DEFAULT '' COMMENT '晒单图片',
  `admin_reply` varchar(1000) NOT NULL DEFAULT '' COMMENT '管理员回复',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示：0否，1是',
  `is_anonymous` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否匿名评价：0否，1是',
  `lang` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`comment_id`),
  KEY `users_id` (`users_id`),
  KEY `order_id` (`order_id`),
  KEY `details_id` (`details_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品评价表';


-- -----------------------------
-- Table structure for `ey_shop_order_details`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_details`;
CREATE TABLE `ey_shop_order_details` (
  `details_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `product_name` varchar(100) NOT NULL DEFAULT '' COMMENT '产品名称',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '单个产品数量',
  `data` text COMMENT '序列化额外数据',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品单价',
  `prom_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '产品类型：0普通产品，1虚拟产品',
  `litpic` varchar(500) NOT NULL DEFAULT '' COMMENT '封面图片',
  `apply_service` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否申请退换货服务：0 未申请、1已申请',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已评论，0为否，1为是，默认0',
  `lang` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`details_id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单详情表';


-- -----------------------------
-- Table structure for `ey_shop_order_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_log`;
CREATE TABLE `ey_shop_order_log` (
  `action_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `action_user` int(10) DEFAULT '0' COMMENT '操作人；0:用户操作；1以上:管理员id',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态，单条记录状态',
  `express_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '物流状态，0:未发货，1:已发货',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态，0:未支付，1:已支付',
  `action_desc` varchar(255) DEFAULT '' COMMENT '状态描述',
  `action_note` varchar(255) NOT NULL DEFAULT '' COMMENT '操作备注',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单操作记录表';


-- -----------------------------
-- Table structure for `ey_shop_order_service`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_service`;
CREATE TABLE `ey_shop_order_service` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `service_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1换货，2退货，3维修',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_code` varchar(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `details_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单明细表ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `product_name` varchar(200) NOT NULL DEFAULT '' COMMENT '产品名称',
  `product_spec` varchar(200) NOT NULL DEFAULT '' COMMENT '产品规格',
  `product_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品数量',
  `product_img` varchar(500) NOT NULL DEFAULT '' COMMENT '产品图片',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '退换货描述',
  `upload_img` varchar(3000) NOT NULL DEFAULT '' COMMENT '上传的图片',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '退货的收货地址',
  `consignee` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `manual_refund` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '服务单是否被手动关闭并退款',
  `refund_note` varchar(500) NOT NULL DEFAULT '' COMMENT '服务单手动退款原因',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还金额',
  `refund_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还余额',
  `refund_code` varchar(40) NOT NULL DEFAULT '' COMMENT '退款单号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1审核中 2审核通过 3审核不通过 4已发货 5已收货 6换货完成 7退款完成 8服务取消',
  `users_delivery` varchar(500) NOT NULL DEFAULT '' COMMENT '会员发货信息',
  `admin_delivery` varchar(500) NOT NULL DEFAULT '' COMMENT '管理员发货信息',
  `admin_note` varchar(1000) NOT NULL DEFAULT '' COMMENT '管理员操作备注',
  `lang` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '申请时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`service_id`),
  KEY `users_id` (`users_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `order_code` (`order_code`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `details_id` (`details_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单退换货服务表';


-- -----------------------------
-- Table structure for `ey_shop_order_service_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_order_service_log`;
CREATE TABLE `ey_shop_order_service_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `service_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '服务表ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `log_note` varchar(500) NOT NULL DEFAULT '' COMMENT '记录备注',
  `lang` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`log_id`),
  KEY `service_id` (`service_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单退换货服务记录表';


-- -----------------------------
-- Table structure for `ey_shop_product_attr`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_product_attr`;
CREATE TABLE `ey_shop_product_attr` (
  `product_attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品属性id自增',
  `aid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '产品id',
  `attr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) DEFAULT '' COMMENT '属性价格',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`product_attr_id`),
  KEY `aid` (`aid`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_shop_product_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_product_attribute`;
CREATE TABLE `ey_shop_product_attribute` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `list_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 0=文本框，1=下拉框，2=多行文本框',
  `attr_values` text NOT NULL COMMENT '可选值列表',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0=禁用，1=启用)',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`list_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_shop_product_attrlist`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_product_attrlist`;
CREATE TABLE `ey_shop_product_attrlist` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '列表id',
  `list_name` varchar(60) NOT NULL DEFAULT '' COMMENT '列表名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0=禁用，1=启用)',
  `attr_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '参数数量',
  `desc` text NOT NULL COMMENT '描述备注',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除，0=否，1=是',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '列表排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `ey_shop_shipping_template`
-- -----------------------------
DROP TABLE IF EXISTS `ey_shop_shipping_template`;
CREATE TABLE `ey_shop_shipping_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `template_region` varchar(255) NOT NULL DEFAULT '' COMMENT '模板运送区域',
  `template_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '模板运费',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'region表id',
  `lang` varchar(30) DEFAULT 'cn' COMMENT '语言标识',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='运费模板表';

-- -----------------------------
-- Records of `ey_shop_shipping_template`
-- -----------------------------
INSERT INTO `ey_shop_shipping_template` VALUES ('1', '北京市', '0.00', '1', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('2', '天津市', '0.00', '338', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('3', '河北省', '0.00', '636', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('4', '山西省', '0.00', '3102', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('5', '内蒙古自治区', '0.00', '4670', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('6', '辽宁省', '0.00', '5827', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('7', '吉林省', '0.00', '7531', 'cn', '1554775921');
INSERT INTO `ey_shop_shipping_template` VALUES ('8', '黑龙江省', '0.00', '8558', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('9', '上海市', '0.00', '10543', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('10', '江苏省', '0.00', '10808', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('11', '浙江省', '0.00', '12596', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('12', '安徽省', '0.00', '14234', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('13', '福建省', '0.00', '16068', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('14', '江西省', '0.00', '17359', 'cn', '1554775962');
INSERT INTO `ey_shop_shipping_template` VALUES ('15', '山东省', '0.00', '19280', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('16', '河南省', '0.00', '21387', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('17', '湖北省', '0.00', '24022', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('18', '湖南省', '0.00', '25579', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('19', '广东省', '0.00', '28240', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('20', '广西壮族自治区', '0.00', '30164', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('21', '海南省', '0.00', '31563', 'cn', '1555483193');
INSERT INTO `ey_shop_shipping_template` VALUES ('22', '重庆市', '0.00', '31929', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('23', '四川省', '0.00', '33007', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('24', '贵州省', '0.00', '37906', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('25', '云南省', '0.00', '39556', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('26', '西藏自治区', '0.00', '41103', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('27', '陕西省', '0.00', '41877', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('28', '甘肃省', '0.00', '43776', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('29', '青海省', '0.00', '45286', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('30', '宁夏回族自治区', '0.00', '45753', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('31', '新疆维吾尔自治区', '0.00', '46047', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('32', '台湾省', '0.00', '47493', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('33', '香港特别行政区', '0.00', '47494', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('34', '澳门特别行政区', '0.00', '47495', 'cn', '1554775610');
INSERT INTO `ey_shop_shipping_template` VALUES ('35', '统一配送价格', '0.00', '100000', 'cn', '1556618311');

-- -----------------------------
-- Table structure for `ey_single_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_single_content`;
CREATE TABLE `ey_single_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `ey_single_content`
-- -----------------------------
INSERT INTO `ey_single_content` VALUES ('1', '60', '1', '&lt;p&gt;\r\n	某某网络科技有限公司成立于2006年，致力行业10年，开创智能响应式建站云平台，打造集响应式网站技术、云端架构、整合营销为一体商业模式。伴随着中国互联网的成长，经历了互联网快速发展的10年，积累了雄厚自主研发技术和丰富的响应式网站开发案例。&lt;/p&gt;&lt;p&gt;\r\n	面对日新月异的互联网趋势，2016旗下&amp;amp;ldquo;赞赞&amp;amp;ldquo;响应式营销云平台，攻克技术难题，自主打造以SaaS云平台为构架，&amp;amp;ldquo;快速响应式建站+全维度整合营销&amp;amp;rdquo;为核心，从过去局限的定制建站运营转变为整合营销运营，领先实现智能响应式技术和网站可视化编辑方案，不仅提供全设备智能响应式系统的功能，更融合了良好的用户体验和多层次优化指导，渗透到互联网+的全维度整合营销运营管理中，其创新的商业模式集合了产业链的关键元素，真正意义上具备了企业发展需求的整体营销，为企业提供多元、高效、易用的网站管理方式，满足企业各个阶段不同变化的系统升级。&lt;/p&gt;&lt;p&gt;\r\n	在汲取互联网思维的同时，赞赞将进一步整合优质企业服务商，引入和开发更多切实解决企业需求的应用，力求与生态级互联网+完美融合，并深度挖掘可持续性之间更深的契合点，输出智能、卓越、创新、整合的产品概念，全面营造一站式平台，释放生态级互联网+影响力，助力企业全面互联网+转型升级，开创品牌互联网价值新领地。&lt;/p&gt;', '', '1654563517', '1654563517');
INSERT INTO `ey_single_content` VALUES ('2', '61', '10', '', '', '1654563986', '1654563986');
INSERT INTO `ey_single_content` VALUES ('3', '62', '17', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('4', '63', '2', '&lt;p&gt;\r\n	某某网络科技有限公司是一家专注于企业网站建设，推广，微信开发的专业技术型公司，公司有资深PHP技术开发团队，专注于为中小企业提供性价比最高的建站服务，所做的网站以价格低，配置高，运行稳定快速，效果好而著称，积累客户案例上万家，遍布全国各地，赢得了良好的口碑。&lt;/p&gt;&lt;p&gt;\r\n	最优网络是腾宁科技旗下专注网站建设的品牌，只做高性价比的网站，公司致力于为中国企业提供全方位、多层面的互联网服务，依靠自主研发的应用软件系统，基于云计算，重点面向中国广大企业客户，专业提供企业互联网基础运营服务 ，并为企业搭建互联网一站式整合软件系统。&lt;/p&gt;&lt;p&gt;\r\n	公司致力于为中国最小企业提供低门槛，专业的建站服务，你选中喜欢的网站风格，只需要提供资料图片，简介联系方式给我们，我们高效率，流水线式的技术团队，将在3天之内帮你把网站快速打造好，摆到你面前让你提出修改意见，完善之后即刻上线，快速，方便，保障，全程无忧，这是我们的专注和努力。&lt;/p&gt;', '', '1654563533', '1654563533');
INSERT INTO `ey_single_content` VALUES ('5', '64', '3', '&lt;p&gt;\r\n	一个网站的重要性不言而喻，而如何选择一家专业靠谱的建站公司却是多数需求方为之苦恼的问题。&lt;/p&gt;\r\n&lt;p&gt;\r\n	纵观目前建站市场的整体发展，网站建设的业务已经趋于饱和，各类网站建设公司包括小型工作室以及个人服务商的数量却在逐年增加。&lt;/p&gt;\r\n&lt;p&gt;\r\n	如今市场上的建站公司不计其数， 各地网站公司的数量甚至已经逼近了整体市场需求的总量。&lt;/p&gt;\r\n&lt;p&gt;\r\n	各家建站公司的服务水平却是参差不齐，价格五花八门，其中更是不乏一些服务商惯用的欺诈陷阱和招数。&lt;/p&gt;\r\n&lt;p&gt;\r\n	对于需求方而言， 面对如此乱象丛生的建站市场找到一家专业、靠谱的建站服务公司是一件非常头疼的事情。&lt;/p&gt;\r\n', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('6', '65', '25', '', '', '1654002848', '1654002848');
INSERT INTO `ey_single_content` VALUES ('7', '66', '26', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('8', '67', '27', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('9', '68', '28', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('10', '69', '18', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('11', '70', '19', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('12', '71', '20', '', '', '1653996665', '1653996666');
INSERT INTO `ey_single_content` VALUES ('13', '72', '21', '', '', '1653996665', '1653996666');

-- -----------------------------
-- Table structure for `ey_sms_log`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sms_log`;
CREATE TABLE `ey_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发送来源，与场景ID对应：0=注册，1=绑定，2=登录密码，3=支付密码，4=找回密码',
  `sms_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '短信服务商类型，1---阿里云短信， 2---腾讯云短信',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '发送状态,1:成功,0:失败',
  `is_use` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用，1:是，0:否',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '短信内容',
  `ip` varchar(20) DEFAULT 'IP地址',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `error_msg` text NOT NULL COMMENT '发送短信异常内容',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机短信发送记录';


-- -----------------------------
-- Table structure for `ey_sms_template`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sms_template`;
CREATE TABLE `ey_sms_template` (
  `tpl_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sms_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '短信服务商类型，1---阿里云短信， 2---腾讯云短信',
  `tpl_title` varchar(128) NOT NULL DEFAULT '' COMMENT '短信标题',
  `sms_sign` varchar(50) NOT NULL DEFAULT '' COMMENT '短信签名',
  `sms_tpl_code` varchar(100) NOT NULL DEFAULT '' COMMENT '短信模板ID',
  `tpl_content` varchar(1000) NOT NULL DEFAULT '' COMMENT '发送短信内容',
  `send_scene` varchar(100) NOT NULL DEFAULT '' COMMENT '短信发送场景',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启使用这个模板，1为是，0为否。',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='手机短信发送模板';

-- -----------------------------
-- Records of `ey_sms_template`
-- -----------------------------
INSERT INTO `ey_sms_template` VALUES ('1', '1', '账号注册', '', '', '验证码为 ${content} ，请在30分钟内输入验证。', '0', '1', 'cn', '1611054772', '1611054772');
INSERT INTO `ey_sms_template` VALUES ('2', '1', '手机绑定', '', '', '验证码为 ${content} ，请在30分钟内输入验证。', '1', '1', 'cn', '1611054772', '1611054772');
INSERT INTO `ey_sms_template` VALUES ('3', '1', '找回密码', '', '', '验证码为 ${content} ，请在30分钟内输入验证。', '4', '1', 'cn', '1611054772', '1611054772');
INSERT INTO `ey_sms_template` VALUES ('4', '1', '订单付款', '', '', '您有新的消息：您有新的${content}订单，请注意查收！', '5', '1', 'cn', '1611054772', '1616293292');
INSERT INTO `ey_sms_template` VALUES ('5', '2', '账号注册', '', '', '验证码为 {1} ，请在30分钟内输入验证。', '0', '1', 'cn', '1611055150', '1611055150');
INSERT INTO `ey_sms_template` VALUES ('6', '2', '手机绑定', '', '', '验证码为 {1} ，请在30分钟内输入验证。', '1', '1', 'cn', '1611055150', '1611055150');
INSERT INTO `ey_sms_template` VALUES ('7', '2', '找回密码', '', '', '验证码为 {1} ，请在30分钟内输入验证。', '4', '1', 'cn', '1611055150', '1611055150');
INSERT INTO `ey_sms_template` VALUES ('8', '2', '订单付款', '', '', '您有新的消息：您有新的{1}订单，请注意查收！', '5', '1', 'cn', '1611055150', '1616293292');
INSERT INTO `ey_sms_template` VALUES ('9', '1', '订单发货', '', '', '您有新的消息：您有新的${content}订单，请注意查收！', '6', '1', 'cn', '1611054772', '1616293292');
INSERT INTO `ey_sms_template` VALUES ('10', '2', '订单发货', '', '', '您有新的消息：您有新的{1}订单，请注意查收！', '6', '1', 'cn', '1611055150', '1616293292');

-- -----------------------------
-- Table structure for `ey_smtp_record`
-- -----------------------------
DROP TABLE IF EXISTS `ey_smtp_record`;
CREATE TABLE `ey_smtp_record` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `source` tinyint(1) DEFAULT '0' COMMENT '来源，与场景ID对应：0=默认，2=注册，3=绑定邮箱，4=找回密码',
  `email` varchar(50) DEFAULT '' COMMENT '邮件地址',
  `users_id` int(10) DEFAULT '0' COMMENT '用户ID',
  `code` varchar(20) DEFAULT '' COMMENT '发送邮件内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否使用，默认0，0为未使用，1为使用',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件发送记录表';


-- -----------------------------
-- Table structure for `ey_smtp_tpl`
-- -----------------------------
DROP TABLE IF EXISTS `ey_smtp_tpl`;
CREATE TABLE `ey_smtp_tpl` (
  `tpl_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tpl_name` varchar(200) DEFAULT '' COMMENT '模板名称',
  `tpl_title` varchar(200) DEFAULT '' COMMENT '邮件标题',
  `tpl_content` text COMMENT '发送邮件内容',
  `send_scene` tinyint(1) DEFAULT '0' COMMENT '邮件发送场景(1=留言表单）',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '是否开启使用这个模板，1为是，0为否。',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='邮件模板表';

-- -----------------------------
-- Records of `ey_smtp_tpl`
-- -----------------------------
INSERT INTO `ey_smtp_tpl` VALUES ('1', '留言表单', '您有新的留言消息，请查收！', '${content}', '1', '1', 'cn', '1544763495', '1552638302');
INSERT INTO `ey_smtp_tpl` VALUES ('2', '会员注册', '验证码已发送至您的邮箱，请登录邮箱查看验证码！', '${content}', '2', '1', 'cn', '1544763495', '1552667056');
INSERT INTO `ey_smtp_tpl` VALUES ('3', '绑定邮箱', '验证码已发送至您的邮箱，请登录邮箱查看验证码！', '${content}', '3', '1', 'cn', '1544763495', '1552667400');
INSERT INTO `ey_smtp_tpl` VALUES ('4', '找回密码', '验证码已发送至您的邮箱，请登录邮箱查看验证码！', '${content}', '4', '1', 'cn', '1544763495', '1552663577');
INSERT INTO `ey_smtp_tpl` VALUES ('5', '订单付款', '您有新的待发货订单消息，请到商城订单查看！', '${content}', '5', '1', 'cn', '1611054608', '1616293292');
INSERT INTO `ey_smtp_tpl` VALUES ('6', '订单发货', '您有新的待收货订单消息，请到会员订单查看！', '${content}', '6', '1', 'cn', '1616293292', '1616293292');

-- -----------------------------
-- Table structure for `ey_special_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_special_content`;
CREATE TABLE `ey_special_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) DEFAULT '0' COMMENT '文档ID',
  `content` longtext COMMENT '内容详情',
  `content_ey_m` longtext COMMENT '手机端内容详情',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='专题附加表';


-- -----------------------------
-- Table structure for `ey_special_node`
-- -----------------------------
DROP TABLE IF EXISTS `ey_special_node`;
CREATE TABLE `ey_special_node` (
  `node_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '节点名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '节点标识',
  `isauto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动获取文档',
  `keywords` varchar(200) NOT NULL DEFAULT '' COMMENT '关键字（多个中间用'',''分开）',
  `typeid` int(10) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `aidlist` text NOT NULL COMMENT '关联文章列表（多个中间用'',''分开）',
  `row` int(5) NOT NULL DEFAULT '10' COMMENT '文档数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='专题节点表';


-- -----------------------------
-- Table structure for `ey_sql_cache_table`
-- -----------------------------
DROP TABLE IF EXISTS `ey_sql_cache_table`;
CREATE TABLE `ey_sql_cache_table` (
  `cache_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sql_name` varchar(60) NOT NULL DEFAULT '' COMMENT 'mysql语句的标识名称，目前由模型名称+模型ID组成',
  `sql_result` text NOT NULL COMMENT 'mysql执行结果',
  `sql_md5` varchar(60) NOT NULL DEFAULT '' COMMENT 'mysql语句MD5的值',
  `sql_query` text NOT NULL COMMENT '完整mysql语句',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='mysql缓存表';

-- -----------------------------
-- Records of `ey_sql_cache_table`
-- -----------------------------
INSERT INTO `ey_sql_cache_table` VALUES ('1', 'ArchivesMaxID', '72', '494a17e43cff13eeb4b9c9837c29026c', 'SELECT MAX(aid) AS tp_max FROM `ey_archives` LIMIT 1', '1654005323', '1654005323');
INSERT INTO `ey_sql_cache_table` VALUES ('2', '|arctype|all|count|', '{\"4\":{\"typeid\":4,\"num\":15},\"6\":{\"typeid\":6,\"num\":6},\"7\":{\"typeid\":7,\"num\":2},\"12\":{\"typeid\":12,\"num\":6},\"13\":{\"typeid\":13,\"num\":6},\"14\":{\"typeid\":14,\"num\":6},\"29\":{\"typeid\":29,\"num\":4},\"30\":{\"typeid\":30,\"num\":6}}', '9f6b5e62b9b8456535e5881c8b05072f', 'SELECT typeid, count(typeid) as num FROM `ey_archives` WHERE  `channel` IN (1,2,3,4,5,7,51)  AND `lang` = \'cn\'  AND `is_del` = 0  AND (  (users_id = 0 OR (users_id > 0 AND arcrank >= 0)) ) GROUP BY `typeid`', '1654005323', '1654005323');
INSERT INTO `ey_sql_cache_table` VALUES ('3', '|model|all|count|', '{\"1\":{\"channel\":1,\"total\":51},\"6\":{\"channel\":6,\"total\":13}}', 'd5ac17fe5649c6d04f4b174c42f2d535', 'SELECT channel, count(aid) as total FROM `ey_archives` WHERE  `lang` = \'cn\'  AND `status` = 1  AND `is_del` = 0  AND (  (users_id = 0 OR (users_id > 0 AND arcrank >= 0)) ) GROUP BY `channel`', '1654015996', '1654015996');
INSERT INTO `ey_sql_cache_table` VALUES ('4', '|archives|!=8,6,5,7,51|', '51', '79384ebcdb28f5eed29a07a310ff31ee', 'SELECT COUNT(aid) AS tp_count FROM `ey_archives` `a` WHERE  `a`.`channel` NOT IN (8,6,5,7,51)  AND `a`.`lang` = \'cn\'  AND `a`.`is_del` = 0  AND (  (a.users_id = 0 OR (a.users_id > 0 AND a.arcrank >= 0)) ) LIMIT 1', '1654564279', '1654564279');

-- -----------------------------
-- Table structure for `ey_tagindex`
-- -----------------------------
DROP TABLE IF EXISTS `ey_tagindex`;
CREATE TABLE `ey_tagindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'tagid',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag内容',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `litpic` varchar(250) DEFAULT '' COMMENT '封面图',
  `seo_title` varchar(200) DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT '' COMMENT 'SEO关键词',
  `seo_description` text COMMENT 'SEO描述',
  `count` int(10) unsigned DEFAULT '0' COMMENT '点击',
  `total` int(10) unsigned DEFAULT '0' COMMENT '文档数',
  `weekcc` int(10) unsigned DEFAULT '0' COMMENT '周统计',
  `monthcc` int(10) unsigned DEFAULT '0' COMMENT '月统计',
  `weekup` int(10) unsigned DEFAULT '0' COMMENT '每周更新',
  `monthup` int(10) unsigned DEFAULT '0' COMMENT '每月更新',
  `is_common` tinyint(1) DEFAULT '0' COMMENT '是否常用标签，0=否，1=是',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`) USING BTREE,
  KEY `count` (`count`,`total`,`weekcc`,`monthcc`,`weekup`,`monthup`,`add_time`) USING BTREE,
  KEY `tag` (`tag`) USING BTREE,
  KEY `lang` (`lang`,`add_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标签索引表';


-- -----------------------------
-- Table structure for `ey_taglist`
-- -----------------------------
DROP TABLE IF EXISTS `ey_taglist`;
CREATE TABLE `ey_taglist` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'tagid',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `tag` varchar(50) DEFAULT '' COMMENT 'tag内容',
  `arcrank` tinyint(1) DEFAULT '0' COMMENT '阅读权限',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tid`,`aid`),
  KEY `aid` (`aid`,`typeid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章标签表';


-- -----------------------------
-- Table structure for `ey_ui_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_ui_config`;
CREATE TABLE `ey_ui_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `md5key` varchar(100) NOT NULL DEFAULT '' COMMENT '唯一键值（由 theme_style、page、name）组成',
  `theme_style` varchar(200) DEFAULT 'pc' COMMENT '模板风格',
  `page` varchar(64) DEFAULT '' COMMENT '页面分组',
  `type` varchar(50) DEFAULT '' COMMENT '编辑类型',
  `name` varchar(50) DEFAULT '' COMMENT '与页面的e-id对应',
  `value` text COMMENT '页面美化的val值',
  `idcode` varchar(50) DEFAULT '' COMMENT '页面唯一id标识（由 标识符+栏目id或文档id等）组成',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5key` (`md5key`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='可视化参数设置';


-- -----------------------------
-- Table structure for `ey_uploads`
-- -----------------------------
DROP TABLE IF EXISTS `ey_uploads`;
CREATE TABLE `ey_uploads` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_id` int(10) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `title` varchar(200) DEFAULT '' COMMENT '文档标题',
  `image_url` varchar(255) DEFAULT '' COMMENT '文件存储路径',
  `intro` varchar(500) DEFAULT '' COMMENT '图集描述',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `filesize` int(11) unsigned DEFAULT '0' COMMENT '文件大小',
  `mime` varchar(50) DEFAULT '' COMMENT '图片类型',
  `users_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `sort_order` smallint(5) DEFAULT '100' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '1已删除 0未删除',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`img_id`),
  KEY `aid` (`aid`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上传记录表';

-- -----------------------------
-- Records of `ey_uploads`
-- -----------------------------
INSERT INTO `ey_uploads` VALUES ('1', '0', '0', 'logo.png', '/uploads/allimg/20220607/1-22060FT231306.png', '', '170', '60', '5057', 'image/png', '0', '100', '0', '1654562551', '1654562551');
INSERT INTO `ey_uploads` VALUES ('2', '0', '0', 'weixin.jpg', '/uploads/allimg/20220607/1-22060FT253N9.jpg', '', '200', '200', '25048', 'image/jpeg', '0', '100', '0', '1654562573', '1654562573');

-- -----------------------------
-- Table structure for `ey_uploads_type`
-- -----------------------------
DROP TABLE IF EXISTS `ey_uploads_type`;
CREATE TABLE `ey_uploads_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_type` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上传分组表';


-- -----------------------------
-- Table structure for `ey_users`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users`;
CREATE TABLE `ey_users` (
  `users_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '绑定手机号，0为不绑定，1为绑定',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码（仅用于登录）',
  `is_email` tinyint(1) DEFAULT '0' COMMENT '绑定邮箱，0为不绑定，1为绑定',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '电子邮件（仅用于登录）',
  `paypwd` varchar(255) DEFAULT '' COMMENT '支付密码，暂时未用到，可保留。',
  `users_money` decimal(10,2) DEFAULT '0.00' COMMENT '用户金额',
  `frozen_money` decimal(10,2) DEFAULT '0.00' COMMENT '冻结金额',
  `scores` int(10) DEFAULT '0' COMMENT '积分',
  `devote` int(10) DEFAULT '0' COMMENT '贡献值',
  `reg_time` int(11) unsigned DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `login_count` int(11) DEFAULT '0' COMMENT '登陆次数',
  `head_pic` varchar(255) DEFAULT '' COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `level` smallint(5) DEFAULT '0' COMMENT '会员等级',
  `open_level_time` int(11) unsigned DEFAULT '0' COMMENT '开通会员级别时间',
  `level_maturity_days` varchar(20) DEFAULT '' COMMENT '会员级别到期天数',
  `discount` decimal(10,2) DEFAULT '1.00' COMMENT '会员折扣，默认1不享受',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费累计额度',
  `is_activation` tinyint(1) DEFAULT '1' COMMENT '是否激活，0否，1是。\r\n后台注册默认为1激活。\r\n前台注册时，当会员功能设置选择后台审核，需后台激活才可以登陆。',
  `register_place` tinyint(1) DEFAULT '2' COMMENT '注册位置。后台注册不受注册验证影响，1为后台注册，2为前台注册。默认为2。',
  `open_id` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方唯一标识openid',
  `thirdparty` tinyint(1) DEFAULT '0' COMMENT '第三方注册类型：0=普通，1=微信，2=QQ',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `admin_id` int(10) DEFAULT '0' COMMENT '关联管理员ID',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '伪删除，1=是，0=否',
  `unread_notice_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '未读消息数量',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `sex` varchar(10) DEFAULT '保密' COMMENT '性别- 男,女,保密',
  `coin` int(11) unsigned DEFAULT '0' COMMENT '金币',
  `union_id` varchar(50) NOT NULL DEFAULT '' COMMENT '微信用户的unionId',
  PRIMARY KEY (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员信息表';


-- -----------------------------
-- Table structure for `ey_users_bottom_menu`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_bottom_menu`;
CREATE TABLE `ey_users_bottom_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(30) DEFAULT '' COMMENT '导航名称',
  `mca` varchar(50) DEFAULT '' COMMENT '分组/控制器/操作名',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '功能开关状态，1=开启，0=关闭',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示, 1--是, 0--否',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员中心移动端底部菜单表';

-- -----------------------------
-- Records of `ey_users_bottom_menu`
-- -----------------------------
INSERT INTO `ey_users_bottom_menu` VALUES ('1', '首页', 'home/Index/index', 'shouye', '100', '1', '1', 'cn', '1611055150', '1611055150');
INSERT INTO `ey_users_bottom_menu` VALUES ('2', '下载', 'user/Download/index', 'xiazai', '100', '1', '1', 'cn', '1611055150', '1611055150');
INSERT INTO `ey_users_bottom_menu` VALUES ('3', '发布', 'user/UsersRelease/article_add', 'fabu', '100', '1', '1', 'cn', '1611055150', '1611055150');
INSERT INTO `ey_users_bottom_menu` VALUES ('4', '我的', 'user/Users/centre', 'geren', '100', '1', '1', 'cn', '1611055150', '1611055150');

-- -----------------------------
-- Table structure for `ey_users_collection`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_collection`;
CREATE TABLE `ey_users_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) DEFAULT '0',
  `aid` int(10) DEFAULT '0' COMMENT '文档id',
  `channel` int(10) DEFAULT '0' COMMENT '模型',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目',
  `title` varchar(200) DEFAULT '' COMMENT '网站标题',
  `litpic` varchar(255) DEFAULT '' COMMENT '缩略图',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的收藏';


-- -----------------------------
-- Table structure for `ey_users_config`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_config`;
CREATE TABLE `ey_users_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员功能配置表ID',
  `name` varchar(50) DEFAULT '' COMMENT '配置的key键名',
  `value` text COMMENT '配置的value值',
  `desc` varchar(100) DEFAULT '' COMMENT '键名说明',
  `inc_type` varchar(64) DEFAULT '' COMMENT '配置分组',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员功能配置表';

-- -----------------------------
-- Records of `ey_users_config`
-- -----------------------------
INSERT INTO `ey_users_config` VALUES ('1', 'users_reg_notallow', 'www,bbs,ftp,mail,user,users,admin,administrator', '不允许注册的会员名', 'users', 'cn', '1653996665');
INSERT INTO `ey_users_config` VALUES ('2', 'score_signin_status', '1', '', 'score', 'cn', '1611055150');
INSERT INTO `ey_users_config` VALUES ('3', 'score_signin_score', '3', '', 'score', 'cn', '1611055150');
INSERT INTO `ey_users_config` VALUES ('4', 'pay_balance_open', '1', '', 'pay', 'cn', '1616293292');
INSERT INTO `ey_users_config` VALUES ('5', 'shop_open', '0', '', 'shop', 'cn', '1623814050');
INSERT INTO `ey_users_config` VALUES ('6', 'users_login_expiretime', '3600', '', 'users', 'cn', '1639022045');

-- -----------------------------
-- Table structure for `ey_users_footprint`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_footprint`;
CREATE TABLE `ey_users_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` int(10) DEFAULT '0' COMMENT '频道模型',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目id',
  `aid` int(10) DEFAULT '0' COMMENT '文档id',
  `title` varchar(100) DEFAULT '' COMMENT '网站标题',
  `litpic` varchar(255) DEFAULT '' COMMENT '缩略图',
  `users_id` int(10) DEFAULT '0',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的足迹';


-- -----------------------------
-- Table structure for `ey_users_forward`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_forward`;
CREATE TABLE `ey_users_forward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) DEFAULT '0',
  `aid` int(10) DEFAULT '0' COMMENT '文档id',
  `channel` int(10) DEFAULT '0' COMMENT '模型',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目',
  `title` varchar(200) DEFAULT '' COMMENT '网站标题',
  `litpic` varchar(255) DEFAULT '' COMMENT '缩略图',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='转发记录';


-- -----------------------------
-- Table structure for `ey_users_level`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_level`;
CREATE TABLE `ey_users_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `level_name` varchar(30) DEFAULT '' COMMENT '级别名称',
  `level_value` int(10) DEFAULT '0' COMMENT '会员等级值',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '类型，1=系统，0=用户',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '消费额度',
  `down_count` int(10) DEFAULT '0' COMMENT '每天下载次数限制',
  `discount` float(10,2) DEFAULT '100.00' COMMENT '折扣率，初始值为100即100%，无折扣',
  `posts_count` int(10) DEFAULT '5' COMMENT '会员投稿次数限制',
  `ask_is_release` tinyint(1) DEFAULT '1' COMMENT '允许在问答中发布问题，1=是，0=否',
  `ask_is_review` tinyint(1) DEFAULT '0' COMMENT '在问答中发布问题或回答是否需要审核，1=是，0=否',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员级别表';

-- -----------------------------
-- Records of `ey_users_level`
-- -----------------------------
INSERT INTO `ey_users_level` VALUES ('1', '注册会员', '10', '1', '0.00', '100', '100', '5', '1', '0', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_users_level` VALUES ('2', '低级会员', '20', '0', '0.00', '100', '100', '5', '1', '0', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_users_level` VALUES ('3', '中级会员', '50', '0', '0.00', '100', '100', '5', '1', '0', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_users_level` VALUES ('4', '高级会员', '100', '0', '0.00', '100', '100', '5', '1', '0', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_users_level` VALUES ('5', '给力会员', '150', '0', '0.00', '100', '100', '5', '1', '0', 'cn', '1653996665', '1653996665');
INSERT INTO `ey_users_level` VALUES ('6', '超能会员', '180', '0', '0.00', '100', '100', '5', '1', '0', 'cn', '1653996665', '1653996665');

-- -----------------------------
-- Table structure for `ey_users_like`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_like`;
CREATE TABLE `ey_users_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) DEFAULT '0',
  `aid` int(10) DEFAULT '0' COMMENT '文档id',
  `channel` int(10) DEFAULT '0' COMMENT '模型',
  `typeid` int(10) DEFAULT '0' COMMENT '栏目',
  `title` varchar(200) DEFAULT '' COMMENT '网站标题',
  `litpic` varchar(255) DEFAULT '' COMMENT '缩略图',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我喜欢的';


-- -----------------------------
-- Table structure for `ey_users_list`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_list`;
CREATE TABLE `ey_users_list` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `users_id` int(10) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `para_id` int(10) NOT NULL DEFAULT '0' COMMENT '属性ID',
  `info` text COMMENT '属性值',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员属性表(信息）';


-- -----------------------------
-- Table structure for `ey_users_menu`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_menu`;
CREATE TABLE `ey_users_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(30) DEFAULT '' COMMENT '导航名称',
  `version` varchar(10) DEFAULT 'weapp' COMMENT '分组',
  `mca` varchar(50) DEFAULT '' COMMENT '分组/控制器/操作名',
  `active_url` varchar(500) DEFAULT '' COMMENT '标记为选中的url',
  `is_userpage` tinyint(1) DEFAULT '0' COMMENT '默认会员首页',
  `sort_order` int(10) DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1=显示，0=隐藏',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='会员菜单表';

-- -----------------------------
-- Records of `ey_users_menu`
-- -----------------------------
INSERT INTO `ey_users_menu` VALUES ('1', '个人信息', 'v1', 'user/Users/index', '', '1', '100', '1', 'cn', '1555904190', '1555917737');
INSERT INTO `ey_users_menu` VALUES ('2', '账户充值', 'v1', 'user/Pay/pay_consumer_details', '', '0', '100', '0', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('3', '商城中心', 'v1', 'user/Shop/shop_centre', '', '0', '100', '0', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('4', '会员升级', 'v1', 'user/Level/level_centre', '', '0', '100', '0', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('5', '会员投稿', 'v1', 'user/UsersRelease/release_centre', '', '0', '100', '0', 'cn', '1555904190', '1555917761');
INSERT INTO `ey_users_menu` VALUES ('6', '我的下载', 'v1', 'user/Download/index', '', '0', '100', '1', 'cn', '1590484667', '1611054964');
INSERT INTO `ey_users_menu` VALUES ('7', '个人中心', 'v2', 'user/Users/index', 'user/Users/index|user/Pay/pay_account_recharge|user/Users/footprint_index|user/Level/level_centre|user/Download/index|user/Users/media_index', '1', '100', '1', 'cn', '1608708057', '1609385363');
INSERT INTO `ey_users_menu` VALUES ('8', '我的信息', 'v2', 'user/Users/info', 'user/Users/info', '0', '100', '1', 'cn', '1608709100', '1609385363');
INSERT INTO `ey_users_menu` VALUES ('9', '我的收藏', 'v2', 'user/Users/collection_index', 'user/Users/collection_index', '0', '100', '1', 'cn', '1608708100', '1609385363');
INSERT INTO `ey_users_menu` VALUES ('10', '财务明细', 'v2', 'user/Pay/pay_consumer_details', 'user/Pay/pay_consumer_details|user/Users/score_index', '0', '100', '1', 'cn', '1608709000', '1609387813');

-- -----------------------------
-- Table structure for `ey_users_money`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_money`;
CREATE TABLE `ey_users_money` (
  `moneyid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '金额明细表ID',
  `users_id` int(10) DEFAULT '0' COMMENT '会员表ID',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `users_money` decimal(10,2) DEFAULT '0.00' COMMENT '此条记录的账户金额',
  `cause` text COMMENT '事由，暂时在升级消费中使用到，以serialize序列化后存入，用于后续查询。',
  `cause_type` tinyint(1) DEFAULT '0' COMMENT '数据类型，0为消费，1为充值。其余后续添加。',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否成功，默认1，0失败，1未付款，2已付款，3已完成，4订单取消。',
  `pay_method` varchar(50) DEFAULT '' COMMENT '支付方式，wechat为微信支付，alipay为支付宝支付',
  `wechat_pay_type` varchar(20) NOT NULL DEFAULT '' COMMENT '微信支付时，标记使用的支付类型（扫码支付，微信内部，微信H5页面）',
  `pay_details` text COMMENT '支付时返回的数据，以serialize序列化后存入，用于后续查询。',
  `order_number` varchar(30) DEFAULT '' COMMENT '订单号',
  `level_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员升级时所升级的会员级别ID，默认0',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`moneyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='金额明细表';


-- -----------------------------
-- Table structure for `ey_users_notice`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_notice`;
CREATE TABLE `ey_users_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '通知标题',
  `users_id` text NOT NULL COMMENT '用户id',
  `usernames` text NOT NULL COMMENT '用户名字符串',
  `remark` text COMMENT '通知信息',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内通知';


-- -----------------------------
-- Table structure for `ey_users_notice_read`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_notice_read`;
CREATE TABLE `ey_users_notice_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `notice_id` int(10) DEFAULT NULL COMMENT '站内信id',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读, 1---是, 0---否',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除, 1---是, 0---否',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户已读站内通知';


-- -----------------------------
-- Table structure for `ey_users_notice_tpl`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_notice_tpl`;
CREATE TABLE `ey_users_notice_tpl` (
  `tpl_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tpl_name` varchar(200) DEFAULT '' COMMENT '模板名称',
  `tpl_title` varchar(200) DEFAULT '' COMMENT '站内信标题',
  `tpl_content` text COMMENT '发送内容',
  `send_scene` tinyint(1) DEFAULT '0' COMMENT '站内信发送场景(1=留言表单）',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '是否开启使用这个模板，1为是，0为否。',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='站内信模板表';

-- -----------------------------
-- Records of `ey_users_notice_tpl`
-- -----------------------------
INSERT INTO `ey_users_notice_tpl` VALUES ('1', '留言表单', '您有新的留言消息，请到内容管理中查看！', '${content}', '1', '1', 'cn', '1616293292', '1616293292');
INSERT INTO `ey_users_notice_tpl` VALUES ('5', '订单付款', '您有新的待发货订单消息，请到商城订单查看！', '${content}', '5', '1', 'cn', '1616293292', '1616293292');
INSERT INTO `ey_users_notice_tpl` VALUES ('6', '订单发货', '您有新的待收货订单消息，请到会员订单查看！', '${content}', '6', '1', 'cn', '1616293292', '1616293292');

-- -----------------------------
-- Table structure for `ey_users_notice_tpl_content`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_notice_tpl_content`;
CREATE TABLE `ey_users_notice_tpl_content` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `source` tinyint(1) DEFAULT '0' COMMENT '来源，对应 users_notice_tpl 表 send_scene 字段',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID，不为空则表示管理员接收信息',
  `users_id` int(10) DEFAULT '0' COMMENT '用户ID，不为空则表示会员接收信息，暂未使用',
  `content_title` varchar(200) DEFAULT '' COMMENT '通知标题',
  `content` text COMMENT '接收的通知内容',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读，默认0，1是，0否',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`content_id`),
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `users_id` (`users_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='站内信发送接收记录表';

-- -----------------------------
-- Records of `ey_users_notice_tpl_content`
-- -----------------------------
INSERT INTO `ey_users_notice_tpl_content` VALUES ('1', '1', '1', '0', '您有新的留言消息，请到内容管理中查看！', 'test<br/>13000000000<br/>test<br/>移动端/APP', '0', 'cn', '1654003446', '1654003446');
INSERT INTO `ey_users_notice_tpl_content` VALUES ('2', '1', '1', '0', '您有新的留言消息，请到内容管理中查看！', '<br/><br/><br/>如何选择', '0', 'cn', '1654005529', '1654005529');
INSERT INTO `ey_users_notice_tpl_content` VALUES ('3', '1', '1', '0', '您有新的留言消息，请到内容管理中查看！', '<br/><br/><br/>关于我们', '0', 'cn', '1654563323', '1654563323');
INSERT INTO `ey_users_notice_tpl_content` VALUES ('4', '1', '1', '0', '您有新的留言消息，请到内容管理中查看！', '11<br/>22<br/>33', '0', 'cn', '1654563451', '1654563451');
INSERT INTO `ey_users_notice_tpl_content` VALUES ('5', '1', '1', '0', '您有新的留言消息，请到内容管理中查看！', '11<br/>22<br/>33', '0', 'cn', '1654564275', '1654564275');

-- -----------------------------
-- Table structure for `ey_users_parameter`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_parameter`;
CREATE TABLE `ey_users_parameter` (
  `para_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `dtype` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `dfvalue` varchar(1000) NOT NULL DEFAULT '' COMMENT '默认值',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '是否为系统属性，系统属性不可删除，1为是，0为否，默认0。',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否禁用属性，1为是，0为否',
  `is_required` tinyint(1) DEFAULT '0' COMMENT '是否为必填属性，1为是，0为否，默认0。',
  `is_reg` tinyint(1) DEFAULT '1' COMMENT '是否为注册表单，1为是，0为否',
  `placeholder` varchar(255) DEFAULT '' COMMENT '提示文字',
  `sort_order` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`para_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员属性表(字段)';

-- -----------------------------
-- Records of `ey_users_parameter`
-- -----------------------------
INSERT INTO `ey_users_parameter` VALUES ('1', '手机号码', 'mobile_1', 'mobile', '', '1', '0', '0', '1', '', '1', 'cn', '0', '1551238026');
INSERT INTO `ey_users_parameter` VALUES ('2', '邮箱地址', 'email_2', 'email', '', '1', '0', '1', '1', '', '1', 'cn', '0', '1551238549');

-- -----------------------------
-- Table structure for `ey_users_score`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_score`;
CREATE TABLE `ey_users_score` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '积分明细表',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型:1-提问,2-回答,3-最佳答案4-悬赏退回,5-每日签到',
  `users_id` int(10) DEFAULT '0' COMMENT '用户id',
  `ask_id` int(10) DEFAULT '0' COMMENT '问题id',
  `reply_id` int(10) DEFAULT '0' COMMENT '回答id',
  `score` int(10) DEFAULT '0' COMMENT '积分',
  `devote` int(10) DEFAULT '0' COMMENT '贡献值,同score',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `info` varchar(255) DEFAULT '' COMMENT '说明',
  `lang` varchar(50) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分详情表';


-- -----------------------------
-- Table structure for `ey_users_signin`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_signin`;
CREATE TABLE `ey_users_signin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `lang` varchar(50) NOT NULL DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签到时间',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户签到表';


-- -----------------------------
-- Table structure for `ey_users_type_manage`
-- -----------------------------
DROP TABLE IF EXISTS `ey_users_type_manage`;
CREATE TABLE `ey_users_type_manage` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `type_name` varchar(30) DEFAULT '' COMMENT '类型名称',
  `level_id` int(10) DEFAULT '0' COMMENT '会员等级ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `limit_id` int(10) DEFAULT '0' COMMENT '会员期限限制，存储ID，值对应常量表的admin_member_limit_arr数组',
  `activity` varchar(30) DEFAULT '' COMMENT '活动文案',
  `sort_order` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `lang` varchar(20) DEFAULT 'cn' COMMENT '语言标识',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员产品类型表';

-- -----------------------------
-- Records of `ey_users_type_manage`
-- -----------------------------
INSERT INTO `ey_users_type_manage` VALUES ('1', '升级为本站中级会员', '2', '100.00', '2', '', '100', 'cn', '1611053268', '1611053268');
INSERT INTO `ey_users_type_manage` VALUES ('2', '升级为本站高级会员', '3', '200.00', '3', '', '100', 'cn', '1611053268', '1611053268');

-- -----------------------------
-- Table structure for `ey_weapp`
-- -----------------------------
DROP TABLE IF EXISTS `ey_weapp`;
CREATE TABLE `ey_weapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '' COMMENT '插件标识',
  `name` varchar(55) DEFAULT '' COMMENT '中文名字',
  `config` text COMMENT '配置信息',
  `data` text COMMENT '额外序列化存储数据，简单插件可以不创建表，存储这里即可',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0=未安装，1=启用，-1=禁用',
  `tag_weapp` tinyint(1) DEFAULT '1' COMMENT '1=自动绑定，2=手工调用。关联模板标签weapp，自动调用内置的show钩子方法',
  `thorough` tinyint(1) DEFAULT '0' COMMENT '彻底卸载：0=是，1=否',
  `position` varchar(30) DEFAULT 'default' COMMENT '插件位置',
  `is_buy` tinyint(1) DEFAULT '0' COMMENT '0-本地,1-线上购买 2-线上购买,但已删除,不显示在我的插件列表',
  `is_upgrade` tinyint(1) DEFAULT '1' COMMENT '是否提示升级',
  `sort_order` int(10) DEFAULT '100' COMMENT '排序号',
  `add_time` int(11) DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件应用表';


-- -----------------------------
-- Table structure for `ey_wx_users`
-- -----------------------------
DROP TABLE IF EXISTS `ey_wx_users`;
CREATE TABLE `ey_wx_users` (
  `wxuser_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(100) NOT NULL DEFAULT '' COMMENT 'openid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `headimgurl` varchar(200) NOT NULL DEFAULT '' COMMENT '头像',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`wxuser_id`),
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信小程序用户表';

