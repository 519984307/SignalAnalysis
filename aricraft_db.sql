-- MySQL dump 10.13  Distrib 5.7.39, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aricraft_db
-- ------------------------------------------------------
-- Server version	5.7.39-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelCode` varchar(255) DEFAULT NULL COMMENT '传感器标识',
  `channelDesc` varchar(255) DEFAULT NULL COMMENT '传感器描述',
  `channelStatus` char(1) DEFAULT NULL,
  `measureType` int(11) DEFAULT NULL COMMENT '测量类型',
  `windowType` int(11) DEFAULT NULL COMMENT '窗口类型，参考的是字典表',
  `triggerMagnitude` float DEFAULT NULL COMMENT '触发量级',
  `triggerPolarity` int(11) DEFAULT NULL COMMENT '触发极性,参考字典表',
  `pointNum` int(11) DEFAULT NULL COMMENT '测点号',
  `coordinateSystem` int(11) DEFAULT NULL COMMENT '坐标系，参考字典表',
  `coordinateSystemdirection` int(11) DEFAULT NULL COMMENT '坐标系方向，参考字典表',
  `isReference` char(1) DEFAULT NULL COMMENT '参考标识，即是否参考',
  `engineeringUnits` int(11) DEFAULT NULL COMMENT '工程单位，参考字典表',
  `sensitivity` float DEFAULT NULL COMMENT '传感器灵敏度',
  `fullValue` int(11) DEFAULT NULL COMMENT '满度量程',
  `integralType` int(11) DEFAULT NULL COMMENT '积分类型，参考字典表',
  `integralUnits` int(11) DEFAULT NULL COMMENT '积分单位，参考字典表',
  `inputMode` int(11) DEFAULT NULL COMMENT '输入方式，参考字典表',
  `antiAliasingFiltering` char(1) DEFAULT NULL COMMENT '抗混滤波器',
  `upFreq` int(50) DEFAULT NULL COMMENT '上限频率',
  `elcPressure` int(255) DEFAULT NULL COMMENT '电压测量范围',
  `downFrequency` int(255) DEFAULT NULL COMMENT '下限频率',
  `projectId` int(11) DEFAULT NULL COMMENT '项目编号',
  `testlocatonId` int(11) DEFAULT NULL COMMENT '测试位置编号',
  `xMin` double(11,0) DEFAULT NULL COMMENT 'x轴最小值',
  `xMax` double(11,0) DEFAULT NULL COMMENT 'x轴最大值',
  `yMin` double(11,0) DEFAULT NULL COMMENT 'y轴最小值',
  `yMax` double(11,0) DEFAULT NULL COMMENT 'y轴最大值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7026 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectionparas`
--

