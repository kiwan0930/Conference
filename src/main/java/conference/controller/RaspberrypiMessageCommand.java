package conference.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import conference.service.RaspberrypiMessageService;

@Controller
public class RaspberrypiMessageCommand {
	
	@Resource(name = "raspberrypiMessageService")
	private RaspberrypiMessageService service;
	
    @RequestMapping(value="/logList")
    public String selRaspberrypiMessage(HttpServletRequest request, Model model){
    	List<Map<String, Object>> list = service.selRaspberrypiMessage();
    	model.addAttribute("list", list);

    	model.addAttribute("leftNaviVal", 2);
    	
        return "logList";
    }
	
    @RequestMapping(value="/delLog")
    public String delLogList(){
    	service.delRaspberrypiMessage();
        return "redirect:logList";
    }
}
