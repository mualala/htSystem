-- 数据库初始化脚本

-- 创建数据库
create database seckill;
-- 使用数据库
use seckill;
-- 创建库存表
DROP TABLE IF EXISTS `seckill`;
CREATE TABLE `seckill` (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `name` varchar(120) NOT NULL COMMENT '商品名称',
  `number` int(11) NOT NULL COMMENT '库存数量',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '秒杀开启时间',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '秒杀结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_creae_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

-- 初始化数据
INSERT INTO `seckill` VALUES ('1000', '1000元秒杀iphone6', '100', '2017-02-02 00:00:00', '2017-02-28 00:00:00', '2017-02-03 23:55:46');
INSERT INTO `seckill` VALUES ('1001', '500元秒杀ipad2', '200', '2017-02-02 00:00:00', '2017-02-28 00:00:00', '2017-02-03 23:55:48');
INSERT INTO `seckill` VALUES ('1002', '300元秒杀小米4', '300', '2017-02-18 00:00:00', '2017-02-28 00:00:00', '2017-02-03 03:12:42');
INSERT INTO `seckill` VALUES ('1003', '200元秒杀红米note', '400', '2017-02-02 00:00:00', '2017-02-28 00:00:00', '2017-02-03 23:47:50');

-- 秒杀成功明细表
-- 用户登录认证相关信息
DROP TABLE IF EXISTS `success_killed`;
CREATE TABLE `success_killed` (
  `seckill_id` bigint(20) NOT NULL COMMENT '秒杀商品id',
  `user_phone` bigint(20) NOT NULL COMMENT '用户手机号',
  `state` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状态标示，-1:无效 0:成功 1:已付款 2:已发货',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`,`user_phone`),
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

show create table tables_name\G;-- 用于查看创建表的sql语句

-- 链接数据库控制台
mysql -uroot -p

