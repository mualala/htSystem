package service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.service.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class SeckillServiceImplTest {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SeckillService seckillService;
	
	@Test
	public void test01(){
		List<Seckill> list = seckillService.getSeckillList(); 
		logger.info("list={}",list);
	}
	
	@Test
	public void test02(){
		long id = 1000L;
		Seckill skiSeckill = seckillService.getById(id);
		logger.info("skiSeckill={}",skiSeckill);
	}
	
	@Test
	public void test03(){
		long id = 1001L;
		Exposer exposer = seckillService.exportSeckillUrl(id);
		if (exposer.isExposed()) {
			long phone = 15680078351L;
			String md5 = exposer.getMd5();
			try {
				SeckillExecution seckillExecution = seckillService.executeSeckill(id, phone, md5);
				logger.info("result={}",seckillExecution);
			} catch (RepeatKillException e) {
				logger.error(e.getMessage());
			} catch (SeckillCloseException e) {
				logger.error(e.getMessage());
			}
		}else {
			//秒杀未开启
			logger.warn("exposer={}",exposer);
		}
	}
	
	@Test
	//测试存储过程的秒杀优化
	public void test04(){
		long seckillId = 1001L;
		long phone = 15680078351L;
		Exposer exposer = seckillService.exportSeckillUrl(seckillId);
		if (exposer.isExposed()) {
			String md5 = exposer.getMd5();
			SeckillExecution execution = seckillService.
					executeSeckillProcedure(seckillId, phone, md5);
			logger.info(execution.getStateInfo());
		}
		
	}
}
