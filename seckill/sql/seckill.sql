-- 秒杀执行的存储过程
-- 1:存储过程优化: 事务行级锁持有时间
-- 2:不要过度依赖存储过程
-- 3:简单的逻辑可以应用存储过程
-- 4:QPS 一个秒杀单6000/qps
delimiter $$ -- 结束符由;变成$$
-- 定义存储过程
-- 参数: in表示输入参数;out表示输出参数
-- row_count():返回上一条修改类型sql(delete,insert,update)的影响行数
-- row_count():0 未修改数据;>0 表示修改的行数;<0 sql错误/未执行修改sql
create procedure `seckill`.`execute_seckill` 
	(in v_seckill_id bigint,in v_phone bigint,
		in v_kill_time timestamp,out r_result int) 
	begin 
		declare insert_count int default 0;
		start transaction;
		insert ignore into success_killed 
			(seckill_id,user_phone,state,create_time) 
		values 
			(v_seckill_id,v_phone,0,v_kill_time);
		select row_count() into insert_count;
		if(insert_count = 0) then 
			rollback;
			set r_result = -1;
		elseif(insert_count < 0) then 
			rollback;
			set r_result = -2;
		else 
			update seckill set number = number - 1 
			where seckill_id = v_seckill_id 
				and end_time > v_kill_time 
				and start_time < v_kill_time 
				and number > 0;
			select row_count() into insert_count;
			if(insert_count = 0) then 
				rollback;
				set r_result = 0;
			elseif(insert_count < 0) then 
				rollback;
				set r_result = -2;
			else 
				commit;
				set r_result = 1;
			end if;
		end if;
	end;
$$-- 存储过程定义结束

delimiter ;
set @r_result = -3;
-- 执行存储过程
call execute_seckill(1003,13883261153,now(),@r_result);
-- 获取结果
select @r_result;