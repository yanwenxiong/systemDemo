package com.vlifepaper.system.timer;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.TriggerContext;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

import com.vlifepaper.system.model.CommonUtils;
import com.vlifepaper.system.service.GenDataService;

/** @author 闫文雄
 * @date 2017年7月11日
 * @version 1.0
 * @description spring自带定时器，用于生成随机数据，并且将生成的数据
 * 插入数据库。
 */

@Component
@EnableScheduling
public class TimerGenData implements SchedulingConfigurer {
	@Autowired
	private GenDataService genDataService;
	
	//动态获取数据的时间间隔
	private String cron;
	
	//初始化时间间隔
	public TimerGenData() {
		cron = "0/2 * * * * ?";
	}
	

	public Integer getCron() {
		int left = cron.indexOf('/');
		int right = cron.indexOf(' ');
		return Integer.parseInt(cron.substring(left+1, right));
	}


	/**
	 * @parm int cron
	 * @return void
	 * @description 设置时间间隔，仅限于设置间隔秒1-59
	 */
	public void setCron(int cron) {
		String cronStr = "0/" + String.valueOf(cron) + " * * * * ?";
		this.cron = cronStr;
	}
	
	/**
	 * @parm ScheduledTaskRegistrar taskRegistrar
	 * @return void
	 * @description schedule更改时间时间间隔cron
	 */
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		taskRegistrar.addTriggerTask(new Runnable() {
			public void run() {
				genDataService.storeGenData(CommonUtils.getTime(), CommonUtils.randomVal());
			}
		}, new Trigger() {
			public Date nextExecutionTime(TriggerContext triggerContext) {
				// 任务触发，可修改任务的执行周期
				CronTrigger trigger = new CronTrigger(cron);
                Date nextExec = trigger.nextExecutionTime(triggerContext);
                return nextExec;
			}
		});
	}
}

