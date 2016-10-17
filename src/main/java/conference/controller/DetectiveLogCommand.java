
package conference.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import conference.common.argResolver.CommandMap;
import conference.common.configure.ConfigVal;
import conference.service.DetectiveLogService;

@Controller
public class DetectiveLogCommand {
	
    @Resource(name="detectiveLogService")
    private DetectiveLogService service;
  
    String[] uuidList = ConfigVal.UUID;
    
    @RequestMapping(value="/confBeaconList" , method=RequestMethod.GET)
    public ModelAndView confBeaconList(CommandMap map){
    	ModelAndView mv = new ModelAndView("/confBeaconList");
    	List<Map<String,Object>> list = service.selConfBeaconList(map.getMap());
    	
    	
//    	for(int i = 0 ; i<list.size(); i++){
//    		String UUID = (String) list.get(i).get("uuid");
//    		System.out.println("i "+i +" :dddddddddddddddd" + UUID);
//    		
//    		for(int j = 0 ; j<uuidList.length;j++ ){
//    			if(UUID.equals(uuidList[j]) ){
//    				
//    			}
//    		}
//    	}
    	
    	mv.addObject("list", list);
    	
    	mv.addObject("macaddr", map.get("macaddr"));
    	mv.addObject("confName", map.get("name"));
    	mv.addObject("ipaddress", map.get("ipaddress"));
    	
    	mv.addObject("leftNaviVal", 1);
    	
    	
        return mv;
    }
    
    @RequestMapping(value="/deleteBeaconList" , method=RequestMethod.GET)
    public String delDetectiveLog(CommandMap map){
    	service.delDetectiveLog();
    	
    	return "redirect:confList";
    }
    
    
   
	
}
