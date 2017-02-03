package dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dao.SeckillDao;
import org.seckill.dao.SuccessKilledDao;
import org.seckill.entity.Seckill;
import org.seckill.entity.SuccessKilled;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 配置spring和junit整合,junit启动时加载springIOC容器
 * spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SuccessKilledDaoTest {
	@Resource
	private SuccessKilledDao successKilledDao;//注入Dao实现类的依赖
	
	@Test
	public void test01(){
		long id = 1001L;
		long phone = 15680078351L;
		int insertCount = successKilledDao.insertSuccessKilled(id, phone);
		System.out.println(insertCount);
	}
	
	@Test
	public void test02(){
		long id = 1000L;
		long phone = 11111111111L;
		SuccessKilled successKilled = successKilledDao.queryByIdWithSeckill(id, phone);
		System.out.println(successKilled);
		System.out.println(successKilled.getSeckill());
		/*
04:34:56.143 [main] DEBUG o.s.d.S.queryByIdWithSeckill - <==      Total: 1
04:34:56.149 [main] DEBUG org.mybatis.spring.SqlSessionUtils - Closing non transactional SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@72df520e]
	SuccessKilled [
		seckillId=1000, 
		userPhone=15680078351, 
		state=-1, 
		createTime=Tue Jan 24 04:27:47 CST 2017]
	Seckill [
		seckillId=1000, 
		name=1000元秒杀iphone6, 
		number=100, 
		startTime=Sun Nov 01 00:00:00 CST 2015, 
		endTime=Mon Nov 02 00:00:00 CST 2015, 
		createTime=Mon Jan 23 20:14:50 CST 2017]
		 */
	}
	
	
}
