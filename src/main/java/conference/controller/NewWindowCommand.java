package conference.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import conference.service.BeaconInfoService;
import conference.service.ConfigValService;
import conference.service.RaspberrypiInfoService;
import conference.service.RaspberrypiManagerService;

@Controller
public class NewWindowCommand {
	 
    @Resource(name="beaconInfoService")
    private BeaconInfoService serviceB;

    @Resource(name="raspberrypiInfoService")
    private RaspberrypiInfoService serviceI;
    
    @Resource(name="raspberrypiManagerService")
    private RaspberrypiManagerService serviceM;
    
    @Resource(name="configValService")
    private ConfigValService serviceC;
    
    @RequestMapping(value="/confAddView")
    public String raspberrypiInfoAddView(HttpServletRequest request, Model model){
    	List<Map<String,Object>> list = serviceI.selRaspberrypiInfoList();
    	model.addAttribute("list", list);
        return "addConf";
    }
    
    @RequestMapping(value="/keyAddView")
    public String beaconInfoAddView(HttpServletRequest request, Model model){
    	List<Map<String,Object>> list = serviceB.selBeaconInfoList();
    	model.addAttribute("list", list);
        return "addKey";
    }
  
    @RequestMapping(value="/keyMapAddView")
    public String keyMatchAddView(HttpServletRequest request, Model model){
    	List<Map<String, Object>> keyList = serviceB.selBeaconInfoList();
    	List<Map<String, Object>> confList = serviceI.selRaspberrypiInfoList();
    	
    	model.addAttribute("keyList", keyList);
    	model.addAttribute("confList", confList);

        return "addKeyMap";
    }
    

    
    @RequestMapping(value="/manageAddView")
    public String raspberrypiManagerAddView(HttpServletRequest request, Model model){
    	List<Map<String,Object>> list = serviceM.selRaspberrypimanagerList();
    	model.addAttribute("list", list);
        return "addManage";
    }
    

    @RequestMapping(value="/keyManageAddView")
    public String keyManageAddView(HttpServletRequest request, Model model){
    	List<Map<String, Object>> keyList = serviceB.selBeaconInfoList();
    	List<Map<String, Object>> manageList = serviceM.selRaspberrypimanagerList();
    	
    	model.addAttribute("keyList", keyList);
    	model.addAttribute("manageList", manageList);
    	
        return "addKeyManage";
    }
    
    @RequestMapping(value="/config")
    public String config(HttpServletRequest request, Model model){
    	List<HashMap<String, Object>> configVal = serviceC.selConfigVal();
    	
    	model.addAttribute("configVal", configVal);

    	System.out.println(configVal);
        return "config";
    }
    
}