DROP TABLE IF EXISTS `collectionparas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionparas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_frequency` int(255) DEFAULT NULL COMMENT '采样频率',
  `collection_method` int(11) DEFAULT NULL COMMENT '采样方式',
  `trigger_method` int(11) DEFAULT NULL COMMENT '触发方式',
  `data_blocks` int(11) DEFAULT NULL COMMENT '数据块数',
  `delay_blocks` int(11) DEFAULT NULL COMMENT '延迟块数',
  `trigger_times` int(11) DEFAULT NULL COMMENT '触发次数',
  `line` int(11) DEFAULT NULL COMMENT '采集点数',
  `sample_batch` int(11) DEFAULT NULL COMMENT '采样批次',
  `sample_clk` int(255) DEFAULT NULL COMMENT '采样时钟',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `simple_frequency` (`sample_frequency`) USING BTREE,
  KEY `sampling_method` (`collection_method`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectionparas`
--

LOCK TABLES `collectionparas` WRITE;
/*!40000 ALTER TABLE `collectionparas` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectionparas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `dict_name` varchar(255) NOT NULL,
  `dict_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'samplefrequency','{\"title\":\"128HZ\",\"content\":128}'),(2,'samplefrequency','{\"title\":\"256HZ\",\"content\":256}'),(3,'samplefrequency','{\"title\":\"512HZ\",\"content\":512}'),(4,'samplefrequency','{\"title\":\"1.28KHZ\",\"content\":1280}'),(5,'samplefrequency','{\"title\":\"2.56KHZ\",\"content\":2560}'),(6,'samplefrequency','{\"title\":\"5.12KHZ\",\"content\":5120}'),(7,'samplefrequency','{\"title\":\"12.8KHZ\",\"content\":12800}'),(8,'samplefrequency','{\"title\":\"25.6KHZ\",\"content\":25600}'),(9,'samplefrequency','{\"title\":\"51.2KHZ\",\"content\":51200}'),(10,'samplefrequency','{\"title\":\"128KHZ\",\"content\":128000}'),(11,'samplefrequency','{\"title\":\"256KHZ\",\"content\":256000}'),(12,'analysisfrequency','{\"title\":\"0.5HZ\",\"content\":0.5}'),(13,'analysisfrequency','{\"title\":\"1HZ\",\"content\":1}'),(14,'analysisfrequency','{\"title\":\"2HZ\",\"content\":2}'),(15,'analysisfrequency','{\"title\":\"5HZ\",\"content\":5}'),(16,'analysisfrequency','{\"title\":\"10HZ\",\"content\":10}'),(17,'analysisfrequency','{\"title\":\"20HZ\",\"content\":20}'),(18,'analysisfrequency','{\"title\":\"50HZ\",\"content\":50}'),(19,'analysisfrequency','{\"title\":\"100HZ\",\"content\":100}'),(20,'analysisfrequency','{\"title\":\"200HZ\",\"content\":200}'),(21,'analysisfrequency','{\"title\":\"500HZ\",\"content\":500}'),(22,'analysisfrequency','{\"title\":\"1KHZ\",\"content\":1000}'),(23,'analysisfrequency','{\"title\":\"2KHZ\",\"content\":2000}'),(24,'analysisfrequency','{\"title\":\"5KHZ\",\"content\":5000}'),(25,'analysisfrequency','{\"title\":\"10KHZ\",\"content\":10000}'),(26,'analysisfrequency','{\"title\":\"20KHZ\",\"content\":20000}'),(27,'analysisfrequency','{\"title\":\"50KHZ\",\"content\":50000}'),(28,'analysisfrequency','{\"title\":\"100KHZ\",\"content\":100000}'),(29,'collectionmethod','连续'),(30,'collectionmethod','示波'),(31,'collectionmethod','瞬态'),(32,'collectionmethod','触发连续'),(46,'engineeringunit','v'),(48,'engineeringunit','με'),(49,'engineeringunit','g'),(50,'engineeringunit','m/s^2'),(51,'engineeringunit','cm/s^2'),(52,'engineeringunit','mm/s^2'),(53,'engineeringunit','m/s'),(54,'engineeringunit','cm/s'),(55,'engineeringunit','mm/s'),(56,'engineeringunit','m'),(57,'engineeringunit','cm'),(58,'engineeringunit','mm'),(59,'engineeringunit','μm'),(60,'engineeringunit','℃'),(61,'engineeringunit','℉'),(62,'engineeringunit','N'),(63,'engineeringunit','Pa'),(64,'engineeringunit','KPa'),(65,'engineeringunit','MPa'),(66,'engineeringunit','kg'),(67,'engineeringunit','Hz'),(68,'engineeringunit','J'),(69,'engineeringunit','W'),(70,'engineeringunit','RPM'),(71,'engineeringunit','rad/s'),(72,'engineeringunit','rad'),(73,'engineeringunit','A'),(75,'collectionplan','{\"planName\":\"平稳状态\",\"planIntro\":\"平稳状态下的采集\",\"planParaTitle\":[\"转速\"],\"planParaContent\":[[\"126hz\"],[\"126hz\"]]}'),(76,'windowtype','矩形窗'),(77,'windowtype','海宁窗'),(78,'windowtype','平顶窗'),(79,'windowtype','汉明窗'),(80,'windowtype','力窗'),(81,'inputmethod','AC'),(82,'inputmethod','ICP'),(83,'collectionplan','{\"planName\":\"上升状态\",\"planIntro\":\"上升状态下的采集\",\"planParaTitle\":[\"速度\",\"加速度\"],\"planParaContent\":[[\"30\",\"20\"],[\"20\",\"2\"]]}'),(84,'engineeringunit','test'),(87,'collectionplan','{\"planName\":\"下降状态\",\"planIntro\":\"下降状态的采集\",\"planParaTitle\":[\"速度\",\"减速度\"],\"planParaContent\":[[\"20hz\",\"25hz\"],[\"36hz\",\"29hz\"],[\"39hz\",\"42hz\"]]}'),(88,'collectionpoint','50'),(89,'collectionpoint','100'),(90,'collectionpoint','200'),(91,'collectionpoint','400'),(92,'collectionpoint','800'),(93,'collectionpoint','1600'),(94,'collectionpoint','3200'),(95,'collectionpoint','6400'),(96,'collectionpoint','8192'),(97,'collectionpoint','25600'),(98,'collectionpoint','51200'),(99,'collectionpoint','102400'),(100,'triggermethod','触发'),(101,'lines','50'),(102,'lines','100'),(103,'lines','200'),(104,'lines','400'),(105,'lines','800'),(106,'lines','1600'),(107,'lines','3200'),(108,'lines','6400'),(109,'lines','12800'),(110,'lines','25600');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `post_id` (`id`) USING BTREE,
  UNIQUE KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'普通用户'),(2,'管理员');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `projectName` varchar(255) NOT NULL COMMENT '项目名称',
  `projectCreateTime` varchar(255) DEFAULT NULL COMMENT '项目创建时间',
  `projectUpdateTime` varchar(255) DEFAULT NULL COMMENT '项目更新时间',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `projectParameterId` int(11) DEFAULT NULL COMMENT '项目参数id',
  `projectStatus` int(11) DEFAULT NULL COMMENT ' 1默认状态 2 正在使用 3 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_signal`
