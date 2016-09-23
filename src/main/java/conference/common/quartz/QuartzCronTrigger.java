package conference.common.quartz;

import java.text.ParseException;

import org.springframework.scheduling.quartz.CronTriggerBean;

@SuppressWarnings("serial")
public class QuartzCronTrigger extends CronTriggerBean
{
	
	@Override
	public void setCronExpression(String cronExpression) throws ParseException {
		super.setCronExpression(cronExpression);
	}
}
