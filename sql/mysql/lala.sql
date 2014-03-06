-- ----------------------------
-- DROP constraints of FK
-- ----------------------------
ALTER TABLE `t_account` DROP FOREIGN KEY `FK_acc_dept`;
ALTER TABLE t_course DROP FOREIGN KEY FK_course_plan;
ALTER TABLE t_plan DROP FOREIGN KEY FK_plan_project;

-- ----------------------------
-- Table structure for `t_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_dept` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('100','培训中心');
INSERT INTO `t_dept` VALUES ('101','研1');
INSERT INTO `t_dept` VALUES ('102','研2');
INSERT INTO `t_dept` VALUES ('103','研3');
INSERT INTO `t_dept` VALUES ('104','质管');

-- ----------------------------
-- Table structure for `t_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,

  `phoneNo` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `deptId` int(11) NOT NULL,

  `lastLoginTime` datetime DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `lastLoginIp` varchar(50) DEFAULT NULL,
  `loginIp` varchar(50) DEFAULT NULL,
  `logintimes` int(11) DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_account_index` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_account` VALUES ('71','admin', 'admin', 'admin', '','','100','2011-02-15 11:45:04', '2011-02-15 11:53:27', '113.108.129.92', '113.108.129.92', '1', '');
INSERT INTO `t_account` VALUES ('72','shine', 'shine', 'shine', '','','100','2010-12-20 15:27:08', '2010-12-20 15:30:38', '110.185.60.11', '110.185.60.11', '1', '');
INSERT INTO `t_account` VALUES ('73','user',  'user',  'user',  '','','100','2010-12-17 10:14:26', '2010-12-17 10:16:22', '113.108.129.92', '192.168.1.15', '1', '');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_role` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('100','管理员');
INSERT INTO `t_role` VALUES ('101','培训组织');
INSERT INTO `t_role` VALUES ('102','培训现场管理');

-- ----------------------------
-- Table structure for `t_account_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_account_role`;
CREATE TABLE `t_account_role` (
  `accountId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`accountId`,`roleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account_role
-- ----------------------------
INSERT INTO `t_account_role` VALUES ('71','100');
INSERT INTO `t_account_role` VALUES ('72','101');
INSERT INTO `t_account_role` VALUES ('72','102');

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_resource` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1000','部门');
INSERT INTO `t_resource` VALUES ('1001','人员');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `resourceId` int(11) ,
  `acl` int(11) ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_permission` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2500 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('2000', '部门管理',null, null);
INSERT INTO `t_permission` VALUES ('2001', '人员管理',null, null);

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('100', '2000' );
INSERT INTO `t_role_permission` VALUES ('100', '2001' );

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(256) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `mandays` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_plan`
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `projectId` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `numbers` int(11) NOT NULL,
  `planId` int(11) NOT NULL,
  `status` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_signup`
-- ----------------------------
DROP TABLE IF EXISTS `t_signup`;
CREATE TABLE `t_signup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `signerId` int(11) NOT NULL,
  `checkInId` int(11) DEFAULT NULL,
  `signUpDay` datetime DEFAULT null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_checkin`
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `checkInAccountId` int(11) NOT NULL,
  `checkInDay` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `t_rungin`
-- ----------------------------
DROP TABLE IF EXISTS `t_rungin`;
CREATE TABLE `t_rungin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `rungInAccountId` int(11) NOT NULL,
  `rungInDay` date NOT NULL,
  `forenoon` int(1) DEFAULT 0,
  `planId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- constraints of FK
-- ----------------------------
alter table `t_account`  add CONSTRAINT `FK_acc_dept` FOREIGN KEY (`deptId`) REFERENCES `t_dept` (`id`);
alter table `t_course`   add CONSTRAINT `FK_course_plan` FOREIGN KEY (`planId`) REFERENCES `t_plan` (`id`);
alter table `t_plan`     add CONSTRAINT `FK_plan_project` FOREIGN KEY (`projectId`) REFERENCES `t_project` (`id`);


-- ----------------------------
-- VIEWs
-- ----------------------------
create or replace view `v_project` as 
select e.*, sum(if(ifnull(t.id,0) = 0,0,1))/2 as actualMandays
from t_project as e 
left join t_rungin as t on
e.id =  t.projectid
group by e.id;

