/* This file is created by DBReback 1510631957 */ 
 /* 数据表结构 `shang_acl`*/ 
 DROP TABLE IF EXISTS `shang_acl`;/* DBReback Separation */ 
 CREATE TABLE `shang_acl` (
  `controller` text CHARACTER SET utf8,
  `group_id` int(10) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:49:{s:6:\"global\";a:17:{i:0;s:3:\"at1\";i:1;s:3:\"at1\";i:2;s:3:\"at2\";i:3;s:3:\"at3\";i:4;s:3:\"at4\";i:5;s:3:\"at5\";i:6;s:3:\"at6\";i:7;s:3:\"at5\";i:8;s:3:\"at6\";i:9;s:3:\"at7\";i:10;s:3:\"at8\";i:11;s:4:\"att8\";i:12;s:4:\"at22\";i:13;s:4:\"at23\";i:14;s:4:\"at24\";i:15;s:4:\"at25\";i:16;s:4:\"at26\";}s:2:\"ad\";a:4:{i:0;s:3:\"ad1\";i:1;s:3:\"ad2\";i:2;s:3:\"ad4\";i:3;s:3:\"ad3\";}s:11:\"loginonline\";a:2:{i:0;s:3:\"dl1\";i:1;s:3:\"dl2\";}s:4:\"auto\";a:2:{i:0;s:5:\"atjb1\";i:1;s:5:\"atjb2\";}s:10:\"appmanager\";a:3:{i:0;s:5:\"appm1\";i:1;s:5:\"appm2\";i:2;s:5:\"appm3\";}s:6:\"borrow\";a:19:{i:0;s:3:\"br1\";i:1;s:3:\"br2\";i:2;s:3:\"br3\";i:3;s:3:\"br4\";i:4;s:3:\"br5\";i:5;s:3:\"br6\";i:6;s:3:\"br8\";i:7;s:4:\"br20\";i:8;s:3:\"br7\";i:9;s:3:\"br7\";i:10;s:4:\"br15\";i:11;s:4:\"br20\";i:12;s:3:\"br9\";i:13;s:4:\"br20\";i:14;s:4:\"br11\";i:15;s:4:\"br13\";i:16;s:4:\"br14\";i:17;s:4:\"br16\";i:18;s:4:\"br17\";}s:4:\"debt\";a:2:{i:0;s:5:\"debt1\";i:1;s:5:\"debt2\";}s:7:\"expired\";a:3:{i:0;s:3:\"yq1\";i:1;s:3:\"yq2\";i:2;s:3:\"yq3\";}s:4:\"fund\";a:6:{i:0;s:5:\"fund1\";i:1;s:5:\"fund2\";i:2;s:5:\"fund3\";i:3;s:5:\"fund5\";i:4;s:5:\"fund6\";i:5;s:5:\"fund4\";}s:7:\"members\";a:9:{i:0;s:3:\"me1\";i:1;s:3:\"mx2\";i:2;s:3:\"mx3\";i:3;s:3:\"mxw\";i:4;s:4:\"xmxw\";i:5;s:3:\"me3\";i:6;s:3:\"me4\";i:7;s:3:\"me7\";i:8;s:3:\"me6\";}s:6:\"common\";a:5:{i:0;s:4:\"mex5\";i:1;s:4:\"sms1\";i:2;s:4:\"sms2\";i:3;s:4:\"sms3\";i:4;s:4:\"sms4\";}s:13:\"refereedetail\";a:2:{i:0;s:9:\"referee_1\";i:1;s:9:\"referee_2\";}s:6:\"spread\";a:5:{i:0;s:9:\"referee_3\";i:1;s:9:\"referee_4\";i:2;s:9:\"referee_5\";i:3;s:9:\"referee_6\";i:4;s:9:\"referee_7\";}s:5:\"jubao\";a:1:{i:0;s:3:\"me5\";}s:8:\"vipapply\";a:2:{i:0;s:4:\"vip1\";i:1;s:4:\"vip2\";}s:8:\"memberid\";a:3:{i:0;s:4:\"me10\";i:1;s:3:\"me9\";i:2;s:3:\"me8\";}s:10:\"memberdata\";a:4:{i:0;s:4:\"dat1\";i:1;s:4:\"dat3\";i:2;s:4:\"dat4\";i:3;s:4:\"dat5\";}s:11:\"verifyphone\";a:3:{i:0;s:7:\"vphone1\";i:1;s:7:\"vphone2\";i:2;s:7:\"vphone3\";}s:6:\"paylog\";a:2:{i:0;s:2:\"cz\";i:1;s:4:\"czgl\";}s:11:\"withdrawlog\";a:2:{i:0;s:3:\"cg2\";i:1;s:3:\"cg3\";}s:15:\"withdrawlogwait\";a:2:{i:0;s:3:\"cg4\";i:1;s:3:\"cg5\";}s:14:\"withdrawloging\";a:2:{i:0;s:3:\"cg6\";i:1;s:3:\"cg7\";}s:7:\"article\";a:4:{i:0;s:3:\"at1\";i:1;s:3:\"at2\";i:2;s:3:\"at3\";i:3;s:3:\"at4\";}s:9:\"acategory\";a:5:{i:0;s:4:\"act1\";i:1;s:4:\"act2\";i:2;s:4:\"act5\";i:3;s:4:\"act3\";i:4;s:4:\"act4\";}s:10:\"navigation\";a:5:{i:0;s:4:\"nav1\";i:1;s:4:\"nav2\";i:2;s:4:\"nav5\";i:3;s:4:\"nav3\";i:4;s:4:\"nav4\";}s:14:\"capitalaccount\";a:2:{i:0;s:9:\"capital_1\";i:1;s:9:\"capital_2\";}s:10:\"capitalhas\";a:2:{i:0;s:12:\"capitalhas_1\";i:1;s:12:\"capitalhas_2\";}s:12:\"capitalrepay\";a:2:{i:0;s:14:\"capitalrepay_1\";i:1;s:14:\"capitalrepay_2\";}s:13:\"capitalonline\";a:4:{i:0;s:9:\"capital_3\";i:1;s:9:\"capital_4\";i:2;s:9:\"capital_5\";i:3;s:9:\"capital_6\";}s:6:\"remark\";a:3:{i:0;s:3:\"rm1\";i:1;s:3:\"rm2\";i:2;s:3:\"rm3\";}s:13:\"capitaldetail\";a:2:{i:0;s:9:\"capital_7\";i:1;s:9:\"capital_8\";}s:10:\"capitalall\";a:1:{i:0;s:9:\"capital_9\";}s:3:\"acl\";a:4:{i:0;s:4:\"at73\";i:1;s:4:\"at74\";i:2;s:4:\"at75\";i:3;s:4:\"at76\";}s:9:\"adminuser\";a:5:{i:0;s:4:\"at77\";i:1;s:4:\"at78\";i:2;s:4:\"at79\";i:3;s:4:\"at99\";i:4;s:4:\"at80\";}s:2:\"db\";a:8:{i:0;s:3:\"db1\";i:1;s:3:\"db2\";i:2;s:3:\"db3\";i:3;s:3:\"db4\";i:4;s:3:\"db5\";i:5;s:3:\"db6\";i:6;s:3:\"db7\";i:7;s:3:\"db8\";}s:5:\"kissy\";a:1:{i:0;s:4:\"at81\";}s:7:\"bconfig\";a:2:{i:0;s:3:\"fb1\";i:1;s:3:\"fb2\";}s:4:\"leve\";a:4:{i:0;s:3:\"jb1\";i:1;s:3:\"jb2\";i:2;s:3:\"jb3\";i:3;s:3:\"jb4\";}s:3:\"id5\";a:1:{i:0;s:3:\"id5\";}s:3:\"age\";a:2:{i:0;s:3:\"bc1\";i:1;s:3:\"bc2\";}s:6:\"hetong\";a:2:{i:0;s:3:\"ht1\";i:1;s:3:\"ht2\";}s:2:\"qq\";a:9:{i:0;s:3:\"qq5\";i:1;s:3:\"qq6\";i:2;s:3:\"qq7\";i:3;s:4:\"qun5\";i:4;s:4:\"qun6\";i:5;s:4:\"qun7\";i:6;s:4:\"tel5\";i:7;s:4:\"tel6\";i:8;s:4:\"tel7\";}s:9:\"payonline\";a:2:{i:0;s:3:\"jk1\";i:1;s:3:\"jk2\";}s:6:\"wappay\";a:2:{i:0;s:3:\"wp1\";i:1;s:3:\"wp2\";}s:10:\"payoffline\";a:2:{i:0;s:8:\"offline1\";i:1;s:8:\"offline2\";}s:9:\"msgonline\";a:4:{i:0;s:3:\"jk3\";i:1;s:3:\"jk4\";i:2;s:3:\"jk5\";i:3;s:3:\"jk6\";}s:9:\"redpacket\";a:4:{i:0;s:4:\"rpk1\";i:1;s:4:\"rpk2\";i:2;s:4:\"rpk3\";i:3;s:4:\"rpk5\";}s:18:\"interestratecoupon\";a:2:{i:0;s:4:\"irc1\";i:1;s:4:\"irc2\";}s:9:\"privilege\";a:3:{i:0;s:4:\"pri1\";i:1;s:4:\"pri2\";i:2;s:4:\"pri3\";}}','5','超级管理员权限');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:13:{s:6:\"global\";a:1:{i:0;s:4:\"at23\";}s:6:\"borrow\";a:10:{i:0;s:3:\"br1\";i:1;s:3:\"br2\";i:2;s:3:\"br5\";i:3;s:3:\"br6\";i:4;s:3:\"br7\";i:5;s:3:\"br7\";i:6;s:3:\"br9\";i:7;s:4:\"br11\";i:8;s:4:\"br13\";i:9;s:4:\"br14\";}s:7:\"expired\";a:2:{i:0;s:3:\"yq1\";i:1;s:3:\"yq3\";}s:7:\"members\";a:8:{i:0;s:3:\"me1\";i:1;s:3:\"mx2\";i:2;s:3:\"mx3\";i:3;s:4:\"xmxw\";i:4;s:3:\"me3\";i:5;s:3:\"me4\";i:6;s:3:\"me7\";i:7;s:3:\"me6\";}s:6:\"common\";a:1:{i:0;s:4:\"mex5\";}s:8:\"vipapply\";a:2:{i:0;s:4:\"vip1\";i:1;s:4:\"vip2\";}s:8:\"memberid\";a:2:{i:0;s:4:\"me10\";i:1;s:3:\"me9\";}s:10:\"memberdata\";a:1:{i:0;s:4:\"dat1\";}s:11:\"verifyphone\";a:2:{i:0;s:7:\"vphone1\";i:1;s:7:\"vphone2\";}s:11:\"withdrawlog\";a:2:{i:0;s:3:\"cg2\";i:1;s:3:\"cg3\";}s:14:\"capitalaccount\";a:2:{i:0;s:9:\"capital_1\";i:1;s:9:\"capital_2\";}s:13:\"capitalonline\";a:4:{i:0;s:9:\"capital_3\";i:1;s:9:\"capital_4\";i:2;s:9:\"capital_5\";i:3;s:9:\"capital_6\";}s:13:\"capitaldetail\";a:2:{i:0;s:9:\"capital_7\";i:1;s:9:\"capital_8\";}}','15','审核专员');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:13:{s:6:\"borrow\";a:9:{i:0;s:3:\"br1\";i:1;s:3:\"br3\";i:2;s:3:\"br5\";i:3;s:3:\"br7\";i:4;s:3:\"br7\";i:5;s:3:\"br9\";i:6;s:4:\"br11\";i:7;s:4:\"br13\";i:8;s:4:\"br14\";}s:7:\"expired\";a:2:{i:0;s:3:\"yq1\";i:1;s:3:\"yq3\";}s:7:\"members\";a:4:{i:0;s:3:\"me1\";i:1;s:3:\"me3\";i:2;s:3:\"me4\";i:3;s:3:\"me7\";}s:6:\"common\";a:1:{i:0;s:4:\"mex5\";}s:8:\"memberid\";a:1:{i:0;s:4:\"me10\";}s:11:\"verifyphone\";a:1:{i:0;s:7:\"vphone1\";}s:6:\"paylog\";a:2:{i:0;s:2:\"cz\";i:1;s:4:\"czgl\";}s:11:\"withdrawlog\";a:2:{i:0;s:3:\"cg2\";i:1;s:3:\"cg3\";}s:15:\"withdrawlogwait\";a:2:{i:0;s:3:\"cg4\";i:1;s:3:\"cg5\";}s:14:\"withdrawloging\";a:2:{i:0;s:3:\"cg6\";i:1;s:3:\"cg7\";}s:14:\"capitalaccount\";a:2:{i:0;s:9:\"capital_1\";i:1;s:9:\"capital_2\";}s:13:\"capitalonline\";a:4:{i:0;s:9:\"capital_3\";i:1;s:9:\"capital_4\";i:2;s:9:\"capital_5\";i:3;s:9:\"capital_6\";}s:13:\"capitaldetail\";a:2:{i:0;s:9:\"capital_7\";i:1;s:9:\"capital_8\";}}','16','财务');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:11:{s:6:\"global\";a:3:{i:0;s:3:\"at1\";i:1;s:3:\"at1\";i:2;s:4:\"at22\";}s:6:\"borrow\";a:8:{i:0;s:3:\"br1\";i:1;s:3:\"br3\";i:2;s:3:\"br5\";i:3;s:3:\"br7\";i:4;s:3:\"br7\";i:5;s:3:\"br9\";i:6;s:4:\"br13\";i:7;s:4:\"br14\";}s:7:\"expired\";a:1:{i:0;s:3:\"yq3\";}s:7:\"members\";a:2:{i:0;s:3:\"me1\";i:1;s:3:\"me7\";}s:8:\"vipapply\";a:1:{i:0;s:4:\"vip1\";}s:8:\"memberid\";a:1:{i:0;s:4:\"me10\";}s:10:\"memberdata\";a:1:{i:0;s:4:\"dat1\";}s:11:\"verifyphone\";a:1:{i:0;s:7:\"vphone1\";}s:14:\"capitalaccount\";a:2:{i:0;s:9:\"capital_1\";i:1;s:9:\"capital_2\";}s:13:\"capitalonline\";a:4:{i:0;s:9:\"capital_3\";i:1;s:9:\"capital_4\";i:2;s:9:\"capital_5\";i:3;s:9:\"capital_6\";}s:13:\"capitaldetail\";a:2:{i:0;s:9:\"capital_7\";i:1;s:9:\"capital_8\";}}','17','管理D组');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:10:{s:6:\"global\";a:2:{i:0;s:3:\"at1\";i:1;s:3:\"at1\";}s:6:\"borrow\";a:6:{i:0;s:3:\"br1\";i:1;s:3:\"br3\";i:2;s:3:\"br5\";i:3;s:3:\"br7\";i:4;s:3:\"br7\";i:5;s:3:\"br9\";}s:7:\"members\";a:2:{i:0;s:3:\"me1\";i:1;s:3:\"me7\";}s:5:\"jubao\";a:1:{i:0;s:3:\"me5\";}s:8:\"vipapply\";a:1:{i:0;s:4:\"vip1\";}s:8:\"memberid\";a:1:{i:0;s:4:\"me10\";}s:10:\"memberdata\";a:1:{i:0;s:4:\"dat1\";}s:11:\"verifyphone\";a:1:{i:0;s:7:\"vphone1\";}s:11:\"withdrawlog\";a:1:{i:0;s:3:\"cg2\";}s:5:\"kissy\";a:1:{i:0;s:4:\"at81\";}}','18','管理C组');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:20:{s:6:\"global\";a:8:{i:0;s:3:\"at1\";i:1;s:3:\"at1\";i:2;s:3:\"at5\";i:3;s:3:\"at6\";i:4;s:3:\"at7\";i:5;s:3:\"at8\";i:6;s:4:\"att8\";i:7;s:4:\"at22\";}s:2:\"ad\";a:4:{i:0;s:3:\"ad1\";i:1;s:3:\"ad2\";i:2;s:3:\"ad4\";i:3;s:3:\"ad3\";}s:6:\"borrow\";a:12:{i:0;s:3:\"br1\";i:1;s:3:\"br2\";i:2;s:3:\"br3\";i:3;s:3:\"br4\";i:4;s:3:\"br5\";i:5;s:3:\"br6\";i:6;s:3:\"br7\";i:7;s:3:\"br7\";i:8;s:3:\"br9\";i:9;s:4:\"br11\";i:10;s:4:\"br13\";i:11;s:4:\"br14\";}s:7:\"expired\";a:3:{i:0;s:3:\"yq1\";i:1;s:3:\"yq2\";i:2;s:3:\"yq3\";}s:7:\"members\";a:9:{i:0;s:3:\"me1\";i:1;s:3:\"mx2\";i:2;s:3:\"mx3\";i:3;s:3:\"mxw\";i:4;s:4:\"xmxw\";i:5;s:3:\"me3\";i:6;s:3:\"me4\";i:7;s:3:\"me7\";i:8;s:3:\"me6\";}s:6:\"common\";a:1:{i:0;s:4:\"mex5\";}s:5:\"jubao\";a:1:{i:0;s:3:\"me5\";}s:8:\"vipapply\";a:2:{i:0;s:4:\"vip1\";i:1;s:4:\"vip2\";}s:8:\"memberid\";a:2:{i:0;s:4:\"me10\";i:1;s:3:\"me9\";}s:10:\"memberdata\";a:1:{i:0;s:4:\"dat1\";}s:11:\"verifyphone\";a:2:{i:0;s:7:\"vphone1\";i:1;s:7:\"vphone2\";}s:11:\"withdrawlog\";a:2:{i:0;s:3:\"cg2\";i:1;s:3:\"cg3\";}s:7:\"article\";a:4:{i:0;s:3:\"at1\";i:1;s:3:\"at2\";i:2;s:3:\"at3\";i:3;s:3:\"at4\";}s:9:\"acategory\";a:5:{i:0;s:4:\"act1\";i:1;s:4:\"act2\";i:2;s:4:\"act5\";i:3;s:4:\"act3\";i:4;s:4:\"act4\";}s:8:\"feedback\";a:3:{i:0;s:4:\"msg1\";i:1;s:4:\"msg2\";i:2;s:4:\"msg3\";}s:14:\"capitalaccount\";a:2:{i:0;s:9:\"capital_1\";i:1;s:9:\"capital_2\";}s:13:\"capitalonline\";a:4:{i:0;s:9:\"capital_3\";i:1;s:9:\"capital_4\";i:2;s:9:\"capital_5\";i:3;s:9:\"capital_6\";}s:13:\"capitaldetail\";a:2:{i:0;s:9:\"capital_7\";i:1;s:9:\"capital_8\";}s:4:\"leve\";a:2:{i:0;s:3:\"jb1\";i:1;s:3:\"jb2\";}s:3:\"age\";a:2:{i:0;s:3:\"bc1\";i:1;s:3:\"bc2\";}}','20','管理B组');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:43:{s:6:\"global\";a:7:{i:0;s:3:\"at1\";i:1;s:3:\"at1\";i:2;s:3:\"at5\";i:3;s:3:\"at5\";i:4;s:4:\"att8\";i:5;s:4:\"at22\";i:6;s:4:\"at23\";}s:2:\"ad\";a:1:{i:0;s:3:\"ad1\";}s:11:\"loginonline\";a:2:{i:0;s:3:\"dl1\";i:1;s:3:\"dl2\";}s:6:\"borrow\";a:16:{i:0;s:3:\"br1\";i:1;s:3:\"br2\";i:2;s:3:\"br3\";i:3;s:3:\"br4\";i:4;s:3:\"br5\";i:5;s:3:\"br6\";i:6;s:3:\"br8\";i:7;s:3:\"br7\";i:8;s:3:\"br7\";i:9;s:4:\"br15\";i:10;s:3:\"br9\";i:11;s:4:\"br11\";i:12;s:4:\"br13\";i:13;s:4:\"br14\";i:14;s:4:\"br16\";i:15;s:4:\"br17\";}s:4:\"debt\";a:2:{i:0;s:5:\"debt1\";i:1;s:5:\"debt2\";}s:18:\"interestratecoupon\";a:6:{i:0;s:4:\"irc1\";i:1;s:4:\"irc2\";i:2;s:4:\"irc3\";i:3;s:4:\"irc5\";i:4;s:4:\"irc6\";i:5;s:4:\"irc7\";}s:7:\"expired\";a:3:{i:0;s:3:\"yq1\";i:1;s:3:\"yq2\";i:2;s:3:\"yq3\";}s:4:\"fund\";a:4:{i:0;s:5:\"fund1\";i:1;s:5:\"fund2\";i:2;s:5:\"fund3\";i:3;s:5:\"fund4\";}s:7:\"members\";a:8:{i:0;s:3:\"me1\";i:1;s:3:\"mx2\";i:2;s:3:\"mx3\";i:3;s:4:\"xmxw\";i:4;s:3:\"me3\";i:5;s:3:\"me4\";i:6;s:3:\"me7\";i:7;s:3:\"me6\";}s:6:\"common\";a:5:{i:0;s:4:\"mex5\";i:1;s:4:\"sms1\";i:2;s:4:\"sms2\";i:3;s:4:\"sms3\";i:4;s:4:\"sms4\";}s:13:\"refereedetail\";a:2:{i:0;s:9:\"referee_1\";i:1;s:9:\"referee_2\";}s:5:\"jubao\";a:1:{i:0;s:3:\"me5\";}s:8:\"vipapply\";a:2:{i:0;s:4:\"vip1\";i:1;s:4:\"vip2\";}s:8:\"memberid\";a:3:{i:0;s:4:\"me10\";i:1;s:3:\"me9\";i:2;s:3:\"me8\";}s:10:\"memberdata\";a:4:{i:0;s:4:\"dat1\";i:1;s:4:\"dat3\";i:2;s:4:\"dat4\";i:3;s:4:\"dat5\";}s:11:\"verifyphone\";a:3:{i:0;s:7:\"vphone1\";i:1;s:7:\"vphone2\";i:2;s:7:\"vphone3\";}s:6:\"market\";a:12:{i:0;s:3:\"mk0\";i:1;s:3:\"mk1\";i:2;s:3:\"mk2\";i:3;s:3:\"mk3\";i:4;s:3:\"mk4\";i:5;s:3:\"mk5\";i:6;s:3:\"mk6\";i:7;s:3:\"mk7\";i:8;s:3:\"mk8\";i:9;s:6:\"mkcom1\";i:10;s:6:\"mkcom2\";i:11;s:6:\"mkcom3\";}s:6:\"paylog\";a:2:{i:0;s:2:\"cz\";i:1;s:4:\"czgl\";}s:11:\"withdrawlog\";a:2:{i:0;s:3:\"cg2\";i:1;s:3:\"cg3\";}s:15:\"withdrawlogwait\";a:2:{i:0;s:3:\"cg4\";i:1;s:3:\"cg5\";}s:14:\"withdrawloging\";a:2:{i:0;s:3:\"cg6\";i:1;s:3:\"cg7\";}s:7:\"article\";a:4:{i:0;s:3:\"at1\";i:1;s:3:\"at2\";i:2;s:3:\"at3\";i:3;s:3:\"at4\";}s:9:\"acategory\";a:1:{i:0;s:4:\"act1\";}s:10:\"navigation\";a:1:{i:0;s:4:\"nav1\";}s:8:\"feedback\";a:3:{i:0;s:4:\"msg1\";i:1;s:4:\"msg2\";i:2;s:4:\"msg3\";}s:14:\"capitalaccount\";a:2:{i:0;s:9:\"capital_1\";i:1;s:9:\"capital_2\";}s:12:\"capitalrepay\";a:2:{i:0;s:14:\"capitalrepay_1\";i:1;s:14:\"capitalrepay_2\";}s:13:\"capitalonline\";a:4:{i:0;s:9:\"capital_3\";i:1;s:9:\"capital_4\";i:2;s:9:\"capital_5\";i:3;s:9:\"capital_6\";}s:6:\"remark\";a:3:{i:0;s:3:\"rm1\";i:1;s:3:\"rm2\";i:2;s:3:\"rm3\";}s:13:\"capitaldetail\";a:2:{i:0;s:9:\"capital_7\";i:1;s:9:\"capital_8\";}s:10:\"capitalall\";a:1:{i:0;s:9:\"capital_9\";}s:5:\"kissy\";a:1:{i:0;s:4:\"at81\";}s:7:\"bconfig\";a:1:{i:0;s:3:\"fb1\";}s:4:\"leve\";a:2:{i:0;s:3:\"jb1\";i:1;s:3:\"jb3\";}s:3:\"id5\";a:1:{i:0;s:3:\"id5\";}s:8:\"shangid5\";a:1:{i:0;s:8:\"shangid5\";}s:3:\"age\";a:1:{i:0;s:3:\"bc1\";}s:6:\"hetong\";a:1:{i:0;s:3:\"ht1\";}s:2:\"qq\";a:3:{i:0;s:3:\"qq5\";i:1;s:4:\"qun5\";i:2;s:4:\"tel5\";}s:9:\"payonline\";a:1:{i:0;s:3:\"jk1\";}s:6:\"wappay\";a:1:{i:0;s:3:\"wp1\";}s:10:\"payoffline\";a:1:{i:0;s:8:\"offline1\";}s:9:\"msgonline\";a:2:{i:0;s:3:\"jk3\";i:1;s:3:\"jk5\";}}','21','演示管理员');/* DBReback Separation */
 /* 插入数据 `shang_acl` */
 INSERT INTO `shang_acl` VALUES ('a:7:{s:6:\"borrow\";a:7:{i:0;s:3:\"br1\";i:1;s:3:\"br2\";i:2;s:3:\"br3\";i:3;s:3:\"br4\";i:4;s:3:\"br5\";i:5;s:3:\"br6\";i:6;s:3:\"br8\";}s:7:\"members\";a:3:{i:0;s:3:\"me1\";i:1;s:3:\"me3\";i:2;s:3:\"me4\";}s:6:\"common\";a:1:{i:0;s:4:\"mex5\";}s:7:\"article\";a:4:{i:0;s:3:\"at1\";i:1;s:3:\"at2\";i:2;s:3:\"at3\";i:3;s:3:\"at4\";}s:9:\"acategory\";a:5:{i:0;s:4:\"act1\";i:1;s:4:\"act2\";i:2;s:4:\"act5\";i:3;s:4:\"act3\";i:4;s:4:\"act4\";}s:5:\"kissy\";a:1:{i:0;s:4:\"at81\";}s:9:\"msgonline\";a:1:{i:0;s:3:\"jk3\";}}','22','客服');/* DBReback Separation */ 
 /* 数据表结构 `shang_ad`*/ 
 DROP TABLE IF EXISTS `shang_ad`;/* DBReback Separation */ 
 CREATE TABLE `shang_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `ad_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('1','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171025151734.png\" />','1403082675','1403082675','1403082675','LOGO（350*48像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('3','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20170927092150.jpg\" />','1403082675','1403082675','1403082675','投资详情——头部（1200*122像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('4','a:4:{i:0;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20171025092752144.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:32:\"http://runze360.com/invest/index\";}i:1;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20171024085803484.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:2;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20171024084706234.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:3;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20171024212317680.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}}','1403082675','1403082675','1403082675','首页——滚动图（1960*440像素）','1');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('19','<img style=\"height: 107px; width: 97px; float: none; margin: 0px;\" alt=\"\" src=\"/Static/Uploads/Article/20160805163148.png\" />','0','0','1445570866','网站数据-首页-中-右','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('20','<img alt=\"\" src=\"/Static/Uploads/Article/20171001183654.png\" />','0','0','1445591129','首页-优计划（248*379）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('12','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171024200631.jpg\" /><br />&nbsp;','0','0','1414318996','计算工具——头部（1200*122像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('31','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20170927091536.jpg\" />','0','0','1446086931','关于我们——头部（1200*122像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('8','<img style=\"height:133px;width:133px;float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171024212632.png\" />','0','0','1403082675','首页——底部——二维码右','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('13','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171006155841.png\" />','0','0','1414396969','我的账户-广告位0','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('9','<img style=\"height:133px;width:133px;float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171024212616.png\" />','0','0','1403082675','首页——底部——二维码左','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('14','<span style=\"display:block;font-size:16px;color:#000;padding-bottom:5px;\">申请条件</span> 22-55周岁的中国公民<br /> 在现单位工作满6个月<br /> <span style=\"display:block;font-size:16px;color:#000;padding-bottom:5px;\">额度</span> 可使用额度:{$minfo.credit_limit|Fmoney=###}<br /> 已使用额度:{:Fmoney($minfo[\'credit_cuse\']-$minfo[\'credit_limit\'])}<br /> 提示:<if condition=\"$minfo.credit_cuse gt 0\">额度正常<else>额度不足</else></if><else> </else><br /> <else><span style=\"display:block;font-size:16px;color:#000;padding-bottom:5px;\">信用标描述</span> 以借款人的信用作为其借款额度的标准发布的借款，借款时须先申请相关信用额度。</else><br />&nbsp;','0','0','1438828853','标种-信用标','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('21','<img alt=\"\" src=\"/Static/Uploads/Article/20171001182236.png\" />','0','0','1445591153','首页-新手标（248*379）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('22','<img alt=\"\" src=\"/Static/Uploads/Article/20171001183121.png\" />','0','0','1445591223','首页-精选散标（248*379）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('26','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171004161248.png\" />','0','0','1445662106','用户中心广告位1（221*113像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('27','<img alt=\"\" style=\"float:none;margin:0px;\" src=\"/Static/Uploads/Article/20170927084834.jpg\" />','0','0','1445663045','我要投资——头部（1200*122像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('28','a:3:{i:0;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20170927084524715.png\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:1;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20170927084528835.png\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:2;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20170927084528147.png\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}}','0','0','1445669098','公司风采','1');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('29','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171024085206.jpg\" />','0','0','1445827127','我要借款——头部（1200*122像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('30','<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20170927091425.png\" />','0','0','1445937923','实时财务——头部（1200*122像素）','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('32','a:1:{i:0;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20171024085835723.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}}','0','0','1446452590','微信端--首页--轮播图','1');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('40','http://weibo.com/','0','0','1506869556','微博链接地址','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('38','<img alt=\"\" src=\"/Static/Uploads/Article/20171001224253.png\" />','0','0','1498204019','头部微信二维码','0');/* DBReback Separation */
 /* 插入数据 `shang_ad` */
 INSERT INTO `shang_ad` VALUES ('39','a:1:{i:0;a:3:{s:3:\"img\";s:39:\"Static/Uploads/Ad/20170927091142404.jpg\";s:4:\"info\";s:0:\"\";s:3:\"url\";s:0:\"\";}}','0','0','1503968457','积分商城轮播','1');/* DBReback Separation */ 
 /* 数据表结构 `shang_app_manager`*/ 
 DROP TABLE IF EXISTS `shang_app_manager`;/* DBReback Separation */ 
 CREATE TABLE `shang_app_manager` (
  `banner_img` varchar(3000) CHARACTER SET utf8 DEFAULT NULL,
  `text_content` text CHARACTER SET utf8,
  `kefu` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `kefu_time` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `erweima` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `weixin` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `weibo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `more_img` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `id` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_area`*/ 
 DROP TABLE IF EXISTS `shang_area`;/* DBReback Separation */ 
 CREATE TABLE `shang_area` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `reid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_open` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`reid`,`sort_order`),
  KEY `is_open` (`is_open`,`domain`,`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=3414 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1','0','中国','0','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2','1','北京','1','1','bj');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3','1','安徽','1','0','ah');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('4','1','福建','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('5','1','甘肃','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('6','1','广东','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('7','1','广西','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('8','1','贵州','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('9','1','海南','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('10','1','河北','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('11','1','河南','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('12','1','黑龙江','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('13','1','湖北','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('14','1','湖南','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('15','1','吉林','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('16','1','江苏','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('17','1','江西','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('18','1','辽宁','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('19','1','内蒙古','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('20','1','宁夏','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('21','1','青海','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('22','1','山东','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('23','1','山西','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('24','1','陕西','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('25','1','上海','1','1','sh');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('26','1','四川','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('27','1','天津','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('28','1','西藏','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('29','1','新疆','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('30','1','云南','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('31','1','浙江','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('32','1','重庆','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('33','1','香港','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('34','1','澳门','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('35','1','台湾','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('36','3','安庆','2','1','aq');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('37','3','蚌埠','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('38','3','巢湖','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('39','3','池州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('40','3','滁州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('41','3','阜阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('42','3','淮北','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('43','3','淮南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('44','3','黄山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('45','3','六安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('46','3','马鞍山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('47','3','宿州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('48','3','铜陵','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('49','3','芜湖','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('50','3','宣城','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('51','3','亳州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('52','2','北京','2','1','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('53','4','福州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('54','4','龙岩','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('55','4','南平','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('56','4','宁德','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('57','4','莆田','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('58','4','泉州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('59','4','三明','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('60','4','厦门','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('61','4','漳州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('62','5','兰州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('63','5','白银','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('64','5','定西','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('65','5','甘南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('66','5','嘉峪关','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('67','5','金昌','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('68','5','酒泉','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('69','5','临夏','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('70','5','陇南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('71','5','平凉','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('72','5','庆阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('73','5','天水','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('74','5','武威','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('75','5','张掖','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('76','6','广州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('77','6','深圳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('78','6','潮州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('79','6','东莞','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('80','6','佛山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('81','6','河源','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('82','6','惠州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('83','6','江门','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('84','6','揭阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('85','6','茂名','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('86','6','梅州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('87','6','清远','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('88','6','汕头','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('89','6','汕尾','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('90','6','韶关','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('91','6','阳江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('92','6','云浮','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('93','6','湛江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('94','6','肇庆','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('95','6','中山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('96','6','珠海','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('97','7','南宁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('98','7','桂林','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('99','7','百色','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('100','7','北海','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('101','7','崇左','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('102','7','防城港','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('103','7','贵港','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('104','7','河池','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('105','7','贺州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('106','7','来宾','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('107','7','柳州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('108','7','钦州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('109','7','梧州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('110','7','玉林','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('111','8','贵阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('112','8','安顺','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('113','8','毕节','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('114','8','六盘水','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('115','8','黔东南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('116','8','黔南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('117','8','黔西南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('118','8','铜仁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('119','8','遵义','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('120','9','海口','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('121','9','三亚','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('122','9','白沙','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('123','9','保亭','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('124','9','昌江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('125','9','澄迈县','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('126','9','定安县','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('127','9','东方','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('128','9','乐东','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('129','9','临高县','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('130','9','陵水','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('131','9','琼海','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('132','9','琼中','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('133','9','屯昌县','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('134','9','万宁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('135','9','文昌','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('136','9','五指山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('137','9','儋州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('138','10','石家庄','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('139','10','保定','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('140','10','沧州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('141','10','承德','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('142','10','邯郸','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('143','10','衡水','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('144','10','廊坊','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('145','10','秦皇岛','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('146','10','唐山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('147','10','邢台','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('148','10','张家口','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('149','11','郑州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('150','11','洛阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('151','11','开封','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('152','11','安阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('153','11','鹤壁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('154','11','济源','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('155','11','焦作','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('156','11','南阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('157','11','平顶山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('158','11','三门峡','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('159','11','商丘','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('160','11','新乡','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('161','11','信阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('162','11','许昌','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('163','11','周口','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('164','11','驻马店','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('165','11','漯河','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('166','11','濮阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('167','12','哈尔滨','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('168','12','大庆','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('169','12','大兴安岭','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('170','12','鹤岗','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('171','12','黑河','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('172','12','鸡西','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('173','12','佳木斯','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('174','12','牡丹江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('175','12','七台河','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('176','12','齐齐哈尔','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('177','12','双鸭山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('178','12','绥化','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('179','12','伊春','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('180','13','武汉','100','0','wh');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('181','13','仙桃','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('182','13','鄂州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('183','13','黄冈','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('184','13','黄石','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('185','13','荆门','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('186','13','荆州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('187','13','潜江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('188','13','神农架林区','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('189','13','十堰','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('190','13','随州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('191','13','天门','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('192','13','咸宁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('193','13','襄樊','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('194','13','孝感','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('195','13','宜昌','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('196','13','恩施','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('197','14','长沙','2','0','cs');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('198','14','张家界','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('199','14','常德','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('200','14','郴州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('201','14','衡阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('202','14','怀化','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('203','14','娄底','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('204','14','邵阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('205','14','湘潭','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('206','14','湘西','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('207','14','益阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('208','14','永州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('209','14','岳阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('210','14','株洲','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('211','15','长春','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('212','15','吉林','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('213','15','白城','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('214','15','白山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('215','15','辽源','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('216','15','四平','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('217','15','松原','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('218','15','通化','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('219','15','延边','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('220','16','南京','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('221','16','苏州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('222','16','无锡','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('223','16','常州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('224','16','淮安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('225','16','连云港','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('226','16','南通','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('227','16','宿迁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('228','16','泰州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('229','16','徐州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('230','16','盐城','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('231','16','扬州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('232','16','镇江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('233','17','南昌','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('234','17','抚州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('235','17','赣州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('236','17','吉安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('237','17','景德镇','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('238','17','九江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('239','17','萍乡','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('240','17','上饶','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('241','17','新余','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('242','17','宜春','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('243','17','鹰潭','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('244','18','沈阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('245','18','大连','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('246','18','鞍山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('247','18','本溪','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('248','18','朝阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('249','18','丹东','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('250','18','抚顺','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('251','18','阜新','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('252','18','葫芦岛','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('253','18','锦州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('254','18','辽阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('255','18','盘锦','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('256','18','铁岭','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('257','18','营口','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('258','19','呼和浩特','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('259','19','阿拉善盟','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('260','19','巴彦淖尔盟','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('261','19','包头','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('262','19','赤峰','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('263','19','鄂尔多斯','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('264','19','呼伦贝尔','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('265','19','通辽','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('266','19','乌海','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('267','19','乌兰察布市','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('268','19','锡林郭勒盟','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('269','19','兴安盟','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('270','20','银川','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('271','20','固原','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('272','20','石嘴山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('273','20','吴忠','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('274','20','中卫','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('275','21','西宁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('276','21','果洛','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('277','21','海北','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('278','21','海东','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('279','21','海南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('280','21','海西','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('281','21','黄南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('282','21','玉树','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('283','22','济南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('284','22','青岛','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('285','22','滨州','2','0','binzhou');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('286','22','德州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('287','22','东营','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('288','22','菏泽','2','0','heze');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('289','22','济宁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('290','22','莱芜','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('291','22','聊城','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('292','22','临沂','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('293','22','日照','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('294','22','泰安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('295','22','威海','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('296','22','潍坊','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('297','22','烟台','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('298','22','枣庄','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('299','22','淄博','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('300','23','太原','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('301','23','长治','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('302','23','大同','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('303','23','晋城','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('304','23','晋中','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('305','23','临汾','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('306','23','吕梁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('307','23','朔州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('308','23','忻州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('309','23','阳泉','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('310','23','运城','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('311','24','西安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('312','24','安康','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('313','24','宝鸡','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('314','24','汉中','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('315','24','商洛','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('316','24','铜川','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('317','24','渭南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('318','24','咸阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('319','24','延安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('320','24','榆林','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('321','25','上海','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('322','26','成都','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('323','26','绵阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('324','26','阿坝','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('325','26','巴中','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('326','26','达州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('327','26','德阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('328','26','甘孜','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('329','26','广安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('330','26','广元','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('331','26','乐山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('332','26','凉山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('333','26','眉山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('334','26','南充','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('335','26','内江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('336','26','攀枝花','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('337','26','遂宁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('338','26','雅安','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('339','26','宜宾','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('340','26','资阳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('341','26','自贡','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('342','26','泸州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('343','27','天津','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('344','28','拉萨','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('345','28','阿里','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('346','28','昌都','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('347','28','林芝','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('348','28','那曲','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('349','28','日喀则','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('350','28','山南','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('351','29','乌鲁木齐','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('352','29','阿克苏','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('353','29','阿拉尔','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('354','29','巴音郭楞','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('355','29','博尔塔拉','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('356','29','昌吉','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('357','29','哈密','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('358','29','和田','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('359','29','喀什','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('360','29','克拉玛依','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('361','29','克孜勒苏','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('362','29','石河子','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('363','29','图木舒克','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('364','29','吐鲁番','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('365','29','五家渠','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('366','29','伊犁','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('367','30','昆明','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('368','30','怒江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('369','30','普洱','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('370','30','丽江','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('371','30','保山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('372','30','楚雄','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('373','30','大理','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('374','30','德宏','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('375','30','迪庆','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('376','30','红河','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('377','30','临沧','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('378','30','曲靖','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('379','30','文山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('380','30','西双版纳','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('381','30','玉溪','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('382','30','昭通','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('383','31','杭州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('384','31','湖州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('385','31','嘉兴','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('386','31','金华','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('387','31','丽水','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('388','31','宁波','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('389','31','绍兴','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('390','31','台州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('391','31','温州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('392','31','舟山','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('393','31','衢州','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('394','32','重庆','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('395','33','香港','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('396','34','澳门','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('397','35','台湾','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('398','36','迎江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('399','36','大观区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('400','36','宜秀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('401','36','桐城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('402','36','怀宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('403','36','枞阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('404','36','潜山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('405','36','太湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('406','36','宿松县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('407','36','望江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('408','36','岳西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('409','37','中市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('410','37','东市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('411','37','西市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('412','37','郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('413','37','怀远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('414','37','五河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('415','37','固镇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('416','38','居巢区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('417','38','庐江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('418','38','无为县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('419','38','含山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('420','38','和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('421','39','贵池区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('422','39','东至县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('423','39','石台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('424','39','青阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('425','40','琅琊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('426','40','南谯区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('427','40','天长市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('428','40','明光市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('429','40','来安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('430','40','全椒县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('431','40','定远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('432','40','凤阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('433','41','蚌山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('434','41','龙子湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('435','41','禹会区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('436','41','淮上区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('437','41','颍州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('438','41','颍东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('439','41','颍泉区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('440','41','界首市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('441','41','临泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('442','41','太和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('443','41','阜南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('444','41','颖上县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('445','42','相山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('446','42','杜集区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('447','42','烈山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('448','42','濉溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('449','43','田家庵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('450','43','大通区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('451','43','谢家集区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('452','43','八公山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('453','43','潘集区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('454','43','凤台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('455','44','屯溪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('456','44','黄山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('457','44','徽州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('458','44','歙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('459','44','休宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('460','44','黟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('461','44','祁门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('462','45','金安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('463','45','裕安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('464','45','寿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('465','45','霍邱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('466','45','舒城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('467','45','金寨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('468','45','霍山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('469','46','雨山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('470','46','花山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('471','46','金家庄区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('472','46','当涂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('473','47','埇桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('474','47','砀山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('475','47','萧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('476','47','灵璧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('477','47','泗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('478','48','铜官山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('479','48','狮子山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('480','48','郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('481','48','铜陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('482','49','镜湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('483','49','弋江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('484','49','鸠江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('485','49','三山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('486','49','芜湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('487','49','繁昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('488','49','南陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('489','50','宣州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('490','50','宁国市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('491','50','郎溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('492','50','广德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('493','50','泾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('494','50','绩溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('495','50','旌德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('496','51','涡阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('497','51','蒙城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('498','51','利辛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('499','51','谯城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('500','52','东城区','3','1','bj');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('501','52','西城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('502','52','海淀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('503','52','朝阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('504','52','崇文区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('505','52','宣武区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('506','52','丰台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('507','52','石景山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('508','52','房山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('509','52','门头沟区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('510','52','通州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('511','52','顺义区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('512','52','昌平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('513','52','怀柔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('514','52','平谷区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('515','52','大兴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('516','52','密云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('517','52','延庆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('518','53','鼓楼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('519','53','台江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('520','53','仓山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('521','53','马尾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('522','53','晋安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('523','53','福清市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('524','53','长乐市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('525','53','闽侯县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('526','53','连江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('527','53','罗源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('528','53','闽清县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('529','53','永泰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('530','53','平潭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('531','54','新罗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('532','54','漳平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('533','54','长汀县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('534','54','永定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('535','54','上杭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('536','54','武平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('537','54','连城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('538','55','延平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('539','55','邵武市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('540','55','武夷山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('541','55','建瓯市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('542','55','建阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('543','55','顺昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('544','55','浦城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('545','55','光泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('546','55','松溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('547','55','政和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('548','56','蕉城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('549','56','福安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('550','56','福鼎市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('551','56','霞浦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('552','56','古田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('553','56','屏南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('554','56','寿宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('555','56','周宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('556','56','柘荣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('557','57','城厢区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('558','57','涵江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('559','57','荔城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('560','57','秀屿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('561','57','仙游县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('562','58','鲤城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('563','58','丰泽区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('564','58','洛江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('565','58','清濛开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('566','58','泉港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('567','58','石狮市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('568','58','晋江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('569','58','南安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('570','58','惠安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('571','58','安溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('572','58','永春县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('573','58','德化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('574','58','金门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('575','59','梅列区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('576','59','三元区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('577','59','永安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('578','59','明溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('579','59','清流县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('580','59','宁化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('581','59','大田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('582','59','尤溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('583','59','沙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('584','59','将乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('585','59','泰宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('586','59','建宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('587','60','思明区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('588','60','海沧区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('589','60','湖里区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('590','60','集美区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('591','60','同安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('592','60','翔安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('593','61','芗城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('594','61','龙文区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('595','61','龙海市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('596','61','云霄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('597','61','漳浦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('598','61','诏安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('599','61','长泰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('600','61','东山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('601','61','南靖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('602','61','平和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('603','61','华安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('604','62','皋兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('605','62','城关区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('606','62','七里河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('607','62','西固区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('608','62','安宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('609','62','红古区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('610','62','永登县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('611','62','榆中县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('612','63','白银区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('613','63','平川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('614','63','会宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('615','63','景泰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('616','63','靖远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('617','64','临洮县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('618','64','陇西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('619','64','通渭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('620','64','渭源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('621','64','漳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('622','64','岷县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('623','64','安定区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('624','64','安定区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('625','65','合作市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('626','65','临潭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('627','65','卓尼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('628','65','舟曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('629','65','迭部县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('630','65','玛曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('631','65','碌曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('632','65','夏河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('633','66','嘉峪关市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('634','67','金川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('635','67','永昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('636','68','肃州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('637','68','玉门市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('638','68','敦煌市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('639','68','金塔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('640','68','瓜州县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('641','68','肃北','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('642','68','阿克塞','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('643','69','临夏市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('644','69','临夏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('645','69','康乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('646','69','永靖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('647','69','广河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('648','69','和政县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('649','69','东乡族自治县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('650','69','积石山','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('651','70','成县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('652','70','徽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('653','70','康县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('654','70','礼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('655','70','两当县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('656','70','文县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('657','70','西和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('658','70','宕昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('659','70','武都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('660','71','崇信县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('661','71','华亭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('662','71','静宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('663','71','灵台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('664','71','崆峒区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('665','71','庄浪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('666','71','泾川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('667','72','合水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('668','72','华池县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('669','72','环县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('670','72','宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('671','72','庆城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('672','72','西峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('673','72','镇原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('674','72','正宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('675','73','甘谷县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('676','73','秦安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('677','73','清水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('678','73','秦州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('679','73','麦积区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('680','73','武山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('681','73','张家川','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('682','74','古浪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('683','74','民勤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('684','74','天祝','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('685','74','凉州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('686','75','高台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('687','75','临泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('688','75','民乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('689','75','山丹县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('690','75','肃南','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('691','75','甘州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('692','76','从化市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('693','76','天河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('694','76','东山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('695','76','白云区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('696','76','海珠区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('697','76','荔湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('698','76','越秀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('699','76','黄埔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('700','76','番禺区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('701','76','花都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('702','76','增城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('703','76','从化区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('704','76','市郊','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('705','77','福田区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('706','77','罗湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('707','77','南山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('708','77','宝安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('709','77','龙岗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('710','77','盐田区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('711','78','湘桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('712','78','潮安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('713','78','饶平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('714','79','南城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('715','79','东城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('716','79','万江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('717','79','莞城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('718','79','石龙镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('719','79','虎门镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('720','79','麻涌镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('721','79','道滘镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('722','79','石碣镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('723','79','沙田镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('724','79','望牛墩镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('725','79','洪梅镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('726','79','茶山镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('727','79','寮步镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('728','79','大岭山镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('729','79','大朗镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('730','79','黄江镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('731','79','樟木头','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('732','79','凤岗镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('733','79','塘厦镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('734','79','谢岗镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('735','79','厚街镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('736','79','清溪镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('737','79','常平镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('738','79','桥头镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('739','79','横沥镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('740','79','东坑镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('741','79','企石镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('742','79','石排镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('743','79','长安镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('744','79','中堂镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('745','79','高埗镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('746','80','禅城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('747','80','南海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('748','80','顺德区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('749','80','三水区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('750','80','高明区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('751','81','东源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('752','81','和平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('753','81','源城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('754','81','连平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('755','81','龙川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('756','81','紫金县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('757','82','惠阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('758','82','惠城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('759','82','大亚湾','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('760','82','博罗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('761','82','惠东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('762','82','龙门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('763','83','江海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('764','83','蓬江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('765','83','新会区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('766','83','台山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('767','83','开平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('768','83','鹤山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('769','83','恩平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('770','84','榕城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('771','84','普宁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('772','84','揭东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('773','84','揭西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('774','84','惠来县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('775','85','茂南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('776','85','茂港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('777','85','高州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('778','85','化州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('779','85','信宜市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('780','85','电白县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('781','86','梅县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('782','86','梅江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('783','86','兴宁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('784','86','大埔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('785','86','丰顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('786','86','五华县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('787','86','平远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('788','86','蕉岭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('789','87','清城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('790','87','英德市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('791','87','连州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('792','87','佛冈县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('793','87','阳山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('794','87','清新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('795','87','连山','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('796','87','连南','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('797','88','南澳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('798','88','潮阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('799','88','澄海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('800','88','龙湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('801','88','金平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('802','88','濠江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('803','88','潮南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('804','89','城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('805','89','陆丰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('806','89','海丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('807','89','陆河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('808','90','曲江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('809','90','浈江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('810','90','武江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('811','90','曲江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('812','90','乐昌市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('813','90','南雄市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('814','90','始兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('815','90','仁化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('816','90','翁源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('817','90','新丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('818','90','乳源','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('819','91','江城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('820','91','阳春市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('821','91','阳西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('822','91','阳东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('823','92','云城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('824','92','罗定市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('825','92','新兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('826','92','郁南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('827','92','云安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('828','93','赤坎区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('829','93','霞山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('830','93','坡头区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('831','93','麻章区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('832','93','廉江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('833','93','雷州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('834','93','吴川市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('835','93','遂溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('836','93','徐闻县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('837','94','肇庆市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('838','94','高要市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('839','94','四会市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('840','94','广宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('841','94','怀集县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('842','94','封开县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('843','94','德庆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('844','95','石岐街道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('845','95','东区街道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('846','95','西区街道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('847','95','环城街道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('848','95','中山港街道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('849','95','五桂山街道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('850','96','香洲区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('851','96','斗门区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('852','96','金湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('853','97','邕宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('854','97','青秀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('855','97','兴宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('856','97','良庆区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('857','97','西乡塘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('858','97','江南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('859','97','武鸣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('860','97','隆安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('861','97','马山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('862','97','上林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('863','97','宾阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('864','97','横县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('865','98','秀峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('866','98','叠彩区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('867','98','象山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('868','98','七星区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('869','98','雁山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('870','98','阳朔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('871','98','临桂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('872','98','灵川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('873','98','全州县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('874','98','平乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('875','98','兴安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('876','98','灌阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('877','98','荔浦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('878','98','资源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('879','98','永福县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('880','98','龙胜','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('881','98','恭城','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('882','99','右江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('883','99','凌云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('884','99','平果县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('885','99','西林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('886','99','乐业县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('887','99','德保县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('888','99','田林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('889','99','田阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('890','99','靖西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('891','99','田东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('892','99','那坡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('893','99','隆林','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('894','100','海城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('895','100','银海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('896','100','铁山港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('897','100','合浦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('898','101','江州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('899','101','凭祥市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('900','101','宁明县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('901','101','扶绥县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('902','101','龙州县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('903','101','大新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('904','101','天等县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('905','102','港口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('906','102','防城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('907','102','东兴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('908','102','上思县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('909','103','港北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('910','103','港南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('911','103','覃塘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('912','103','桂平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('913','103','平南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('914','104','金城江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('915','104','宜州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('916','104','天峨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('917','104','凤山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('918','104','南丹县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('919','104','东兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('920','104','都安','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('921','104','罗城','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('922','104','巴马','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('923','104','环江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('924','104','大化','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('925','105','八步区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('926','105','钟山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('927','105','昭平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('928','105','富川','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('929','106','兴宾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('930','106','合山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('931','106','象州县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('932','106','武宣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('933','106','忻城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('934','106','金秀','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('935','107','城中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('936','107','鱼峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('937','107','柳北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('938','107','柳南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('939','107','柳江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('940','107','柳城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('941','107','鹿寨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('942','107','融安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('943','107','融水','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('944','107','三江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('945','108','钦南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('946','108','钦北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('947','108','灵山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('948','108','浦北县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('949','109','万秀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('950','109','蝶山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('951','109','长洲区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('952','109','岑溪市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('953','109','苍梧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('954','109','藤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('955','109','蒙山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('956','110','玉州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('957','110','北流市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('958','110','容县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('959','110','陆川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('960','110','博白县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('961','110','兴业县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('962','111','南明区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('963','111','云岩区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('964','111','花溪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('965','111','乌当区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('966','111','白云区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('967','111','小河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('968','111','金阳新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('969','111','新天园区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('970','111','清镇市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('971','111','开阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('972','111','修文县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('973','111','息烽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('974','112','西秀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('975','112','关岭','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('976','112','镇宁','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('977','112','紫云','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('978','112','平坝县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('979','112','普定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('980','113','毕节市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('981','113','大方县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('982','113','黔西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('983','113','金沙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('984','113','织金县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('985','113','纳雍县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('986','113','赫章县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('987','113','威宁','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('988','114','钟山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('989','114','六枝特区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('990','114','水城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('991','114','盘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('992','115','凯里市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('993','115','黄平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('994','115','施秉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('995','115','三穗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('996','115','镇远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('997','115','岑巩县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('998','115','天柱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('999','115','锦屏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1000','115','剑河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1001','115','台江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1002','115','黎平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1003','115','榕江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1004','115','从江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1005','115','雷山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1006','115','麻江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1007','115','丹寨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1008','116','都匀市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1009','116','福泉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1010','116','荔波县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1011','116','贵定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1012','116','瓮安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1013','116','独山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1014','116','平塘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1015','116','罗甸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1016','116','长顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1017','116','龙里县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1018','116','惠水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1019','116','三都','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1020','117','兴义市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1021','117','兴仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1022','117','普安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1023','117','晴隆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1024','117','贞丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1025','117','望谟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1026','117','册亨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1027','117','安龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1028','118','铜仁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1029','118','江口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1030','118','石阡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1031','118','思南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1032','118','德江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1033','118','玉屏','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1034','118','印江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1035','118','沿河','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1036','118','松桃','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1037','118','万山特区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1038','119','红花岗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1039','119','务川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1040','119','道真县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1041','119','汇川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1042','119','赤水市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1043','119','仁怀市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1044','119','遵义县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1045','119','桐梓县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1046','119','绥阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1047','119','正安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1048','119','凤冈县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1049','119','湄潭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1050','119','余庆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1051','119','习水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1052','119','道真','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1053','119','务川','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1054','120','秀英区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1055','120','龙华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1056','120','琼山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1057','120','美兰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1058','137','市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1059','137','洋浦开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1060','137','那大镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1061','137','王五镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1062','137','雅星镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1063','137','大成镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1064','137','中和镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1065','137','峨蔓镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1066','137','南丰镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1067','137','白马井镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1068','137','兰洋镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1069','137','和庆镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1070','137','海头镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1071','137','排浦镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1072','137','东成镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1073','137','光村镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1074','137','木棠镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1075','137','新州镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1076','137','三都镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1077','137','其他','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1078','138','长安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1079','138','桥东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1080','138','桥西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1081','138','新华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1082','138','裕华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1083','138','井陉矿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1084','138','高新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1085','138','辛集市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1086','138','藁城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1087','138','晋州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1088','138','新乐市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1089','138','鹿泉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1090','138','井陉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1091','138','正定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1092','138','栾城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1093','138','行唐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1094','138','灵寿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1095','138','高邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1096','138','深泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1097','138','赞皇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1098','138','无极县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1099','138','平山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1100','138','元氏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1101','138','赵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1102','139','新市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1103','139','南市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1104','139','北市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1105','139','涿州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1106','139','定州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1107','139','安国市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1108','139','高碑店市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1109','139','满城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1110','139','清苑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1111','139','涞水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1112','139','阜平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1113','139','徐水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1114','139','定兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1115','139','唐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1116','139','高阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1117','139','容城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1118','139','涞源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1119','139','望都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1120','139','安新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1121','139','易县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1122','139','曲阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1123','139','蠡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1124','139','顺平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1125','139','博野县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1126','139','雄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1127','140','运河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1128','140','新华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1129','140','泊头市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1130','140','任丘市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1131','140','黄骅市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1132','140','河间市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1133','140','沧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1134','140','青县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1135','140','东光县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1136','140','海兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1137','140','盐山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1138','140','肃宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1139','140','南皮县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1140','140','吴桥县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1141','140','献县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1142','140','孟村','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1143','141','双桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1144','141','双滦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1145','141','鹰手营子矿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1146','141','承德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1147','141','兴隆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1148','141','平泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1149','141','滦平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1150','141','隆化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1151','141','丰宁','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1152','141','宽城','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1153','141','围场','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1154','142','从台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1155','142','复兴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1156','142','邯山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1157','142','峰峰矿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1158','142','武安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1159','142','邯郸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1160','142','临漳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1161','142','成安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1162','142','大名县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1163','142','涉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1164','142','磁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1165','142','肥乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1166','142','永年县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1167','142','邱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1168','142','鸡泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1169','142','广平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1170','142','馆陶县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1171','142','魏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1172','142','曲周县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1173','143','桃城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1174','143','冀州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1175','143','深州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1176','143','枣强县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1177','143','武邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1178','143','武强县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1179','143','饶阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1180','143','安平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1181','143','故城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1182','143','景县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1183','143','阜城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1184','144','安次区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1185','144','广阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1186','144','霸州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1187','144','三河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1188','144','固安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1189','144','永清县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1190','144','香河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1191','144','大城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1192','144','文安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1193','144','大厂','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1194','145','海港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1195','145','山海关区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1196','145','北戴河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1197','145','昌黎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1198','145','抚宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1199','145','卢龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1200','145','青龙','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1201','146','路北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1202','146','路南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1203','146','古冶区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1204','146','开平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1205','146','丰南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1206','146','丰润区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1207','146','遵化市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1208','146','迁安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1209','146','滦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1210','146','滦南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1211','146','乐亭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1212','146','迁西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1213','146','玉田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1214','146','唐海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1215','147','桥东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1216','147','桥西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1217','147','南宫市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1218','147','沙河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1219','147','邢台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1220','147','临城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1221','147','内丘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1222','147','柏乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1223','147','隆尧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1224','147','任县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1225','147','南和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1226','147','宁晋县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1227','147','巨鹿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1228','147','新河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1229','147','广宗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1230','147','平乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1231','147','威县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1232','147','清河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1233','147','临西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1234','148','桥西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1235','148','桥东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1236','148','宣化区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1237','148','下花园区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1238','148','宣化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1239','148','张北县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1240','148','康保县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1241','148','沽源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1242','148','尚义县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1243','148','蔚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1244','148','阳原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1245','148','怀安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1246','148','万全县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1247','148','怀来县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1248','148','涿鹿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1249','148','赤城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1250','148','崇礼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1251','149','金水区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1252','149','邙山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1253','149','二七区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1254','149','管城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1255','149','中原区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1256','149','上街区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1257','149','惠济区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1258','149','郑东新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1259','149','经济技术开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1260','149','高新开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1261','149','出口加工区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1262','149','巩义市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1263','149','荥阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1264','149','新密市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1265','149','新郑市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1266','149','登封市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1267','149','中牟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1268','150','西工区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1269','150','老城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1270','150','涧西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1271','150','瀍河回族区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1272','150','洛龙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1273','150','吉利区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1274','150','偃师市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1275','150','孟津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1276','150','新安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1277','150','栾川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1278','150','嵩县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1279','150','汝阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1280','150','宜阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1281','150','洛宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1282','150','伊川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1283','151','鼓楼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1284','151','龙亭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1285','151','顺河回族区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1286','151','金明区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1287','151','禹王台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1288','151','杞县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1289','151','通许县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1290','151','尉氏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1291','151','开封县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1292','151','兰考县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1293','152','北关区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1294','152','文峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1295','152','殷都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1296','152','龙安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1297','152','林州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1298','152','安阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1299','152','汤阴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1300','152','滑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1301','152','内黄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1302','153','淇滨区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1303','153','山城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1304','153','鹤山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1305','153','浚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1306','153','淇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1307','154','济源市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1308','155','解放区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1309','155','中站区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1310','155','马村区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1311','155','山阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1312','155','沁阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1313','155','孟州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1314','155','修武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1315','155','博爱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1316','155','武陟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1317','155','温县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1318','156','卧龙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1319','156','宛城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1320','156','邓州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1321','156','南召县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1322','156','方城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1323','156','西峡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1324','156','镇平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1325','156','内乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1326','156','淅川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1327','156','社旗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1328','156','唐河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1329','156','新野县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1330','156','桐柏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1331','157','新华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1332','157','卫东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1333','157','湛河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1334','157','石龙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1335','157','舞钢市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1336','157','汝州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1337','157','宝丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1338','157','叶县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1339','157','鲁山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1340','157','郏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1341','158','湖滨区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1342','158','义马市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1343','158','灵宝市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1344','158','渑池县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1345','158','陕县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1346','158','卢氏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1347','159','梁园区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1348','159','睢阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1349','159','永城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1350','159','民权县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1351','159','睢县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1352','159','宁陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1353','159','虞城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1354','159','柘城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1355','159','夏邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1356','160','卫滨区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1357','160','红旗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1358','160','凤泉区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1359','160','牧野区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1360','160','卫辉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1361','160','辉县市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1362','160','新乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1363','160','获嘉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1364','160','原阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1365','160','延津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1366','160','封丘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1367','160','长垣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1368','161','浉河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1369','161','平桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1370','161','罗山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1371','161','光山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1372','161','新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1373','161','商城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1374','161','固始县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1375','161','潢川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1376','161','淮滨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1377','161','息县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1378','162','魏都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1379','162','禹州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1380','162','长葛市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1381','162','许昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1382','162','鄢陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1383','162','襄城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1384','163','川汇区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1385','163','项城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1386','163','扶沟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1387','163','西华县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1388','163','商水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1389','163','沈丘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1390','163','郸城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1391','163','淮阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1392','163','太康县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1393','163','鹿邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1394','164','驿城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1395','164','西平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1396','164','上蔡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1397','164','平舆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1398','164','正阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1399','164','确山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1400','164','泌阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1401','164','汝南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1402','164','遂平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1403','164','新蔡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1404','165','郾城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1405','165','源汇区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1406','165','召陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1407','165','舞阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1408','165','临颍县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1409','166','华龙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1410','166','清丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1411','166','南乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1412','166','范县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1413','166','台前县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1414','166','濮阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1415','167','道里区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1416','167','南岗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1417','167','动力区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1418','167','平房区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1419','167','香坊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1420','167','太平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1421','167','道外区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1422','167','阿城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1423','167','呼兰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1424','167','松北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1425','167','尚志市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1426','167','双城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1427','167','五常市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1428','167','方正县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1429','167','宾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1430','167','依兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1431','167','巴彦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1432','167','通河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1433','167','木兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1434','167','延寿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1435','168','萨尔图区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1436','168','红岗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1437','168','龙凤区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1438','168','让胡路区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1439','168','大同区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1440','168','肇州县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1441','168','肇源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1442','168','林甸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1443','168','杜尔伯特','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1444','169','呼玛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1445','169','漠河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1446','169','塔河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1447','170','兴山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1448','170','工农区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1449','170','南山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1450','170','兴安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1451','170','向阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1452','170','东山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1453','170','萝北县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1454','170','绥滨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1455','171','爱辉区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1456','171','五大连池市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1457','171','北安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1458','171','嫩江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1459','171','逊克县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1460','171','孙吴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1461','172','鸡冠区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1462','172','恒山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1463','172','城子河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1464','172','滴道区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1465','172','梨树区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1466','172','虎林市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1467','172','密山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1468','172','鸡东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1469','173','前进区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1470','173','郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1471','173','向阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1472','173','东风区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1473','173','同江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1474','173','富锦市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1475','173','桦南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1476','173','桦川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1477','173','汤原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1478','173','抚远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1479','174','爱民区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1480','174','东安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1481','174','阳明区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1482','174','西安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1483','174','绥芬河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1484','174','海林市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1485','174','宁安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1486','174','穆棱市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1487','174','东宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1488','174','林口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1489','175','桃山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1490','175','新兴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1491','175','茄子河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1492','175','勃利县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1493','176','龙沙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1494','176','昂昂溪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1495','176','铁峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1496','176','建华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1497','176','富拉尔基区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1498','176','碾子山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1499','176','梅里斯达斡尔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1500','176','讷河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1501','176','龙江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1502','176','依安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1503','176','泰来县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1504','176','甘南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1505','176','富裕县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1506','176','克山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1507','176','克东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1508','176','拜泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1509','177','尖山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1510','177','岭东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1511','177','四方台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1512','177','宝山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1513','177','集贤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1514','177','友谊县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1515','177','宝清县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1516','177','饶河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1517','178','北林区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1518','178','安达市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1519','178','肇东市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1520','178','海伦市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1521','178','望奎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1522','178','兰西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1523','178','青冈县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1524','178','庆安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1525','178','明水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1526','178','绥棱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1527','179','伊春区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1528','179','带岭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1529','179','南岔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1530','179','金山屯区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1531','179','西林区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1532','179','美溪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1533','179','乌马河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1534','179','翠峦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1535','179','友好区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1536','179','上甘岭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1537','179','五营区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1538','179','红星区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1539','179','新青区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1540','179','汤旺河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1541','179','乌伊岭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1542','179','铁力市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1543','179','嘉荫县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1544','180','江岸区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1545','180','武昌区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1546','180','江汉区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1547','180','硚口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1548','180','汉阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1549','180','青山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1550','180','洪山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1551','180','东西湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1552','180','汉南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1553','180','蔡甸区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1554','180','江夏区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1555','180','黄陂区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1556','180','新洲区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1557','180','经济开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1558','181','仙桃市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1559','182','鄂城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1560','182','华容区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1561','182','梁子湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1562','183','黄州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1563','183','麻城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1564','183','武穴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1565','183','团风县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1566','183','红安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1567','183','罗田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1568','183','英山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1569','183','浠水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1570','183','蕲春县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1571','183','黄梅县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1572','184','黄石港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1573','184','西塞山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1574','184','下陆区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1575','184','铁山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1576','184','大冶市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1577','184','阳新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1578','185','东宝区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1579','185','掇刀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1580','185','钟祥市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1581','185','京山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1582','185','沙洋县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1583','186','沙市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1584','186','荆州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1585','186','石首市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1586','186','洪湖市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1587','186','松滋市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1588','186','公安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1589','186','监利县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1590','186','江陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1591','187','潜江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1592','188','神农架林区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1593','189','张湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1594','189','茅箭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1595','189','丹江口市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1596','189','郧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1597','189','郧西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1598','189','竹山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1599','189','竹溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1600','189','房县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1601','190','曾都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1602','190','广水市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1603','191','天门市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1604','192','咸安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1605','192','赤壁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1606','192','嘉鱼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1607','192','通城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1608','192','崇阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1609','192','通山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1610','193','襄城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1611','193','樊城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1612','193','襄阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1613','193','老河口市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1614','193','枣阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1615','193','宜城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1616','193','南漳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1617','193','谷城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1618','193','保康县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1619','194','孝南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1620','194','应城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1621','194','安陆市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1622','194','汉川市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1623','194','孝昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1624','194','大悟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1625','194','云梦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1626','195','长阳','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1627','195','五峰','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1628','195','西陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1629','195','伍家岗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1630','195','点军区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1631','195','猇亭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1632','195','夷陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1633','195','宜都市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1634','195','当阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1635','195','枝江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1636','195','远安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1637','195','兴山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1638','195','秭归县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1639','196','恩施市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1640','196','利川市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1641','196','建始县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1642','196','巴东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1643','196','宣恩县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1644','196','咸丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1645','196','来凤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1646','196','鹤峰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1647','197','岳麓区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1648','197','芙蓉区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1649','197','天心区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1650','197','开福区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1651','197','雨花区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1652','197','开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1653','197','浏阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1654','197','长沙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1655','197','望城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1656','197','宁乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1657','198','永定区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1658','198','武陵源区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1659','198','慈利县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1660','198','桑植县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1661','199','武陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1662','199','鼎城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1663','199','津市市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1664','199','安乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1665','199','汉寿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1666','199','澧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1667','199','临澧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1668','199','桃源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1669','199','石门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1670','200','北湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1671','200','苏仙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1672','200','资兴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1673','200','桂阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1674','200','宜章县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1675','200','永兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1676','200','嘉禾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1677','200','临武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1678','200','汝城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1679','200','桂东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1680','200','安仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1681','201','雁峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1682','201','珠晖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1683','201','石鼓区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1684','201','蒸湘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1685','201','南岳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1686','201','耒阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1687','201','常宁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1688','201','衡阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1689','201','衡南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1690','201','衡山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1691','201','衡东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1692','201','祁东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1693','202','鹤城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1694','202','靖州','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1695','202','麻阳','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1696','202','通道','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1697','202','新晃','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1698','202','芷江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1699','202','沅陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1700','202','辰溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1701','202','溆浦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1702','202','中方县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1703','202','会同县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1704','202','洪江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1705','203','娄星区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1706','203','冷水江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1707','203','涟源市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1708','203','双峰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1709','203','新化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1710','204','城步','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1711','204','双清区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1712','204','大祥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1713','204','北塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1714','204','武冈市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1715','204','邵东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1716','204','新邵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1717','204','邵阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1718','204','隆回县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1719','204','洞口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1720','204','绥宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1721','204','新宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1722','205','岳塘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1723','205','雨湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1724','205','湘乡市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1725','205','韶山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1726','205','湘潭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1727','206','吉首市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1728','206','泸溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1729','206','凤凰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1730','206','花垣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1731','206','保靖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1732','206','古丈县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1733','206','永顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1734','206','龙山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1735','207','赫山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1736','207','资阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1737','207','沅江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1738','207','南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1739','207','桃江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1740','207','安化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1741','208','江华','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1742','208','冷水滩区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1743','208','零陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1744','208','祁阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1745','208','东安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1746','208','双牌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1747','208','道县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1748','208','江永县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1749','208','宁远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1750','208','蓝山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1751','208','新田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1752','209','岳阳楼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1753','209','君山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1754','209','云溪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1755','209','汨罗市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1756','209','临湘市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1757','209','岳阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1758','209','华容县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1759','209','湘阴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1760','209','平江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1761','210','天元区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1762','210','荷塘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1763','210','芦淞区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1764','210','石峰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1765','210','醴陵市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1766','210','株洲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1767','210','攸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1768','210','茶陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1769','210','炎陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1770','211','朝阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1771','211','宽城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1772','211','二道区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1773','211','南关区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1774','211','绿园区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1775','211','双阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1776','211','净月潭开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1777','211','高新技术开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1778','211','经济技术开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1779','211','汽车产业开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1780','211','德惠市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1781','211','九台市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1782','211','榆树市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1783','211','农安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1784','212','船营区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1785','212','昌邑区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1786','212','龙潭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1787','212','丰满区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1788','212','蛟河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1789','212','桦甸市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1790','212','舒兰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1791','212','磐石市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1792','212','永吉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1793','213','洮北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1794','213','洮南市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1795','213','大安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1796','213','镇赉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1797','213','通榆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1798','214','江源区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1799','214','八道江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1800','214','长白','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1801','214','临江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1802','214','抚松县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1803','214','靖宇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1804','215','龙山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1805','215','西安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1806','215','东丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1807','215','东辽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1808','216','铁西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1809','216','铁东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1810','216','伊通','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1811','216','公主岭市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1812','216','双辽市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1813','216','梨树县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1814','217','前郭尔罗斯','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1815','217','宁江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1816','217','长岭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1817','217','乾安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1818','217','扶余县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1819','218','东昌区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1820','218','二道江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1821','218','梅河口市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1822','218','集安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1823','218','通化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1824','218','辉南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1825','218','柳河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1826','219','延吉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1827','219','图们市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1828','219','敦化市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1829','219','珲春市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1830','219','龙井市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1831','219','和龙市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1832','219','安图县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1833','219','汪清县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1834','220','玄武区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1835','220','鼓楼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1836','220','白下区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1837','220','建邺区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1838','220','秦淮区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1839','220','雨花台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1840','220','下关区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1841','220','栖霞区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1842','220','浦口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1843','220','江宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1844','220','六合区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1845','220','溧水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1846','220','高淳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1847','221','沧浪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1848','221','金阊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1849','221','平江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1850','221','虎丘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1851','221','吴中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1852','221','相城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1853','221','园区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1854','221','新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1855','221','常熟市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1856','221','张家港市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1857','221','玉山镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1858','221','巴城镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1859','221','周市镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1860','221','陆家镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1861','221','花桥镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1862','221','淀山湖镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1863','221','张浦镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1864','221','周庄镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1865','221','千灯镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1866','221','锦溪镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1867','221','开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1868','221','吴江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1869','221','太仓市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1870','222','崇安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1871','222','北塘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1872','222','南长区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1873','222','锡山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1874','222','惠山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1875','222','滨湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1876','222','新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1877','222','江阴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1878','222','宜兴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1879','223','天宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1880','223','钟楼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1881','223','戚墅堰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1882','223','郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1883','223','新北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1884','223','武进区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1885','223','溧阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1886','223','金坛市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1887','224','清河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1888','224','清浦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1889','224','楚州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1890','224','淮阴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1891','224','涟水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1892','224','洪泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1893','224','盱眙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1894','224','金湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1895','225','新浦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1896','225','连云区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1897','225','海州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1898','225','赣榆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1899','225','东海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1900','225','灌云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1901','225','灌南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1902','226','崇川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1903','226','港闸区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1904','226','经济开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1905','226','启东市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1906','226','如皋市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1907','226','通州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1908','226','海门市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1909','226','海安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1910','226','如东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1911','227','宿城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1912','227','宿豫区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1913','227','宿豫县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1914','227','沭阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1915','227','泗阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1916','227','泗洪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1917','228','海陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1918','228','高港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1919','228','兴化市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1920','228','靖江市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1921','228','泰兴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1922','228','姜堰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1923','229','云龙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1924','229','鼓楼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1925','229','九里区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1926','229','贾汪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1927','229','泉山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1928','229','新沂市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1929','229','邳州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1930','229','丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1931','229','沛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1932','229','铜山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1933','229','睢宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1934','230','城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1935','230','亭湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1936','230','盐都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1937','230','盐都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1938','230','东台市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1939','230','大丰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1940','230','响水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1941','230','滨海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1942','230','阜宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1943','230','射阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1944','230','建湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1945','231','广陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1946','231','维扬区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1947','231','邗江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1948','231','仪征市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1949','231','高邮市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1950','231','江都市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1951','231','宝应县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1952','232','京口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1953','232','润州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1954','232','丹徒区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1955','232','丹阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1956','232','扬中市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1957','232','句容市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1958','233','东湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1959','233','西湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1960','233','青云谱区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1961','233','湾里区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1962','233','青山湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1963','233','红谷滩新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1964','233','昌北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1965','233','高新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1966','233','南昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1967','233','新建县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1968','233','安义县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1969','233','进贤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1970','234','临川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1971','234','南城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1972','234','黎川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1973','234','南丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1974','234','崇仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1975','234','乐安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1976','234','宜黄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1977','234','金溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1978','234','资溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1979','234','东乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1980','234','广昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1981','235','章贡区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1982','235','于都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1983','235','瑞金市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1984','235','南康市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1985','235','赣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1986','235','信丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1987','235','大余县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1988','235','上犹县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1989','235','崇义县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1990','235','安远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1991','235','龙南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1992','235','定南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1993','235','全南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1994','235','宁都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1995','235','兴国县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1996','235','会昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1997','235','寻乌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1998','235','石城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('1999','236','安福县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2000','236','吉州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2001','236','青原区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2002','236','井冈山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2003','236','吉安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2004','236','吉水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2005','236','峡江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2006','236','新干县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2007','236','永丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2008','236','泰和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2009','236','遂川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2010','236','万安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2011','236','永新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2012','237','珠山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2013','237','昌江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2014','237','乐平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2015','237','浮梁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2016','238','浔阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2017','238','庐山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2018','238','瑞昌市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2019','238','九江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2020','238','武宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2021','238','修水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2022','238','永修县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2023','238','德安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2024','238','星子县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2025','238','都昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2026','238','湖口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2027','238','彭泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2028','239','安源区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2029','239','湘东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2030','239','莲花县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2031','239','芦溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2032','239','上栗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2033','240','信州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2034','240','德兴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2035','240','上饶县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2036','240','广丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2037','240','玉山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2038','240','铅山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2039','240','横峰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2040','240','弋阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2041','240','余干县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2042','240','波阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2043','240','万年县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2044','240','婺源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2045','241','渝水区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2046','241','分宜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2047','242','袁州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2048','242','丰城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2049','242','樟树市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2050','242','高安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2051','242','奉新县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2052','242','万载县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2053','242','上高县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2054','242','宜丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2055','242','靖安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2056','242','铜鼓县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2057','243','月湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2058','243','贵溪市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2059','243','余江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2060','244','沈河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2061','244','皇姑区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2062','244','和平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2063','244','大东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2064','244','铁西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2065','244','苏家屯区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2066','244','东陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2067','244','沈北新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2068','244','于洪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2069','244','浑南新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2070','244','新民市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2071','244','辽中县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2072','244','康平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2073','244','法库县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2074','245','西岗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2075','245','中山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2076','245','沙河口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2077','245','甘井子区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2078','245','旅顺口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2079','245','金州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2080','245','开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2081','245','瓦房店市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2082','245','普兰店市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2083','245','庄河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2084','245','长海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2085','246','铁东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2086','246','铁西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2087','246','立山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2088','246','千山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2089','246','岫岩','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2090','246','海城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2091','246','台安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2092','247','本溪','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2093','247','平山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2094','247','明山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2095','247','溪湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2096','247','南芬区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2097','247','桓仁','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2098','248','双塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2099','248','龙城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2100','248','喀喇沁左翼蒙古族自治县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2101','248','北票市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2102','248','凌源市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2103','248','朝阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2104','248','建平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2105','249','振兴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2106','249','元宝区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2107','249','振安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2108','249','宽甸','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2109','249','东港市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2110','249','凤城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2111','250','顺城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2112','250','新抚区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2113','250','东洲区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2114','250','望花区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2115','250','清原','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2116','250','新宾','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2117','250','抚顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2118','251','阜新','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2119','251','海州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2120','251','新邱区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2121','251','太平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2122','251','清河门区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2123','251','细河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2124','251','彰武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2125','252','龙港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2126','252','南票区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2127','252','连山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2128','252','兴城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2129','252','绥中县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2130','252','建昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2131','253','太和区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2132','253','古塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2133','253','凌河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2134','253','凌海市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2135','253','北镇市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2136','253','黑山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2137','253','义县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2138','254','白塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2139','254','文圣区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2140','254','宏伟区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2141','254','太子河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2142','254','弓长岭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2143','254','灯塔市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2144','254','辽阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2145','255','双台子区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2146','255','兴隆台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2147','255','大洼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2148','255','盘山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2149','256','银州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2150','256','清河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2151','256','调兵山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2152','256','开原市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2153','256','铁岭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2154','256','西丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2155','256','昌图县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2156','257','站前区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2157','257','西市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2158','257','鲅鱼圈区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2159','257','老边区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2160','257','盖州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2161','257','大石桥市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2162','258','回民区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2163','258','玉泉区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2164','258','新城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2165','258','赛罕区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2166','258','清水河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2167','258','土默特左旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2168','258','托克托县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2169','258','和林格尔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2170','258','武川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2171','259','阿拉善左旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2172','259','阿拉善右旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2173','259','额济纳旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2174','260','临河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2175','260','五原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2176','260','磴口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2177','260','乌拉特前旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2178','260','乌拉特中旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2179','260','乌拉特后旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2180','260','杭锦后旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2181','261','昆都仑区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2182','261','青山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2183','261','东河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2184','261','九原区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2185','261','石拐区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2186','261','白云矿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2187','261','土默特右旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2188','261','固阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2189','261','达尔罕茂明安联合旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2190','262','红山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2191','262','元宝山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2192','262','松山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2193','262','阿鲁科尔沁旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2194','262','巴林左旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2195','262','巴林右旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2196','262','林西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2197','262','克什克腾旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2198','262','翁牛特旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2199','262','喀喇沁旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2200','262','宁城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2201','262','敖汉旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2202','263','东胜区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2203','263','达拉特旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2204','263','准格尔旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2205','263','鄂托克前旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2206','263','鄂托克旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2207','263','杭锦旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2208','263','乌审旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2209','263','伊金霍洛旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2210','264','海拉尔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2211','264','莫力达瓦','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2212','264','满洲里市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2213','264','牙克石市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2214','264','扎兰屯市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2215','264','额尔古纳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2216','264','根河市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2217','264','阿荣旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2218','264','鄂伦春自治旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2219','264','鄂温克族自治旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2220','264','陈巴尔虎旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2221','264','新巴尔虎左旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2222','264','新巴尔虎右旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2223','265','科尔沁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2224','265','霍林郭勒市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2225','265','科尔沁左翼中旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2226','265','科尔沁左翼后旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2227','265','开鲁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2228','265','库伦旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2229','265','奈曼旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2230','265','扎鲁特旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2231','266','海勃湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2232','266','乌达区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2233','266','海南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2234','267','化德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2235','267','集宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2236','267','丰镇市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2237','267','卓资县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2238','267','商都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2239','267','兴和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2240','267','凉城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2241','267','察哈尔右翼前旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2242','267','察哈尔右翼中旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2243','267','察哈尔右翼后旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2244','267','四子王旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2245','268','二连浩特市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2246','268','锡林浩特市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2247','268','阿巴嘎旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2248','268','苏尼特左旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2249','268','苏尼特右旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2250','268','东乌珠穆沁旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2251','268','西乌珠穆沁旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2252','268','太仆寺旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2253','268','镶黄旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2254','268','正镶白旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2255','268','正蓝旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2256','268','多伦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2257','269','乌兰浩特市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2258','269','阿尔山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2259','269','科尔沁右翼前旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2260','269','科尔沁右翼中旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2261','269','扎赉特旗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2262','269','突泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2263','270','西夏区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2264','270','金凤区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2265','270','兴庆区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2266','270','灵武市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2267','270','永宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2268','270','贺兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2269','271','原州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2270','271','海原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2271','271','西吉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2272','271','隆德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2273','271','泾源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2274','271','彭阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2275','272','惠农县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2276','272','大武口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2277','272','惠农区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2278','272','陶乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2279','272','平罗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2280','273','利通区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2281','273','中卫县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2282','273','青铜峡市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2283','273','中宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2284','273','盐池县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2285','273','同心县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2286','274','沙坡头区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2287','274','海原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2288','274','中宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2289','275','城中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2290','275','城东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2291','275','城西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2292','275','城北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2293','275','湟中县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2294','275','湟源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2295','275','大通','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2296','276','玛沁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2297','276','班玛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2298','276','甘德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2299','276','达日县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2300','276','久治县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2301','276','玛多县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2302','277','海晏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2303','277','祁连县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2304','277','刚察县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2305','277','门源','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2306','278','平安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2307','278','乐都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2308','278','民和','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2309','278','互助','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2310','278','化隆','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2311','278','循化','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2312','279','共和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2313','279','同德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2314','279','贵德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2315','279','兴海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2316','279','贵南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2317','280','德令哈市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2318','280','格尔木市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2319','280','乌兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2320','280','都兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2321','280','天峻县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2322','281','同仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2323','281','尖扎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2324','281','泽库县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2325','281','河南蒙古族自治县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2326','282','玉树县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2327','282','杂多县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2328','282','称多县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2329','282','治多县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2330','282','囊谦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2331','282','曲麻莱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2332','283','市中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2333','283','历下区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2334','283','天桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2335','283','槐荫区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2336','283','历城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2337','283','长清区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2338','283','章丘市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2339','283','平阴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2340','283','济阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2341','283','商河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2342','284','市南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2343','284','市北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2344','284','城阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2345','284','四方区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2346','284','李沧区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2347','284','黄岛区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2348','284','崂山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2349','284','胶州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2350','284','即墨市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2351','284','平度市','3','0','pingdu');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2352','284','胶南市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2353','284','莱西市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2354','285','滨城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2355','285','惠民县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2356','285','阳信县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2357','285','无棣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2358','285','沾化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2359','285','博兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2360','285','邹平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2361','286','德城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2362','286','陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2363','286','乐陵市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2364','286','禹城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2365','286','宁津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2366','286','庆云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2367','286','临邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2368','286','齐河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2369','286','平原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2370','286','夏津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2371','286','武城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2372','287','东营区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2373','287','河口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2374','287','垦利县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2375','287','利津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2376','287','广饶县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2377','288','牡丹区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2378','288','曹县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2379','288','单县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2380','288','成武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2381','288','巨野县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2382','288','郓城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2383','288','鄄城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2384','288','定陶县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2385','288','东明县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2386','289','市中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2387','289','任城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2388','289','曲阜市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2389','289','兖州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2390','289','邹城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2391','289','微山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2392','289','鱼台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2393','289','金乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2394','289','嘉祥县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2395','289','汶上县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2396','289','泗水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2397','289','梁山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2398','290','莱城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2399','290','钢城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2400','291','东昌府区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2401','291','临清市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2402','291','阳谷县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2403','291','莘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2404','291','茌平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2405','291','东阿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2406','291','冠县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2407','291','高唐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2408','292','兰山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2409','292','罗庄区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2410','292','河东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2411','292','沂南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2412','292','郯城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2413','292','沂水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2414','292','苍山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2415','292','费县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2416','292','平邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2417','292','莒南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2418','292','蒙阴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2419','292','临沭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2420','293','东港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2421','293','岚山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2422','293','五莲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2423','293','莒县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2424','294','泰山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2425','294','岱岳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2426','294','新泰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2427','294','肥城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2428','294','宁阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2429','294','东平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2430','295','荣成市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2431','295','乳山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2432','295','环翠区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2433','295','文登市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2434','296','潍城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2435','296','寒亭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2436','296','坊子区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2437','296','奎文区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2438','296','青州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2439','296','诸城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2440','296','寿光市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2441','296','安丘市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2442','296','高密市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2443','296','昌邑市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2444','296','临朐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2445','296','昌乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2446','297','芝罘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2447','297','福山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2448','297','牟平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2449','297','莱山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2450','297','开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2451','297','龙口市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2452','297','莱阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2453','297','莱州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2454','297','蓬莱市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2455','297','招远市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2456','297','栖霞市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2457','297','海阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2458','297','长岛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2459','298','市中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2460','298','山亭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2461','298','峄城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2462','298','台儿庄区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2463','298','薛城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2464','298','滕州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2465','299','张店区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2466','299','临淄区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2467','299','淄川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2468','299','博山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2469','299','周村区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2470','299','桓台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2471','299','高青县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2472','299','沂源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2473','300','杏花岭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2474','300','小店区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2475','300','迎泽区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2476','300','尖草坪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2477','300','万柏林区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2478','300','晋源区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2479','300','高新开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2480','300','民营经济开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2481','300','经济技术开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2482','300','清徐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2483','300','阳曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2484','300','娄烦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2485','300','古交市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2486','301','城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2487','301','郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2488','301','沁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2489','301','潞城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2490','301','长治县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2491','301','襄垣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2492','301','屯留县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2493','301','平顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2494','301','黎城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2495','301','壶关县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2496','301','长子县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2497','301','武乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2498','301','沁源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2499','302','城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2500','302','矿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2501','302','南郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2502','302','新荣区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2503','302','阳高县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2504','302','天镇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2505','302','广灵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2506','302','灵丘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2507','302','浑源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2508','302','左云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2509','302','大同县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2510','303','城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2511','303','高平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2512','303','沁水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2513','303','阳城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2514','303','陵川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2515','303','泽州县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2516','304','榆次区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2517','304','介休市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2518','304','榆社县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2519','304','左权县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2520','304','和顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2521','304','昔阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2522','304','寿阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2523','304','太谷县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2524','304','祁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2525','304','平遥县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2526','304','灵石县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2527','305','尧都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2528','305','侯马市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2529','305','霍州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2530','305','曲沃县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2531','305','翼城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2532','305','襄汾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2533','305','洪洞县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2534','305','吉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2535','305','安泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2536','305','浮山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2537','305','古县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2538','305','乡宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2539','305','大宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2540','305','隰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2541','305','永和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2542','305','蒲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2543','305','汾西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2544','306','离石市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2545','306','离石区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2546','306','孝义市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2547','306','汾阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2548','306','文水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2549','306','交城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2550','306','兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2551','306','临县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2552','306','柳林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2553','306','石楼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2554','306','岚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2555','306','方山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2556','306','中阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2557','306','交口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2558','307','朔城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2559','307','平鲁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2560','307','山阴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2561','307','应县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2562','307','右玉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2563','307','怀仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2564','308','忻府区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2565','308','原平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2566','308','定襄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2567','308','五台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2568','308','代县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2569','308','繁峙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2570','308','宁武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2571','308','静乐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2572','308','神池县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2573','308','五寨县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2574','308','岢岚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2575','308','河曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2576','308','保德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2577','308','偏关县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2578','309','城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2579','309','矿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2580','309','郊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2581','309','平定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2582','309','盂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2583','310','盐湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2584','310','永济市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2585','310','河津市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2586','310','临猗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2587','310','万荣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2588','310','闻喜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2589','310','稷山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2590','310','新绛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2591','310','绛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2592','310','垣曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2593','310','夏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2594','310','平陆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2595','310','芮城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2596','311','莲湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2597','311','新城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2598','311','碑林区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2599','311','雁塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2600','311','灞桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2601','311','未央区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2602','311','阎良区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2603','311','临潼区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2604','311','长安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2605','311','蓝田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2606','311','周至县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2607','311','户县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2608','311','高陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2609','312','汉滨区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2610','312','汉阴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2611','312','石泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2612','312','宁陕县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2613','312','紫阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2614','312','岚皋县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2615','312','平利县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2616','312','镇坪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2617','312','旬阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2618','312','白河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2619','313','陈仓区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2620','313','渭滨区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2621','313','金台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2622','313','凤翔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2623','313','岐山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2624','313','扶风县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2625','313','眉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2626','313','陇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2627','313','千阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2628','313','麟游县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2629','313','凤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2630','313','太白县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2631','314','汉台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2632','314','南郑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2633','314','城固县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2634','314','洋县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2635','314','西乡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2636','314','勉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2637','314','宁强县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2638','314','略阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2639','314','镇巴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2640','314','留坝县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2641','314','佛坪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2642','315','商州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2643','315','洛南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2644','315','丹凤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2645','315','商南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2646','315','山阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2647','315','镇安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2648','315','柞水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2649','316','耀州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2650','316','王益区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2651','316','印台区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2652','316','宜君县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2653','317','临渭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2654','317','韩城市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2655','317','华阴市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2656','317','华县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2657','317','潼关县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2658','317','大荔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2659','317','合阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2660','317','澄城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2661','317','蒲城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2662','317','白水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2663','317','富平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2664','318','秦都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2665','318','渭城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2666','318','杨陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2667','318','兴平市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2668','318','三原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2669','318','泾阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2670','318','乾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2671','318','礼泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2672','318','永寿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2673','318','彬县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2674','318','长武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2675','318','旬邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2676','318','淳化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2677','318','武功县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2678','319','吴起县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2679','319','宝塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2680','319','延长县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2681','319','延川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2682','319','子长县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2683','319','安塞县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2684','319','志丹县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2685','319','甘泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2686','319','富县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2687','319','洛川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2688','319','宜川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2689','319','黄龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2690','319','黄陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2691','320','榆阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2692','320','神木县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2693','320','府谷县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2694','320','横山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2695','320','靖边县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2696','320','定边县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2697','320','绥德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2698','320','米脂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2699','320','佳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2700','320','吴堡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2701','320','清涧县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2702','320','子洲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2703','321','长宁区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2704','321','闸北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2705','321','闵行区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2706','321','徐汇区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2707','321','浦东新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2708','321','杨浦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2709','321','普陀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2710','321','静安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2711','321','卢湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2712','321','虹口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2713','321','黄浦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2714','321','南汇区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2715','321','松江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2716','321','嘉定区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2717','321','宝山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2718','321','青浦区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2719','321','金山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2720','321','奉贤区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2721','321','崇明县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2722','322','青羊区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2723','322','锦江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2724','322','金牛区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2725','322','武侯区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2726','322','成华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2727','322','龙泉驿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2728','322','青白江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2729','322','新都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2730','322','温江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2731','322','高新区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2732','322','高新西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2733','322','都江堰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2734','322','彭州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2735','322','邛崃市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2736','322','崇州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2737','322','金堂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2738','322','双流县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2739','322','郫县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2740','322','大邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2741','322','蒲江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2742','322','新津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2743','322','都江堰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2744','322','彭州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2745','322','邛崃市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2746','322','崇州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2747','322','金堂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2748','322','双流县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2749','322','郫县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2750','322','大邑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2751','322','蒲江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2752','322','新津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2753','323','涪城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2754','323','游仙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2755','323','江油市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2756','323','盐亭县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2757','323','三台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2758','323','平武县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2759','323','安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2760','323','梓潼县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2761','323','北川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2762','324','马尔康县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2763','324','汶川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2764','324','理县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2765','324','茂县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2766','324','松潘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2767','324','九寨沟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2768','324','金川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2769','324','小金县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2770','324','黑水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2771','324','壤塘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2772','324','阿坝县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2773','324','若尔盖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2774','324','红原县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2775','325','巴州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2776','325','通江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2777','325','南江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2778','325','平昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2779','326','通川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2780','326','万源市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2781','326','达县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2782','326','宣汉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2783','326','开江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2784','326','大竹县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2785','326','渠县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2786','327','旌阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2787','327','广汉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2788','327','什邡市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2789','327','绵竹市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2790','327','罗江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2791','327','中江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2792','328','康定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2793','328','丹巴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2794','328','泸定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2795','328','炉霍县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2796','328','九龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2797','328','甘孜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2798','328','雅江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2799','328','新龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2800','328','道孚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2801','328','白玉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2802','328','理塘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2803','328','德格县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2804','328','乡城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2805','328','石渠县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2806','328','稻城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2807','328','色达县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2808','328','巴塘县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2809','328','得荣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2810','329','广安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2811','329','华蓥市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2812','329','岳池县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2813','329','武胜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2814','329','邻水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2815','330','利州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2816','330','元坝区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2817','330','朝天区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2818','330','旺苍县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2819','330','青川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2820','330','剑阁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2821','330','苍溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2822','331','峨眉山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2823','331','乐山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2824','331','犍为县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2825','331','井研县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2826','331','夹江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2827','331','沐川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2828','331','峨边','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2829','331','马边','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2830','332','西昌市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2831','332','盐源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2832','332','德昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2833','332','会理县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2834','332','会东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2835','332','宁南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2836','332','普格县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2837','332','布拖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2838','332','金阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2839','332','昭觉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2840','332','喜德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2841','332','冕宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2842','332','越西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2843','332','甘洛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2844','332','美姑县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2845','332','雷波县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2846','332','木里','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2847','333','东坡区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2848','333','仁寿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2849','333','彭山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2850','333','洪雅县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2851','333','丹棱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2852','333','青神县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2853','334','阆中市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2854','334','南部县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2855','334','营山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2856','334','蓬安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2857','334','仪陇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2858','334','顺庆区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2859','334','高坪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2860','334','嘉陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2861','334','西充县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2862','335','市中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2863','335','东兴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2864','335','威远县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2865','335','资中县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2866','335','隆昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2867','336','东  区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2868','336','西  区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2869','336','仁和区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2870','336','米易县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2871','336','盐边县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2872','337','船山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2873','337','安居区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2874','337','蓬溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2875','337','射洪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2876','337','大英县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2877','338','雨城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2878','338','名山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2879','338','荥经县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2880','338','汉源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2881','338','石棉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2882','338','天全县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2883','338','芦山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2884','338','宝兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2885','339','翠屏区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2886','339','宜宾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2887','339','南溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2888','339','江安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2889','339','长宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2890','339','高县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2891','339','珙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2892','339','筠连县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2893','339','兴文县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2894','339','屏山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2895','340','雁江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2896','340','简阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2897','340','安岳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2898','340','乐至县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2899','341','大安区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2900','341','自流井区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2901','341','贡井区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2902','341','沿滩区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2903','341','荣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2904','341','富顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2905','342','江阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2906','342','纳溪区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2907','342','龙马潭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2908','342','泸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2909','342','合江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2910','342','叙永县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2911','342','古蔺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2912','343','和平区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2913','343','河西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2914','343','南开区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2915','343','河北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2916','343','河东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2917','343','红桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2918','343','东丽区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2919','343','津南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2920','343','西青区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2921','343','北辰区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2922','343','塘沽区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2923','343','汉沽区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2924','343','大港区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2925','343','武清区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2926','343','宝坻区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2927','343','经济开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2928','343','宁河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2929','343','静海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2930','343','蓟县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2931','344','城关区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2932','344','林周县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2933','344','当雄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2934','344','尼木县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2935','344','曲水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2936','344','堆龙德庆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2937','344','达孜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2938','344','墨竹工卡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2939','345','噶尔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2940','345','普兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2941','345','札达县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2942','345','日土县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2943','345','革吉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2944','345','改则县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2945','345','措勤县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2946','346','昌都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2947','346','江达县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2948','346','贡觉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2949','346','类乌齐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2950','346','丁青县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2951','346','察雅县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2952','346','八宿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2953','346','左贡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2954','346','芒康县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2955','346','洛隆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2956','346','边坝县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2957','347','林芝县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2958','347','工布江达县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2959','347','米林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2960','347','墨脱县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2961','347','波密县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2962','347','察隅县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2963','347','朗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2964','348','那曲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2965','348','嘉黎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2966','348','比如县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2967','348','聂荣县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2968','348','安多县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2969','348','申扎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2970','348','索县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2971','348','班戈县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2972','348','巴青县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2973','348','尼玛县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2974','349','日喀则市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2975','349','南木林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2976','349','江孜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2977','349','定日县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2978','349','萨迦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2979','349','拉孜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2980','349','昂仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2981','349','谢通门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2982','349','白朗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2983','349','仁布县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2984','349','康马县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2985','349','定结县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2986','349','仲巴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2987','349','亚东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2988','349','吉隆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2989','349','聂拉木县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2990','349','萨嘎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2991','349','岗巴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2992','350','乃东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2993','350','扎囊县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2994','350','贡嘎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2995','350','桑日县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2996','350','琼结县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2997','350','曲松县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2998','350','措美县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('2999','350','洛扎县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3000','350','加查县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3001','350','隆子县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3002','350','错那县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3003','350','浪卡子县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3004','351','天山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3005','351','沙依巴克区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3006','351','新市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3007','351','水磨沟区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3008','351','头屯河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3009','351','达坂城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3010','351','米东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3011','351','乌鲁木齐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3012','352','阿克苏市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3013','352','温宿县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3014','352','库车县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3015','352','沙雅县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3016','352','新和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3017','352','拜城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3018','352','乌什县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3019','352','阿瓦提县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3020','352','柯坪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3021','353','阿拉尔市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3022','354','库尔勒市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3023','354','轮台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3024','354','尉犁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3025','354','若羌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3026','354','且末县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3027','354','焉耆','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3028','354','和静县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3029','354','和硕县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3030','354','博湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3031','355','博乐市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3032','355','精河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3033','355','温泉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3034','356','呼图壁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3035','356','米泉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3036','356','昌吉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3037','356','阜康市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3038','356','玛纳斯县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3039','356','奇台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3040','356','吉木萨尔县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3041','356','木垒','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3042','357','哈密市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3043','357','伊吾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3044','357','巴里坤','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3045','358','和田市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3046','358','和田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3047','358','墨玉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3048','358','皮山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3049','358','洛浦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3050','358','策勒县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3051','358','于田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3052','358','民丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3053','359','喀什市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3054','359','疏附县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3055','359','疏勒县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3056','359','英吉沙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3057','359','泽普县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3058','359','莎车县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3059','359','叶城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3060','359','麦盖提县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3061','359','岳普湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3062','359','伽师县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3063','359','巴楚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3064','359','塔什库尔干','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3065','360','克拉玛依市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3066','361','阿图什市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3067','361','阿克陶县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3068','361','阿合奇县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3069','361','乌恰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3070','362','石河子市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3071','363','图木舒克市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3072','364','吐鲁番市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3073','364','鄯善县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3074','364','托克逊县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3075','365','五家渠市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3076','366','阿勒泰市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3077','366','布克赛尔','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3078','366','伊宁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3079','366','布尔津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3080','366','奎屯市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3081','366','乌苏市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3082','366','额敏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3083','366','富蕴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3084','366','伊宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3085','366','福海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3086','366','霍城县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3087','366','沙湾县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3088','366','巩留县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3089','366','哈巴河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3090','366','托里县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3091','366','青河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3092','366','新源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3093','366','裕民县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3094','366','和布克赛尔','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3095','366','吉木乃县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3096','366','昭苏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3097','366','特克斯县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3098','366','尼勒克县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3099','366','察布查尔','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3100','367','盘龙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3101','367','五华区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3102','367','官渡区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3103','367','西山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3104','367','东川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3105','367','安宁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3106','367','呈贡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3107','367','晋宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3108','367','富民县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3109','367','宜良县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3110','367','嵩明县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3111','367','石林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3112','367','禄劝','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3113','367','寻甸','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3114','368','兰坪','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3115','368','泸水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3116','368','福贡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3117','368','贡山','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3118','369','宁洱','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3119','369','思茅区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3120','369','墨江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3121','369','景东','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3122','369','景谷','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3123','369','镇沅','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3124','369','江城','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3125','369','孟连','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3126','369','澜沧','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3127','369','西盟','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3128','370','古城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3129','370','宁蒗','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3130','370','玉龙','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3131','370','永胜县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3132','370','华坪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3133','371','隆阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3134','371','施甸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3135','371','腾冲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3136','371','龙陵县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3137','371','昌宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3138','372','楚雄市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3139','372','双柏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3140','372','牟定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3141','372','南华县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3142','372','姚安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3143','372','大姚县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3144','372','永仁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3145','372','元谋县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3146','372','武定县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3147','372','禄丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3148','373','大理市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3149','373','祥云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3150','373','宾川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3151','373','弥渡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3152','373','永平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3153','373','云龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3154','373','洱源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3155','373','剑川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3156','373','鹤庆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3157','373','漾濞','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3158','373','南涧','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3159','373','巍山','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3160','374','潞西市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3161','374','瑞丽市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3162','374','梁河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3163','374','盈江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3164','374','陇川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3165','375','香格里拉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3166','375','德钦县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3167','375','维西','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3168','376','泸西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3169','376','蒙自县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3170','376','个旧市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3171','376','开远市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3172','376','绿春县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3173','376','建水县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3174','376','石屏县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3175','376','弥勒县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3176','376','元阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3177','376','红河县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3178','376','金平','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3179','376','河口','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3180','376','屏边','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3181','377','临翔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3182','377','凤庆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3183','377','云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3184','377','永德县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3185','377','镇康县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3186','377','双江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3187','377','耿马','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3188','377','沧源','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3189','378','麒麟区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3190','378','宣威市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3191','378','马龙县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3192','378','陆良县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3193','378','师宗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3194','378','罗平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3195','378','富源县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3196','378','会泽县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3197','378','沾益县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3198','379','文山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3199','379','砚山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3200','379','西畴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3201','379','麻栗坡县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3202','379','马关县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3203','379','丘北县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3204','379','广南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3205','379','富宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3206','380','景洪市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3207','380','勐海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3208','380','勐腊县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3209','381','红塔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3210','381','江川县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3211','381','澄江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3212','381','通海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3213','381','华宁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3214','381','易门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3215','381','峨山','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3216','381','新平','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3217','381','元江','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3218','382','昭阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3219','382','鲁甸县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3220','382','巧家县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3221','382','盐津县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3222','382','大关县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3223','382','永善县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3224','382','绥江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3225','382','镇雄县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3226','382','彝良县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3227','382','威信县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3228','382','水富县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3229','383','西湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3230','383','上城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3231','383','下城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3232','383','拱墅区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3233','383','滨江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3234','383','江干区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3235','383','萧山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3236','383','余杭区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3237','383','市郊','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3238','383','建德市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3239','383','富阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3240','383','临安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3241','383','桐庐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3242','383','淳安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3243','384','吴兴区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3244','384','南浔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3245','384','德清县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3246','384','长兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3247','384','安吉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3248','385','南湖区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3249','385','秀洲区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3250','385','海宁市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3251','385','嘉善县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3252','385','平湖市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3253','385','桐乡市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3254','385','海盐县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3255','386','婺城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3256','386','金东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3257','386','兰溪市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3258','386','市区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3259','386','佛堂镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3260','386','上溪镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3261','386','义亭镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3262','386','大陈镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3263','386','苏溪镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3264','386','赤岸镇','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3265','386','东阳市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3266','386','永康市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3267','386','武义县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3268','386','浦江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3269','386','磐安县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3270','387','莲都区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3271','387','龙泉市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3272','387','青田县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3273','387','缙云县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3274','387','遂昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3275','387','松阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3276','387','云和县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3277','387','庆元县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3278','387','景宁','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3279','388','海曙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3280','388','江东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3281','388','江北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3282','388','镇海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3283','388','北仑区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3284','388','鄞州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3285','388','余姚市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3286','388','慈溪市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3287','388','奉化市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3288','388','象山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3289','388','宁海县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3290','389','越城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3291','389','上虞市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3292','389','嵊州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3293','389','绍兴县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3294','389','新昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3295','389','诸暨市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3296','390','椒江区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3297','390','黄岩区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3298','390','路桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3299','390','温岭市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3300','390','临海市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3301','390','玉环县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3302','390','三门县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3303','390','天台县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3304','390','仙居县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3305','391','鹿城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3306','391','龙湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3307','391','瓯海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3308','391','瑞安市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3309','391','乐清市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3310','391','洞头县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3311','391','永嘉县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3312','391','平阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3313','391','苍南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3314','391','文成县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3315','391','泰顺县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3316','392','定海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3317','392','普陀区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3318','392','岱山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3319','392','嵊泗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3320','393','衢州市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3321','393','江山市','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3322','393','常山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3323','393','开化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3324','393','龙游县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3325','394','合川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3326','394','江津区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3327','394','南川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3328','394','永川区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3329','394','南岸区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3330','394','渝北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3331','394','万盛区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3332','394','大渡口区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3333','394','万州区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3334','394','北碚区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3335','394','沙坪坝区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3336','394','巴南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3337','394','涪陵区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3338','394','江北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3339','394','九龙坡区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3340','394','渝中区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3341','394','黔江开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3342','394','长寿区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3343','394','双桥区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3344','394','綦江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3345','394','潼南县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3346','394','铜梁县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3347','394','大足县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3348','394','荣昌县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3349','394','璧山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3350','394','垫江县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3351','394','武隆县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3352','394','丰都县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3353','394','城口县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3354','394','梁平县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3355','394','开县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3356','394','巫溪县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3357','394','巫山县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3358','394','奉节县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3359','394','云阳县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3360','394','忠县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3361','394','石柱','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3362','394','彭水','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3363','394','酉阳','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3364','394','秀山','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3365','395','沙田区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3366','395','东区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3367','395','观塘区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3368','395','黄大仙区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3369','395','九龙城区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3370','395','屯门区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3371','395','葵青区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3372','395','元朗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3373','395','深水埗区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3374','395','西贡区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3375','395','大埔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3376','395','湾仔区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3377','395','油尖旺区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3378','395','北区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3379','395','南区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3380','395','荃湾区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3381','395','中西区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3382','395','离岛区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3383','396','澳门','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3384','397','台北','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3385','397','高雄','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3386','397','基隆','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3387','397','台中','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3388','397','台南','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3389','397','新竹','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3390','397','嘉义','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3391','397','宜兰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3392','397','桃园县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3393','397','苗栗县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3394','397','彰化县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3395','397','南投县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3396','397','云林县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3397','397','屏东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3398','397','台东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3399','397','花莲县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3400','397','澎湖县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3401','3','合肥','2','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3402','3401','庐阳区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3403','3401','瑶海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3404','3401','蜀山区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3405','3401','包河区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3406','3401','长丰县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3407','3401','肥东县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3408','3401','肥西县','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3410','292','经济开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3411','284','西海区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3412','292','高新技术开发区','3','0','');/* DBReback Separation */
 /* 插入数据 `shang_area` */
 INSERT INTO `shang_area` VALUES ('3413','292','北城新区','3','0','');/* DBReback Separation */ 
 /* 数据表结构 `shang_article`*/ 
 DROP TABLE IF EXISTS `shang_article`;/* DBReback Separation */ 
 CREATE TABLE `shang_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `art_info` varchar(255) NOT NULL,
  `art_keyword` varchar(200) NOT NULL,
  `art_content` text NOT NULL,
  `art_writer` varchar(20) NOT NULL,
  `art_time` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id` smallint(5) unsigned NOT NULL,
  `art_url` varchar(200) NOT NULL,
  `art_img` varchar(200) NOT NULL,
  `art_userid` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  `art_click` int(10) unsigned NOT NULL DEFAULT '0',
  `art_set` int(1) unsigned NOT NULL DEFAULT '0',
  `art_attr` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('157','一诺担保公司','','','<p>21</p>','admin','1413869938','7','','','0','2','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('265','媒体报道','','','<p>&nbsp;</p><p><span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\">股票配资系统可快速搭建起安全高效的网络股票配资平台，帮助股票投资用户利用资金杠杆撬动更大的财富，为投资理财客户提供便捷、流畅的投资通道。</span><br style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\" /> <span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\">特色功能：</span><span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(101,101,101);font:14px/34px \'microsoft yahei\', 宋体, helvetica, sans-serif, simsun, 黑体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:20px;\">免费体验 按天配资 按月配资 投资理财 实时数据 交易软件</span><span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\">&nbsp;</span><br style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\" /> <span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\">技术参数：</span><span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(101,101,101);font:14px/34px \'microsoft yahei\', 宋体, helvetica, sans-serif, simsun, 黑体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:20px;\">PHP + MySQL</span><br style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\" /> <span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\">部署环境：独立服务器（推荐阿里云10M以上带宽）</span><br style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\" /> <span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(102,102,102);font:14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:0px;\">运行环境：</span><span style=\"white-space:normal;word-spacing:0px;text-transform:none;color:rgb(101,101,101);font:14px/34px \'microsoft yahei\', 宋体, helvetica, sans-serif, simsun, 黑体;letter-spacing:normal;background-color:rgb(255,255,255);text-indent:20px;\">Linux/Windows + Apache/Nginx + PHP + MySQL + Memcached + Redis</span></p>','tuanshang','1446174360','47','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('219','公司简介','','','<p>&nbsp;</p><p>公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介公司简介</p><br />','tuanshang','1430980705','10','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('263','P2P系统','','','<p><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; float: none; color: rgb(85,85,85); font: 14px/23px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 28px\">P2P网贷系统产品自2011年4月发布以来，经多次迭代升级与功能创新，在产品体验，系统安全性，稳定性，延展性处于同行领先水平。截至2014年底已为百余家企业提供技术支持。</span></p>','tuanshang','1446174241','2','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('264','投资指南','','','<p><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">股票配资系统可快速搭建起安全高效的网络股票配资平台，帮助股票投资用户利用资金杠杆撬动更大的财富，为投资理财客户提供便捷、流畅的投资通道。</span><br style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\" /><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">特色功能：</span><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(101,101,101); font: 14px/34px \'microsoft yahei\', 宋体, helvetica, sans-serif, simsun, 黑体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 20px\">免费体验 按天配资 按月配资 投资理财 实时数据 交易软件</span><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">&nbsp;</span><br style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\" /><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">技术参数：</span><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(101,101,101); font: 14px/34px \'microsoft yahei\', 宋体, helvetica, sans-serif, simsun, 黑体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 20px\">PHP + MySQL</span><br style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\" /><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">部署环境：独立服务器（推荐阿里云10M以上带宽）</span><br style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\" /><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(102,102,102); font: 14px/25px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">运行环境：</span><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(101,101,101); font: 14px/34px \'microsoft yahei\', 宋体, helvetica, sans-serif, simsun, 黑体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 20px\">Linux/Windows + Apache/Nginx + PHP + MySQL + Memcached + Redis</span></p>','tuanshang','1446174333','48','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('223','如何注册、激活本平台账户','','','<div style=\"display:block;\" class=\"hp_cont\"><p><span style=\"font-family:font-size:12pt;\">（1）进入本平台首页，点击右上角\"注册\"按钮;</span><br /> <span style=\"font-family:font-size:12pt;\">（2）根据提示信息，填写您的注册邮箱、用户名、密码等信息，点击“免费注册”;</span><br /> <span style=\"font-family:font-size:12pt;\">（3）用户名为用户的展示昵称，一经注册后不可修改</span><br /><span style=\"font-family:font-size:12pt;\"> &nbsp;&nbsp;备注：如果没有收到激活邮件，有两种解决途径。一、登录注册邮箱后，在垃圾箱里寻找，看是否被邮箱系统自动辨识为了垃圾邮件。二、请尝试清空浏览器缓存，清空后，点击“重新发送激活邮件”。若是还未成功，请联系网站在线客服。 </span></p></div>','tuanshang','1439881578','37','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('224','如何充值','','','<p><span style=\"font-family:font-size:12pt;\">可以通过网上银行或财付通账户进行充值，目前所有的商业银行都支持个人网银业务，您只需要携带有效身份证件，到当地您所持银行卡的发卡行任意营业网点，即可申请开通网上银行业务。</span><br /> <span style=\"font-family:font-size:12pt;\">（1）进入“我的账户”-“充值”，选择充值方式，输入要充值的金额，点击充值按钮;</span><br /> <span style=\"font-family:font-size:12pt;\">（2）充值类型有国付宝和网银在线，或者其他第三方支付；</span><br /> <span style=\"font-family:font-size:12pt;\">（3）选择付款银行，点击确认无误按钮，按提示完成付款；</span><br /> <span style=\"font-family:font-size:12pt;\">（4）显示成功付款后，跳转到本平台充值页面，显示充值成功；</span><br /> <span style=\"font-family:font-size:12pt;\">（5）您可以通过资金明细查看充值的金额及历史记录；</span></p>','tuanshang','1439882087','37','','','0','9','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('225','如何开始理财投资','','','<div style=\"display:block;\" class=\"hp_cont\"><p><span style=\"font-family:font-size:12pt;\">（1）投资前请认真阅读该笔借款标的详细信息，以确定您所要投资的项目符合您的理财时间规划和您所要求的投资回报率；</span><br /> <span style=\"font-family:font-size:12pt;\">（2）进入“网站首页”或点击“我要投资”-“普通借款”/“流转借款”/“债权转让”，如果有投标未满的项目，直接点击“立即投标”，按照相关提示操作即可</span></p></div>','tuanshang','1439882126','37','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('226','如何提现','','','<div style=\"display:block;\" class=\"hp_cont\"><p><span style=\"font-family:font-size:12pt;\">（1）您可以随时将您在“本平台”账户中的可用余额申请提现到您名下的任何一家银行的账号上</span><br /> <span style=\"font-family:font-size:12pt;\">（2）进入“我的账户”-“提现”，输入要提现的金额，输入验证码，点击提现按钮</span><br /> <span style=\"font-family:font-size:12pt;\">注意：请提供申请提现的银行卡账号，并确保该账号的开户人姓名和您在本平台上提供的身份证上的真实姓名一致，否则无法成功提现。</span></p></div>','tuanshang','1439882160','37','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('227','如何修改密码？','','','<p><span style=\"font-family:font-size:12pt;\">注册后，每个账户会有两个密码，一个是会员登录密码，一个 是交易密码，前者用于登录您的账户，后者用于确保提现等相关交易的安全，初始的交易密码跟登录密码是一样的，建议您注册后立即进行修改。您可以随时在“我 的账户”-“基本设置&amp;头像与密码”-“修改密码/修改支付密码”中修改您的密码。 </span></p>','tuanshang','1439882590','38','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('228','如何提升账户安全等级？','','','<p><span style=\"font-family:font-size:12pt;\">成功注册账户后，可以进行实名认证、修改支付密码，申请VIP会员等相关操作，加强账户安全等级。</span></p>','tuanshang','1439882741','38','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('229','如何绑定到账银行卡？','','','<p><span style=\"font-family:font-size:12pt;\">登录“我的账户”页面中，点击左侧“资金管理-银行账户”，依次确认输入正确的持卡人、卡号和开户行地点。（注：提现到账银行卡户名必须与实名认证姓名保持一致。）</span></p>','tuanshang','1439883292','38','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('230','如何申请 VIP ？','','','<div style=\"display:block;\" class=\"hp_cont\"><p><span style=\"font-family:SimSun;color:#333333;\">&nbsp;</span> <span style=\"font-family:font-size:12pt;\">登录到个人账户后，点击“我的账户”，头像右侧 VIP 字认证，点击申请即可， VIP 免费申请，到期后须重新申请。 </span></p></div>','tuanshang','1439883362','38','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('231','如何进行实名认证？','','','<p><span style=\"font-family:font-size:12pt;\">我的账户-认证中心-实名认证，按照要求填写即可，提交之后客服人员会尽快审核。 </span></p>','tuanshang','1439883568','38','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('232','如何理财','','','<div style=\"display:block;\" class=\"hp_cont\"><p><span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">投标之前需要注意哪些事项？</span><br /> <span style=\"font-family:font-size:12pt;\">对于投资用户，投资前需要您先通过实名认证，同时，您还可以进行VIP认证(该认证为可选认证，认证通过后，即可安心在本平台进行投资)。</span><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">投资时有没有相关费用？</span><br /> <span style=\"font-family:font-size:12pt;\">在投资人收到借款标的回款时，投资人使用回款提现是完全免费的。</span><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">投资收益何时开始计算？</span><br /> <span style=\"font-family:font-size:12pt;\">（1）所参与投标的借款已借款完成的当日开始计算利息。</span><br /> <span style=\"font-family:font-size:12pt;\">（2）借款项目到期时，平台会提前3天和当天多次通知借款客户还款。</span><br /> <span style=\"font-family:font-size:12pt;\">（3）还款日当天24:00之前，借款人操作还款，都是符合借款协议约定的，不会产生罚息。</span><br /><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">协议查询</span><br /> <span style=\"font-family:font-size:12pt;\">进入“我的账户”——“投资管理”—— “投资总表” —— “回收中的投资” 查看电子合同，点击打开即可在线阅览。</span></p></div>','tuanshang','1439883658','39','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('233','借款标的类型介绍','','','<p><span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">信用标：</span><br /> <span style=\"font-family:font-size:12pt;\">信用借款标显示“信”字标记，是一种免抵押、免担保、纯信用，的小额个人信用贷款标，主要面向固定收入群体开放。如借款人到期还款出现困难，逾期约定时间由网站运营方垫付本金息还款，债权转让为网站运营方所有。 </span><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">担保标：</span><br /> 机构担保借款标显示标记“担”，是有担保机构进行担保的借款，担保人和借款人之间协商并签订抵押担保手续，确保风险控制在合理的范围内。如借款人到期还款出现逾期，由担保机构垫付本息还款。<br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">净值标：</span><br /> <span style=\"font-family:font-size:12pt;\">净值借款标显示标记“净”，如果客户净资产大于借款金额，网站运营方允许发布净值借款标用于临时周转。他是一种相对安全系数很高的借款标，因此利率方面可能比较低，适合资金黄牛，用户可以借助此标放大自己的投资标。 净值借款标逾期后约定时间由网站先行垫付本息还款。 </span><br /><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">抵押标：</span><br /> <span style=\"font-family:font-size:12pt;\">抵押标借款者对象一般为地区优质中小微企业，是网站运营方重点发展对象。借款人到期还款出现困难，借款到期日当天由网站运营方垫付本金和利息还款，债权为网站运营方所有。抵押标逾期后，每天按约定收取罚息，本金利息及罚息全部为网站运营方收取.。</span><br />&nbsp;</p><p><span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">企业直投：</span><br /> <span style=\"font-family:font-size:12pt;\">企业直投是债权人将手中的优质债权分割成几个份额，转让给其他投资人并且承诺在一定期限内回购该债权的投资品种。在投资人受让债权的期限内，投资人本金和收益的安全由平台保证，在投资人认购到期时平台自动回购债权。</span></p>','tuanshang','1439883706','39','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('234','自动投标','','','<p><span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">什么是自动投标？</span><br /> <span style=\"font-family:font-size:12pt;\">自动投标是一种根据自行设定条件帮助投资者进行智能投资的工具，为减少投资人用于理财的时间投入而开发，根据个人条件设定并开启后，有项目符合设定规则时，会在项目发布后及时进行自动投资。</span><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">如何设置我的自动投标？</span><br /> <span style=\"font-family:font-size:12pt;\">操作流程可参照：进入我的账户页面——投资管理——自动投标，再根据个人实际理财需求依次设定每次自动投资金额、利率范围、项目期限，等等，并点击开启自动投标与保存设置。</span><br /> <span style=\"font-family:微软雅黑;font-size:12pt;font-weight:bold;\">自动投标的规则</span><br /> <span style=\"font-family:font-size:12pt;\">（1）投标顺序按照开启自动投标功能的时间先后进行排序。</span><br /> <span style=\"font-family:font-size:12pt;\">（2）每个会员每个借款仅自动投标一次，投标成功后，排到所有自动投标会员的末尾。</span><br /> <span style=\"font-family:font-size:12pt;\">（3）中间对自动投标进行修改的，排名不变。</span><br /> <span style=\"font-family:font-size:12pt;\">（4）新开启自动投标用户，自动排到所有自动投标会员的末尾。</span><br /> <span style=\"font-family:font-size:12pt;\">（5）当账户余额不足时，系统按顺序进行，但不投标，依次转移到下一个自动投标。</span></p>','tuanshang','1439883808','39','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('235','申请的条件','','','<div style=\"display:block;\" class=\"hp_cont\"><p class=\"txt\"><span style=\"font-family:font-size:12pt;\">（1） 22-55周岁的中国公民</span><br /> <span style=\"font-family:font-size:12pt;\">（2）工薪阶层，需要在现单位工作满3个月，月收入2000以上<br /> &nbsp; &nbsp; 企业老板，企业经营时间满1年<br /> &nbsp; &nbsp; 抵押贷款，需要自己名下有房产或车产。</span></p></div>','tuanshang','1439883948','40','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('236','申请流程','','','<div style=\"display:block;\" class=\"hp_cont\"><p class=\"txt\"><span style=\"font-family:font-size:12pt;\">（1）在“我要借款”页面提交借款申请。</span><br /> <span style=\"font-family:font-size:12pt;\">（2）本平台会联系借款人所在当地合作机构。</span><br /> <span style=\"font-family:font-size:12pt;\">（3）合作机构联系借款申请人，进行实地考察。</span><br /> &nbsp; &nbsp; <span style=\"font-family:font-size:12pt;\">注：整个流程需要3-5个工作日。</span></p></div>','tuanshang','1439883989','40','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('237','投资赎回的方式有哪些？','','','<p><span style=\"font-family:font-size:12pt;\">为提高理财者投资的流动性，本平台平台提供了“债权转让”和“净值借款”两大功能，实现资金紧急赎回，最快当天可以到账。</span></p>','tuanshang','1439884133','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('238','债权转让是什么？','','','<p><span style=\"font-family:font-size:12pt;\">债权转让是指债权持有人通过本平台债权转让平台将债权挂出出售，将所持有的债权转让给购买人的操作。</span></p>','tuanshang','1439884162','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('239','如何转让债权？','','','<p><span style=\"font-family:font-size:12pt;\">当投资用户持有的债权处于可转让状态时，理财用户可以在“我的账户”——“债权转让”——“可转让债权”页面进行债权转让操作，填写转让的折扣，将债权挂出，其它用户对此债权进行了购买后即完成转出。</span></p>','tuanshang','1439884201','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('240','债权转让是如何收费的？','','','<p><span style=\"font-family:font-size:12pt;\">债权转让的费用为转让管理费。平台向转出人收取，不向购买人收取任何费用。转让管理费金额为转让价格*转让管理费率，具体金额以债权转让页面显示为准。债权转让管理费在成交后直接从成交金额中扣除，不成交平台不向用户收取转让管理费。</span></p>','tuanshang','1439884230','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('241','什么是净值借款？','','','<p><span style=\"font-family:font-size:12pt;\">如果客户净资产大于借款金额，网站运营方允许发布净值借款标用于临时周转。他是一种相对安全系数很高的借款标，因此利率方面可能比较低，适合资金黄牛，用户可以借助此标放大自己的投资标。 净值借款标逾期后约定时间由网站先行垫付本息还款。 </span></p>','tuanshang','1439884256','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('242','如何发布净值借款？','','','<p><span style=\"font-family:font-size:12pt;\">投资用户可以在“我要借款”页面进行净值借款的发布操作，填写借款信息，提交借款申请。借款通过初审后，会在网站首页和“我要投资”页面挂出，投标完成后即完成借款流程。</span></p>','tuanshang','1439884284','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('243','如何投资债权转让标','','','<p><span style=\"font-family:font-size:12pt;\">投资债权转让标需要在我要投资-债权转让栏目-选择债权转让标进行投资购买债权。</span></p>','tuanshang','1439884310','41','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('244','收不到激活邮件怎么办？','','','<p><span style=\"font-family:font-size:12pt;\">答：有以下方法可以尝试。一是可以登录注册邮箱后，在垃圾箱里寻找，看是否被邮箱系统自动辨识为了垃圾邮件。二是请尝试清空浏览器缓存，清空后，点击“重新发送激活邮件”。若是还未成功，请联系网站在线客服。</span></p>','tuanshang','1439884429','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('245','充值使用的银行卡和提现绑定的银行卡是否必须一致？','','','<p><span style=\"font-family:font-size:12pt;\">答：不需要。充值您可以使用网站上标明的任何一家银行的银行卡网银充值。</span></p>','tuanshang','1439884454','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('246','同一人是否可以申请多个账号？','','','<p><span style=\"font-family:font-size:12pt;\">答：因账户和实名信息是一对一的绑定关系，所以同一人只能申请一个账号，您的身份信息不能再次绑定新账户。</span></p>','tuanshang','1439884481','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('247','投资后，本人是否能够自主撤销？','','','<p><span style=\"font-family:font-size:12pt;\">答：为了不影响项目的融资进度，保证交易的时效性，投资后，不能申请撤销。</span></p>','tuanshang','1439884506','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('248','为什么有些项目标题后会标有第二期或者第三期字样？','','','<p><span style=\"font-family:font-size:12pt;\">答：短期内，借款人可能会在我们所审批的额度内连续发布第二期或第三期借款项目，我们会建议借款人将大额借款项目分期发布，以保证项目当日认购完成并计息。这不仅缩短了投资人所投资金的冻结时间，减少了投资人资金闲置，还提高了借款人融资效率。</span></p>','tuanshang','1439884585','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('249','借款人逾期了怎么办？','','','<p><span style=\"font-family:font-size:12pt;\">答：若借款人逾期，则推荐借款项目的担保机构会在逾期后的1-3个工作日内代偿该期本金、收益。</span></p>','tuanshang','1439884659','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('250','投资人申请提现后何时到账？','','','<p><span style=\"margin-bottom:5px;font-size:16px;\">详情查看网站收费标准公告</span></p>','tuanshang','1439884716','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('251','为什么充值的时候提示充值金额超过每日支付限额？','','','<p><span style=\"font-family:font-size:12pt;\">答：每日支付限额由银行每日支付限额、第三方支付平台每日 支付限额和用户自己设定的每日支付限额三者共同决定，在实际使用中三者取最小值。例如：交通银行的网银每日支付限额是50万，但是交通银行和财付通签协议 的时候，规定用户在财付通使用交通银行网银的时候每日支付限额为100万，用户自己设定的每日支付限额为30万，此时用户可以使用的每日支付限额为30 万。</span></p>','tuanshang','1439884739','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('252','投资人相关费用','','','<p><span style=\"font-family:font-size:12pt;\">1、 详细收费标准请查看网站收费标准公告。<br /> 2、 请查看网站自费说明公告。。<br /> 3、 充值费用：全免。<br /> 4、 提现费用：请查看网站收费标准公告。</span></p>','tuanshang','1439884785','42','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('253','名词解释','','','<h5 class=\"up down\"><b>借款人（贷款人）</b></h5><p><b><span style=\"font-family:font-size:12pt;\">已经或准备在网站上进行借款活动的用户称为借款人。凡22周岁以上的中国大陆地区公民，都可以成为借款人。 </span></b></p><h5 class=\"up down\"><b>投资人 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">已经或准备在网站上进行资金出借活动并完成了实名认证、手机号码绑定的用户称为投资人。 </span></b></p><h5 class=\"up\"><b>借款标</b></h5><p><b><span style=\"font-family:font-size:12pt;\">指借款人发布的包含其借款相关说明信息的借款申请。一个合格的借款项目至少包含：标题、描述、借款用途、借款总额、还款方式、年利率、借款期限、招标期限等基本信息。 </span></b></p><h5 class=\"up\"><b>发标</b></h5><p><b><span style=\"font-family:font-size:12pt;\">指借款用户发布借款项目的行为。 </span></b></p><h5 class=\"up down\"><b>投标 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">指投资人将其本平台账户内的可用余额出借给指定的借款用户的行为。 </span></b></p><h5 class=\"up down\"><b>流标 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">指一个项目在一定时间内没有招标完成，借款失败了自动流标的谁投资的钱自动还给谁。 </span></b></p><h5 class=\"up\"><b>放款 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">指一个借款标满额后且已符合放款标准，该借款所筹资金从投资人账户转入借款人账户的过程，即借款人成功获得了借款。</span></b></p><h5 class=\"up down\"><b>借款失败 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">指因资料上传不全或综合情况不符合借款要求，导致借款申请未通过，或超过项目购买期限但未满额的状态叫做借款失败。 </span></b></p><h5 class=\"up\"><b>逾期</b></h5><p><b><span style=\"font-family:font-size:12pt;\">指借款用户未按协议约定还款日当天24:00之前进行足额还款，此时借款的状态为逾期。 </span></b></p><h5 class=\"up\"><b>帐户总额 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">指用户账户的所有金额（帐户总额=可用余额+待收总额+冻结总额）。 </span></b></p><h5 class=\"up\"><b>可用余额 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">是指用户可自由支配的金额。 </span></b></p><h5 class=\"up\"><b>冻结总额 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">帐户中已冻结，不能自由支配的金额，（冻结总额=投资中冻结金额+提现中冻结金额） </span></b></p><h5 class=\"up\"><b>总收益 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">指用户账户的所有收益（总收益=已赚利息+待收利息+其他收益） </span></b></p><h5 class=\"up down\"><b>等额本息 </b></h5><p><b><span style=\"font-family:font-size:12pt;\">在还款期内，每月偿还同等的金额(包含本金和利息)。月利率不变，每月所得利息随本金逐月减少而减少。 每月还款额=[贷款本金×月利率×（1+月利率）^还款总期数]÷[（1+月利率）^还款总期数-1] </span></b></p><h5 class=\"up\"><b>先息后本</b></h5><p><b><span style=\"font-family:font-size:12pt;\">每月返还利息，最后一个月返还当月的本金和利息。 </span></b></p><h5 class=\"up down\"><b>债权</b></h5><p><b><span style=\"font-family:font-size:12pt;\">指投资人与借款人之间的债务约定。 </span></b></p><h5 class=\"up down\"><b>净值</b></h5><p><b><span style=\"font-family:font-size:12pt;\">以投资用户在本平台的待收债权为担保，按一定比例授予的可借款权。</span></b></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>','tuanshang','1439885212','43','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('262','P2P系统安全','','','<p><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; float: none; color: rgb(102,102,102); font: 14px/20px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">安全是P2P网贷系统稳定运行的基础。西西小镇系统通过对危险源进行归类分析，分别从6个维度对可能出现的危险源进行封堵，为客户提供了数字签名技术、数据加密技术、短信验证、</span><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; color: rgb(255,0,0); font: 14px/20px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">Ukey校验</span><span style=\"white-space: normal; word-spacing: 0px; text-transform: none; float: none; color: rgb(102,102,102); font: 14px/20px \'microsoft yahei\', \'lucida sans unicode\', \'myriad pro\', \'hiragino sans gb\', \'heiti sc\', verdana, simsun, 宋体; display: inline !important; letter-spacing: normal; background-color: rgb(255,255,255); text-indent: 0px\">等一系列实用安全保障功能</span></p>','tuanshang','1446174035','9','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('267','活动1','测试活动','测试活动','<p>测试活动测试活动测试活动</p><p>测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动</p><p>测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动测试活动<img style=\"height:375px;width:600px;float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20161020104200.jpg\" /></p>','tuanshang','1476931323','51','','Static/Uploads/Article/20161020104203668.jpg','0','1','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('268','政策法规1','政策法规1','政策法规1','','tuanshang','1490231767','17','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('269','政策法规2','政策法规2','政策法规2','<p>政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2政策法规2</p>','tuanshang','1490231866','17','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('270','网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告','','','<p>网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告网站公告</p>','tuanshang','1491968397','9','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('271','P2P APP端即将上线，敬请期待！','','','<p style=\"text-align: center;\"><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20170424135602.jpg\" /></p><p>P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！P2P APP端即将上线，敬请期待！</p><p style=\"text-align:center;\">&nbsp;</p><br /><br /><br /><br /><br />','tuanshang','1493012982','9','','','0','1','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('273','《注册服务协议》','注册服务协议','注册服务协议','<p>《注册服务协议》内容</p>','tuanshang','1498441795','49','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('274','热烈庆祝润泽在线正式上线','','','<p>热烈庆祝润泽在线正式上线</p><p><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171113105612.png\" /></p>','zerunadmin','1510541775','2','','','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('275','10年间P2P从无到有，从默默无闻到声名大振，从野蛮生长到合规','','','<p><section label=\"Powered by 135editor.com\" data-role=\"outer\" style=\"max-width:100%;color:rgb(62, 62, 62);font-size:16px;widows:1;font-family:微软雅黑;box-sizing:border-box !important;word-wrap:break-word !important;\"><section data-id=\"708\" data-color=\"rgb(245, 245, 244)\" data-tools=\"135编辑器\" style=\"max-width:100%;box-sizing:border-box;border:0px none;word-wrap:break-word !important;\"><section style=\"padding:35px;max-width:100%;box-sizing:border-box;border-color:rgb(245, 245, 244);color:rgb(123, 123, 111);background-color:rgb(245, 245, 244);word-wrap:break-word !important;\"><section style=\"margin-right:auto;margin-left:auto;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\"><p style=\"max-width:100%;clear:both;min-height:1em;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;\">P2P金融出现以来，尽管鱼龙混杂，但毕竟它为无数创业者找到了便利融资的机会，前两年热火的“大众创业、万众创新”的大潮里不乏P2P带来的巨大推动，同时，它也充分调动了民间闲散资金的力量，为普通民众带来了更多的机会。</p></section></section></section></section></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;text-align:center;box-sizing:border-box !important;word-wrap:break-word !important;\"><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171113122059.jpg\" /> &nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">P2P金融指不同的网络节点之间的小额借贷交易（一般指个人），需要借助电子商务专业网络平台帮助借贷双方确立借贷关系并完成相关交易手续。借款者可自行发布借款信息，包括金额、利息、还款方式和时间，自行决定借出金额实现自助式借款。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　全球第一家P2P平台成立于2005年3月，中国第一家P2P平台成立于2007年6月，迄今已超过10年，在这10年间P2P行业从无到有，从默默无闻到声名大振，从粗放到有序。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　<strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\">便利</strong><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　P2P金融出现以来，尽管鱼龙混杂，但毕竟它为无数创业者找到了便利融资的机会，前两年热火的“大众创业、万众创新”的大潮里不乏P2P带来的巨大推动，同时，它也充分调动了民间闲散资金的力量，为普通民众带来了更多的机会。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　<strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\">　安全</strong><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　行业蓬勃发展的同时，负面状况也随之而来，2013-2014年以来，行业进入了高息自融的风险高发期，多家平台跑路，不少投资人损失惨重。可是，P2P金融或者说互联网金融难道就没落了吗？当然不是，刚刚十九大上做出的《决胜全面建成小康社会 夺取新时代中国特色社会主义伟大胜利》的报告中就指出，提高直接融资比重，P2P网贷大有可为！<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　而且，鱼龙混杂才是造就乱象的根本原因，我们可以看到，规范一直在逐步建立，具体看下面列表<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2015年7月18日《关于促进互联网金融健康发展的指导意见》<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2015年12月28日《网络借贷信息中介机构业务活动管理暂行办法(征求意见稿)》<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2016年8月13日《网络借贷资金存管业务指引（征求意见稿）》<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2016年8月24日《网络借贷信息中介机构业务活动管理暂行办法》公布之日起施行<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2016年11月28日网传银监会下发《网络借贷信息中介备案登记管理指引》<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2017年2月4日厦门发布《网络借贷信息中介机构备案登记管理暂行办法》 发布之日起实施<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　2016年2月13日《广东省&lt;网络借贷信息中介机构业务活动管理暂行办法&gt;实施细则》（征求意见稿）<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">　　</span>2017年初，发布了《网络借贷信息中介机构备案登记管理指引》<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">　　</span>2017年8月25银监会发布了《网络借贷信息中介机构业务活动信息披露指引》。</span></p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　《信息披露指引》的出台，标志着网贷行业“1+3”制度框架基本搭建完成，初步形成了较为完善的制度政策体系，进一步明确网贷行业规则，有效防范网贷风险，保护消费者权益，加快行业合规进程，实现网贷机构优胜劣汰，真正做到监管有法可依、行业有章可循。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　可以看到，行业在一步步规范，去芜存菁是每个行业发展的必然历程。投资有风险，入市需谨慎，投资者还要擦亮眼睛，提高个人辨别能力。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　收益<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />　　早期监管不完善的阶段，P2P年化收益一度达到20%~30，经过不断地行业完善，平台合规成本的增加等原因使得现在的年华收益在8-12%，已趋于理性。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />在此背景下，中小P2P平台加速被淘汰，而其他P2P平台会加速转型。P2P更加回归互联网和金融本质，P2P进入一个新的发展阶段。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />技术改变命运，技术对网贷行业影响也是巨大的。近年来，随着科学技术的发展，移动互联网、大数据、云计算等新一代信息技术与金融业不断深度融合。未来网贷行业发展的方向会随着信息技术的发展而更加简便。例如平台使用大数据征信审核风控，大数据征信可以快速了解借款人的身份特质、行为偏好、人脉关系、信用历史、履约能力等各类信息，类似于阿里的芝麻信用，这样风控审核会更加快速、准确，现有平台已经在使用大数据技术，相信在未来，该技术也会普及。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />随着监管力度加强，平台的合规化也成为了创新必不可少的考量点。校园贷被禁、活期产品被禁、现金贷也不被看好、未来存管必须属地化等等等等。这些告诉我们，随着监管力度的加强，网贷原本有优势的领域都会迎着合规化发展优胜劣汰适者生存。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />趋势告诉我们，针对普惠金融，网贷发展的方向应该是个贷、小贷。这也迎合了小额、分散的监管要求，对平台风控和平台资金流来说也是一件好事。但对投资人来说，可能未来P2P收益会逐步降低，这未必是一个好消息。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />部分不了解网贷的人对P2P网贷行业都有着偏见，国家监管到位后，未来行业合规发展，P2P是可以为自己正名的。互联网金融快速发展，表明仍有大量客群的金融需求没有得到有效服务。在互联网巨头生态圈之外，存在许多垂直细分领域的场景，一些互金机构通过特色模式解决客户风险识别难题，满足他们的金融服务需求，由此得到蓬勃发展，未来也仍将是经济体系中不可忽略的一部分。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />监管的成熟以及用户的大幅增长，给行业一个明确的信号，金融行业的总体需求非常大、行业定位非常高，互联网金融大有可为。</span></p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;text-align:justify;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;text-align:justify;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\"><span style=\"max-width:100%;color:rgb(255, 76, 0);box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">投资永远是收益和风险成正比，风险意识最重要，投资之前先学习，不了解，看不懂，不投资。</span></strong></span></p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">&nbsp;</p><p><section style=\"max-width:100%;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><h2 style=\"margin-top:8px;font-weight:400;max-width:100%;font-family:微软雅黑, 宋体, tahoma, arial;border-bottom:1px solid rgb(227, 227, 227);height:32px;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">&nbsp;</h2><p style=\"margin-right:16px;margin-left:16px;padding-right:2px;padding-bottom:3px;padding-left:2px;max-width:100%;clear:both;min-height:1em;color:rgb(70, 118, 217);border-bottom:2px solid rgb(70, 118, 217);float:left;font-weight:bold;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;font-family:微软雅黑, sans-serif !important;\">实现资产翻番需要多久：</p></section></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;text-indent:0em;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">根据理财投资七十二法则，我们不难算出时下主要理财渠道实现资产翻番所需时间：</span></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;text-indent:0em;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">1.储蓄</strong>：现在1年期的定期存款利率是1.5%，本金翻一番需用时间：<span style=\"max-width:100%;font-size:16px;color:rgb(192, 0, 0);box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">72÷1.5=48年</span>。</span></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;text-indent:0em;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">2.股票：</strong>股市风云变幻大家已经感受过了，不同于固定收益类投资，股市是动态的，长期来看，股民中<span style=\"max-width:100%;font-size:16px;color:rgb(192, 0, 0);box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">7赔2平1赚</span>的格局永远不会变。</span></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;text-indent:0em;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">3.余额宝</strong>：按余额宝最近的收益2.5%计算，本金翻番的时间为：<span style=\"max-width:100%;font-size:16px;color:rgb(192, 0, 0);box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">72÷3≈24年</span>。</span></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;text-indent:0em;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">4.p2p</strong>：年化收益率10%左右，本金翻番的时间为：<span style=\"max-width:100%;font-size:16px;color:rgb(192, 0, 0);box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">72÷10<span style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\">≈7</span>年</span>。</span></p>','zerunadmin','1510546865','2','','','0','10','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article` */
 INSERT INTO `shang_article` VALUES ('276','你在银行买理财，银行却在做P2P','','','<p><section label=\"Powered by 135editor.com\" data-role=\"outer\" style=\"max-width:100%;color:rgb(62, 62, 62);font-size:16px;widows:1;font-family:微软雅黑;box-sizing:border-box !important;word-wrap:break-word !important;\"><section data-id=\"708\" data-color=\"rgb(245, 245, 244)\" data-tools=\"135编辑器\" style=\"max-width:100%;box-sizing:border-box;border:0px none;word-wrap:break-word !important;\"><section style=\"padding:35px;max-width:100%;box-sizing:border-box;border-color:rgb(245, 245, 244);color:rgb(123, 123, 111);background-color:rgb(245, 245, 244);word-wrap:break-word !important;\"><section style=\"margin-right:auto;margin-left:auto;max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\"><p style=\"max-width:100%;clear:both;min-height:1em;text-align:justify;box-sizing:border-box !important;word-wrap:break-word !important;\">为什么银行理财、余额宝理财年化收益2%-4%，而P2P网贷投资却可以达到6％-13%，殊不知这才是投资者应得的收益！投资者承担了相同的风险，却让银行赚走了大头，这是金融行业的信息不对称导致的。<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171114093002.jpg\" /></p></section></section></section></section></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;text-align:center;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;color:rgb(217, 33, 66);box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\">你的钱借给了谁从根本上决定了收益差别<img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171114093126.png\" /> </strong></span></span></p><p style=\"margin:5px 16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;&nbsp;</p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;text-align:center;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin:5px 16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">投资者收益=借款人支付的利息-金融中介机构的运营成本-金融中介机构的利润，你的钱借给了谁从根本上决定了收益差别。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />余额宝的钱大多借给了银行，他们借钱的利息很低，所以投资人的收益低。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />P2P投资的钱都借给了中小企业主、农民、蓝领，他们借钱的利息较高，所以投资人的收益自然就高。</span></p><p style=\"max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;text-align:center;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;color:rgb(217, 33, 66);box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">什么是监管套利</span></strong></span><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">“监管套利”借用了金融学中的“套利”一词。根据《新帕尔格雷夫货币金融大辞典》的定义，“套利”是一种投资策略，其保证在某些情况下获取正报酬，而不存在负报酬的可能性，也无需净投资。其主要特征是无风险、无净投资、或有正收益。与套利类似，监管套利捕捉的也是市场中的非均衡，决定套利机会吸引力的关键性因素也正是套利策略的交易费用。但对于“监管套利”，目前在国内外都还没有一个统一的定义。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />简单的理解，贷款人从银行或者金融机构借钱的综合成本大概在10%以上，比如房贷车贷，信用卡借钱的成本可能更高；<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />信用卡有几个赢利点：<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />1、利息收入。如果你超期不还款，那么就要交日利率万分之5的利息，相当于18.25％年。这个利率是非常高的。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />2、消费手续费收入。持卡人在商场消费以后，银行要向商场收取手续费收入。现在的比率是0.7%.别小看这个比率，这是每笔交易都要收取的手续费，非常可观。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />3、年费收入。&nbsp;<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />而储户把钱存在银行的钱收益大家都很清楚，现在一年定期的利率是1.5%左右，还有大量的活期存款，利率是0.35%，对比一下就明白银行靠什么赚钱了，利差是比较可观的。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />问题的关键不在这里，关键是银行喜欢高大上的借钱客户，比如央企、国企、大公司，不喜欢中小企业和穷人，他们往往贷款无门，享受不到国家发展的红利，借钱的成本更高。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><span style=\"max-width:100%;font-size:15px;color:rgb(217, 33, 66);box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\">银行上门合作</strong></span><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />有报道称，近日广东南粤银行直销银行上线四款理财产品，预计年化收益率在8.20%~9.09%之间，远高于一般的直销银行理财产品！<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />仔细一看，原来这四款理财产品都是代销，代销的也不是其他银行的理财产品，而是一家互金平台的P2P产品。这就有意思了，P2P一向入不了银行的眼，现在银行却要代销P2P产品。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />让银行最害怕的，应该就是互联网金融。短短4年时间，互联网金融的规模已经秒杀各大商业银行直逼四大行存款规模。说实话，互联网金融能有今天，其实也是银行一手造成的。要知道互联网金融进入的，都是普通人手里的闲钱散钱，以前银行是看不上的。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />对于银行来说，普通人的存款算得了什么，要服务也是高净值人群，再说随随便便发一个同业存单，都是几十亿上百亿的规模，根本看不上普通人手里那点小钱。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />无论是做互联网金融，还是代销P2P，这背后都是银行在加大布局互联网金融。为什么要这么做？其实很简单，与传统的银行理财产品相比，互联网金融产品不仅便捷，收益也有一定的优势，而且运营成本更低，更容易获取用户做大规模。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />最让人担心的无非是投资风险。特别是P2P被夸大、恶意污名化这么些年，很多人谈P2P色变，就连许多专业人士也是如此。但是，这两年针对互联网金融特别是P2P，监管出台了许多政策，连央妈都说要把互联网金融纳入与银行同等地位的MPA考核。是个明眼人应该都看得出来，互联网金融行业会越来越规范。最近，人民日报也发文谈P2P市场，里面的一些内容值得深思。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><span style=\"max-width:100%;font-size:15px;color:rgb(217, 33, 66);box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\">马云涉足P2P网贷</strong></span><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />截止到2016年10月15日，招财宝平台总成交额高达5710.50亿，投资总用户数1294.77万人，总成交笔数8446.11万笔，已获得总收益（147.76亿元），借款成交总金额4070.61 亿元，借款总用户为507.95万（企业及个人），借款产品平均年化收益率5.26% （这个收益率应该是投资的人收益率），借款人的借款成本应该远比这个高很多；<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />1、招财宝的定位是什么？<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />笔者在官方的公告中截取了两段文字：<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />“招亲们，招财宝平台是蚂蚁金服旗下设立的互联网投资理财与融资交易开放平台，致力于帮助亲们实现财富招之即来的理财愿景。”<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />“亲爱的招财宝用户：作为金融信息服务平台，招财宝平台上所有的产品信息均由金融机构或融资人发布，招财宝负责为投融资双方提供金融信息中介服务。为了让投资人更全面的了解借款产品及其他债权类产品的推荐机构、增信机构、增信措施等信息，帮助投资人对于风险和收益有确切的了解和认知，从而作出理性的投资决策。”<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />定位已经非常明确，是金融信息服务平台，提供金融信息中介服务，这也是P2P平台最核心的定位，银监会等监管层已经多次强调，监管办法也已经明确；<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />2、招财宝资产是什么样的，从哪里来？<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />官方公告信息显示，招财宝平台上所有的产品信息均由金融机构或融资人发布，说明招财宝平台自己不提供资产；其中明确了个人贷和中小企业贷。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />3、风控模式是什么样的？<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />“借款产品及其他债权投资类产品由什么机构提供投资保障？由于投资理财与融资市场客观存在风险，为有效保障投资者利益，招财宝平台采取的是专业分工的开放平台模式，由国内权威的金融机构或大型担保公司进行风险管理并提供本金和约定收益的到期还款保障措施；如果借入人发生逾期问题，由提供保障措施的相应机构在约定期限内依法履行还款保障义务。<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />符合招财宝平台入驻标准的金融机构主要包括具有良好偿付能力的财产保险公司、央企控股或参股的大型融资性担保公司、国内资产管理规模排名前50的政策银行和商业银行、国务院成立的四大资产管理公司以及其他符合相应标准的金融机构。”<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />解读：招财宝对于投资人方面的保障方式明确的说明了，有担保公司或者保险公司进行担保，但借款产品上线或者发布的标准并没有提及，借款人有什么要求，如何审核，有没有审核团队，哪些结构可以推荐借款，哪些借款人可以发布借款等风控措施并没有像外面公布；借款产品的逾期数据没有对外公布；逾期后的催收情况没有对外公布.<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />4、投资人有什么要求？<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />对于投资人的门槛是100元起投，可以变现，点击进去是个人贷或者中小企业贷，到期一次性还本付息，对投资没有其他的限制。</span></p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;color:rgb(217, 33, 66);box-sizing:border-box !important;word-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">互联网金融的发展将迎来新阶段</span></span></strong></span></p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">2016年8月24日银监会等部门正式发布《网络借贷信息中介机构业务活动管理暂行办法》，《办法》出台后，银监会会同相关部门分别于2016年底和2017年初，发布了《网络借贷信息中介机构备案登记管理指引》、《网络借贷资金存管业务指引》，随后，2017年8月银监会发布了《网络借贷信息中介机构业务活动信息披露指引》<br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" /><br style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;\" />《信息披露指引》的出台，标志着网贷行业“1+3”制度框架基本搭建完成，初步形成了较为完善的制度政策体系，进一步明确网贷行业规则，有效防范网贷风险，保护消费者权益，加快行业合规进程，实现网贷机构优胜劣汰。</span></p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:15px;box-sizing:border-box !important;word-wrap:break-word !important;\">监管的成熟以及用户的大幅增长，给行业一个明确的信号，金融行业的总体需求非常大、行业定位非常高，互联网金融大有可为。意味着互联网金融的发展将迎来新阶段。</span></p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-bottom:10px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:inherit;font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;widows:1;text-align:justify;letter-spacing:2px;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;\">&nbsp;</p><p style=\"margin-right:16px;margin-left:16px;max-width:100%;clear:both;min-height:1em;color:rgb(62, 62, 62);font-family:Helvetica Neue, Helvetica, Hiragino Sans GB, Microsoft YaHei, Arial, sans-serif;font-size:16px;widows:1;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\"><span style=\"max-width:100%;color:rgb(255, 76, 0);box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\"><strong style=\"max-width:100%;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\"><span style=\"max-width:100%;font-size:14px;box-sizing:border-box !important;word-wrap:break-word !important;overflow-wrap:break-word !important;\">投资永远是收益和风险成正比，风险意识最重要，投资之前先学习，不了解，看不懂，不投资。</span></strong></span></p><div>&nbsp;</div>','weileilei','1510623124','47','','','0','0','0','0','0');/* DBReback Separation */ 
 /* 数据表结构 `shang_article_area`*/ 
 DROP TABLE IF EXISTS `shang_article_area`;/* DBReback Separation */ 
 CREATE TABLE `shang_article_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `art_info` varchar(255) NOT NULL,
  `art_keyword` varchar(200) NOT NULL,
  `art_content` text NOT NULL,
  `art_writer` varchar(20) NOT NULL,
  `art_time` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id` smallint(5) unsigned NOT NULL,
  `art_url` varchar(200) NOT NULL,
  `art_img` varchar(200) NOT NULL,
  `art_userid` smallint(5) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  `art_click` int(10) unsigned NOT NULL DEFAULT '0',
  `art_set` int(1) unsigned NOT NULL DEFAULT '0',
  `art_attr` tinyint(4) NOT NULL DEFAULT '0',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_article_category`*/ 
 DROP TABLE IF EXISTS `shang_article_category`;/* DBReback Separation */ 
 CREATE TABLE `shang_article_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  `type_url` varchar(200) NOT NULL,
  `type_keyword` varchar(200) NOT NULL,
  `type_info` varchar(400) NOT NULL,
  `type_content` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  `type_set` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` smallint(6) NOT NULL,
  `type_nid` varchar(50) NOT NULL,
  `is_hiden` int(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `is_sys` tinyint(3) unsigned NOT NULL,
  `model` char(30) NOT NULL,
  `is_wechat` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否显示在微信端，0：默认不显示，1：显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('2','最新动态','','','','','9','1','0','news','0','1386230747','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('6','服务协议','','','','<p>服务协议在后台进行修改！</p>','4','0','0','ruleserver','1','1386324861','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('8','关于我们','','','','<p>15454454</p>','2','0','0','anenst','0','1386379033','0','article','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('7','担保机构','','','','<br />','3','0','0','danbao','1','1386326249','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('9','网站公告','','','','','10','1','0','gonggao','0','1389929083','0','article','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('10','公司简介','','','','<p class=\"15\" style=\"margin-top:4.0500pt;margin-right:-2.6500pt;margin-left:-0.7000pt;text-indent:21.7500pt;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(8, 8, 8);\">润泽在线</span><span style=\"color:rgb(8, 8, 8);\">(www.runze360.com</span><span style=\"color:rgb(53, 52, 53);\">)</span><span style=\"color:rgb(8, 8, 8);\">是青岛润泽顺融商务咨询服务有限公司运营的一家高科技互联网金融信息服务平台，总部位于青岛西海岸新区。公司引入国外先进的信用管理理念，结合中国的社会信用状况，为平台两端的客户提供包括信用咨询、评估、信贷方案制定、协议管理、回款管理等多方面专业的全程信用管理和财富管理，旨在为有投资及融资需求的个人和小微企业主，搭建高效、安全、透明的互联网金通信息桥梁。</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(64, 64, 64);text-indent:0cm;\">&nbsp;经营项目</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">&nbsp;项目：</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">&nbsp;&nbsp;&nbsp;</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">担保借款</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">&nbsp;&nbsp;</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">信用借款</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">&nbsp;&nbsp;</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">抵押借款</span><span style=\"font-family: ;\" microsoft=\"\" text-indent:=\"\" color:=\"\">&nbsp;</span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"text-indent:-18pt;color:rgb(64, 64, 64);\">1.<span style=\"font-stretch:normal;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"text-indent:-18pt;color:rgb(64, 64, 64);\">担保标</span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:22pt;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(64, 64, 64);\">&nbsp;</span><span style=\"color:rgb(64, 64, 64);\">担保借款</span><span style=\"color:rgb(64, 64, 64);\">&nbsp;</span><span style=\"color:rgb(64, 64, 64);\">，是必须要有担保人担保才能进行的借款，</span><span style=\"color:rgb(64, 64, 64);\">&nbsp;</span><span style=\"color:rgb(64, 64, 64);\">担保人需承诺本息连带责任</span><span style=\"color:rgb(64, 64, 64);\">&nbsp;</span><span style=\"color:rgb(64, 64, 64);\">，和借款人一起承担责任，担保人和借款人之间协商并签订抵押担保书手续，确保把风险控制在合理的范围内，如借款人到期还款出现逾期，由担保人进行垫付本息还款。</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(64, 64, 64);\">&nbsp;</span><span style=\"text-indent:-18pt;color:rgb(64, 64, 64);\">2.<span style=\"font-stretch:normal;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"text-indent:-18pt;color:rgb(64, 64, 64);\">信用标</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(64, 64, 64);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P2P</span><span style=\"color:rgb(64, 64, 64);\">最早的借款标，以借款人的信用作为其借款额度的标准发布的借款。在国外个人信用体系较为健全，因此在国外比较流行。但在我们国家，信用体系不健全，信用标在各平台运行一段时期后逾期量较大，因此，各平台已在逐步采用担保标与抵押标的形式取代信用标。</span><span style=\"color:rgb(64, 64, 64);\">&nbsp;&nbsp;&nbsp;</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:-18pt;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(64, 64, 64);\">&nbsp; &nbsp; 3.<span style=\"font-stretch:normal;\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"color:rgb(64, 64, 64);\">抵押标</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(64, 64, 64);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"color:rgb(64, 64, 64);\">一</span><span style=\"color:rgb(64, 64, 64);\">&nbsp;</span><span style=\"color:rgb(51, 51, 51);background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;\">&nbsp;</span><span style=\"color:rgb(51, 51, 51);background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;\">般来说，借款人真正到抵押房子的地步，都是缺口很急很大的，各种信用贷款已经凑集不到资金了，以房产作为抵押物，借款的金额会相对较高，又可能超过借款人的违约成本，容易产生逾期和坏账。</span></span></span></p><p style=\"margin-left:18pt;font-family:Microsoft YaHei;font-size:14px;color:rgb(153, 153, 153);text-indent:0cm;\"><span style=\"font-size:14px;\"><span style=\"font-family: ;\" microsoft=\"\"><span style=\"color:rgb(51, 51, 51);background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;\">虽然房产抵押标的相对比较安全，但也并非绝对安全。即便做了他项权证，但如果借款人有其他民间债务，或者借款人在抵押前把房子长期租了出去，比如签订了一个长期租约，由于租约受法律保护，债权人无法顺利卖掉房子。</span></span></span></p>','30','0','8','intro','0','1389931247','0','article','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('11','运营团队','','','','<p><font face=\"simhei\">&nbsp; &nbsp;上档次</font></p>','20','0','8','team','1','1389931315','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('16','资费说明','','','','','7','0','8','tariff','1','1389940055','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('17','政策法规','','','','<div class=\"title\" style=\"font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-align:center;\"><span style=\"font-size:18px;\">人民银行等十部门发布《关于促进互联网金融健康发展的指导意见》&nbsp;</span><br />&nbsp;</div><div class=\"time\" style=\"font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);\">时间：2015-07-28&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源：&nbsp;中国人民银行</div><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">为鼓励金融创新，促进互联网金融健康发展，明确监管责任，规范市场秩序，经党中央、国务院同意，中国人民银行、工业和信息化部、公安部、财政部、国家工商总局、国务院法制办、中国银行业监督管理委员会、中国证券监督管理委员会、中国保险监督管理委员会、国家互联网信息办公室日前联合印发了《关于促进互联网金融健康发展的指导意见》（银发〔<span style=\"font-size:10.5pt;\">2015</span>〕<span style=\"font-size:10.5pt;\">221</span>号，以下简称《指导意见》）。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">《指导意见》按照<span style=\"font-size:10.5pt;\">“</span>鼓励创新、防范风险、趋利避害、健康发展<span style=\"font-size:10.5pt;\">”</span>的总体要求，提出了一系列鼓励创新、支持互联网金融稳步发展的政策措施，积极鼓励互联网金融平台、产品和服务创新，鼓励从业机构相互合作，拓宽从业机构融资渠道，坚持简政放权和落实、完善财税政策，推动信用基础设施建设和配套服务体系建设。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">《指导意见》按照<span style=\"font-size:10.5pt;\">“</span>依法监管、适度监管、分类监管、协同监管、创新监管<span style=\"font-size:10.5pt;\">”</span>的原则，确立了互联网支付、网络借贷、股权众筹融资、互联网基金销售、互联网保险、互联网信托和互联网消费金融等互联网金融主要业态的监管职责分工，落实了监管责任，明确了业务边界。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">《指导意见》坚持以市场为导向发展互联网金融，遵循服务好实体经济、服从宏观调控和维护金融稳定的总体目标，切实保障消费者合法权益，维护公平竞争的市场秩序，在互联网行业管理，客户资金第三方存管制度，信息披露、风险提示和合格投资者制度，消费者权益保护，网络与信息安全，反洗钱和防范金融犯罪，加强互联网金融行业自律以及监管协调与数据统计监测等方面提出了具体要求。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">下一步，各相关部门将按照《指导意见》的职责分工，认真贯彻落实《指导意见》的各项要求；互联网金融行业从业机构应按照《指导意见》的相关规定，依法合规开展各项经营活动。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\">&nbsp;</p><p align=\"center\" style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-align:center;\"><b><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">中国人民银行 工业和信息化部 公安部 财政部 工商总局 法制办 银监会</font></span></b></p><p align=\"center\" style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-align:center;\"><b><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">证监会 保监会 国家互联网信息办公室关于促进互联网金融健康发展的指导意见</font></span></b></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">近年来，互联网技术、信息通信技术不断取得突破，推动互联网与金融快速融合，促进了金融创新，提高了金融资源配置效率，但也存在一些问题和风险隐患。为全面贯彻落实党的十八大和十八届二中、三中、四中全会精神，按照党中央、国务院决策部署，遵循<span style=\"font-size:10.5pt;\">“</span>鼓励创新、防范风险、趋利避害、健康发展<span style=\"font-size:10.5pt;\">”</span>的总体要求，从金融业健康发展全局出发，进一步推进金融改革创新和对外开放，促进互联网金融健康发展，经党中央、国务院同意，现提出以下意见。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">一、鼓励创新，支持互联网金融稳步发展</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">互联网金融是传统金融机构与互联网企业（以下统称从业机构）利用互联网技术和信息通信技术实现资金融通、支付、投资和信息中介服务的新型金融业务模式。互联网与金融深度融合是大势所趋，将对金融产品、业务、组织和服务等方面产生更加深刻的影响。互联网金融对促进小微企业发展和扩大就业发挥了现有金融机构难以替代的积极作用，为大众创业、万众创新打开了大门。促进互联网金融健康发展，有利于提升金融服务质量和效率，深化金融改革，促进金融创新发展，扩大金融业对内对外开放，构建多层次金融体系。作为新生事物，互联网金融既需要市场驱动，鼓励创新，也需要政策助力，促进发展。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（一）积极鼓励互联网金融平台、产品和服务创新，激发市场活力。鼓励银行、证券、保险、基金、信托和消费金融等金融机构依托互联网技术，实现传统金融业务与服务转型升级，积极开发基于互联网技术的新产品和新服务。支持有条件的金融机构建设创新型互联网平台开展网络银行、网络证券、网络保险、网络基金销售和网络消费金融等业务。支持互联网企业依法合规设立互联网支付机构、网络借贷平台、股权众筹融资平台、网络金融产品销售平台，建立服务实体经济的多层次金融服务体系，更好地满足中小微企业和个人投融资需求，进一步拓展普惠金融的广度和深度。鼓励电子商务企业在符合金融法律法规规定的条件下自建和完善线上金融服务体系，有效拓展电商供应链业务。鼓励从业机构积极开展产品、服务、技术和管理创新，提升从业机构核心竞争力。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（二）鼓励从业机构相互合作，实现优势互补。支持各类金融机构与互联网企业开展合作，建立良好的互联网金融生态环境和产业链。鼓励银行业金融机构开展业务创新，为第三方支付机构和网络贷款平台等提供资金存管、支付清算等配套服务。支持小微金融服务机构与互联网企业开展业务合作，实现商业模式创新。支持证券、基金、信托、消费金融、期货机构与互联网企业开展合作，拓宽金融产品销售渠道，创新财富管理模式。鼓励保险公司与互联网企业合作，提升互联网金融企业风险抵御能力。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（三）拓宽从业机构融资渠道，改善融资环境。支持社会资本发起设立互联网金融产业投资基金，推动从业机构与创业投资机构、产业投资基金深度合作。鼓励符合条件的优质从业机构在主板、创业板等境内资本市场上市融资。鼓励银行业金融机构按照支持小微企业发展的各项金融政策，对处于初创期的从业机构予以支持。针对互联网企业特点，创新金融产品和服务。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（四）坚持简政放权，提供优质服务。各金融监管部门要积极支持金融机构开展互联网金融业务。按照法律法规规定，对符合条件的互联网企业开展相关金融业务实施高效管理。工商行政管理部门要支持互联网企业依法办理工商注册登记。电信主管部门、国家互联网信息管理部门要积极支持互联网金融业务，电信主管部门对互联网金融业务涉及的电信业务进行监管，国家互联网信息管理部门负责对金融信息服务、互联网信息内容等业务进行监管。积极开展互联网金融领域立法研究，适时出台相关管理规章，营造有利于互联网金融发展的良好制度环境。加大对从业机构专利、商标等知识产权的保护力度。鼓励省级人民政府加大对互联网金融的政策支持。支持设立专业化互联网金融研究机构，鼓励建设互联网金融信息交流平台，积极开展互联网金融研究。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（五）落实和完善有关财税政策。按照税收公平原则，对于业务规模较小、处于初创期的从业机构，符合我国现行对中小企业特别是小微企业税收政策条件的，可按规定享受税收优惠政策。结合金融业营业税改征增值税改革，统筹完善互联网金融税收政策。落实从业机构新技术、新产品研发费用税前加计扣除政策。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（六）推动信用基础设施建设，培育互联网金融配套服务体系。支持大数据存储、网络与信息安全维护等技术领域基础设施建设。鼓励从业机构依法建立信用信息共享平台。推动符合条件的相关从业机构接入金融信用信息基础数据库。允许有条件的从业机构依法申请征信业务许可。支持具备资质的信用中介组织开展互联网企业信用评级，增强市场信息透明度。鼓励会计、审计、法律、咨询等中介服务机构为互联网企业提供相关专业服务。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">二、分类指导，明确互联网金融监管责任</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">互联网金融本质仍属于金融，没有改变金融风险隐蔽性、传染性、广泛性和突发性的特点。加强互联网金融监管，是促进互联网金融健康发展的内在要求。同时，互联网金融是新生事物和新兴业态，要制定适度宽松的监管政策，为互联网金融创新留有余地和空间。通过鼓励创新和加强监管相互支撑，促进互联网金融健康发展，更好地服务实体经济。互联网金融监管应遵循<span style=\"font-size:10.5pt;\">“</span>依法监管、适度监管、分类监管、协同监管、创新监管<span style=\"font-size:10.5pt;\">”</span>的原则，科学合理界定各业态的业务边界及准入条件，落实监管责任，明确风险底线，保护合法经营，坚决打击违法和违规行为。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（七）互联网支付。互联网支付是指通过计算机、手机等设备，依托互联网发起支付指令、转移货币资金的服务。互联网支付应始终坚持服务电子商务发展和为社会提供小额、快捷、便民小微支付服务的宗旨。银行业金融机构和第三方支付机构从事互联网支付，应遵守现行法律法规和监管规定。第三方支付机构与其他机构开展合作的，应清晰界定各方的权利义务关系，建立有效的风险隔离机制和客户权益保障机制。要向客户充分披露服务信息，清晰地提示业务风险，不得夸大支付服务中介的性质和职能。互联网支付业务由人民银行负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（八）网络借贷。网络借贷包括个体网络借贷（即<span style=\"font-size:10.5pt;\">P2P</span>网络借贷）和网络小额贷款。个体网络借贷是指个体和个体之间通过互联网平台实现的直接借贷。在个体网络借贷平台上发生的直接借贷行为属于民间借贷范畴，受合同法、民法通则等法律法规以及最高人民法院相关司法解释规范。个体网络借贷要坚持平台功能，为投资方和融资方提供信息交互、撮合、资信评估等中介服务。个体网络借贷机构要明确信息中介性质，主要为借贷双方的直接借贷提供信息服务，不得提供增信服务，不得非法集资。网络小额贷款是指互联网企业通过其控制的小额贷款公司，利用互联网向客户提供的小额贷款。网络小额贷款应遵守现有小额贷款公司监管规定，发挥网络贷款优势，努力降低客户融资成本。网络借贷业务由银监会负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（九）股权众筹融资。股权众筹融资主要是指通过互联网形式进行公开小额股权融资的活动。股权众筹融资必须通过股权众筹融资中介机构平台（互联网网站或其他类似的电子媒介）进行。股权众筹融资中介机构可以在符合法律法规规定前提下，对业务模式进行创新探索，发挥股权众筹融资作为多层次资本市场有机组成部分的作用，更好服务创新创业企业。股权众筹融资方应为小微企业，应通过股权众筹融资中介机构向投资人如实披露企业的商业模式、经营管理、财务、资金使用等关键信息，不得误导或欺诈投资者。投资者应当充分了解股权众筹融资活动风险，具备相应风险承受能力，进行小额投资。股权众筹融资业务由证监会负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十）互联网基金销售。基金销售机构与其他机构通过互联网合作销售基金等理财产品的，要切实履行风险披露义务，不得通过违规承诺收益方式吸引客户；基金管理人应当采取有效措施防范资产配置中的期限错配和流动性风险；基金销售机构及其合作机构通过其他活动为投资人提供收益的，应当对收益构成、先决条件、适用情形等进行全面、真实、准确表述和列示，不得与基金产品收益混同。第三方支付机构在开展基金互联网销售支付服务过程中，应当遵守人民银行、证监会关于客户备付金及基金销售结算资金的相关监管要求。第三方支付机构的客户备付金只能用于办理客户委托的支付业务，不得用于垫付基金和其他理财产品的资金赎回。互联网基金销售业务由证监会负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十一）互联网保险。保险公司开展互联网保险业务，应遵循安全性、保密性和稳定性原则，加强风险管理，完善内控系统，确保交易安全、信息安全和资金安全。专业互联网保险公司应当坚持服务互联网经济活动的基本定位，提供有针对性的保险服务。保险公司应建立对所属电子商务公司等非保险类子公司的管理制度，建立必要的防火墙。保险公司通过互联网销售保险产品，不得进行不实陈述、片面或夸大宣传过往业绩、违规承诺收益或者承担损失等误导性描述。互联网保险业务由保监会负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十二）互联网信托和互联网消费金融。信托公司、消费金融公司通过互联网开展业务的，要严格遵循监管规定，加强风险管理，确保交易合法合规，并保守客户信息。信托公司通过互联网进行产品销售及开展其他信托业务的，要遵守合格投资者等监管规定，审慎甄别客户身份和评估客户风险承受能力，不能将产品销售给与风险承受能力不相匹配的客户。信托公司与消费金融公司要制定完善产品文件签署制度，保证交易过程合法合规，安全规范。互联网信托业务、互联网消费金融业务由银监会负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">三、健全制度，规范互联网金融市场秩序</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">发展互联网金融要以市场为导向，遵循服务实体经济、服从宏观调控和维护金融稳定的总体目标，切实保障消费者合法权益，维护公平竞争的市场秩序。要细化管理制度，为互联网金融健康发展营造良好环境。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十三）互联网行业管理。任何组织和个人开设网站从事互联网金融业务的，除应按规定履行相关金融监管程序外，还应依法向电信主管部门履行网站备案手续，否则不得开展互联网金融业务。工业和信息化部负责对互联网金融业务涉及的电信业务进行监管，国家互联网信息办公室负责对金融信息服务、互联网信息内容等业务进行监管，两部门按职责制定相关监管细则。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十四）客户资金第三方存管制度。除另有规定外，从业机构应当选择符合条件的银行业金融机构作为资金存管机构，对客户资金进行管理和监督，实现客户资金与从业机构自身资金分账管理。客户资金存管账户应接受独立审计并向客户公开审计结果。人民银行会同金融监管部门按照职责分工实施监管，并制定相关监管细则。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十五）信息披露、风险提示和合格投资者制度。从业机构应当对客户进行充分的信息披露，及时向投资者公布其经营活动和财务状况的相关信息，以便投资者充分了解从业机构运作状况，促使从业机构稳健经营和控制风险。从业机构应当向各参与方详细说明交易模式、参与方的权利和义务，并进行充分的风险提示。要研究建立互联网金融的合格投资者制度，提升投资者保护水平。有关部门按照职责分工负责监管。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十六）消费者权益保护。研究制定互联网金融消费者教育规划，及时发布维权提示。加强互联网金融产品合同内容、免责条款规定等与消费者利益相关的信息披露工作，依法监督处理经营者利用合同格式条款侵害消费者合法权益的违法、违规行为。构建在线争议解决、现场接待受理、监管部门受理投诉、第三方调解以及仲裁、诉讼等多元化纠纷解决机制。细化完善互联网金融个人信息保护的原则、标准和操作流程。严禁网络销售金融产品过程中的不实宣传、强制捆绑销售。人民银行、银监会、证监会、保监会会同有关行政执法部门，根据职责分工依法开展互联网金融领域消费者和投资者权益保护工作。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十七）网络与信息安全。从业机构应当切实提升技术安全水平，妥善保管客户资料和交易信息，不得非法买卖、泄露客户个人信息。人民银行、银监会、证监会、保监会、工业和信息化部、公安部、国家互联网信息办公室分别负责对相关从业机构的网络与信息安全保障进行监管，并制定相关监管细则和技术安全标准。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十八）反洗钱和防范金融犯罪。从业机构应当采取有效措施识别客户身份，主动监测并报告可疑交易，妥善保存客户资料和交易记录。从业机构有义务按照有关规定，建立健全有关协助查询、冻结的规章制度，协助公安机关和司法机关依法、及时查询、冻结涉案财产，配合公安机关和司法机关做好取证和执行工作。坚决打击涉及非法集资等互联网金融犯罪，防范金融风险，维护金融秩序。金融机构在和互联网企业开展合作、代理时应根据有关法律和规定签订包括反洗钱和防范金融犯罪要求的合作、代理协议，并确保不因合作、代理关系而降低反洗钱和金融犯罪执行标准。人民银行牵头负责对从业机构履行反洗钱义务进行监管，并制定相关监管细则。打击互联网金融犯罪工作由公安部牵头负责。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（十九）加强互联网金融行业自律。充分发挥行业自律机制在规范从业机构市场行为和保护行业合法权益等方面的积极作用。人民银行会同有关部门，组建中国互联网金融协会。协会要按业务类型，制订经营管理规则和行业标准，推动机构之间的业务交流和信息共享。协会要明确自律惩戒机制，提高行业规则和标准的约束力。强化守法、诚信、自律意识，树立从业机构服务经济社会发展的正面形象，营造诚信规范发展的良好氛围。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><span style=\"color:rgb(51, 51, 51);\"><font style=\"font-size:10.5pt;\">（二十）监管协调与数据统计监测。各监管部门要相互协作、形成合力，充分发挥金融监管协调部际联席会议制度的作用。人民银行、银监会、证监会、保监会应当密切关注互联网金融业务发展及相关风险，对监管政策进行跟踪评估，适时提出调整建议，不断总结监管经验。财政部负责互联网金融从业机构财务监管政策。人民银行会同有关部门，负责建立和完善互联网金融数据统计监测体系，相关部门按照监管职责分工负责相关互联网金融数据统计和监测工作，并实现统计数据和信息共享。</font></span></p><p style=\"margin:7.8pt 0cm;font-family:Microsoft YaHei, Helvetica, Tahoma;font-size:14px;color:rgb(102, 102, 102);text-indent:21pt;\"><font style=\"font-size:10.5pt;\">&nbsp;</font></p>','8','0','8','policy','0','1389940204','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('24','专家顾问','','','','','10','0','8','expert','1','1414225350','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('25','合作伙伴','','','','<p><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171026161821.jpg\" /></p><p>&nbsp;</p><p><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171026161829.jpg\" /></p><p>&nbsp;</p><p><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171026161836.jpg\" /></p><p>&nbsp;</p><p><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171026161855.jpg\" /></p><p>&nbsp;</p><p><img style=\"float:none;margin:0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171026161902.jpg\" /></p>','9','0','8','partner','1','1414287385','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('26','联系我们','','','','<p>公司：山东省青岛市黄岛区双珠路58号</p><p>联系电话：0532-87166577</p>','0','0','8','contact','0','1414287474','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('27','招贤纳士','','','','','7','0','8','invite','1','1414287514','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('28','帮助中心','','','','','0','1','0','assistance','0','1414414710','0','article','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('37','新手指引','','','','','10','1','28','newbee','0','1414415834','0','article','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('38','我的账户','','','','','9','1','28','userinfo','0','1414416009','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('39','我要理财','','','','','8','1','28','licai_m','0','1414416148','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('40','我要借款','','','','','7','1','28','jiekuan_m','0','1414416217','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('41','投资赎回','','','','','6','1','28','touzireturn','0','1414416284','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('42','常见问题','','','','','5','1','28','Q_A','0','1414416373','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('43','名词解释','','','','','0','1','28','mingci','0','1414416428','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('44','借款协议','','','','<p>借款协议借款协议借款协议借款协议借款协议借款协议借款协议借款协议借款协议借款协议</p>','0','0','0','xieyi','0','1435887494','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('47','媒体报道','','','','','10','1','0','medias','0','1445658873','0','article','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('48','投资指南','','','','','0','1','0','guide','0','1445659153','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('49','注册协议','','','','','0','0','0','zhucexieyi','0','1446190971','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('50','安全保障','','','','<p><img style=\"height: 623px; width: 900px; float: none; margin: 0px;\" alt=\"\" src=\"/Static/Uploads/Article/20171030103251.jpg\" /></p>','0','0','8','baozhang','0','1446195126','0','article','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category` */
 INSERT INTO `shang_article_category` VALUES ('51','平台活动','','','','','6','1','0','activity','0','1476931167','0','article','0');/* DBReback Separation */ 
 /* 数据表结构 `shang_article_category_area`*/ 
 DROP TABLE IF EXISTS `shang_article_category_area`;/* DBReback Separation */ 
 CREATE TABLE `shang_article_category_area` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  `type_url` varchar(200) NOT NULL,
  `type_keyword` varchar(200) NOT NULL,
  `type_info` varchar(400) NOT NULL,
  `type_content` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  `type_set` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` smallint(6) NOT NULL,
  `type_nid` varchar(50) NOT NULL,
  `is_hiden` int(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `is_sys` tinyint(3) unsigned NOT NULL,
  `area_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('1','网站首页','/index.html','','','','0','2','0','indexs','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('2','我要投资','/invest/index.html','','','','0','2','0','invests','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('3','我要借款','/borrow/index.html','','','','0','2','0','borrows','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('4','我的账户','/member/index.html','','','','0','2','0','url4','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('5','项目投资','','','','','0','2','0','url5','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('6','会员联盟','','','','','0','2','0','url6','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('7','会员社区','','','','','0','2','0','url7','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('8','媒体宣传','','','','','0','2','0','url8','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('312','首页','/index.html','','','','0','2','1','url1','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('313','法律政策','','','','<p>sdfsdf</p>','0','0','1','zc','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('314','法律顾问','','','','','0','0','1','gw','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('315','媒体报道','','','','','0','0','1','bd','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('316','关于我们','','','','','0','0','1','about','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('317','与我们联系','','','','','0','0','1','contact','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('318','借贷工具','','','','','0','0','2','tool','0','1343744158','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('319','退出登陆','/member/common/actlogout/','','','','0','2','4','logout','0','1343912106','0','0');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('320','登陆帐户','/member/common/login/','','','','0','2','4','login','0','1343912279','0','500');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('321','testarea','','','','','0','0','0','area','0','1344078155','0','398');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('322','东城的分类','','','','','0','0','0','dcs','0','1344078193','0','500');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('323','sssfsdf','','','','','0','0','0','area','0','1344078290','0','500');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('324','长沙的','','','','<p>修改分类-\"<span style=\"color:red;\">长沙的</span>\"修改分类-\"<span style=\"color:red;\">长沙的</span>\"修改分类-\"<span style=\"color:red;\">长沙的</span>\"修改分类-\"<span style=\"color:red;\">长沙的</span>\"</p>','0','1','0','csnews','0','1344085904','0','197');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('325','北京新闻','','','','','0','0','0','csnews','0','1344087105','0','2');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('326','财经频道','','','','','0','1','0','test','0','1345123826','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('329','房产新闻','','','','','0','1','0','fangchan','0','1346053716','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('332','国际新闻','','','','','0','1','0','guoji','0','1346118554','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('336','社会新闻','','','','','0','1','0','heshui','0','1346199468','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('337','IT科技','','','','','0','1','0','IT','0','1346219957','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('338','体育新闻','','','','','0','1','0','tiyu','0','1346220003','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('339','教育新闻','','','','<h1>录取通知书满天飞 硕士竟被高职“抢录”</h1><p class=\"Introduction\">[<strong>导读</strong>]“通知：广东省南方技师学院录取你为《环境艺术设计》应届生”一则发自陌生号码的手机短信让唐先生哭笑不得。唐先生告诉记者，他硕士毕业都已经3年了。“难道还让我去读专科吗？”</p><div style=\"position: relative\" id=\"Cnt-Main-Article-QQ\" bosszone=\"content\"><p align=\"center\">&nbsp;</p><div style=\"width: 400px\" class=\"mbArticleSharePic     \" r=\"1\"><div class=\"mbArticleShareBtn\"><span>转播到腾讯微博</span></div><img alt=\"录取通知书满天飞 硕士竟被高职“抢录”\" src=\"http://img1.gtimg.com/edu/pics/hv1/253/177/1125/73198513.jpg\" /></div><p>&nbsp;</p><p class=\"pictext\" align=\"center\">报料人向记者出示他所收到的录取信息。 受访者供图</p><p style=\"text-indent: 2em\">南方日报讯 （记者/闫昆仑实习生/周晓敏）新学期即将开始，高校的招生工作已落下帷幕。然而近日，南方日报记者接到报料称，还有一些高职院校疑似乱发录取通知书。在广州上班的唐先生称，他莫名其妙地收到某大专院校的一则录取通知短信，当他致电校方询问，对方竟还说得头头是道。据了解，今年<!--keyword--><a class=\"a-tips-Article-QQ\" href=\"http://gaokao.qq.com/\"><!--/keyword-->高考<!--keyword--></a><span class=\"infoMblog\">(<a class=\"a-tips-Article-QQ\" href=\"http://t.qq.com/qqgaokao#pref=qqcom.keyword\" rel=\"qqgaokao\" target=\"_blank\" reltitle=\"腾讯高考\">微博</a>)</span><!--/keyword-->后，有不少考生也都接到类似的通知，有些人甚至上当受骗。</p><p style=\"text-indent: 2em\"><strong>录取信息真假难辨</strong></p><p style=\"text-indent: 2em\">“通知：广东省南方技师学院录取你为《环境艺术设计》应届生，请依时入学……”一则发自陌生号码的手机短信让唐先生哭笑不得。唐先生告诉记者，他硕士毕业都已经3年了。“难道还让我去读专科吗？”</p><p style=\"text-indent: 2em\">记者根据唐先生提供的短信，致电校方询问。谁知校方不仅没有跟记者核对身份，还说他们是从教育系统得到考生资料。“我们对考生分数没有限制，你感兴趣可以过来看看。”校方工作人员称。而当记者询问学校地址时，对方只让记者坐车到花都客运站再给他们电话，“校方有车辆接送”。</p><p style=\"text-indent: 2em\">记者随后登录了短信中提供的学校网址，发现这所名为“广东省南方技师学院花都校区”的技工学校自称是“创办于1983年”、“经国务院和中央军委批准成立的公办全日制国家级重点学院”，网站上不仅有学校要闻、专业课程推荐、就业资讯等信息，还有学生作品展示，但记者留意到，这些学生作品图大都有某<a class=\"a-tips-Article-QQ\" href=\"http://edu.qq.com/photo/ctsh.shtml\" target=\"_blank\">图片</a>素材网的水印标识。</p><p style=\"text-indent: 2em\">昨日下午，记者致电广东省南方技师学院韶关本部，该校负责人称，广东省南方技师学院目前除了韶关本部，还有广州、深圳、佛山和高州4个分校区，而广州校区位于广州科学城内，学校并无新设的花都校区。</p><p style=\"text-indent: 2em\"><strong>未报名已收到录取通知</strong></p><p style=\"text-indent: 2em\">南方日报记者通过网络搜索发现，很多网友在论坛上称收到过此类录取通知，有收到手机短信的，也有接到电话的，但一般以应届考生为主。这些同学大都表示自己并没有在相应的学校报名。“不知我们的信息怎么被泄露了。”一名姓王的同学说。</p><p style=\"text-indent: 2em\">据了解，网友提到的招生学校多为高职和技工院校。记者调查发现，其中不乏正规的民办学校，也有无证经营的“野鸡学校”。王同学告诉记者，像他这样成绩不够上本科的学生，选择高职院校是很正常的，去年高考前他就接到了自称“广州华夏职业学院招生办”的电话。“一个电话来了，先跟你谈人生、谈理想，说你不读大学，理想就远了。”</p><p style=\"text-indent: 2em\">王同学说，对方还以老乡身份博取信任，再通过各种入情入理的话吸引他到学校去参观。但由于听到华夏的某些负面新闻，王同学并没心动，还和对方提到自己感兴趣的南方技师学院。“于是该招生办老师口不择言，说那个学校以前死过人，让我不要去。”</p><p style=\"text-indent: 2em\">去年9月，王同学最终报读了广东南方技师学院广州校区。这所学校虽是正规的民办学院，仍令他大失所望。“和宣传的有很大落差。”王同学说，学校招生时说得天花乱坠，称校内有很多社团活动，而当他到学校后才发现只有零散的一两个协会，社团活动也很少，“大学生活真的很无聊。”</p><p style=\"text-indent: 2em\">其他高职院校的同学也普遍反映这学校不规范。目前就读于某创新技术学院的刘同学告诉记者，学校通过各种方式收费的现象很常见。“原来给我们的宣传资料上说学费是每学期四千多，结果加上学杂费、住宿费等其他费用竟要收九千多。”</p><p style=\"text-indent: 2em\">此外，还有某些高职院校被怀疑利用学生劳动力获取商业利益。去年曾有媒体报道，广州华夏职业学院以“实习”为由强迫学生到高尔夫球场割草，不割草就不给学分。记者向该校一名同学了解到，学校原来规定的实习时间是第三学期，“现在第二学期就让我们来割草了”。该同学直呼“当初是被骗进来的”，他们入学后多次想找招生办的的老师理论，却发现当初的“知心”老师或师兄师姐全都不见踪影，“打他们电话打了一星期都打不通。”</p><p style=\"text-indent: 2em\"><strong>知情人报料招生有提成</strong></p><p style=\"text-indent: 2em\">据了解，考生资料外泄的现象其实很普遍。记者通过网络搜索发现，每年均有不少考生收到高职或专科院校的录取短信和电话，有人收到不知名学校寄来的录取通知书。</p><p style=\"text-indent: 2em\">如此奇怪的录取方式为何能得到考生信任？一知情人称，他们一般都是利用了落榜考生的自卑心理。“很多学生求学心切，觉得有学校肯收我就不错了，管他什么学校。”该知情人称，学校会向有报名意向的学生收定金，称是“预留学位”的费用。例如某职业技术学院就要求学生报名时预付1000元定金，考生一旦反悔，定金很难要回来，“主要是退款手续太麻烦了。”该知情人还告诉记者，如果是交了全额学费的，一般只能拿回70%至80%。</p><p style=\"text-indent: 2em\">知情人还透露，像唐先生这样的情况还比较少，“这类学校一般下手很准，收到短信的多是应届考生。”高职院校一般会找些大学生或高中毕业生做“招生助理”，从“助理”手上买来他们学弟学妹的个人资料，这些资料就包括考生的出生日期、电话、准考证号、模拟考成绩等。“有时直接从高中老师那里拿考生资料。”</p><p style=\"text-indent: 2em\">一名不愿透露姓名的“招生助理”告诉记者，他不仅为某信息技术学院提供汕尾市一所高中的考生资料获取报酬，还负责联系“师弟师妹”劝说其报读该学校。“每招一个学生，我可以拿200元提成。”该同学承认，做“招生助理”每月平均能拿到一千多元，还有相应的车费、话费补贴，这对在校大学生来说是很吸引的。</p><p style=\"text-indent: 2em\"><strong>■省人保厅回应</strong></p><p style=\"text-indent: 2em\"><strong>会对此事调查清楚</strong></p><p style=\"text-indent: 2em\">随意发放录取通知的学校究竟有无办学资质？记者就此事采访了主管技工学校的广东省人力资源与社会保障厅，工作人员称直接归省厅管理的技工院校只有12所，唐先生反映的广东省南方技师学院花都校区不在这12所技校之列。记者随后向工作人员反映该校未经总部授权擅自招生并乱发录取短信的情况，工作人员表示：“只要将文字材料送到这边，我们一定调查清楚。”</p><p style=\"text-indent: 2em\"><strong>■律师说法</strong></p><p style=\"text-indent: 2em\"><strong>此类高职院校招生行为不合法</strong></p><p style=\"text-indent: 2em\">广东德比律师事务所律师金豪认为，高职院校需在教育或劳动主管部门批准后方可招生，分校还需得到学校总部的授权。广东南方技师学院花都校区并无得到韶关总部的授权，所以其招生行为是不合法的。</p><p style=\"text-indent: 2em\">无论是高职还是专科院校，其招生计划都受到教育部门的宏观调控，像唐先生反映的学校乱发录取通知，还有网友提到的入学后发现学校和招生说明大有出入的情况都涉嫌民事上的虚假宣传和欺诈。</p><p style=\"text-indent: 2em\">金豪建议，学生入学后如发现学校有不合理收费可提出异议，能提供证据证明学生要求退学被扣手续费的，可控告学校的欺诈行为。考生身份信息属个人隐私，泄露考生身份信息的行为侵犯了公民的隐私权，如果以营利为目的买卖考生身份信息，情节严重的可追究其法律责任。<a id=\"backqqcom\" title=\"点击进入腾讯首页\" href=\"http://www.qq.com/?pref=article\" target=\"_blank\" bosszone=\"backqqcom\" alt=\"点击进入腾讯首页\"><img src=\"http://www.qq.com/favicon.ico\" /></a></p><div style=\"z-index: 899; position: absolute; width: 59px; height: 22px; visibility: visible; top: 2933px; cursor: pointer; text-decoration: none; left: 544px\" id=\"tipsWBzf\"><span style=\"position: relative\"><a style=\"z-index: 900; position: absolute; width: 59px; display: block; background: url(http://mat1.gtimg.com/news/2011/logo.png) no-repeat; height: 22px; top: 0px; left: 0px\" title=\"转播至微博\" href=\"javascript:void(0)\">﻿</a></span></div></div>','0','1','0','jiaoyu','0','1346220057','0','1');/* DBReback Separation */
 /* 插入数据 `shang_article_category_area` */
 INSERT INTO `shang_article_category_area` VALUES ('343','安徽新闻','','','','','0','1','0','anhuixw','0','1348407480','0','3');/* DBReback Separation */ 
 /* 数据表结构 `shang_auser_dologs`*/ 
 DROP TABLE IF EXISTS `shang_auser_dologs`;/* DBReback Separation */ 
 CREATE TABLE `shang_auser_dologs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL COMMENT '日志操作类型',
  `tid` int(10) unsigned NOT NULL,
  `tstatus` tinyint(4) unsigned NOT NULL,
  `deal_ip` varchar(16) NOT NULL COMMENT '操作者IP',
  `deal_time` int(10) unsigned NOT NULL COMMENT '操作者时间',
  `deal_user` varchar(50) NOT NULL COMMENT '操作者用户名',
  `deal_info` varchar(200) NOT NULL COMMENT '操作备注',
  PRIMARY KEY (`id`),
  KEY `deal_user` (`deal_user`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('1','login','0','1','112.224.17.200','1508753793','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('2','login','0','1','123.134.63.125','1508757467','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('3','Global','0','1','123.134.63.125','1508757488','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('4','login','0','1','111.37.10.12','1508805887','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('5','ad','0','1','111.37.10.12','1508806027','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('6','Global','0','1','111.37.10.12','1508806033','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('7','ad','0','1','111.37.10.12','1508806143','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('8','Global','0','1','111.37.10.12','1508806145','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('9','ad','0','1','111.37.10.12','1508806206','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('10','Global','0','1','111.37.10.12','1508806210','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('11','ad','0','1','111.37.10.12','1508806327','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('12','Global','0','1','111.37.10.12','1508806328','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('13','ad','0','1','111.37.10.12','1508806684','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('14','Global','0','1','111.37.10.12','1508806685','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('15','ad','0','1','111.37.10.12','1508806716','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('16','login','0','1','61.156.219.211','1508814808','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('17','Msgonline','0','1','61.156.219.211','1508814857','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('18','Msgonline','0','1','61.156.219.211','1508814873','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('19','Msgonline','0','1','61.156.219.211','1508814897','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('20','Msgonline','0','1','61.156.219.211','1508814917','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('21','Msgonline','0','1','61.156.219.211','1508814932','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('22','Msgonline','0','1','61.156.219.211','1508814987','zerunadmin','成功执行了通知信息模板的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('23','Msgonline','0','1','61.156.219.211','1508819690','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('24','Msgonline','0','1','61.156.219.211','1508819753','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('25','Msgonline','0','1','61.156.219.211','1508820180','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('26','Msgonline','0','1','61.156.219.211','1508820400','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('27','Global','0','1','61.156.219.211','1508820612','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('28','id5','0','1','61.156.219.211','1508822620','zerunadmin','执行了id5身份验证接口参数的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('29','Msgonline','0','1','61.156.219.211','1508831104','zerunadmin','成功执行了通知信息接口的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('30','Global','0','1','61.156.219.211','1508831155','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('31','Global','0','1','111.37.10.12','1508843002','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('32','login','0','1','123.134.63.125','1508843160','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('33','ad','0','1','111.37.10.12','1508843220','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('34','Global','0','1','111.37.10.12','1508843222','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('35','Global','0','1','111.37.10.12','1508843914','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('36','Global','0','1','123.134.63.125','1508844018','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('37','Global','0','1','123.134.63.125','1508844760','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('38','Global','0','1','123.134.63.125','1508844915','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('39','Global','0','1','123.134.63.125','1508845071','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('40','Global','0','1','123.134.63.125','1508845261','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('41','Global','0','1','123.134.63.125','1508845296','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('42','Global','0','1','123.134.63.125','1508845403','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('43','Global','0','1','123.134.63.125','1508845485','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('44','Global','0','1','123.134.63.125','1508845485','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('45','Global','0','1','123.134.63.125','1508845485','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('46','Global','0','1','123.134.63.125','1508845492','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('47','acategory','0','1','111.37.10.12','1508845520','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('48','Global','0','1','123.134.63.125','1508845582','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('49','Global','0','1','123.134.63.125','1508845595','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('50','Global','0','1','123.134.63.125','1508845596','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('51','Global','0','1','123.134.63.125','1508845596','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('52','Global','0','1','123.134.63.125','1508845662','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('53','Global','0','1','123.134.63.125','1508845751','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('54','Global','0','1','123.134.63.125','1508845811','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('55','Global','0','1','123.134.63.125','1508846159','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('56','Global','0','1','123.134.63.125','1508846272','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('57','Global','0','1','123.134.63.125','1508846339','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('58','Global','0','1','123.134.63.125','1508846498','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('59','Global','0','1','123.134.63.125','1508846513','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('60','QQ','1','1','123.134.63.125','1508846640','zerunadmin','执行了客服QQ的添加操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('61','Global','0','1','123.134.63.125','1508846642','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('62','ad','0','1','111.37.10.12','1508846792','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('63','Global','0','1','111.37.10.12','1508846794','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('64','Global','0','1','123.134.63.125','1508847185','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('65','Global','0','1','123.134.63.125','1508847186','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('66','Global','0','1','123.134.63.125','1508847360','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('67','Global','0','1','123.134.63.125','1508847585','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('68','Global','0','1','123.134.63.125','1508847794','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('69','friend','0','1','112.224.20.227','1508850861','zerunadmin','成功执行了添加友情链接操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('70','friend','0','1','112.224.20.227','1508850885','zerunadmin','成功执行了添加友情链接操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('71','friend','0','1','112.224.20.227','1508850902','zerunadmin','成功执行了添加友情链接操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('72','friend','0','1','112.224.20.227','1508850919','zerunadmin','成功执行了添加友情链接操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('73','friend','0','1','112.224.20.227','1508850939','zerunadmin','成功执行了添加友情链接操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('74','ad','0','1','112.224.20.227','1508851398','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('75','ad','0','1','112.224.20.227','1508851405','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('76','Global','0','1','112.224.20.227','1508851413','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('77','ad','0','1','112.224.20.227','1508851577','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('78','ad','0','1','112.224.20.227','1508851593','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('79','Global','0','1','112.224.20.227','1508851595','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('80','ad','0','1','112.224.20.227','1508894883','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('81','Global','0','1','112.224.20.227','1508894888','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('82','login','0','1','61.156.219.211','1508915728','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('83','Global','0','1','61.156.219.211','1508915730','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('84','login','0','1','111.37.10.16','1508915824','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('85','ad','0','1','111.37.10.16','1508915854','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('86','Global','0','1','111.37.10.16','1508915856','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('87','Global','0','1','61.156.219.211','1508916510','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('88','login','0','1','221.213.85.214','1509005561','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('89','acategory','0','1','221.213.85.214','1509005782','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('90','Global','0','1','221.213.85.214','1509005784','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('91','acategory','0','1','221.213.85.214','1509005817','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('92','acategory','0','1','221.213.85.214','1509005826','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('93','Global','0','1','221.213.85.214','1509005828','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('94','Global','0','1','221.213.85.214','1509005829','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('95','acategory','0','1','221.213.85.214','1509005852','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('96','acategory','0','1','221.213.85.214','1509005945','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('97','Global','0','1','221.213.85.214','1509005946','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('98','acategory','0','1','221.213.85.214','1509006337','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('99','Global','0','1','221.213.85.214','1509006356','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('100','Global','0','1','221.213.85.214','1509006378','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('101','acategory','0','1','221.213.85.214','1509006453','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('102','Global','0','1','221.213.85.214','1509006455','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('103','acategory','0','1','221.213.85.214','1509006485','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('104','Global','0','1','221.213.85.214','1509006486','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('105','acategory','0','1','221.213.85.214','1509006569','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('106','acategory','0','1','221.213.85.214','1509006657','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('107','Global','0','1','221.213.85.214','1509006659','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('108','login','0','1','39.88.17.110','1509071913','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('109','Global','0','1','39.88.17.110','1509072048','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('110','login','0','1','39.88.17.110','1509090926','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('111','Memberid','0','1','39.88.17.110','1509090979','zerunadmin','执行了实名认证会员列表导出操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('112','login','0','1','61.156.219.211','1509330738','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('113','acategory','0','1','61.156.219.211','1509330772','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('114','Global','0','1','61.156.219.211','1509330775','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('115','acategory','0','1','61.156.219.211','1509330803','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('116','Global','0','1','61.156.219.211','1509330804','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('117','acategory','0','1','61.156.219.211','1509330830','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('118','Global','0','1','61.156.219.211','1509330832','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('119','acategory','0','1','61.156.219.211','1509333911','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('120','acategory','0','1','61.156.219.211','1509333975','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('121','login','0','1','58.222.101.206','1509517650','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('122','Members','0','1','58.222.101.206','1509518099','zerunadmin','成功执行了会员信息资料的修改操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('123','doEditWait','1','1','58.222.101.206','1509518309','zerunadmin','初审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('124','Members','0','1','58.222.101.206','1509520274','zerunadmin','成功执行了会员信息资料的修改操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('125','Tborrow','1','1','58.222.101.206','1509520317','zerunadmin','成功执行了优计划的添加操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('126','Global','0','1','58.222.101.206','1509520403','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('127','Global','0','1','58.222.101.206','1509520405','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('128','doEditWait','2','1','58.222.101.206','1509520416','zerunadmin','初审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('129','acategory','0','1','58.222.101.206','1509520492','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('130','acategory','0','1','58.222.101.206','1509520738','zerunadmin','成功执行了文章分类编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('131','login','0','1','61.156.219.211','1510124899','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('132','Global','0','1','61.156.219.211','1510124994','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('133','login','0','1','58.57.136.19','1510126791','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('134','Global','0','1','61.156.219.211','1510127255','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('135','Global','0','1','61.156.219.211','1510130327','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('136','Global','0','1','61.156.219.211','1510130328','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('137','Global','0','1','61.156.219.211','1510130329','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('138','Global','0','1','61.156.219.211','1510130330','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('139','Global','0','1','61.156.219.211','1510130330','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('140','Global','0','1','61.156.219.211','1510130331','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('141','Global','0','1','61.156.219.211','1510130332','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('142','Global','0','1','61.156.219.211','1510130333','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('143','Global','0','1','61.156.219.211','1510130334','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('144','Global','0','1','61.156.219.211','1510130334','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('145','Global','0','1','61.156.219.211','1510130335','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('146','Global','0','1','61.156.219.211','1510130336','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('147','Global','0','1','61.156.219.211','1510130337','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('148','Global','0','1','61.156.219.211','1510130337','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('149','Global','0','1','61.156.219.211','1510130338','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('150','Global','0','1','61.156.219.211','1510130339','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('151','Global','0','1','61.156.219.211','1510130340','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('152','Global','0','1','61.156.219.211','1510130341','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('153','Global','0','1','61.156.219.211','1510130341','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('154','Global','0','1','61.156.219.211','1510130342','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('155','Global','0','1','61.156.219.211','1510130343','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('156','Global','0','1','61.156.219.211','1510130345','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('157','Global','0','1','61.156.219.211','1510130345','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('158','Global','0','1','61.156.219.211','1510130346','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('159','Global','0','1','61.156.219.211','1510130348','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('160','Global','0','1','61.156.219.211','1510130349','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('161','Global','0','1','61.156.219.211','1510130350','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('162','Global','0','1','61.156.219.211','1510130351','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('163','login','0','1','58.57.136.19','1510294584','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('164','Payonline','0','1','58.57.136.19','1510294604','zerunadmin','执行了第三方支付接口参数的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('165','Global','0','1','58.57.136.19','1510294606','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('166','bconfig','0','1','58.57.136.19','1510294717','zerunadmin','成功执行了业务参数编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('167','Global','0','1','58.57.136.19','1510294719','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('168','login','0','1','27.202.249.110','1510446385','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('169','Global','0','1','27.202.249.110','1510450722','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('170','Global','0','1','27.202.249.110','1510450880','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('171','Global','0','1','27.202.249.110','1510451004','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('172','Global','0','1','27.202.249.110','1510451140','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('173','AclEdit','1','1','27.202.249.110','1510451165','zerunadmin','用户组权限修改成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('174','Global','0','1','27.202.249.110','1510451167','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('175','login','0','1','27.202.249.110','1510451732','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('176','Global','0','1','27.202.249.110','1510453919','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('177','Global','0','1','27.202.249.110','1510454273','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('178','Global','0','1','27.202.249.110','1510454895','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('179','Global','0','1','27.202.249.110','1510455016','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('180','Global','0','1','27.202.249.110','1510455136','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('181','Global','0','1','27.202.249.110','1510455249','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('182','withdraw','1','3','27.202.249.110','1510455289','zerunadmin','123');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('183','login','0','1','27.202.249.110','1510455890','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('184','login','0','1','27.223.243.65','1510534198','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('185','Global','0','1','27.223.243.65','1510534202','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('186','Global','0','1','27.223.243.65','1510534203','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('187','Global','0','1','27.223.243.65','1510534204','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('188','Paylog','0','1','27.223.243.65','1510534395','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('189','Paylog','0','1','27.223.243.65','1510534432','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('190','Paylog','0','1','27.223.243.65','1510534436','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('191','Paylog','0','1','27.223.243.65','1510534439','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('192','Paylog','0','1','27.223.243.65','1510534446','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('193','Paylog','0','1','27.223.243.65','1510534450','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('194','Paylog','0','1','27.223.243.65','1510534453','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('195','Paylog','0','1','27.223.243.65','1510534457','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('196','Paylog','0','1','27.223.243.65','1510534461','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('197','Paylog','0','1','27.223.243.65','1510534465','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('198','Paylog','0','1','27.223.243.65','1510534469','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('199','Paylog','0','1','27.223.243.65','1510534473','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('200','Paylog','0','1','27.223.243.65','1510534477','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('201','Paylog','0','1','27.223.243.65','1510534480','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('202','Paylog','0','1','27.223.243.65','1510534484','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('203','Paylog','0','1','27.223.243.65','1510534488','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('204','Paylog','0','1','27.223.243.65','1510534492','zerunadmin','执行了管理员手动审核充值操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('205','Members','0','1','27.223.243.65','1510534883','zerunadmin','成功执行了会员信息资料的修改操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('206','Global','0','1','27.223.243.65','1510534928','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('207','Global','0','1','27.223.243.65','1510534936','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('208','Global','0','1','27.223.243.65','1510534937','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('209','bconfig','0','1','27.223.243.65','1510537119','zerunadmin','成功执行了业务参数编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('210','Global','0','1','27.223.243.65','1510537121','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('211','Members','0','1','27.223.243.65','1510539093','zerunadmin','成功执行了会员信息资料的修改操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('212','doEditWait','3','1','27.223.243.65','1510539378','zerunadmin','初审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('213','Members','0','1','27.223.243.65','1510539524','zerunadmin','成功执行了会员余额调整的操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('214','borrowApproved','3','1','27.223.243.65','1510539621','zerunadmin','复审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('215','Members','0','1','27.223.243.65','1510539787','zerunadmin','成功执行了会员信息资料的修改操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('216','doEditWait','4','1','27.223.243.65','1510540086','zerunadmin','初审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('217','Global','0','1','27.223.243.65','1510540242','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('218','Global','0','1','27.223.243.65','1510540247','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('219','Global','0','1','27.223.243.65','1510540276','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('220','Global','0','1','27.223.243.65','1510540276','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('221','Global','0','1','27.223.243.65','1510540277','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('222','Global','0','1','27.223.243.65','1510540278','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('223','Global','0','1','27.223.243.65','1510540279','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('224','Global','0','1','27.223.243.65','1510540280','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('225','Global','0','1','27.223.243.65','1510540280','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('226','Global','0','1','27.223.243.65','1510540280','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('227','Global','0','1','27.223.243.65','1510540281','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('228','Global','0','1','27.223.243.65','1510540281','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('229','Global','0','1','27.223.243.65','1510540281','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('230','Global','0','1','27.223.243.65','1510540281','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('231','Global','0','1','27.223.243.65','1510540283','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('232','Global','0','1','27.223.243.65','1510540498','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('233','Global','0','1','27.223.243.65','1510540582','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('234','spread','0','1','27.223.243.65','1510541027','zerunadmin','成功执行了关联的操作！推荐人:13606488437被推荐人:15166272750');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('235','spread','0','1','27.223.243.65','1510541038','zerunadmin','成功执行了取消关联的操作！取消的推荐人:13606488437被推荐人:15166272750');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('236','Global','0','1','27.223.243.65','1510541453','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('237','Global','0','1','27.223.243.65','1510541507','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('238','withdraw','2','1','27.223.243.65','1510541575','zerunadmin','成功执行了提现处理操作！备注:啊');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('239','login','0','1','58.57.136.19','1510541718','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('240','AclEdit','1','1','27.223.243.65','1510541961','zerunadmin','用户组权限修改成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('241','AusersAdd','140','1','27.223.243.65','1510542007','zerunadmin','管理员添加成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('242','AusersAdd','141','1','27.223.243.65','1510542025','zerunadmin','管理员添加成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('243','AusersAdd','142','1','27.223.243.65','1510542056','zerunadmin','管理员添加成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('244','AusersAdd','143','1','27.223.243.65','1510542078','zerunadmin','管理员添加成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('245','QQ','2','1','27.223.243.65','1510542969','zerunadmin','执行了客服QQ的添加操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('246','QQ','3','1','27.223.243.65','1510543004','zerunadmin','执行了客服QQ的添加操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('247','QQ','0','0','27.223.243.65','1510543011','zerunadmin','执行了客服QQ的删除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('248','QQ','0','0','27.223.243.65','1510543013','zerunadmin','执行了客服QQ的删除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('249','Global','0','1','27.223.243.65','1510543016','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('250','ad','0','1','27.223.243.65','1510543071','zerunadmin','成功执行了广告编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('251','logout','0','1','27.223.243.65','1510543163','zerunadmin','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('252','login','0','1','27.223.243.65','1510543475','zhuangli','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('253','login','0','1','27.223.243.65','1510543646','liuhengsen','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('254','login','0','1','27.223.243.65','1510543851','weileilei','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('255','doEditWait','5','1','27.223.243.65','1510544219','zhuangli','初审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('256','logout','0','1','27.223.243.65','1510544599','zhuangli','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('257','login','0','1','27.223.243.65','1510544631','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('258','AusersAdd','144','1','27.223.243.65','1510544660','zerunadmin','管理员添加成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('259','logout','0','1','27.223.243.65','1510544683','zerunadmin','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('260','login','0','1','27.223.243.65','1510544792','wangjinye','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('261','Members','0','1','27.223.243.65','1510544827','wangjinye','成功执行了会员信息资料的修改操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('262','doEditWait','6','0','27.223.243.65','1510545720','wangjinye','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('263','doEditWait','6','0','27.223.243.65','1510545737','wangjinye','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('264','doEditWait','6','0','27.223.243.65','1510545763','wangjinye','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('265','logout','0','1','27.223.243.65','1510546419','wangjinye','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('266','login','0','1','27.223.243.65','1510546467','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('267','withdraw','2','3','27.223.243.65','1510546482','zerunadmin',';通联返回：未开通的业务类型');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('268','login','0','1','27.223.243.65','1510546653','weileilei','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('269','login','0','1','27.223.243.65','1510546689','liuhengsen','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('270','Global','0','1','27.223.243.65','1510546870','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('271','Global','0','1','27.223.243.65','1510546871','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('272','Global','0','1','27.223.243.65','1510546873','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('273','Global','0','1','27.223.243.65','1510546874','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('274','Global','0','1','27.223.243.65','1510546874','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('275','Global','0','1','27.223.243.65','1510546979','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('276','Global','0','1','27.223.243.65','1510546996','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('277','logout','0','1','27.223.243.65','1510547028','zerunadmin','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('278','logout','0','1','27.223.243.65','1510547246','weileilei','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('279','logout','0','1','27.223.243.65','1510547282','liuhengsen','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('280','login','0','1','27.223.243.65','1510547300','zhuangli','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('281','doEditWait','7','1','27.223.243.65','1510547400','zhuangli','初审操作成功！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('282','logout','0','1','27.223.243.65','1510547809','zhuangli','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('283','login','0','1','27.223.243.65','1510547831','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('284','login','0','1','58.57.136.19','1510550129','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('285','Global','0','1','58.57.136.19','1510550741','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('286','withdraw','2','3','58.57.136.19','1510550747','zerunadmin',';通联返回：未开通的业务类型');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('287','navigation','0','1','58.57.136.19','1510550780','zerunadmin','成功执行了导航菜单编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('288','Global','0','1','58.57.136.19','1510550877','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('289','login','0','1','27.223.243.65','1510554308','qiuwen','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('290','logout','0','1','27.223.243.65','1510554431','qiuwen','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('291','login','0','1','27.223.243.65','1510555084','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('292','login','0','1','223.81.131.175','1510559921','zhuangli','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('293','Payonline','0','1','58.57.136.19','1510561372','zerunadmin','执行了第三方支付接口参数的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('294','Global','0','1','58.57.136.19','1510561373','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('295','Payonline','0','1','58.57.136.19','1510561528','zerunadmin','执行了第三方支付接口参数的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('296','Global','0','1','58.57.136.19','1510561530','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('297','Global','0','1','58.57.136.19','1510561722','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('298','login','0','1','119.166.107.13','1510619642','wangjinye','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('299','login','0','1','27.193.174.240','1510622228','weileilei','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('300','login','0','1','58.57.136.19','1510622324','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('301','logout','0','1','27.193.174.240','1510622483','weileilei','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('302','login','0','1','223.81.131.45','1510622606','zhuangli','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('303','login','0','1','27.193.174.240','1510622638','weileilei','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('304','login','0','1','27.210.50.113','1510627100','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('305','login','0','1','223.81.131.45','1510627186','zhuangli','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('306','login','0','1','223.81.131.45','1510627382','zhuangli','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('307','doEditWait','6','0','223.81.131.45','1510627767','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('308','doEditWait','6','0','223.81.131.45','1510627840','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('309','doEditWait','6','0','223.81.131.45','1510627887','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('310','doEditWait','6','0','223.81.131.45','1510627962','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('311','Global','0','1','58.57.136.19','1510628254','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('312','Msgonline','0','1','58.57.136.19','1510628749','zerunadmin','成功执行了通知信息模板的编辑操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('313','Global','0','1','58.57.136.19','1510628751','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('314','doEditWait','6','0','223.81.131.45','1510629632','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('315','doEditWait','6','0','223.81.131.45','1510629665','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('316','login','0','1','61.156.219.211','1510630807','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('317','Global','0','1','61.156.219.211','1510630813','zerunadmin','执行了所有缓存清除操作！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('318','doEditWait','6','0','223.81.131.45','1510631263','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('319','doEditWait','6','0','223.81.131.45','1510631289','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('320','doEditWait','6','0','223.81.131.45','1510631299','zhuangli','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('321','logout','0','1','223.81.131.45','1510631435','zhuangli','管理员退出');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('322','login','0','1','223.81.131.45','1510631480','wangjinye','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('323','doEditWait','6','0','223.81.131.45','1510631809','wangjinye','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('324','doEditWait','6','0','223.81.131.45','1510631816','wangjinye','初审操作失败！');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('325','login','0','1','27.210.50.113','1510631890','zerunadmin','管理员登录成功');/* DBReback Separation */
 /* 插入数据 `shang_auser_dologs` */
 INSERT INTO `shang_auser_dologs` VALUES ('326','doEditWait','6','0','223.81.131.45','1510631955','wangjinye','初审操作失败！');/* DBReback Separation */ 
 /* 数据表结构 `shang_ausers`*/ 
 DROP TABLE IF EXISTS `shang_ausers`;/* DBReback Separation */ 
 CREATE TABLE `shang_ausers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  `u_group_id` smallint(6) NOT NULL,
  `real_name` varchar(20) NOT NULL DEFAULT '匿名',
  `last_log_time` int(10) NOT NULL DEFAULT '0',
  `last_log_ip` varchar(30) NOT NULL DEFAULT '0',
  `is_ban` int(1) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL,
  `area_name` varchar(10) NOT NULL,
  `is_kf` int(10) unsigned NOT NULL DEFAULT '0',
  `qq` varchar(20) NOT NULL COMMENT '管理员qq',
  `phone` varchar(20) NOT NULL COMMENT '客服电话',
  `user_word` varchar(100) NOT NULL COMMENT '密码口令',
  `ukey` varchar(255) DEFAULT NULL COMMENT 'uk',
  PRIMARY KEY (`id`),
  KEY `is_kf` (`is_kf`,`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('126','kefuzhang','670b14728ad9902aecba32e22fa4f6bd','22','小张','1441087163','61.156.219.212','0','0','中国','1','89596593','','kefuzhang','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('127','kefuwang','202cb962ac59075b964b07152d234b70','22','kefuwang','0','0','0','0','中国','1','','','','FF06B741565E3201F1D1239D1D77DBA2');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('136','kefuliu','c57562653c783faeb8b6cd917ef258c1','22','','0','0','0','0','中国','1','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('137','kefu123','1e191d851b3b49a248f4ea62f6b06410','22','','0','0','0','0','中国','1','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('138','kefu456','f87003205dd342bec2b81ee940172a4d','22','','0','0','0','0','中国','1','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('139','zerunadmin','0192023a7bbd73250516f069df18b500','5','','1510631890','27.210.50.113','0','0','中国','0','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('140','zhuangli','573a5bfbf3c84a57110078571d5182b4','15','庄丽','1510627382','223.81.131.45','0','0','中国','0','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('141','weileilei','7856c927f00b2dcf93e3d07809289082','22','','1510622638','27.193.174.240','0','0','中国','0','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('142','liuhengsen','235210ca220898c3c20ca13525f781b7','15','','1510546689','27.223.243.65','0','0','中国','0','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('143','qiuwen','b92949a640adc797a9f34f5ea1cf8e54','16','','1510554308','27.223.243.65','0','0','中国','0','','','','');/* DBReback Separation */
 /* 插入数据 `shang_ausers` */
 INSERT INTO `shang_ausers` VALUES ('144','wangjinye','c7d74afa7b0a3837bb8921ef817bf7ba','15','','1510631480','223.81.131.45','0','0','中国','0','','','','');/* DBReback Separation */ 
 /* 数据表结构 `shang_auto_borrow`*/ 
 DROP TABLE IF EXISTS `shang_auto_borrow`;/* DBReback Separation */ 
 CREATE TABLE `shang_auto_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `duration_from` tinyint(3) unsigned NOT NULL,
  `duration_to` tinyint(3) unsigned NOT NULL,
  `account_money` decimal(15,2) NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `is_auto_full` int(11) NOT NULL,
  `invest_money` decimal(15,2) NOT NULL,
  `is_use` tinyint(4) NOT NULL DEFAULT '1',
  `borrow_type` tinyint(4) NOT NULL,
  `min_invest` decimal(15,2) NOT NULL COMMENT '最小投资金额',
  `invest_time` int(10) NOT NULL DEFAULT '0',
  `can_day` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用于天标',
  `invest_id` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新的投资号',
  `repayment_type` tinyint(1) DEFAULT '1' COMMENT '优计划投资还款方式，1每月还息到期还本，2利息复投',
  PRIMARY KEY (`id`),
  KEY `is_use` (`is_use`,`borrow_type`,`end_time`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_bid_name`*/ 
 DROP TABLE IF EXISTS `shang_bid_name`;/* DBReback Separation */ 
 CREATE TABLE `shang_bid_name` (
  `id` int(11) NOT NULL,
  `kay` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bidname` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */
 /* 插入数据 `shang_bid_name` */
 INSERT INTO `shang_bid_name` VALUES ('1','担保标','担保标');/* DBReback Separation */
 /* 插入数据 `shang_bid_name` */
 INSERT INTO `shang_bid_name` VALUES ('2','信用标','信用标');/* DBReback Separation */
 /* 插入数据 `shang_bid_name` */
 INSERT INTO `shang_bid_name` VALUES ('3','秒还标','秒还标');/* DBReback Separation */
 /* 插入数据 `shang_bid_name` */
 INSERT INTO `shang_bid_name` VALUES ('4','抵押标','抵押标');/* DBReback Separation */
 /* 插入数据 `shang_bid_name` */
 INSERT INTO `shang_bid_name` VALUES ('5','净值标','净值标');/* DBReback Separation */ 
 /* 数据表结构 `shang_borrow_verify`*/ 
 DROP TABLE IF EXISTS `shang_borrow_verify`;/* DBReback Separation */ 
 CREATE TABLE `shang_borrow_verify` (
  `borrow_id` int(11) unsigned NOT NULL,
  `deal_user` mediumint(10) unsigned NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  `deal_info` varchar(50) NOT NULL,
  `deal_time_2` int(10) unsigned NOT NULL,
  `deal_user_2` mediumint(10) unsigned NOT NULL,
  `deal_info_2` varchar(50) NOT NULL,
  `deal_status` tinyint(3) unsigned NOT NULL,
  `deal_status_2` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `borrow_id` (`borrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_borrow_verify` */
 INSERT INTO `shang_borrow_verify` VALUES ('1','139','1509518308','啊','0','0','','2','0');/* DBReback Separation */
 /* 插入数据 `shang_borrow_verify` */
 INSERT INTO `shang_borrow_verify` VALUES ('2','139','1509520415','啊','0','0','','2','0');/* DBReback Separation */
 /* 插入数据 `shang_borrow_verify` */
 INSERT INTO `shang_borrow_verify` VALUES ('3','139','1510539378','啊','1510539621','139','','2','6');/* DBReback Separation */
 /* 插入数据 `shang_borrow_verify` */
 INSERT INTO `shang_borrow_verify` VALUES ('4','139','1510540085','同意','0','0','','2','0');/* DBReback Separation */
 /* 插入数据 `shang_borrow_verify` */
 INSERT INTO `shang_borrow_verify` VALUES ('5','140','1510544219','同意','0','0','','2','0');/* DBReback Separation */
 /* 插入数据 `shang_borrow_verify` */
 INSERT INTO `shang_borrow_verify` VALUES ('7','140','1510547400','通过','0','0','','2','0');/* DBReback Separation */ 
 /* 数据表结构 `shang_coupon_interest_config`*/ 
 DROP TABLE IF EXISTS `shang_coupon_interest_config`;/* DBReback Separation */ 
 CREATE TABLE `shang_coupon_interest_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '加息券名称',
  `type` tinyint(2) NOT NULL DEFAULT '11' COMMENT '加息券类型，1注册领取，2登录领取，3推广领取，4投资领取，11管理员下发',
  `min_money` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '可使用该投标金的最低金额',
  `rate` int(3) NOT NULL DEFAULT '0' COMMENT '加息利率，千分位',
  `day` mediumint(4) NOT NULL DEFAULT '1' COMMENT '加息券有效天数，不能填0，必须有值。运营不存在长久可用的加息券',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '加息券状态',
  `online_time` int(10) NOT NULL DEFAULT '0' COMMENT '加息券发放，开始时间',
  `deadline` int(10) NOT NULL DEFAULT '0' COMMENT '加息券发放，截止时间',
  `duration_from` tinyint(3) NOT NULL DEFAULT '0' COMMENT '可用加息券的标的最小期限',
  `duration_to` tinyint(3) NOT NULL DEFAULT '0' COMMENT '可用加息券的标的最大期限，0不限',
  `can_day` tinyint(1) NOT NULL DEFAULT '0' COMMENT '天标是否可用，1可用于天标，0不可',
  `conditions` text CHARACTER SET utf8 COMMENT '额外条件',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `admin_uname` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '管理员名',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '下发领取次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_coupon_interest_list`*/ 
 DROP TABLE IF EXISTS `shang_coupon_interest_list`;/* DBReback Separation */ 
 CREATE TABLE `shang_coupon_interest_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `c_id` int(11) NOT NULL COMMENT '加息券id号',
  `title` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '加息券标题',
  `rate` int(3) NOT NULL DEFAULT '0' COMMENT '加息利率',
  `min_money` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '可用最小投资金额',
  `duration_from` tinyint(3) NOT NULL,
  `duration_to` tinyint(3) NOT NULL,
  `add_time` int(10) NOT NULL,
  `deadline` int(10) NOT NULL COMMENT '过期时间',
  `can_day` tinyint(1) NOT NULL DEFAULT '0' COMMENT '天标是否可用',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态 0可用，1已用锁定，10已用确认（复审通过）20过期',
  `borrow_id` int(11) NOT NULL DEFAULT '0' COMMENT '投标的标id',
  `invest_id` int(11) NOT NULL DEFAULT '0' COMMENT '投资id号',
  `remark` varchar(300) CHARACTER SET utf8 NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_coupon_interest_log`*/ 
 DROP TABLE IF EXISTS `shang_coupon_interest_log`;/* DBReback Separation */ 
 CREATE TABLE `shang_coupon_interest_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `add_time` int(10) NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_friend`*/ 
 DROP TABLE IF EXISTS `shang_friend`;/* DBReback Separation */ 
 CREATE TABLE `shang_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_txt` varchar(50) NOT NULL,
  `link_href` varchar(500) NOT NULL,
  `link_img` varchar(100) NOT NULL DEFAULT ' ',
  `link_order` int(1) NOT NULL DEFAULT '0',
  `link_type` int(1) NOT NULL DEFAULT '0',
  `is_show` int(1) NOT NULL DEFAULT '1',
  `game_id` int(11) NOT NULL DEFAULT '0',
  `game_name` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `game_id` (`game_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_friend` */
 INSERT INTO `shang_friend` VALUES ('1','通联支付','http://www.allinpay.com/','Static/Uploads/Friends/20171024211421488.jpg','0','1','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_friend` */
 INSERT INTO `shang_friend` VALUES ('2','工商银行','http://www.icbc.com.cn/icbc/','Static/Uploads/Friends/20171024211445796.jpg','0','1','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_friend` */
 INSERT INTO `shang_friend` VALUES ('3','农业银行','http://www.icbc.com.cn/icbc/','Static/Uploads/Friends/20171024211502630.jpg','0','1','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_friend` */
 INSERT INTO `shang_friend` VALUES ('4','中国银行','http://www.boc.cn/','Static/Uploads/Friends/20171024211519696.jpg','0','1','1','0','');/* DBReback Separation */
 /* 插入数据 `shang_friend` */
 INSERT INTO `shang_friend` VALUES ('5','中国建设银行','http://www.ccb.com/cn/home/indexv3.html','Static/Uploads/Friends/20171024211539922.jpg','0','1','1','0','');/* DBReback Separation */ 
 /* 数据表结构 `shang_global`*/ 
 DROP TABLE IF EXISTS `shang_global`;/* DBReback Separation */ 
 CREATE TABLE `shang_global` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `text` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT ' ',
  `tip` varchar(200) NOT NULL DEFAULT ' ',
  `order_sn` int(11) NOT NULL DEFAULT '0',
  `code` varchar(20) NOT NULL DEFAULT ' ',
  `is_sys` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isyc` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('20','textarea','润泽在线 P2P 互联网金融 网络借贷 现金贷 理财高手 互联网保险 车贷 抵押贷 信用贷 青岛金融 润泽E贷','网站关键词','在首页的keywords中显示','118','web_keywords','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('21','textarea','润泽在线(www.runze360.com)是青岛润泽顺融商务咨询服务有限公司运营的一家高科技互联网金融信息服务平台，总部位于青岛西海岸新区。公司引入国外先进的信用管理理念，结合中国的社会信用状况，为平台两端的客户提供包括信用咨询、评估、信贷方案制定、协议管理、回款管理等多方面专业的全程信用管理和财富管理，旨在为有投资及融资需求的个人和小微企业主，搭建高效、安全、透明的互联网金通信息桥梁。','网站描述','在网站首页的描述中显示','117','web_descript','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('103','input','0',' 是否开启手动手机验证',' 0代表不开启，则由系统自动向会员发送手机验证码；1代表开启，表示由管理员在后台手动审核会员的手机验证','0','is_manual','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('102','input','23:59:59',' 流转标自动还款时钟设置','23:59:59 表示该流转标将会在还款当天的23:59:59由系统自动执行还款操作，填写请遵循hh:mm:ss格式','0','auto_back_time ','1','0');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('19','input','润泽在线','网站名称','出现在每个页面的title后面','120','web_name','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('27','input','润泽在线-让您的财富节节高','网站标题','首页标题','119','index_title','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('56','textarea','鲁ICP备17046329号-1<br/>
青岛润泽顺融商务咨询服务有限公司<br/>
© 2017 p2p网贷交易平台 All rights reserved<br/>
地址：山东省青岛市黄岛区双珠路58号

','网站底部','网站底部的版权和联系信息','116','bottom','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('71','input','10','VIP费用','VIP费用(每年)','115','fee_vip','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('72','input','1|3','逾期罚息','逾期后罚息的计算,(3|8)表示逾期3天开始算罚息,每天千分之8','115','fee_expired','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('73','input','1|0.3','催收费','逾期以后的催收费,(30|2)表示逾期30天以后开始算每天千分之2的催收费','115','fee_call','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('95','input','5000-19999|1|20000-49999|2|50000|3',' 线下充值奖励',' 填入5000-10000|1|10001-30000|1.5|30001|2 表示，线下充值金额在5000至10000以内的奖励千分之1，在10000至30000以内的奖励千分之1.5，大于30000时奖励千分之2','0','offline_reward','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('64','input','20-2|20-2|20-10000000','提现手续费','以10-50|0-0|3-30的形式填入，数字从左到右依次表示超出回款资金总额的每笔收取总额的千分之10作为手续费,最大手续费上限50元;提现在回款总金额内的每笔收费千分之0元，手续费上限0元;单日单笔提现上限3万,单日提现资金上限30万;如果填写形式为10|5-50,表示体现手续费为10元,单笔体现限额为5万,单日提现资金上限50万;','115','fee_tqtx','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('66','input','0|25','利率限制','以10|24的形式填入，表示年化利率最小10%,最大24%','114','rate_lixi','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('69','input','10','投资者利息管理费','10表示收取投资者所赚利息的10%','115','fee_invest_manage','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('70','input','1|44','天标借款期限','以1|24的形式填入，以天为单位，表示按天借款时最少借款时间为1天，最多24天','114','borrow_duration_day','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('67','input','1|24','借款期限','以1|24的形式填入，以月为单位，表示最小借款时间为1个月，最大24个月','114','borrow_duration','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('74','input','0','借款保证金','借款者借款成功后冻结的保证金,填10表示借款总金额的10%','115','money_deposit','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('77','input','0','实名认证费用','','115','fee_idcard','0','0');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('78','input','10','VIP默认额度','','115','limit_vip','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('79','input','0.1|1|0.2|4','借款者管理费','以0.1|1|0.2|4的形式填入，表示按天时每天收取借款总额0.1%的管理费，按月时在借款期限小于等于4个月时收取借款总额1%的管理费，借款期限大于4个月时(收获取借款总额1%的管理费+超过4个月的时间里每月收取借款总额0.2%的管理费)','115','fee_borrow_manage','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('90','input','1','客服提成','客服提成比例,填2表示千分之二','0','customer_rate','0','0');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('92','input','1','给投资人的积分','表示每1000元借出1天加1个投资积分，投标积分计算公式为：投资金额*天数/1000=投资积分，例如：投资天标1万，积分10000*1/1000=10分，一月标2万，积分20000*30/1000=600分。','113','invest_integral','0','0');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('93','input','0','邀请下线奖励','填入整数，如2表示千分之二,即你所邀请的下线每投标成功一次，您可获得千分之二的奖励','0','award_invest','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('96','input','23:59:59',' 到期还款时钟设置',' 23:59:59 表示借款人必须在还款到期当天的23:59:59之前进行还款，否则该标变为逾期。填写请遵照hh:mm:ss格式','0','back_time','0','0');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('97','input','1',' 银行卡修改开关',' 1表示可以修改，0表示不可以修改','0','edit_bank','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('98','input','0|0|0',' 回款投标自动奖励',' 以1|1.5|2的形式填入，表示回款续投一月标奖励1‰回款续投二月标奖励1.5‰ 回款续投三月标及以上奖励2‰，如果投标金额大于回款资金池金额，有效续投奖励以回款金额资金池总额为标准，否则以投标金额为准','114','today_reward','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('57','input','runze',' 后台登陆code',' 可修改后台登陆路径,格式为任意字母组合。例如：如填写xxx，访问路径即为：【http://www.您的域名.com/admin?code=xxx 】                      ','116','admin_url','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('104','input','1','债权转让手续费','转让价格的百分比，比如15（15%），不能为负数。0表示不收取手续费','115','debt_fee','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('105','input','1','债权转让是否审核','是否开启后台审核 1审核；0不审核','114','debt_audit','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('106','input','30',' 抽奖消耗积分','每抽奖一次所要消耗的积分','113','lottery_cost','0','0');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('112','input','40',' 自动投标可投比率',' 10表示允许会员自动投标时可投的最高上限为借款标金额的10%','114','auto_rate','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('107','input','0',' 是否开启短信发送图形验证码',' 0代表不开启，不需要输入图形验证码即可发送手机验证码；1代表开启，表示需要输入图形验证码才可发送手机验证码','0','is_phone_code','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('117','input','90','自动投标最大投资比率','10表示此标自动投资的最高上限为借款标金额的10%','0','all_auto_rate','1','1');/* DBReback Separation */
 /* 插入数据 `shang_global` */
 INSERT INTO `shang_global` VALUES ('118','input','0',' 还款周期','月标：1表示开启还款周期按照每期30天计算，0表示按照自然月计算还款期限','0','repay_cycle','1','1');/* DBReback Separation */ 
 /* 数据表结构 `shang_hetong`*/ 
 DROP TABLE IF EXISTS `shang_hetong`;/* DBReback Separation */ 
 CREATE TABLE `shang_hetong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hetong_img` varchar(500) NOT NULL,
  `thumb_hetong_img` varchar(500) NOT NULL,
  `add_time` int(11) NOT NULL,
  `deal_user` varchar(100) NOT NULL COMMENT '操作人',
  `name` varchar(100) NOT NULL COMMENT '公司名称',
  `dizhi` varchar(200) NOT NULL COMMENT '公司地址',
  `tel` varchar(50) NOT NULL COMMENT '公司电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_inner_msg`*/ 
 DROP TABLE IF EXISTS `shang_inner_msg`;/* DBReback Separation */ 
 CREATE TABLE `shang_inner_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `send_time` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('1','3','刚刚您的借款标初审通过','您发布的第1号借款标刚刚初审通过','1509518308','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('2','3','刚刚您的借款标初审通过','您发布的第2号借款标刚刚初审通过','1509520415','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('3','1','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510294760','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('4','1','您刚刚申请了提现操作','您刚刚申请了提现操作,如不是自己操作,请尽快联系客服','1510295388','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('5','4','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510370168','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('6','6','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510535971','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('7','7','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510535978','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('8','2','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510535983','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('9','5','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510537562','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('10','8','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510537605','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('11','8','刚刚您的借款标初审通过','您发布的第3号借款标刚刚初审通过','1510539378','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('12','4','您投标的第3号借款借款成功','您投标的借款成功了','1510539621','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('13','8','刚刚您的借款标复审通过','您发布的第3号借款标刚刚复审通过','1510539621','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('14','8','您对借入标还款进行了还款操作','您对借入的第3号借款进行了还款','1510539681','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('15','6','刚刚您的借款标初审通过','您发布的第4号借款标刚刚初审通过','1510540085','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('16','6','您刚刚申请了提现操作','您刚刚申请了提现操作,如不是自己操作,请尽快联系客服','1510541535','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('17','6','您的提现申请已通过','您的提现申请已通过，正在处理中','1510541575','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('18','6','刚刚您的借款标初审通过','您发布的第5号借款标刚刚初审通过','1510544219','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('19','6','刚刚您的借款标初审通过','您发布的第7号借款标刚刚初审通过','1510547400','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('20','6','您的提现申请审核未通过','您的提现申请审核未通过，处理说明：;通联返回：未开通的业务类型','1510550747','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('21','12','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510630581','0');/* DBReback Separation */
 /* 插入数据 `shang_inner_msg` */
 INSERT INTO `shang_inner_msg` VALUES ('22','13','您刚刚修改或绑定了提现的银行账户','您刚刚修改或绑定了提现的银行账户,如不是自己操作,请尽快联系客服','1510631532','0');/* DBReback Separation */ 
 /* 数据表结构 `shang_market_address`*/ 
 DROP TABLE IF EXISTS `shang_market_address`;/* DBReback Separation */ 
 CREATE TABLE `shang_market_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '收货人ID',
  `proid` int(11) NOT NULL COMMENT '产品ID',
  `province` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '省',
  `city` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '市',
  `area` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '区/街道',
  `address` varchar(300) CHARACTER SET utf8 NOT NULL COMMENT '收货详细地址',
  `remark` text CHARACTER SET utf8 NOT NULL COMMENT '备注',
  `add_ip` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '添加者IP',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `phone` bigint(11) NOT NULL,
  `uname` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '收货人姓名',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '0不默认 1默认',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_market_goods`*/ 
 DROP TABLE IF EXISTS `shang_market_goods`;/* DBReback Separation */ 
 CREATE TABLE `shang_market_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `style` varchar(200) NOT NULL,
  `img` varchar(150) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `price` int(10) NOT NULL,
  `cost` int(8) NOT NULL,
  `order_sn` int(8) NOT NULL DEFAULT '0',
  `add_time` int(12) unsigned NOT NULL,
  `is_sys` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `jianjie` text NOT NULL,
  `canshu` text NOT NULL,
  `number` int(10) NOT NULL COMMENT '物品数量',
  `category` tinyint(4) NOT NULL DEFAULT '1' COMMENT '物品类别 1：实物；2：虚拟物品',
  `amount` int(10) NOT NULL COMMENT '限购数量',
  `convert` int(10) NOT NULL COMMENT '已兑换数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_market_jifenlist`*/ 
 DROP TABLE IF EXISTS `shang_market_jifenlist`;/* DBReback Separation */ 
 CREATE TABLE `shang_market_jifenlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(10) NOT NULL DEFAULT '2' COMMENT '物品类别 1：金钱；2：积分',
  `title` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `num` int(10) DEFAULT '0' COMMENT '奖品数量',
  `last_num` int(10) NOT NULL COMMENT '剩余数量',
  `hits` int(10) DEFAULT '0' COMMENT '已中奖次',
  `rate` int(10) DEFAULT '0' COMMENT '中奖机率',
  `value` int(10) NOT NULL COMMENT '可兑换价值',
  `order_sn` int(10) NOT NULL COMMENT '排序',
  `is_sys` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否上线 0：下线；1：上线',
  `add_ip` varchar(16) NOT NULL COMMENT '添加者IP',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `b_img` varchar(200) NOT NULL COMMENT '奖品图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_market_log`*/ 
 DROP TABLE IF EXISTS `shang_market_log`;/* DBReback Separation */ 
 CREATE TABLE `shang_market_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `way` int(11) NOT NULL COMMENT '领取方式',
  `gid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `cost` int(10) unsigned NOT NULL,
  `num` tinyint(4) NOT NULL,
  `style` varchar(50) NOT NULL,
  `info` varchar(200) NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_phone` varchar(50) NOT NULL,
  `u_address` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_address`*/ 
 DROP TABLE IF EXISTS `shang_member_address`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_address` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `main_phone` varchar(20) NOT NULL,
  `secondary_phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `address_type` tinyint(4) NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL,
  `city` smallint(5) unsigned NOT NULL,
  `district` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`address_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_apply`*/ 
 DROP TABLE IF EXISTS `shang_member_apply`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_apply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `apply_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credit_money` decimal(15,2) NOT NULL,
  `deal_user` int(10) unsigned NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  `deal_info` varchar(50) NOT NULL,
  `apply_type` tinyint(3) unsigned NOT NULL,
  `apply_money` decimal(15,2) NOT NULL,
  `apply_info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_banks`*/ 
 DROP TABLE IF EXISTS `shang_member_banks`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_banks` (
  `uid` int(10) unsigned NOT NULL,
  `bank_num` varchar(80) NOT NULL,
  `bank_province` varchar(20) NOT NULL,
  `bank_city` varchar(20) NOT NULL,
  `bank_address` varchar(100) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('1','78a9ifmeOzVnvl6HO6rKdd6dqwyOXEAZ3C4vA0/cN/w1vPA3LOVy/N90xtxK1Esh','22','287','东营支行锦华分理处','CCB','1510294760','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('4','26c5aVvrR/WEFOF+7gxQ8SPb5wICerQjwcyowEjqtagr1W+IXxNPm4JBspwoLP41','22','284','胶南支行','ABC','1510370168','223.81.128.246');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('6','4820MFwQM8rofw+DswavyaKV4DYsrn7c3RBkzFLmgY/CtzGwG2un7E426Dqu31DJ','22','284','中国建设银行','CCB','1510535971','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('7','7ee8wrjfTRZM9W20uTsxFvYSm7XuXpuBmky3s7wD1QjXllJiLw4HbTCE8pi0CPdI','22','284','胶南城区支行','ABC','1510535978','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('2','79619GjUuxjhdzxrUtTVY5bN4+8D0t/x0C/xFuqwOiaz/1ZVIH4c8fYJ6aNhyUKb','22','284','泊里分理处','ABC','1510535983','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('5','40eegXpJZGDZY7D3UEv/y7Rjh4gs4sHlOO62OUmUuGCEHE18U/5pAvKVgD5WO+BK','22','284','黄岛区张家楼营业所','PSBC','1510537562','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('8','fed9rPqutknlm45lvviDQ5teRldjp0Ps2wJKjnB5AqHvO+6aYRMBGpXd5+QnMZ+q','22','284','王台支行','ABC','1510537605','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('12','00c73RPeWkWMOLIZTj/QNCqSFq3MZZ6xGKAuSFlXKXjY9O5Zf+AHn5kLqOzpNn8D','22','284','泊里分理处','ABC','1510630581','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_banks` */
 INSERT INTO `shang_member_banks` VALUES ('13','72ba2XVVpmTndgKb23NyrdksjyqA7d2N4638DLlfZHVqX79VNCiyXZno7ordl07n','22','284','董家口分理处','CCB','1510631532','27.193.174.240');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_borrow_show`*/ 
 DROP TABLE IF EXISTS `shang_member_borrow_show`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_borrow_show` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `data_url` varchar(100) NOT NULL,
  `data_name` varchar(50) NOT NULL,
  `sort` int(8) unsigned NOT NULL,
  `deal_user` varchar(50) NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_contact_info`*/ 
 DROP TABLE IF EXISTS `shang_member_contact_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_contact_info` (
  `uid` int(10) unsigned NOT NULL,
  `address` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `contact1` varchar(50) NOT NULL,
  `contact1_re` varchar(20) NOT NULL,
  `contact1_tel` varchar(50) NOT NULL,
  `contact2` varchar(50) NOT NULL,
  `contact2_re` varchar(20) NOT NULL,
  `contact2_tel` varchar(20) NOT NULL,
  `contact1_other` varchar(100) NOT NULL,
  `contact2_other` varchar(100) NOT NULL,
  `contact3` varchar(40) DEFAULT NULL,
  `contact3_re` varchar(20) DEFAULT NULL,
  `contact3_tel` varchar(100) DEFAULT NULL,
  `contact3_other` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_creditslog`*/ 
 DROP TABLE IF EXISTS `shang_member_creditslog`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_creditslog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `affect_credits` mediumint(9) NOT NULL,
  `account_credits` mediumint(9) NOT NULL,
  `info` varchar(50) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('1','1','10','100','100','手机认证通过,奖励积分100','1508832358','61.156.219.211');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('2','1','10','50','150','实名认证通过,奖励积分50','1508832610','61.156.219.211');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('3','2','10','100','100','手机认证通过,奖励积分100','1508982534','27.223.191.202');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('4','2','10','50','150','实名认证通过,奖励积分50','1508982557','27.223.191.202');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('5','3','10','100','100','手机认证通过,奖励积分100','1509517784','58.222.101.206');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('6','3','10','50','150','实名认证通过,奖励积分50','1509518068','58.222.101.206');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('7','4','10','100','100','手机认证通过,奖励积分100','1509760861','223.81.129.34');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('8','4','10','50','150','实名认证通过,奖励积分50','1509760890','223.81.129.34');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('9','5','10','100','100','手机认证通过,奖励积分100','1510535284','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('10','5','10','50','150','实名认证通过,奖励积分50','1510535311','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('11','6','10','100','100','手机认证通过,奖励积分100','1510535337','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('12','6','10','50','150','实名认证通过,奖励积分50','1510535359','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('13','7','10','100','100','手机认证通过,奖励积分100','1510535544','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('14','7','10','50','150','实名认证通过,奖励积分50','1510535575','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('15','8','10','100','100','手机认证通过,奖励积分100','1510535616','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('16','8','10','50','150','实名认证通过,奖励积分50','1510535664','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('17','9','10','100','100','手机认证通过,奖励积分100','1510628914','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('18','9','10','50','150','实名认证通过,奖励积分50','1510628947','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('19','10','10','100','100','手机认证通过,奖励积分100','1510629114','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('20','10','10','50','150','实名认证通过,奖励积分50','1510629146','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('21','11','10','100','100','手机认证通过,奖励积分100','1510629666','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('22','11','10','50','150','实名认证通过,奖励积分50','1510629692','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('23','12','10','100','100','手机认证通过,奖励积分100','1510630137','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('24','12','10','50','150','实名认证通过,奖励积分50','1510630180','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('25','13','10','100','100','手机认证通过,奖励积分100','1510631092','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_member_creditslog` */
 INSERT INTO `shang_member_creditslog` VALUES ('26','13','10','50','150','实名认证通过,奖励积分50','1510631176','27.193.174.240');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_data_info`*/ 
 DROP TABLE IF EXISTS `shang_member_data_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_data_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `data_url` varchar(100) NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `data_name` varchar(50) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `ext` varchar(10) NOT NULL,
  `deal_info` varchar(40) NOT NULL,
  `deal_credits` smallint(5) unsigned NOT NULL,
  `deal_user` int(11) NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_department_info`*/ 
 DROP TABLE IF EXISTS `shang_member_department_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_department_info` (
  `uid` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_tel` varchar(20) NOT NULL,
  `department_address` varchar(200) NOT NULL,
  `department_year` varchar(20) NOT NULL,
  `voucher_name` varchar(20) NOT NULL,
  `voucher_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_ensure_info`*/ 
 DROP TABLE IF EXISTS `shang_member_ensure_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_ensure_info` (
  `uid` int(11) NOT NULL,
  `ensuer1_name` varchar(20) NOT NULL,
  `ensuer1_re` varchar(20) NOT NULL,
  `ensuer1_tel` varchar(20) NOT NULL,
  `ensuer2_name` varchar(20) NOT NULL,
  `ensuer2_re` varchar(20) NOT NULL,
  `ensuer2_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_financial_info`*/ 
 DROP TABLE IF EXISTS `shang_member_financial_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_financial_info` (
  `uid` int(10) unsigned NOT NULL,
  `fin_monthin` varchar(20) NOT NULL,
  `fin_incomedes` varchar(2000) NOT NULL,
  `fin_monthout` varchar(20) NOT NULL,
  `fin_outdes` varchar(2000) NOT NULL,
  `fin_house` varchar(50) NOT NULL,
  `fin_housevalue` varchar(20) NOT NULL,
  `fin_car` varchar(20) NOT NULL,
  `fin_carvalue` varchar(20) NOT NULL,
  `fin_stockcompany` varchar(50) NOT NULL,
  `fin_stockcompanyvalue` varchar(50) NOT NULL,
  `fin_otheremark` varchar(2000) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_friend`*/ 
 DROP TABLE IF EXISTS `shang_member_friend`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_friend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `apply_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_house_info`*/ 
 DROP TABLE IF EXISTS `shang_member_house_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_house_info` (
  `uid` int(11) NOT NULL,
  `house_dizhi` varchar(200) NOT NULL,
  `house_mianji` float(10,2) NOT NULL,
  `house_nian` varchar(10) NOT NULL,
  `house_gong` varchar(20) NOT NULL,
  `house_suo1` varchar(20) NOT NULL,
  `house_suo2` varchar(20) NOT NULL,
  `house_feng1` float(10,2) NOT NULL,
  `house_feng2` float(10,2) NOT NULL,
  `house_dai` int(11) NOT NULL,
  `house_yuegong` float(10,2) NOT NULL,
  `house_shangxian` float(10,2) NOT NULL,
  `house_anjiebank` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_info`*/ 
 DROP TABLE IF EXISTS `shang_member_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_info` (
  `uid` int(10) unsigned NOT NULL,
  `sex` varchar(20) NOT NULL,
  `zy` varchar(40) NOT NULL,
  `cell_phone` varchar(11) NOT NULL,
  `info` varchar(500) NOT NULL,
  `marry` varchar(20) NOT NULL,
  `education` varchar(50) NOT NULL,
  `income` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `idcard` varchar(20) NOT NULL,
  `card_img` varchar(200) NOT NULL,
  `real_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `province` int(11) NOT NULL,
  `province_now` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `city_now` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `area_now` int(11) NOT NULL,
  `up_time` int(10) unsigned NOT NULL,
  `card_back_img` varchar(200) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('1','','','15166272750','','','','','0','370302199103232933','','刘克涛','','0','0','0','0','0','0','1508832610','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('2','','','18663990931','','','','','0','370284198205162723','','魏蕾蕾','','0','0','0','0','0','0','1508982556','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('3','','','13001702111','','','','','0','37012619940220043X','','张泽奇','','0','0','0','0','0','0','1509518067','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('4','','','13606488437','','','','','0','37022319660404241X','','刘洪森','','0','0','0','0','0','0','1509760889','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('5','','','13791946920','','','','','0','370782197709187641','','王金叶','','0','0','0','0','0','0','1510535311','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('6','女','行政主管','13789840878','啊 ','已婚','大专或本科','5000-10000','32','370281199304157028','','庄丽','山东青岛','34','21','396','281','3383','2324','1510535438','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('7','','','13395423072','','','','','0','370982197902053865','','邱雯','','0','0','0','0','0','0','1510535613','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('8','','','18678431566','','','','','0','37028419791205601X','','张则斗','','0','0','0','0','0','0','1510535669','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('9','','','15908922628','','','','','0','370223197002193127','','王沛英','','0','0','0','0','0','0','1510628946','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('10','','','13792819159','','','','','0','370223196501073125','','赵消然','','0','0','0','0','0','0','1510629145','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('11','','','15964220972','','','','','0','370223196908222743','','闫金玲','','0','0','0','0','0','0','1510629692','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('12','','','13475865956','','','','','0','370223196812062730','','张云荣','','0','0','0','0','0','0','1510630180','');/* DBReback Separation */
 /* 插入数据 `shang_member_info` */
 INSERT INTO `shang_member_info` VALUES ('13','','','13455269306','','','','','0','370223196409022712','','程明伟','','0','0','0','0','0','0','1510631175','');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_integral_log`*/ 
 DROP TABLE IF EXISTS `shang_member_integral_log`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_integral_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `affect_integral` int(11) NOT NULL,
  `active_integral` bigint(20) NOT NULL,
  `integral` bigint(20) NOT NULL,
  `info` varchar(50) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_limit_log`*/ 
 DROP TABLE IF EXISTS `shang_member_limit_log`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_limit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `credit_limit` float(15,2) NOT NULL,
  `borrow_vouch_limit` float(15,2) NOT NULL,
  `invest_vouch_limit` float(15,2) NOT NULL,
  `info` varchar(50) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_login`*/ 
 DROP TABLE IF EXISTS `shang_member_login`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('1','1','61.156.219.211','1508832619');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('2','2','27.223.191.202','1508982570');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('3','2','39.88.17.110','1509086422');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('4','2','39.88.17.110','1509090614');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('5','3','58.222.101.206','1509518082');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('6','3','58.222.101.206','1509519897');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('7','4','223.81.129.34','1509760906');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('8','4','223.81.130.233','1509956603');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('9','4','223.81.131.104','1510019903');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('10','4','223.81.131.104','1510020432');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('11','4','223.81.128.162','1510100238');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('12','2','27.210.70.11','1510102592');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('13','4','223.81.128.246','1510273439');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('14','1','58.57.136.19','1510294641');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('15','4','223.81.128.246','1510364045');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('16','4','223.81.128.246','1510364656');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('17','4','223.81.128.246','1510366208');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('18','4','223.81.128.246','1510369750');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('19','1','27.202.249.110','1510397406');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('20','4','223.81.130.186','1510400213');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('21','4','223.81.129.60','1510446856');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('22','1','27.202.249.110','1510452539');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('23','2','113.120.84.78','1510452792');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('24','4','117.136.78.31','1510455626');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('25','2','27.223.243.65','1510535276');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('26','4','27.223.243.65','1510535328');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('27','5','27.223.243.65','1510535361');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('28','4','27.223.243.65','1510536370');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('29','7','27.223.243.65','1510537278');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('30','4','27.223.243.65','1510537776');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('31','4','27.223.243.65','1510537811');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('32','5','27.223.243.65','1510538222');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('33','8','27.223.243.65','1510539144');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('34','4','27.223.243.65','1510539483');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('35','6','27.223.243.65','1510539823');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('36','6','27.223.243.65','1510541417');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('37','6','27.223.243.65','1510543617');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('38','5','27.223.243.65','1510544910');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('39','6','27.223.243.65','1510547074');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('40','4','27.223.243.65','1510547346');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('41','6','27.223.243.65','1510547870');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('42','4','27.223.243.65','1510551131');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('43','2','27.223.243.65','1510551321');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('44','6','223.81.131.102','1510557197');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('45','2','27.223.191.125','1510559096');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('46','2','27.223.191.125','1510560334');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('47','6','223.81.131.175','1510560437');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('48','4','223.81.128.177','1510560506');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('49','1','58.57.136.19','1510561386');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('50','2','27.223.191.125','1510562528');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('51','4','223.81.130.191','1510572861');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('52','4','223.81.130.191','1510573121');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('53','5','119.166.107.13','1510619823');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('54','6','223.81.131.45','1510623290');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('55','5','119.166.107.13','1510626834');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('56','5','119.166.107.13','1510627427');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('57','6','223.81.131.45','1510627677');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('58','9','27.193.174.240','1510628959');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('59','10','27.193.174.240','1510629157');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('60','11','27.193.174.240','1510629730');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('61','9','27.193.174.240','1510629889');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('62','12','27.193.174.240','1510630192');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('63','11','27.193.174.240','1510630751');/* DBReback Separation */
 /* 插入数据 `shang_member_login` */
 INSERT INTO `shang_member_login` VALUES ('64','13','27.193.174.240','1510631190');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_money`*/ 
 DROP TABLE IF EXISTS `shang_member_money`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_money` (
  `uid` int(10) unsigned NOT NULL,
  `money_freeze` decimal(15,2) NOT NULL COMMENT '冻结金额',
  `money_collect` decimal(15,2) NOT NULL COMMENT '待收金额',
  `account_money` decimal(15,2) NOT NULL COMMENT '充值资金存放池_可用余额',
  `back_money` decimal(15,2) NOT NULL COMMENT '回款资金存放池_可用余额',
  `credit_limit` decimal(15,2) NOT NULL,
  `credit_cuse` decimal(15,2) NOT NULL,
  `borrow_vouch_limit` decimal(15,2) NOT NULL,
  `borrow_vouch_cuse` decimal(15,2) NOT NULL,
  `invest_vouch_limit` decimal(15,2) NOT NULL,
  `invest_vouch_cuse` decimal(15,2) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('1','0.00','0.00','0.02','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('2','0.00','0.00','20000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('3','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('4','0.00','309375.00','100.00','1687.50','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('5','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('6','0.00','0.00','100.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('7','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('8','30000.00','0.00','263925.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('9','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('10','0.00','0.00','100000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('11','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('12','0.00','0.00','20000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money` */
 INSERT INTO `shang_member_money` VALUES ('13','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_money_detail`*/ 
 DROP TABLE IF EXISTS `shang_member_money_detail`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_money_detail` (
  `uid` int(11) unsigned NOT NULL,
  `net_interest` decimal(15,2) DEFAULT '0.00' COMMENT '待收利息',
  `paid_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累计还款利息',
  `vip_fee` decimal(15,2) DEFAULT '0.00' COMMENT '支付会员认证费',
  `borrow_fee` decimal(15,2) DEFAULT '0.00' COMMENT '借款管理费',
  `overdue` decimal(15,2) DEFAULT '0.00' COMMENT '逾期费用',
  `call_fee` decimal(15,2) DEFAULT '0.00' COMMENT '催收费',
  `charge` decimal(15,2) DEFAULT '0.00' COMMENT '累计充值',
  `charge_fee` decimal(15,2) DEFAULT '0.00' COMMENT '累计充值手续费',
  `withdraw_freeze` decimal(15,2) DEFAULT '0.00' COMMENT '累计提现冻结',
  `withdraw` decimal(15,2) DEFAULT '0.00' COMMENT '累计提现',
  `withdraw_fee` decimal(15,2) DEFAULT '0.00' COMMENT '累计提现手续费',
  `capital` decimal(15,2) DEFAULT '0.00' COMMENT '累计投资',
  `invest_reward_in` decimal(15,2) DEFAULT '0.00' COMMENT '投标奖励',
  `invest_reward_out` decimal(15,2) DEFAULT '0.00' COMMENT '累计支付投标奖励',
  `offer_spread_reward` decimal(15,2) DEFAULT '0.00' COMMENT '累计贡献推广奖励',
  `spread_reward` decimal(15,2) DEFAULT '0.00' COMMENT '累计推广奖励',
  `offline_reward` decimal(15,2) DEFAULT '0.00' COMMENT '线下充值奖励',
  `re_invest_reward` decimal(15,2) DEFAULT '0.00' COMMENT '累计续投奖励',
  `admin_options` decimal(15,2) DEFAULT '0.00' COMMENT '管理员操作资金',
  `borrow` decimal(15,2) DEFAULT '0.00' COMMENT '累计借款',
  `suc_capital` decimal(15,2) DEFAULT '0.00' COMMENT '成功投资金额',
  `suc_capital_num` int(10) DEFAULT '0' COMMENT '成功投资笔数',
  `borrow_freeze` decimal(15,2) DEFAULT '0.00' COMMENT '冻结保证金',
  `borrow_unfreeze` decimal(15,2) DEFAULT '0.00' COMMENT '解冻保证金',
  `borrow_service_fee` decimal(15,2) DEFAULT '0.00' COMMENT '累计借款服务费',
  `repayment_money` decimal(15,2) DEFAULT '0.00' COMMENT '累计还款本金',
  `receive_capital` decimal(15,2) DEFAULT '0.00' COMMENT '累计还款入帐本金',
  `receive_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累计收到的利息',
  `refuse_capital` decimal(15,2) DEFAULT '0.00' COMMENT '投标失败退回',
  `interest_fee` decimal(15,2) DEFAULT '0.00' COMMENT '累计利息管理费',
  `wait_pay_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累计需支付利息',
  `buy_debt` decimal(15,2) DEFAULT '0.00' COMMENT '累计购买债权支付金额',
  `sell_debt` decimal(15,2) DEFAULT '0.00' COMMENT '累计出售债权所得',
  `buy_debt_capital` decimal(15,2) DEFAULT '0.00' COMMENT '累计购买债券所得待收本金',
  `sell_debt_capital` decimal(15,2) DEFAULT '0.00' COMMENT '累积出售债权减少的待收本金',
  `sell_debt_fee` decimal(15,2) DEFAULT '0.00' COMMENT '债权转让手续费',
  `buy_debt_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累计购买债券所得待收利息',
  `sell_debt_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累积出售债权减少的待收利息',
  `coupon_reward` decimal(15,2) DEFAULT '0.00' COMMENT '加息券奖励',
  `privilege_reward` decimal(15,2) DEFAULT '0.00' COMMENT '特权金收益',
  `transfer_capital` decimal(15,2) DEFAULT '0.00' COMMENT '优计划投资本金',
  `transfer_num` int(10) DEFAULT '0' COMMENT '优计划投资次数',
  `transfer_borrow` decimal(15,2) DEFAULT '0.00' COMMENT '累计优计划入账',
  `transfer_interest` decimal(15,2) DEFAULT '0.00' COMMENT '优计划待收利息',
  `repay_transfer_money` decimal(15,2) DEFAULT '0.00' COMMENT '累计偿还本金',
  `repay_transfer_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累计偿还利息',
  `receive_transfer_money` decimal(15,2) DEFAULT '0.00' COMMENT '累计优计划回购本金',
  `receive_transfer_interest` decimal(15,2) DEFAULT '0.00' COMMENT '累计优计划回购利息',
  `transfer_interest_fee` decimal(15,2) DEFAULT '0.00' COMMENT '累计优计划利息管理费',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('1','0.00','0.00','0.00','0.00','0.00','0.00','100.02','0.00','100.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('2','0.00','0.00','0.00','0.00','0.00','0.00','20000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('3','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('4','11250.00','0.00','0.00','0.00','0.00','0.00','100.00','0.00','0.00','0.00','0.00','300000.00','0.00','0.00','0.00','0.00','0.00','0.00','300000.00','0.00','300000.00','1','0.00','0.00','0.00','0.00','0.00','1875.00','0.00','187.50','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('5','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('6','0.00','0.00','0.00','0.00','0.00','0.00','100.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('7','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('8','0.00','1875.00','0.00','4200.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','300000.00','0.00','0','30000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','11250.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('9','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('10','0.00','0.00','0.00','0.00','0.00','0.00','100000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('11','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('12','0.00','0.00','0.00','0.00','0.00','0.00','20000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_member_money_detail` */
 INSERT INTO `shang_member_money_detail` VALUES ('13','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_moneylog`*/ 
 DROP TABLE IF EXISTS `shang_member_moneylog`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_moneylog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `affect_money` decimal(15,2) NOT NULL COMMENT '影响金额',
  `account_money` decimal(15,2) NOT NULL COMMENT '充值资金存放池_可用余额',
  `back_money` decimal(15,2) NOT NULL COMMENT '回款资金存放池_可用余额',
  `collect_money` decimal(15,2) NOT NULL COMMENT '待收金额',
  `freeze_money` decimal(15,2) NOT NULL COMMENT '冻结金额',
  `info` varchar(50) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `target_uid` int(11) NOT NULL DEFAULT '0',
  `target_uname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('1','1','3','50.00','50.00','0.00','0.00','0.00','会员充值，充值订单号:20171110141745473129','1510294672','101.95.191.142','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('2','1','3','50.00','100.00','0.00','0.00','0.00','会员充值，充值订单号:20171110141943105985','1510294791','101.95.191.142','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('3','1','21','-100.00','0.00','0.00','0.00','100.00','提现冻结100元','1510295388','58.57.136.19','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('4','1','3','0.01','0.01','0.00','0.00','100.00','会员充值，充值订单号:20171112101608239057','1510453012','140.206.57.164','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('5','1','3','0.01','0.02','0.00','0.00','100.00','会员充值，充值订单号:20171112103205728605','1510453972','140.206.57.164','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('6','4','3','50.00','50.00','0.00','0.00','0.00','管理员手动审核充值','1510534394','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('7','6','3','100.00','100.00','0.00','0.00','0.00','会员充值，充值订单号:20171113093833715472','1510537252','140.206.57.164','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('8','4','3','50.00','100.00','0.00','0.00','0.00','会员充值，充值订单号:20171113095104789614','1510537972','140.206.57.164','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('9','4','2','300000.00','300100.00','0.00','0.00','0.00','啊','1510539524','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('10','4','8','-300000.00','100.00','0.00','0.00','300000.00','对3号标进行投标,资金冻结','1510539593','27.223.243.65','8','18678431566');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('11','8','17','300000.00','300000.00','0.00','0.00','0.00','第3号标复审通过，借款金额入账','1510539620','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('12','8','18','-4200.00','295800.00','0.00','0.00','0.00','第3号标借款成功，扣除借款管理费','1510539620','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('13','8','19','-30000.00','265800.00','0.00','0.00','30000.00','第3号标借款成功，冻结10%的保证金','1510539620','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('14','4','9','300000.00','100.00','0.00','300000.00','0.00','第3号标复审通过，冻结本金成为待收金额','1510539621','27.223.243.65','8','18678431566');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('15','4','10','11250.00','100.00','0.00','311250.00','0.00','第3号标复审通过，应收利息成为待收利息','1510539621','27.223.243.65','8','18678431566');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('16','8','12','-1875.00','263925.00','0.00','0.00','30000.00','对3号标第1期还款(利息)','1510539681','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('17','4','14','1875.00','100.00','1875.00','309375.00','0.00','收到会员对3号标第1期的还款(利息)','1510539681','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('18','4','73','-187.50','100.00','1687.50','309375.00','0.00','收到会员对3号标第1期的还款，扣除利息管理费','1510539681','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('19','6','21','-100.00','0.00','0.00','0.00','100.00','提现冻结100元','1510541535','27.223.243.65','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('20','6','24','100.00','100.00','0.00','0.00','0.00','提现未通过,返还','1510550747','58.57.136.19','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('21','2','3','20000.00','20000.00','0.00','0.00','0.00','会员充值，充值订单号:20171113165010242600','1510563083','140.206.57.164','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('22','10','3','100000.00','100000.00','0.00','0.00','0.00','会员充值，充值订单号:20171114111252390557','1510629254','140.206.57.164','0','@网站管理员@');/* DBReback Separation */
 /* 插入数据 `shang_member_moneylog` */
 INSERT INTO `shang_member_moneylog` VALUES ('23','12','3','20000.00','20000.00','0.00','0.00','0.00','会员充值，充值订单号:20171114113032227500','1510630273','140.206.57.164','0','@网站管理员@');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_msg`*/ 
 DROP TABLE IF EXISTS `shang_member_msg`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) NOT NULL,
  `from_uname` varchar(20) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `to_uname` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `msg` varchar(2000) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL,
  `to_del` tinyint(4) NOT NULL DEFAULT '0',
  `from_del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_order_detail`*/ 
 DROP TABLE IF EXISTS `shang_member_order_detail`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_order_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `back_money` decimal(15,2) DEFAULT NULL,
  `account_money` decimal(15,2) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `add_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;/* DBReback Separation */
 /* 插入数据 `shang_member_order_detail` */
 INSERT INTO `shang_member_order_detail` VALUES ('1','201711101429484567','0.00','100.00','1510295388','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_member_order_detail` */
 INSERT INTO `shang_member_order_detail` VALUES ('2','201711131019535102','0.00','300000.00','1510539593','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_member_order_detail` */
 INSERT INTO `shang_member_order_detail` VALUES ('3','201711131052157228','0.00','100.00','1510541535','27.223.243.65');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_payonline`*/ 
 DROP TABLE IF EXISTS `shang_member_payonline`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_payonline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `nid` char(32) NOT NULL,
  `money` decimal(15,2) NOT NULL,
  `fee` decimal(8,2) NOT NULL,
  `way` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `tran_id` varchar(50) NOT NULL,
  `off_bank` varchar(50) NOT NULL,
  `off_way` varchar(100) NOT NULL,
  `deal_user` varchar(40) NOT NULL,
  `deal_uid` int(11) NOT NULL,
  `payimg` varchar(1000) NOT NULL COMMENT '上传打款凭证',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`status`,`nid`,`id`),
  KEY `uid_2` (`uid`,`money`,`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('1','2','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','0','1508982849','27.223.191.202','20171026095409173644','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('2','4','976075b3791219d3cc27f486e7c52d5d','1000.00','0.00','allinpay','3','1509761193','223.81.129.34','20171104100633234870','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('3','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510020065','223.81.131.104','20171107100105949567','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('4','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510020157','223.81.131.104','20171107100237491682','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('5','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510020306','223.81.131.104','20171107100506850908','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('6','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510020457','223.81.131.104','20171107100737783002','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('7','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510100283','223.81.128.162','20171108081803216598','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('8','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510273478','223.81.128.246','20171110082438960811','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('9','4','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','3','1510273511','223.81.128.246','20171110082511117959','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('10','1','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','1','1510294665','58.57.136.19','20171110141745473129','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('11','1','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','1','1510294783','58.57.136.19','20171110141943105985','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('12','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510364104','223.81.128.246','20171111093504381274','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('13','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510364163','223.81.128.246','20171111093603727190','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('14','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510364271','223.81.128.246','20171111093751368529','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('15','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510364682','223.81.128.246','20171111094442219311','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('16','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510366228','223.81.128.246','20171111101028753906','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('17','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510370208','223.81.128.246','20171111111648296449','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('18','1','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510397419','27.202.249.110','20171111185019838046','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('19','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510400232','223.81.130.186','20171111193712193610','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('20','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','3','1510447173','223.81.129.60','20171112083933579706','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('21','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','1','1510447384','223.81.129.60','20171112084304234286','','','zerunadmin','139','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('22','1','976075b3791219d3cc27f486e7c52d5d','0.01','0.00','allinpay','0','1510452626','27.202.249.110','20171112101026804116','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('23','2','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','0','1510452825','113.120.84.78','20171112101345769182','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('24','1','976075b3791219d3cc27f486e7c52d5d','0.01','0.00','allinpay','1','1510452968','27.202.249.110','20171112101608239057','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('25','1','976075b3791219d3cc27f486e7c52d5d','0.01','0.00','allinpay','0','1510453912','27.202.249.110','20171112103152223512','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('26','1','976075b3791219d3cc27f486e7c52d5d','0.01','0.00','allinpay','1','1510453925','27.202.249.110','20171112103205728605','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('27','6','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','1','1510537113','27.223.243.65','20171113093833715472','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('28','2','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510537350','27.223.243.65','20171113094230326642','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('29','7','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510537365','27.223.243.65','20171113094245164574','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('30','5','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510537664','27.223.243.65','20171113094744551518','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('31','5','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510537860','27.223.243.65','20171113095100871206','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('32','4','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','1','1510537864','27.223.243.65','20171113095104789614','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('33','2','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510537910','27.223.243.65','20171113095150925744','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('34','5','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510538244','27.223.243.65','20171113095724576454','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('35','5','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510538520','27.223.243.65','20171113100200996761','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('36','2','976075b3791219d3cc27f486e7c52d5d','20000.00','0.00','allinpay','0','1510559138','27.223.191.125','20171113154538390993','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('37','2','976075b3791219d3cc27f486e7c52d5d','20000.00','0.00','allinpay','0','1510559249','27.223.191.125','20171113154729186495','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('38','2','976075b3791219d3cc27f486e7c52d5d','3000.00','0.00','allinpay','0','1510559670','27.223.191.125','20171113155430737175','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('39','2','976075b3791219d3cc27f486e7c52d5d','1000.00','0.00','allinpay','0','1510559687','27.223.191.125','20171113155447457061','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('40','2','976075b3791219d3cc27f486e7c52d5d','200.00','0.00','allinpay','0','1510559702','27.223.191.125','20171113155502288086','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('41','2','976075b3791219d3cc27f486e7c52d5d','1000.00','0.00','allinpay','0','1510560389','27.223.191.125','20171113160629741277','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('42','2','976075b3791219d3cc27f486e7c52d5d','1000.00','0.00','allinpay','0','1510560401','27.223.191.125','20171113160641367104','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('43','2','976075b3791219d3cc27f486e7c52d5d','1000.00','0.00','allinpay','0','1510560447','27.223.191.125','20171113160727292442','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('44','4','976075b3791219d3cc27f486e7c52d5d','30000.00','0.00','allinpay','0','1510560541','223.81.128.177','20171113160901688805','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('45','6','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510560548','223.81.131.175','20171113160908320134','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('46','1','976075b3791219d3cc27f486e7c52d5d','0.01','0.00','allinpay','0','1510561728','58.57.136.19','20171113162848492217','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('47','2','976075b3791219d3cc27f486e7c52d5d','100.00','0.00','allinpay','0','1510562582','27.223.191.125','20171113164302850001','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('48','2','976075b3791219d3cc27f486e7c52d5d','20000.00','0.00','allinpay','1','1510563010','27.223.191.125','20171113165010242600','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('49','4','976075b3791219d3cc27f486e7c52d5d','30000.00','0.00','allinpay','0','1510573144','223.81.130.191','20171113193904779940','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('50','5','976075b3791219d3cc27f486e7c52d5d','50.00','0.00','allinpay','0','1510619890','119.166.107.13','20171114083810278413','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('51','10','976075b3791219d3cc27f486e7c52d5d','100000.00','0.00','allinpay','1','1510629172','27.193.174.240','20171114111252390557','','','','0','');/* DBReback Separation */
 /* 插入数据 `shang_member_payonline` */
 INSERT INTO `shang_member_payonline` VALUES ('52','12','976075b3791219d3cc27f486e7c52d5d','20000.00','0.00','allinpay','1','1510630232','27.193.174.240','20171114113032227500','','','','0','');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_remark`*/ 
 DROP TABLE IF EXISTS `shang_member_remark`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_remark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_real_name` varchar(50) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_safequestion`*/ 
 DROP TABLE IF EXISTS `shang_member_safequestion`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_safequestion` (
  `uid` int(10) unsigned NOT NULL,
  `question1` varchar(100) NOT NULL,
  `answer1` varchar(100) NOT NULL,
  `question2` varchar(100) NOT NULL,
  `answer2` varchar(100) NOT NULL,
  `add_time` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_member_spread`*/ 
 DROP TABLE IF EXISTS `shang_member_spread`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_spread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `rid` int(11) NOT NULL COMMENT '推荐人用户id',
  `suc_capital` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计推荐投资总额',
  `suc_num` int(10) NOT NULL DEFAULT '0' COMMENT '累计推荐投资次数',
  `reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计推广总奖励',
  `update` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;/* DBReback Separation */
 /* 插入数据 `shang_member_spread` */
 INSERT INTO `shang_member_spread` VALUES ('1','1','4','0.00','0','0.00','1510541027');/* DBReback Separation */
 /* 插入数据 `shang_member_spread` */
 INSERT INTO `shang_member_spread` VALUES ('2','10','9','0.00','0','0.00','1510629114');/* DBReback Separation */
 /* 插入数据 `shang_member_spread` */
 INSERT INTO `shang_member_spread` VALUES ('3','12','11','0.00','0','0.00','1510630137');/* DBReback Separation */ 
 /* 数据表结构 `shang_member_withdraw`*/ 
 DROP TABLE IF EXISTS `shang_member_withdraw`;/* DBReback Separation */ 
 CREATE TABLE `shang_member_withdraw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `withdraw_money` decimal(15,2) NOT NULL,
  `withdraw_status` tinyint(4) NOT NULL,
  `withdraw_fee` decimal(15,2) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  `deal_user` varchar(50) NOT NULL,
  `deal_info` varchar(200) NOT NULL,
  `second_fee` decimal(15,2) NOT NULL COMMENT '修改后的提现手续费',
  `success_money` decimal(15,2) NOT NULL COMMENT '实际到账金额',
  `order` varchar(50) NOT NULL COMMENT '订单号',
  `withdraw_bankNo` varchar(100) NOT NULL DEFAULT '0' COMMENT '提现时的银行卡号',
  `reqNo` varchar(50) DEFAULT NULL COMMENT '通联order',
  `reqJson` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`withdraw_status`,`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_member_withdraw` */
 INSERT INTO `shang_member_withdraw` VALUES ('1','1','100.00','3','10.00','1510295388','58.57.136.19','1510550747','zerunadmin',';通联返回：未开通的业务类型','10.00','0.00','201711101429484567','78a9ifmeOzVnvl6HO6rKdd6dqwyOXEAZ3C4vA0/cN/w1vPA3LOVy/N90xtxK1Esh','2006040000004450220171112094339000001','{\"INFO\":{\"TRX_CODE\":\"100014\",\"VERSION\":\"03\",\"DATA_TYPE\":\"2\",\"LEVEL\":\"6\",\"USER_NAME\":\"20060400000044502\",\"USER_PASS\":\"111111\",\"REQ_SN\":\"2006040000004450220171112094339000001\"},\"TRANS\":{\"BUSINESS_CODE\":\"09400\",\"MERCHANT_ID\":\"200604000000445\",\"SUBMIT_TIME\":\"20171112094339\",\"ACCOUNT_NO\":\"6217002180002807313\",\"ACCOUNT_NAME\":\"\\u5218\\u514b\\u6d9b\",\"ACCOUNT_PROP\":0,\"AMOUNT\":9000,\"CURRENCY\":\"CNY\",\"ID_TYPE\":\"0\"}}');/* DBReback Separation */
 /* 插入数据 `shang_member_withdraw` */
 INSERT INTO `shang_member_withdraw` VALUES ('2','6','100.00','3','2.00','1510541535','27.223.243.65','1510550747','zerunadmin',';通联返回：未开通的业务类型','2.00','0.00','201711131052157228','4820MFwQM8rofw+DswavyaKV4DYsrn7c3RBkzFLmgY/CtzGwG2un7E426Dqu31DJ','2004520000158130420171113105255000002','{\"INFO\":{\"TRX_CODE\":\"100014\",\"VERSION\":\"03\",\"DATA_TYPE\":\"2\",\"LEVEL\":\"6\",\"USER_NAME\":\"20045200001581304\",\"USER_PASS\":\"111111\",\"REQ_SN\":\"2004520000158130420171113105255000002\"},\"TRANS\":{\"BUSINESS_CODE\":\"09400\",\"MERCHANT_ID\":\"200452000015813\",\"SUBMIT_TIME\":\"20171113105255\",\"ACCOUNT_NO\":\"6236682390001873334\",\"ACCOUNT_NAME\":\"\\u5e84\\u4e3d\",\"ACCOUNT_PROP\":0,\"AMOUNT\":9800,\"CURRENCY\":\"CNY\",\"ID_TYPE\":\"0\"}}');/* DBReback Separation */ 
 /* 数据表结构 `shang_members`*/ 
 DROP TABLE IF EXISTS `shang_members`;/* DBReback Separation */ 
 CREATE TABLE `shang_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` char(32) NOT NULL,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `pin_pass` char(32) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(11) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `user_leve` tinyint(4) NOT NULL DEFAULT '0',
  `time_limit` int(10) unsigned NOT NULL,
  `credits` int(10) NOT NULL,
  `recommend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `is_ban` int(11) NOT NULL DEFAULT '0' COMMENT '是否冻结0：否； 1：是',
  `integral` bigint(20) NOT NULL COMMENT '会员总积分',
  `active_integral` bigint(20) NOT NULL COMMENT '会员可用积分',
  `is_borrow` int(2) NOT NULL DEFAULT '1' COMMENT '是否允许会员发标。0：不允许；1：允许',
  `is_transfer` int(2) NOT NULL DEFAULT '0' COMMENT '是否是流转会员 0代表非流转会员，1代表是流转会员',
  `is_vip` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否开启特权发标，0：不开启；1：开启',
  `last_log_ip` char(15) NOT NULL,
  `last_log_time` int(10) NOT NULL DEFAULT '0',
  `recommend_time` int(10) DEFAULT '0',
  `update_sign` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email` (`user_email`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('1','15166272750','bfda02c0a15fc88b2415076e6aeb1c6a','1','670b14728ad9902aecba32e22fa4f6bd','','15166272750','1508832358','61.156.219.211','0','0','150','0','0','','0','0','0','1','0','0','58.57.136.19','1510561386','0','15105613862076');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('2','18663990931','97f5698a23f67c405ce374d84571b582','1','97f5698a23f67c405ce374d84571b582','','18663990931','1508982534','27.223.191.202','0','0','150','0','0','','0','0','0','1','0','0','27.223.191.125','1510562528','0','15105630836403');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('3','13001702111','4eff7c5c50db1c225df83f35896b6f5a','1','a61a5c5518e1b3ffa363f655c6873fec','','13001702111','1509517784','58.222.101.206','0','0','150','0','0','','0','0','0','1','0','0','58.222.101.206','1509519897','0','15105348833148');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('4','13606488437','34b68d91e8b0acf62f0e5a6747f95967','1','c33367701511b4f6020ec61ded352059','','13606488437','1509760861','223.81.129.34','0','0','150','0','0','','0','0','0','1','0','0','223.81.130.191','1510573121','0','15105731213937');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('5','13791946920','9d4ac868250883a45c72d8786ee838ef','1','9d4ac868250883a45c72d8786ee838ef','','13791946920','1510535284','27.223.243.65','0','0','150','0','0','','0','0','0','1','0','1','119.166.107.13','1510627427','0','15106274274411');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('6','13789840878','43b0df2647436053688e23ffcf0913d1','1','dab779a8e2554deeae022d42b5b7df97','','13789840878','1510535337','27.223.243.65','0','0','150','0','0','','0','0','0','1','0','1','223.81.131.45','1510627677','0','15106276777195');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('7','13395423072','3dacd73b6b58e90227d3fa276eedb51e','1','c15f0a4f437ca35de433ee19ecf60353','','13395423072','1510535544','27.223.243.65','0','0','150','0','0','','0','0','0','1','0','0','27.223.243.65','1510537278','0','15105372782317');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('8','18678431566','caf13895138087fc58759e8a43564358','1','3dacd73b6b58e90227d3fa276eedb51e','','18678431566','1510535616','27.223.243.65','0','0','150','0','0','','0','0','0','1','0','1','27.223.243.65','1510539144','0','15105396817634');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('9','15908922628','3f6558b0a0eb138a1996e3fc38932feb','1','3f6558b0a0eb138a1996e3fc38932feb','','15908922628','1510628914','27.193.174.240','0','0','150','0','0','','0','0','0','1','0','0','27.193.174.240','1510629889','0','15106298899567');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('10','13792819159','97f5698a23f67c405ce374d84571b582','1','97f5698a23f67c405ce374d84571b582','','13792819159','1510629114','27.193.174.240','0','0','150','9','0','','0','0','0','1','0','0','27.193.174.240','1510629157','1510629114','15106292547257');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('11','15964220972','97f5698a23f67c405ce374d84571b582','1','97f5698a23f67c405ce374d84571b582','','15964220972','1510629666','27.193.174.240','0','0','150','0','0','','0','0','0','1','0','0','27.193.174.240','1510630751','0','15106307518542');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('12','13475865956','97f5698a23f67c405ce374d84571b582','1','97f5698a23f67c405ce374d84571b582','','13475865956','1510630137','27.193.174.240','0','0','150','11','0','','0','0','0','1','0','0','27.193.174.240','1510630192','1510630137','15106305813322');/* DBReback Separation */
 /* 插入数据 `shang_members` */
 INSERT INTO `shang_members` VALUES ('13','13455269306','97f5698a23f67c405ce374d84571b582','1','97f5698a23f67c405ce374d84571b582','','13455269306','1510631092','27.193.174.240','0','0','150','0','0','','0','0','0','1','0','0','27.193.174.240','1510631190','0','15106315329287');/* DBReback Separation */ 
 /* 数据表结构 `shang_members_status`*/ 
 DROP TABLE IF EXISTS `shang_members_status`;/* DBReback Separation */ 
 CREATE TABLE `shang_members_status` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `phone_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `phone_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `id_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0:未上传1:验证通过2:等待验证',
  `id_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `face_status` tinyint(4) NOT NULL DEFAULT '0',
  `face_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `email_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `account_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `account_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `credit_status` tinyint(4) NOT NULL DEFAULT '0',
  `credit_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `safequestion_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `safequestion_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `video_status` tinyint(4) NOT NULL DEFAULT '0',
  `video_credits` int(10) unsigned NOT NULL DEFAULT '0',
  `vip_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `vip_credits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('1','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('2','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('3','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('4','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('5','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('6','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('7','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('8','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('9','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('10','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('11','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('12','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */
 /* 插入数据 `shang_members_status` */
 INSERT INTO `shang_members_status` VALUES ('13','1','100','1','50','0','0','0','0','0','0','0','0','0','0','0','0','0','0');/* DBReback Separation */ 
 /* 数据表结构 `shang_name_apply`*/ 
 DROP TABLE IF EXISTS `shang_name_apply`;/* DBReback Separation */ 
 CREATE TABLE `shang_name_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `up_time` int(10) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `idcard` varchar(20) NOT NULL,
  `deal_info` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('1','1','1508832610','1','370302199103232933','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('2','2','1508982556','1','370284198205162723','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('3','3','1509518067','1','37012619940220043X','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('4','4','1509760889','1','37022319660404241X','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('5','5','1510535311','1','370782197709187641','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('6','6','1510535438','1','370281199304157028','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('7','7','1510535613','1','370982197902053865','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('8','8','1510535669','1','37028419791205601X','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('9','9','1510628946','1','370223197002193127','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('10','10','1510629145','1','370223196501073125','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('11','11','1510629692','1','370223196908222743','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('12','12','1510630180','1','370223196812062730','三方实名认证成功');/* DBReback Separation */
 /* 插入数据 `shang_name_apply` */
 INSERT INTO `shang_name_apply` VALUES ('13','13','1510631175','1','370223196409022712','三方实名认证成功');/* DBReback Separation */ 
 /* 数据表结构 `shang_navigation`*/ 
 DROP TABLE IF EXISTS `shang_navigation`;/* DBReback Separation */ 
 CREATE TABLE `shang_navigation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  `type_url` varchar(200) NOT NULL,
  `type_keyword` varchar(200) NOT NULL,
  `type_info` varchar(400) NOT NULL,
  `type_content` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  `type_set` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` smallint(6) NOT NULL,
  `type_nid` varchar(50) NOT NULL,
  `is_hiden` int(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `is_sys` tinyint(3) unsigned NOT NULL,
  `model` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('1','首页','/index.html','','','','10','2','0','indexs','0','1386156845','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('2','我要投资','/invest/index','','','','9','2','0','invests','0','1386156886','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('3','我要借款','/borrow/index','','','','8','2','0','borrows','0','1386156927','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('7','关于我们','/anenst/intro.html','','','<div><img style=\"margin:10px;width:360px;height:256px;float:right;\" alt=\"\" src=\"/UF/Uploads/Article/20131125183424.gif\" /> 　　XXX网站隶属于XXXXXX管理有限公司。XXXXXX经工商局登记注册于2013年成立，注册资本1000万。位于XXXXXXXXXXXXXXXXXXXXXXXXX。是目前XX地区最安全、最专业的网络信贷理财平台之一</div><div>XXXX顺应全球电子商务未来发展的趋势，充分挖掘互联网金融市场潜力，通过建立一个安全、高效、诚信、互惠互助的网络借贷平台，让人们有机会相互帮助实现双赢的结果，帮助投资者及创业者更好地应对目前世界金融危机影响下的经济困境。</div><div>我们深信，依赖现代网络创新技术将民间借贷引入的模式，定会在快捷、便利、透明的体系下得到更健康的发展，并实现利益最大化！</div><div>XXXXX严格遵守国家相关法律法规，并敦促其会员在信息发布和使用过程中严格遵守相关法规。同时，我们也将竭尽所能，不断完善对网站平台的管理！</div><div>让我们携起手来，愿您的财富同xxxx一起成长！</div><div>愿您的创业梦想，在盛世下飞翔！</div><div>&nbsp;</div><div><div><strong><span style=\"font-size:24px;\">P2P平台介绍</span></strong></div><div>XXXXX采用创新的技术和理念，通过互联网建立一个安全、高效、诚信的平台，规范了个人之间的借贷行为，使之更加安全、有效。让人们有机会得到帮助，以及帮助到需要的朋友，同时得到更好的回报。</div><div>现实中朋友家人之间往往由于面子等问题不方便借款以及不好意思催款。XXXXX鼓励大家通过这一平台来帮助解决这些问题。另外，如果朋友家人正好没有钱帮您，而朋友的朋友很可能有闲钱，大家通过人人聚财这个平台就可传递这种信赖关系,扩大信赖的朋友圈子，解决自己的问题。</div><div>通过下面图片可以了解XXXXX如何工作的：需要钱的人发布信息，其他人以竞标方式参与，聚合大众的力量，以市场化的方式决定利率，以及监督借款行为。</div><div style=\"text-align:center;\">&nbsp;<img style=\"margin:0px;float:none;\" alt=\"\" src=\"/UF/Uploads/Article/20131125182918.gif\" /></div><div><strong><span style=\"font-size:24px;\">平成立目的台</span></strong></div><div>为有需要帮助的人伸出援手！为有能力的人实现资产增值！让我们成为成功路上最好的伙伴！&nbsp;</div><div>&nbsp;</div><div><strong><span style=\"font-size:24px;\">愿景</span></strong></div><div>打造一个全民参与、安全、高效、诚信、互惠互利的互联网金融服务平台</div><div>&nbsp;</div></div>','4','2','0','about','0','1386157108','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('9','我的账户','/member/index','','','','2','2','0','members','1','1386157201','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('19','散标投资','/invest/index','','','','10','2','2','borrowing','0','1386212416','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('48','联系我们','/anenst/contact.html','','','','0','2','7','','0','1399189875','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('46','最新动态','/news/index.html','','','','8','2','7','','0','1399189538','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('47','招贤纳士','/anenst/invite.html','','','','7','2','7','','0','1399189583','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('45','运营团队','/anenst/team.html','','','','10','2','7','','0','1399189491','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('41','债权转让','/debt/index','','','','7','2','2','debt','0','1389583429','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('51','优选理财','/fund/index','','','','8','2','2','','1','1402711350','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('56','运营报告','/operational','','','','5','2','0','','0','1413865697','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('57','特权金','/privilege/index','','','','0','2','0','','1','1435374372','0','navigation');/* DBReback Separation */
 /* 插入数据 `shang_navigation` */
 INSERT INTO `shang_navigation` VALUES ('60','新手专区','/novice/index','','','','0','2','2','','0','1445927333','0','navigation');/* DBReback Separation */ 
 /* 数据表结构 `shang_oauth`*/ 
 DROP TABLE IF EXISTS `shang_oauth`;/* DBReback Separation */ 
 CREATE TABLE `shang_oauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_bind` tinyint(30) NOT NULL DEFAULT '0',
  `site` varchar(30) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logintimes` int(10) unsigned NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `bind_uid` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site` (`site`,`openid`),
  KEY `uname` (`is_bind`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_privilege_config`*/ 
 DROP TABLE IF EXISTS `shang_privilege_config`;/* DBReback Separation */ 
 CREATE TABLE `shang_privilege_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) CHARACTER SET utf8 NOT NULL COMMENT '特权金名称',
  `online_time` int(10) NOT NULL COMMENT '活动开始时间',
  `deadline` int(10) NOT NULL COMMENT '活动截止',
  `money` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '特权金金额',
  `rate` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '年化利率',
  `conditions` varchar(800) CHARACTER SET utf8 NOT NULL COMMENT '条件',
  `total` int(3) NOT NULL DEFAULT '1' COMMENT '收益天数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0未开始，1活动中，2活动结束',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '领取人数',
  `admin_uname` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '@管理员@',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_privilege_list`*/ 
 DROP TABLE IF EXISTS `shang_privilege_list`;/* DBReback Separation */ 
 CREATE TABLE `shang_privilege_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL COMMENT '特权金id',
  `money` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` int(10) NOT NULL COMMENT '收益总次数',
  `next_sort` int(10) NOT NULL DEFAULT '1' COMMENT '下次收益',
  `next_time` int(10) NOT NULL COMMENT '下次收益时间',
  `day_reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '每日收益',
  `total_reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '总收益',
  `has_reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '已获得的收益',
  `rate` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '年化收益',
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1发放中2发放完毕',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;/* DBReback Separation */ 
 /* 数据表结构 `shang_qq`*/ 
 DROP TABLE IF EXISTS `shang_qq`;/* DBReback Separation */ 
 CREATE TABLE `shang_qq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq_num` varchar(50) NOT NULL,
  `qq_title` varchar(100) NOT NULL,
  `qq_order` int(2) NOT NULL,
  `is_show` int(1) NOT NULL DEFAULT '1',
  `type` int(1) NOT NULL COMMENT '0：qq号；1：qq群；2：客服电话',
  `tag` int(1) DEFAULT '1' COMMENT 'qq类型，1：普通qq，2：企业qq',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_qq` */
 INSERT INTO `shang_qq` VALUES ('3','174435544','客服小润','0','1','0','1');/* DBReback Separation */ 
 /* 数据表结构 `shang_smslog`*/ 
 DROP TABLE IF EXISTS `shang_smslog`;/* DBReback Separation */ 
 CREATE TABLE `shang_smslog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `admin_real_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_today_reward`*/ 
 DROP TABLE IF EXISTS `shang_today_reward`;/* DBReback Separation */ 
 CREATE TABLE `shang_today_reward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `borrow_id` int(10) unsigned NOT NULL,
  `reward_uid` int(10) unsigned NOT NULL,
  `invest_money` decimal(15,2) unsigned NOT NULL,
  `reward_money` decimal(10,2) unsigned NOT NULL,
  `reward_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `deal_time` int(10) NOT NULL,
  `add_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_transfer_borrow_info`*/ 
 DROP TABLE IF EXISTS `shang_transfer_borrow_info`;/* DBReback Separation */ 
 CREATE TABLE `shang_transfer_borrow_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `borrow_name` varchar(50) NOT NULL,
  `borrow_uid` int(11) NOT NULL,
  `borrow_duration` tinyint(3) unsigned NOT NULL,
  `borrow_money` decimal(15,2) NOT NULL,
  `borrow_interest` decimal(15,2) NOT NULL,
  `borrow_interest_rate` decimal(5,2) NOT NULL,
  `repayment_money` decimal(15,2) NOT NULL,
  `repayment_interest` decimal(15,2) NOT NULL,
  `repayment_type` tinyint(3) unsigned NOT NULL,
  `borrow_status` tinyint(3) unsigned NOT NULL,
  `transfer_out` int(10) NOT NULL,
  `transfer_back` int(10) unsigned NOT NULL,
  `transfer_total` int(10) NOT NULL,
  `per_transfer` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  `deadline` int(10) unsigned NOT NULL,
  `add_ip` varchar(16) NOT NULL,
  `deal_user` int(10) unsigned NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  `deal_info` varchar(500) NOT NULL,
  `borrow_info` varchar(2000) NOT NULL,
  `progress` decimal(15,2) unsigned NOT NULL,
  `total` tinyint(4) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  `borrow_max` int(11) NOT NULL COMMENT '最高投标额度',
  `danbao` decimal(15,2) NOT NULL COMMENT '担保机构',
  `is_tuijian` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否设为推荐标 0表示不推荐；1表示推荐',
  `online_time` int(10) NOT NULL DEFAULT '0' COMMENT '上线时间',
  `on_off` tinyint(2) NOT NULL COMMENT '是否显示 0：显示；1：不显示',
  PRIMARY KEY (`id`),
  KEY `borrow_uid` (`borrow_uid`,`borrow_status`) USING BTREE,
  KEY `borrow_status` (`is_show`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;/* DBReback Separation */
 /* 插入数据 `shang_transfer_borrow_info` */
 INSERT INTO `shang_transfer_borrow_info` VALUES ('1','U-20171101001','3','3','1000000.00','0.00','10.00','0.00','0.00','0','2','0','0','100','10000','1509520317','1517296200','58.222.101.206','139','0','','','0.00','3','1','0','0.00','0','1509520200','1');/* DBReback Separation */ 
 /* 数据表结构 `shang_transfer_borrow_investor`*/ 
 DROP TABLE IF EXISTS `shang_transfer_borrow_investor`;/* DBReback Separation */ 
 CREATE TABLE `shang_transfer_borrow_investor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `borrow_id` int(10) unsigned NOT NULL,
  `investor_uid` int(10) unsigned NOT NULL,
  `borrow_uid` int(11) NOT NULL,
  `investor_capital` decimal(15,2) NOT NULL,
  `investor_interest` decimal(15,2) NOT NULL,
  `invest_fee` decimal(15,2) NOT NULL,
  `receive_capital` decimal(15,2) NOT NULL,
  `receive_interest` decimal(15,2) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `deadline` int(10) unsigned NOT NULL,
  `is_auto` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reward_money` decimal(15,2) NOT NULL,
  `transfer_num` int(10) unsigned NOT NULL DEFAULT '0',
  `transfer_month` int(10) unsigned NOT NULL DEFAULT '0',
  `final_interest_rate` float(5,2) NOT NULL DEFAULT '0.00',
  `repayment_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1每月还息到期还本，2利息复投',
  PRIMARY KEY (`id`),
  KEY `investor_uid` (`investor_uid`,`status`) USING BTREE,
  KEY `borrow_id` (`borrow_id`,`investor_uid`,`status`) USING BTREE,
  KEY `deadline` (`deadline`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_transfer_investor_detail`*/ 
 DROP TABLE IF EXISTS `shang_transfer_investor_detail`;/* DBReback Separation */ 
 CREATE TABLE `shang_transfer_investor_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repayment_time` int(10) unsigned NOT NULL DEFAULT '0',
  `borrow_id` int(10) unsigned NOT NULL,
  `invest_id` int(10) unsigned NOT NULL,
  `investor_uid` int(10) unsigned NOT NULL,
  `borrow_uid` int(10) unsigned NOT NULL,
  `capital` decimal(15,2) NOT NULL,
  `interest` decimal(15,2) NOT NULL,
  `interest_fee` decimal(15,2) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `receive_interest` decimal(15,2) NOT NULL,
  `receive_capital` decimal(15,2) NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `deadline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_id` (`invest_id`,`status`,`deadline`) USING BTREE,
  KEY `borrow_id` (`borrow_id`,`sort_order`,`investor_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_user_email_log`*/ 
 DROP TABLE IF EXISTS `shang_user_email_log`;/* DBReback Separation */ 
 CREATE TABLE `shang_user_email_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `send_email` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_title` varchar(250) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `msg` text,
  `addtime` varchar(32) DEFAULT NULL,
  `addip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;/* DBReback Separation */ 
 /* 数据表结构 `shang_verify`*/ 
 DROP TABLE IF EXISTS `shang_verify`;/* DBReback Separation */ 
 CREATE TABLE `shang_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `send_time` int(10) NOT NULL,
  `ukey` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT '1:邮件激活验证',
  PRIMARY KEY (`id`),
  KEY `code` (`ukey`,`type`,`send_time`,`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_vip_apply`*/ 
 DROP TABLE IF EXISTS `shang_vip_apply`;/* DBReback Separation */ 
 CREATE TABLE `shang_vip_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `kfid` int(10) unsigned NOT NULL,
  `province_now` int(10) unsigned NOT NULL,
  `city_now` int(11) NOT NULL,
  `area_now` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `deal_time` int(10) unsigned NOT NULL,
  `deal_user` int(10) unsigned NOT NULL,
  `deal_info` varchar(200) NOT NULL COMMENT '处理意见',
  `order` varchar(50) NOT NULL COMMENT 'vip申请订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;/* DBReback Separation */ 
 /* 数据表结构 `shang_website_flows`*/ 
 DROP TABLE IF EXISTS `shang_website_flows`;/* DBReback Separation */ 
 CREATE TABLE `shang_website_flows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_options` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '管理员操作可用',
  `charge` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计充值',
  `charge_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计充值手续费',
  `vip_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计vip费用',
  `borrow_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计借款管理费',
  `service_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计借款服务费',
  `withdraw` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计提现',
  `withdraw_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计提现手续费',
  `debt_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '债权转让手续费',
  `spread_reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '支出推广奖励',
  `re_invest_reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '支出续投奖励',
  `overdue` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '逾期罚息',
  `call_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '累计催收费',
  `interest_fee` decimal(15,2) NOT NULL COMMENT '利息管理费',
  `web_in` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '平台收入',
  `web_out` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '平台支出',
  `reg_num` int(11) NOT NULL DEFAULT '0' COMMENT '注册人数',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录人次，只要走登录逻辑就加1',
  `date` int(10) NOT NULL DEFAULT '0' COMMENT '当天的日期',
  `coupon_reward` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '平台支出的加息奖励',
  `privilege_reward` decimal(15,2) DEFAULT '0.00' COMMENT '支出的特权金奖励',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('1','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','1','1','20171024','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('2','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','1','1','20171026','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('3','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','2','20171027','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('4','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','1','2','20171101','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('5','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','1','1','20171104','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('6','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','1','20171106','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('7','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','2','20171107','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('8','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','2','20171108','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('9','0.00','100.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','2','20171110','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('10','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','6','20171111','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('11','0.00','0.02','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','4','20171112','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('12','-300000.00','20200.00','0.00','0.00','4200.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','187.50','4387.50','300000.00','4','31','20171113','0.00','0.00');/* DBReback Separation */
 /* 插入数据 `shang_website_flows` */
 INSERT INTO `shang_website_flows` VALUES ('13','0.00','120000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','5','12','20171114','0.00','0.00');/* DBReback Separation */ 
 /* 数据表结构 `shang_xbo_smslog`*/ 
 DROP TABLE IF EXISTS `shang_xbo_smslog`;/* DBReback Separation */ 
 CREATE TABLE `shang_xbo_smslog` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `to_user_id` mediumint(8) unsigned DEFAULT NULL,
  `to_user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_phone` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `addtime` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime_des` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `back_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `back_status_des` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('1','','','15166272750','您的验证码为347010【润泽E贷】','1508832310','2017-10-24=16-05-10','1','','61.156.219.211');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('2','','','18663990931','您的验证码为946748【润泽E贷】','1508982360','2017-10-26=09-46-00','1','','27.223.191.202');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('3','','','13001702111','您的验证码为887047【润泽E贷】','1509517736','2017-11-01=14-28-56','1','','58.222.101.206');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('4','3','13001702111','13001702111','13001702111，您发布的第1号借款已经通过初审【润泽E贷】','1509518308','2017-11-01=14-38-28','1','','58.222.101.206');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('5','3','13001702111','13001702111','13001702111，您发布的第2号借款已经通过初审【润泽E贷】','1509520415','2017-11-01=15-13-35','1','','58.222.101.206');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('6','','','13606488437','您的验证码为489586【润泽E贷】','1509757541','2017-11-04=09-05-41','1','','223.81.129.34');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('7','','','13606488437','您的验证码为340566【润泽E贷】','1509757620','2017-11-04=09-07-00','1','','223.81.129.34');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('8','','','13606488437','您的验证码为973513【润泽E贷】','1509760493','2017-11-04=09-54-53','1','','223.81.129.34');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('9','','','13791946920','您的验证码为401675【润泽E贷】','1509936978','2017-11-06=10-56-18','1','','112.225.24.155');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('10','1','15166272750','15166272750','您的验证码为416082【润泽E贷】','1510294739','2017-11-10=14-18-59','1','','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('11','4','13606488437','13606488437','您的验证码为424377【润泽E贷】','1510370136','2017-11-11=11-15-36','1','','223.81.128.246');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('12','','','13791946920','您的验证码为667613【润泽E贷】','1510535214','2017-11-13=09-06-54','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('13','','','13789840878','您的验证码为600686【润泽E贷】','1510535306','2017-11-13=09-08-26','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('14','','','13395423072','您的验证码为278410【润泽E贷】','1510535522','2017-11-13=09-12-02','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('15','','','18678431566','您的验证码为790240【润泽E贷】','1510535587','2017-11-13=09-13-07','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('16','2','18663990931','18663990931','您的验证码为417426【润泽E贷】','1510535915','2017-11-13=09-18-35','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('17','6','13789840878','13789840878','您的验证码为420077【润泽E贷】','1510535953','2017-11-13=09-19-13','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('18','5','13791946920','13791946920','您的验证码为229555【润泽E贷】','1510537328','2017-11-13=09-42-08','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('19','5','13791946920','13791946920','您的验证码为871508【润泽E贷】','1510537426','2017-11-13=09-43-46','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('20','5','13791946920','13791946920','您的验证码为289700【润泽E贷】','1510537541','2017-11-13=09-45-41','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('21','8','18678431566','18678431566','18678431566，您发布的第3号借款已经通过初审【润泽E贷】','1510539378','2017-11-13=10-16-18','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('22','4','13606488437','13606488437','13606488437，您投标的第3号借款已经通过复审,现在开始计息【润泽E贷】','1510539621','2017-11-13=10-20-21','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('23','8','18678431566','18678431566','18678431566，您发布的第3号借款已经通过复审【润泽E贷】','1510539621','2017-11-13=10-20-21','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('24','4','13606488437','13606488437','您投资的第3号标第1期的还款已到账,到账金额是0.00元【润泽E贷】','1510539681','2017-11-13=10-21-21','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('25','6','13789840878','13789840878','13789840878，您发布的第4号借款已经通过初审【润泽E贷】','1510540085','2017-11-13=10-28-05','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('26','6','13789840878','13789840878','13789840878，您发布的第5号借款已经通过初审【润泽E贷】','1510544219','2017-11-13=11-36-59','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('27','6','13789840878','13789840878','13789840878，您发布的第7号借款已经通过初审【润泽E贷】','1510547400','2017-11-13=12-30-00','1','','27.223.243.65');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('28','','','15564896329','您的验证码为997312【润泽E贷】','1510567563','2017-11-13=18-06-03','1','','144.52.41.28');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('29','','','15564896329','您的验证码为693549【润泽E贷】','1510567597','2017-11-13=18-06-37','1','','144.52.41.28');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('30','','','15564896329','您的验证码为970095【润泽E贷】','1510567620','2017-11-13=18-07-00','1','','144.52.41.28');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('31','','','15564896329','您的验证码为769480【润泽E贷】','1510567657','2017-11-13=18-07-37','1','','144.52.41.28');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('32','','','15564896329','您的验证码为689806【润泽E贷】','1510567706','2017-11-13=18-08-26','1','','144.52.41.28');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('33','','','15908922628','您的验证码为133996【润泽E贷】','1510628010','2017-11-14=10-53-30','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('34','','','15908922628','您的验证码为002042【润泽E贷】','1510628136','2017-11-14=10-55-36','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('35','','','13181972827','您的验证码为792689【润泽E贷】','1510628299','2017-11-14=10-58-19','1','','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('36','','','13181972827','您的验证码为635857【润泽E贷】','1510628487','2017-11-14=11-01-27','1','','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('37','','','13181972827','您的验证码为405834【润泽E贷】','1510628572','2017-11-14=11-02-52','1','','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('38','','','13181972827','您的验证码为081961【润泽E贷】','1510628616','2017-11-14=11-03-36','1','','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('39','','','13181972827','您的验证码为265657【润泽在线】','1510628785','2017-11-14=11-06-25','1','','58.57.136.19');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('40','','','15908922628','您的验证码为283881【润泽在线】','1510628854','2017-11-14=11-07-34','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('41','','','13792819159','您的验证码为398085【润泽在线】','1510629039','2017-11-14=11-10-39','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('42','10','13792819159','13792819159','13792819159您好，您在线充值的元已到账【润泽在线】','1510629254','2017-11-14=11-14-14','1','','140.206.57.164');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('43','','','15964220972','您的验证码为043468【润泽在线】','1510629635','2017-11-14=11-20-35','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('44','','','13475865956','您的验证码为802456【润泽在线】','1510630068','2017-11-14=11-27-48','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('45','12','13475865956','13475865956','13475865956您好，您在线充值的元已到账【润泽在线】','1510630273','2017-11-14=11-31-13','1','','140.206.57.164');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('46','12','13475865956','13475865956','您的验证码为045846【润泽在线】','1510630555','2017-11-14=11-35-55','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('47','','','13455269306','您的验证码为548146【润泽在线】','1510631055','2017-11-14=11-44-15','1','','27.193.174.240');/* DBReback Separation */
 /* 插入数据 `shang_xbo_smslog` */
 INSERT INTO `shang_xbo_smslog` VALUES ('48','13','13455269306','13455269306','您的验证码为901785【润泽在线】','1510631479','2017-11-14=11-51-19','1','','27.193.174.240');/* DBReback Separation */