--

DROP TABLE IF EXISTS `single_signal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_signal` (
  `id` varchar(255) NOT NULL COMMENT '单通道信号id',
  `channelId` int(11) DEFAULT NULL COMMENT '用来保存该通道的参数的记录的id',
  `sumSignalId` varchar(255) DEFAULT NULL COMMENT '用来保存该批次信号的共同id',
  `signalStatus` int(11) DEFAULT NULL COMMENT '信号的状态',
  `dataUrl` varchar(255) DEFAULT NULL COMMENT '信号的保存路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_signal`
--

LOCK TABLES `single_signal` WRITE;
/*!40000 ALTER TABLE `single_signal` DISABLE KEYS */;
INSERT INTO `single_signal` VALUES ('gege',132,'gegege',1,'data/hige/hihige');
/*!40000 ALTER TABLE `single_signal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sum_signal`
--

DROP TABLE IF EXISTS `sum_signal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sum_signal` (
  `id` varchar(255) NOT NULL COMMENT '该批次信号的公共id',
  `startTime` varchar(100) DEFAULT NULL COMMENT '该批信号的开始采集时间',
  `endTime` varchar(100) DEFAULT NULL COMMENT '该批信号的结束采集时间',
  `projectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `startTimeIndex` (`startTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sum_signal`
--

LOCK TABLES `sum_signal` WRITE;
/*!40000 ALTER TABLE `sum_signal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sum_signal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) NOT NULL COMMENT '登录名',
  `loginPassword` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `name` varchar(255) DEFAULT NULL COMMENT '检测人员姓名',
  `postId` int(11) DEFAULT NULL COMMENT '检测人员职务',
  `telephone` varchar(20) DEFAULT NULL COMMENT '检测人员电话',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_name` (`loginName`) USING BTREE,
  KEY `post_id` (`postId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'ljlgg','123456','ljl',1,'123535646'),(12,'ljl','123456','ljl',1,'123535646'),(13,'ljlg','123456','ljl',1,'123535646'),(14,'ljlgigeg','123456','ljl',1,'123535646'),(15,'ljlgigegge','123456','ljl',1,'123535646'),(16,'ljlgiggegge','123456','ljl',1,'123535646'),(19,'ljlgfe','123','ljg',2,'13567895094'),(20,'hige','hige','hel',2,'13254546234');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:35:48
