package dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dao.SeckillDao;
import org.seckill.entity.Seckill;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 配置spring和junit整合,junit启动时加载springIOC容器
 * spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SeckillDaoTest {
	@Resource
	private SeckillDao seckillDao;//注入Dao实现类的依赖
	
	@Test
	public void test01(){
		long id = 1000L;
		Seckill seckill = seckillDao.queryById(id);
		System.out.println(seckill.getName());
		System.out.println(seckill);
	}
	
	@Test
	/*
	 * java没有保存形参的记录:queryAll(int offset, int limit, ...) -> queryAll(arg0, arg1, ...) 
	 */
	public void test02(){
		List<Seckill> seckills = seckillDao.queryAll(0,100);
		for(Seckill s:seckills)
			System.out.println(s);
	}
	
	@Test
	public void test03(){
		Date killTime = new Date();
		int updateCount = seckillDao.reduceNumber(1000L, killTime);
		System.out.println(updateCount);
	}
	
	
}
