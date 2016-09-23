package conference.common.quartz;

import java.text.ParseException;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

@Component
public class QuartzTaskBean extends QuartzJobBean {
	 
    private QuartzTask quartzTask;

    
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
    
    	try {
			quartzTask.execute();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
   
    public void setQuartzTask(QuartzTask quartzTask) {
        this.quartzTask = quartzTask;
    }
}
