
package conference.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import conference.common.configure.ConfigVal;
import conference.service.RaspberrypiInfoService;
import conference.service.RaspberrypiManagerService;

@Controller
public class MainCommand {
	
    @Resource(name="raspberrypiInfoService")
    private RaspberrypiInfoService serviceI;
    
    @Resource(name="raspberrypiManagerService")
    private RaspberrypiManagerService serviceM;
    
    
    @RequestMapping(value="/confList")
    public String confList(Model model){
   	
    	List<Map<String, Object>> confList = serviceI.selConferenceList();
    	List<Map<String, Object>> manageList = serviceM.selManageList();
    	
    	model.addAttribute("confList", confList);
    	model.addAttribute("manageList", manageList);
    	
    	model.addAttribute("measureRSSI", ConfigVal.CONF_RSSI);
    	
    	model.addAttribute("leftNaviVal", 0);
        
    	return "confList";
    }
    
    @RequestMapping(value="/guest")
    public String guest(Model model){
   	
    	List<Map<String, Object>> confList = serviceI.selConferenceList();
    	List<Map<String, Object>> manageList = serviceM.selManageList();
    	
    	model.addAttribute("confList", confList);
    	model.addAttribute("manageList", manageList);
    	
    	model.addAttribute("measureRSSI", ConfigVal.CONF_RSSI);
    
    	model.addAttribute("leftNaviVal", -1);
        return "guest";
    }
    
	
}
