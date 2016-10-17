package conference.common.quartz;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Component;

import conference.common.argResolver.CommandMap;
import conference.common.configure.ConfigVal;
import conference.service.ConfigValService;
import conference.service.QuartzService;
import conference.service.RaspberrypiManagerService;

@Component
public class QuartzTask {
	
	@Autowired
	private ApplicationContext appContext;
	
    @Resource(name="quartzService")
    private QuartzService serviceQ;
    
    @Resource(name="configValService")
    private ConfigValService serviceC;
    
    @Resource(name="raspberrypiManagerService")
    private RaspberrypiManagerService serviceM;
    
	public CommandMap map;
	
	int rssi = 0; 
	String mac = null;
	Timestamp detectiveTime = null;
	
	
	
	List<HashMap<String,Object>> list;
	List<HashMap<String,Object>> configVal;
	List<Map<String, Object>> mlist;
	
	QuartzCronTrigger trigger;
	
	@Autowired
	SchedulerFactoryBean schedulerFactoryBean;
	
	Date date; 
	Timestamp sysTime;
	
	public void execute() throws ParseException {	
		init();
		conference();
		manage();
    }
	
	
	
	public void init() throws ParseException{
		trigger = (QuartzCronTrigger) appContext.getBean("cronTrigger");
		
		map = new CommandMap();
		
		list = serviceQ.selList();
		mlist = serviceM.selManageList();
		configVal = serviceC.selConfigVal();
		
		
        
		date = new Date();
		sysTime =  new Timestamp(date.getTime());
		 
		// init Config
		ConfigVal.CONF_RSSI= (Integer)configVal.get(0).get("confrssi");
		ConfigVal.MANAGE_RSSI= (Integer)configVal.get(0).get("managerssi");
		ConfigVal.rasp_ID= configVal.get(0).get("rasp_id").toString();	
		ConfigVal.rasp_Pass = configVal.get(0).get("rasp_pass").toString();	
		ConfigVal.NO_DETECTED_MIN = (Integer)configVal.get(0).get("no_detected_min");	
		
	}
	
	public void conference(){
		for (HashMap<String, Object> entry : list) {
		    for (String key : entry.keySet()) {
		    	if(key.equals("rssi"))
		    		rssi = (Integer)entry.get(key);		    	
		    	if(key.equals("raspberrypimac") )
		    		mac = entry.get(key).toString() ;
		    	if(key.equals("detectivetime") )
		    		detectiveTime = (Timestamp) entry.get(key);
		    }
		    
		    map.put("raspberrypimac", mac);
	    	map.put("detectivetime", detectiveTime);

	    	
		    if(sysTime.getTime() - detectiveTime.getTime()  >= ConfigVal.NO_DETECTED_MIN*(60*1000) ){
		    	serviceQ.setEnd(map.getMap());
		    	continue;
		    }
		    	
		    
		    if( rssi != 0 && mac != null){	
		    	List<HashMap<String,Object>> raspberrypi = serviceQ.selStatus(map.getMap());
		    	
		    	
		    	boolean status = (Boolean)raspberrypi.get(0).get("status");		    
		    	
		    	if(rssi >= ConfigVal.CONF_RSSI && status == false)
	    			serviceQ.setStart(map.getMap());
		    	else if (rssi >= ConfigVal.CONF_RSSI && status == true)
		    		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+ConfigVal.MANAGE_RSSI);
		    	else if(rssi < ConfigVal.CONF_RSSI && status == true)
		    		serviceQ.setEnd(map.getMap());
	    	}
		}
		serviceQ.setUpdate(map.getMap());	
	}
	
	public void manage(){
		
	}
	
	
}
