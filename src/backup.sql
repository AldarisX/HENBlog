CREATE DATABASE  IF NOT EXISTS `n_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `n_blog`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: n_blog
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `head`
--

DROP TABLE IF EXISTS `head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `sindex` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head`
--

LOCK TABLES `head` WRITE;
/*!40000 ALTER TABLE `head` DISABLE KEYS */;
INSERT INTO `head` VALUES (1,'首页','index.jsp',1),(3,'关于我','aboutme.jsp',3),(4,'搜索','search.jsp',2);
/*!40000 ALTER TABLE `head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,'bname','HEN'),(2,'sex','男'),(3,'birthday','0000'),(4,'Job','Free'),(5,'Loc','NONE'),(6,'desc','NONE'),(7,'background','img/background.jpg');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk`
--

DROP TABLE IF EXISTS `talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `userName` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk`
--

LOCK TABLES `talk` WRITE;
/*!40000 ALTER TABLE `talk` DISABLE KEYS */;
INSERT INTO `talk` VALUES (5,69,'AldarisX','<p>第一个评论测试</p>\n','2016-10-17 05:51:45'),(6,69,'AldarisX','<p>这个是第二个</p>\n','2016-10-17 06:00:18'),(7,69,'AldarisX','<p>DaDaDa???</p>\n','2016-10-17 06:00:56'),(8,69,'Aldaris','<p>喵喵喵???</p>\n','2016-10-17 06:02:33'),(9,69,'Aldaris','<pre>\n<code class=\"language-java\">package com;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static String warLoc = \"\";\n	// 博客的设置\n	public static String bName = \"\";\n	public static String sex = \"\";\n	public static String birthday = \"\";\n	public static String job = \"\";\n	public static String loc = \"\";\n	public static String desc = \"\";\n	// 主页等记录条数\n	public static int logCount = 15;\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n	// 总博客数\n	public static int titleCount = 0;\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-17 12:50:05');
/*!40000 ALTER TABLE `talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(32) NOT NULL,
  `title` varchar(86) NOT NULL,
  `pretitle` text NOT NULL,
  `content` longtext NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (22,'Aldaris','com.JDBCUtils','com.JDBCUtils','<p>用于连接mysql数据库</p>\n\n<pre>\n<code class=\"language-java\">package com;\n\nimport java.sql.Connection;\nimport java.sql.DriverManager;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport java.sql.Statement;\nimport java.util.Timer;\nimport java.util.TimerTask;\n\npublic class JDBCUtils {\n	public static final String url = \"jdbc:mysql://127.0.0.1/n_blog\";\n	public static final String name = \"com.mysql.jdbc.Driver\";\n	public static final String user = \"root\";\n	public static final String password = \"aldaris\";\n\n	public Connection conn = null;\n	public Statement st = null;\n	public PreparedStatement pst = null;\n	public ResultSet rs = null;\n\n	private Timer timer = new Timer();\n	private int limit = 5;\n	private int count = 0;\n\n	public static void main(String[] args) {\n		for (int i = 0; i &lt; 1000; i++) {\n			try {\n				new JDBCUtils();\n				System.out.println(\"建立了链接\" + i);\n			} catch (SQLException e) {\n				e.printStackTrace();\n			}\n		}\n	}\n\n	public JDBCUtils() throws SQLException {\n		try {\n			Class.forName(name);\n		} catch (ClassNotFoundException e2) {\n			e2.printStackTrace();\n		}\n\n		boolean tryGetConn = true;\n		try {\n			while (tryGetConn) {\n				conn = DriverManager.getConnection(url, user, password);\n				tryGetConn = false;\n			}\n		} catch (com.mysql.jdbc.exceptions.jdbc4.MySQLNonTransientConnectionException e) {\n			System.out.println(\"数据库链接不足 建议调整数据库链接\");\n			tryGetConn = true;\n			try {\n				Thread.sleep(10);\n			} catch (InterruptedException e1) {\n				e1.printStackTrace();\n			}\n		}\n\n		count = limit;\n		timer.schedule(new TimerTask() {\n			public void run() {\n				if (count &lt;= 0) {\n					close();\n				}\n				count--;\n			}\n		}, 0, 1000);\n	}\n\n	private Statement getST() throws SQLException {\n		return conn.createStatement();\n	}\n\n	public PreparedStatement getPST(String sql) throws SQLException {\n		return conn.prepareStatement(sql);\n	}\n\n	public ResultSet getQuery(String sql) throws SQLException {\n		count = limit;\n		return getST().executeQuery(sql);\n	}\n\n	public ResultSet getQuery(PreparedStatement ps) throws SQLException {\n		count = limit;\n		pst = ps;\n		return ps.executeQuery();\n	}\n\n	public int getUpdate(String sql) throws SQLException {\n		count = limit;\n		return getST().executeUpdate(sql);\n	}\n\n	public int getUpdate(PreparedStatement ps) throws SQLException {\n		count = limit;\n		pst = ps;\n		return ps.executeUpdate();\n	}\n\n	public void close() {\n		try {\n			rs.close();\n		} catch (Exception e) {\n			// TODO: handle exception\n		}\n		try {\n			st.close();\n		} catch (Exception e) {\n			// TODO: handle exception\n		}\n		try {\n			pst.close();\n		} catch (Exception e) {\n			// TODO: handle exception\n		}\n		try {\n			conn.close();\n		} catch (Exception e) {\n			// TODO: handle exception\n		}\n\n		timer.cancel();\n	}\n}\n</code></pre>\n','2016-10-02 02:09:19'),(28,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:27:53'),(29,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:42'),(30,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:45'),(31,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:46'),(32,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:46'),(33,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:47'),(34,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:47'),(35,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:48'),(36,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:49'),(37,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:50'),(38,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:50'),(39,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:51'),(40,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:51'),(41,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:51'),(42,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:51'),(43,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:52'),(44,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:52'),(45,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:52'),(46,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:52'),(47,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:52'),(48,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:53'),(49,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:53'),(50,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:53'),(51,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:53'),(52,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:54'),(53,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:54'),(54,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:54'),(55,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:54'),(56,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:55'),(57,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:55'),(58,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:55'),(59,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:55'),(60,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:55'),(61,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:56'),(62,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:56'),(63,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:56'),(64,'Aldaris','model.Config','model.Config','<p>存放对网站的设置</p>\n\n<pre>\n<code class=\"language-java\">package model;\n\nimport java.util.ArrayList;\n\npublic class Config {\n	public static ArrayList&lt;String&gt; headName = new ArrayList&lt;String&gt;();\n	public static ArrayList&lt;String&gt; headLink = new ArrayList&lt;String&gt;();\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-02 03:28:56'),(66,'Aldaris','进制转换:二进制转十六进制','<pre>\n<code class=\"language-java\">public static String bytesToHex(byte[] bytes) {\n		StringBuffer md5str = new StringBuffer();\n		// 把数组每一字节换成16进制连成md5字符串\n		int digital;\n		for (int i = 0; i &lt; bytes.length; i++) {\n			digital = bytes[i];\n\n			if (digital &lt; 0) {\n				digital += 256;\n			}\n			if (digital &lt; 16) {\n				md5str.append(\"0\");\n			}\n			md5str.append(Integer.toHexString(digital));\n		}\n		return md5str.toString().toUpperCase();\n	}</code></pre>\n\n<p>&nbsp;</p>\n','<p>进制转换之一</p>\n\n<p>&nbsp;</p>\n\n<pre>\n<code class=\"language-java\">public static String bytesToHex(byte[] bytes) {\n		StringBuffer md5str = new StringBuffer();\n		// 把数组每一字节换成16进制连成md5字符串\n		int digital;\n		for (int i = 0; i &lt; bytes.length; i++) {\n			digital = bytes[i];\n\n			if (digital &lt; 0) {\n				digital += 256;\n			}\n			if (digital &lt; 16) {\n				md5str.append(\"0\");\n			}\n			md5str.append(Integer.toHexString(digital));\n		}\n		return md5str.toString().toUpperCase();\n	}</code></pre>\n\n<p>&nbsp;</p>\n\n<p>一个MD5的算法</p>\n\n<pre>\n<code class=\"language-java\">package tool;\n\nimport java.security.MessageDigest;\n\npublic class MD5Util {\n	/**\n	 * 生成md5\n	 * \n	 * @param message\n	 * @return\n	 */\n	public static String string2MD5(String message) {\n		String md5str = \"\";\n		try {\n			// 1 创建一个提供信息摘要算法的对象，初始化为md5算法对象\n			MessageDigest md = MessageDigest.getInstance(\"MD5\");\n			// 2 将消息变成byte数组\n			byte[] input = message.getBytes();\n			// 3 计算后获得字节数组,这就是那128位了\n			byte[] buff = md.digest(input);\n			// 4 把数组每一字节（一个字节占八位）换成16进制连成md5字符串\n			md5str = bytesToHex(buff);\n		} catch (Exception e) {\n			e.printStackTrace();\n		}\n		return md5str;\n	}\n\n	/**\n	 * 二进制转十六进制\n	 * \n	 * @param bytes\n	 * @return\n	 */\n	public static String bytesToHex(byte[] bytes) {\n		StringBuffer md5str = new StringBuffer();\n		// 把数组每一字节换成16进制连成md5字符串\n		int digital;\n		for (int i = 0; i &lt; bytes.length; i++) {\n			digital = bytes[i];\n\n			if (digital &lt; 0) {\n				digital += 256;\n			}\n			if (digital &lt; 16) {\n				md5str.append(\"0\");\n			}\n			md5str.append(Integer.toHexString(digital));\n		}\n		return md5str.toString().toUpperCase();\n	}\n}\n</code></pre>\n\n<p>&nbsp;</p>\n','2016-10-03 04:09:32'),(67,'Aldaris','使用了MUI','<h1>使用了MUI</h1>\n\n<p>www.muicss.com</p>\n\n<p><a href=\"https://www.muicss.com/\">点此打开MUI官网</a></p>\n','<h1>使用了MUI</h1>\n\n<p>www.muicss.com</p>\n\n<p><a href=\"https://www.muicss.com/\">点此打开MUI官网</a></p>\n','2016-10-05 09:48:14'),(69,'HEN','图片上载测试','<p>这是图片测试<img alt=\"\" src=\"img/upload/5edcd845a7e9242a31e8866e6fbf1d7b.png\" style=\"height:100%; width:100%\" /></p>\n','<p>图片上载测试哦</p>\n\n<p><img alt=\"\" src=\"img/upload/daff8502e3258955e7903dda7193127b.jpg\" style=\"height:100%; width:100%\" /></p>\n','2016-10-07 06:54:54');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `passwd` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `level` int(8) DEFAULT '6',
  PRIMARY KEY (`id`,`userName`,`passwd`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'Admin','81DC9BDB52D04DC20036DBD8313ED055','',1),(1,'Aldaris','5E2F8C531D572A5A662BE1E69D190254','z919590416@live.cn',1),(3,'AldarisX','5E2F8C531D572A5A662BE1E69D190254','',6);
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

-- Dump completed on 2016-10-23 14:39:14
