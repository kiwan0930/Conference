package conference.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import conference.common.argResolver.CommandMap;
import conference.service.DeleteService;

@Controller
public class DeleteController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name="deleteService")
    private DeleteService service;

	
	@RequestMapping(value = "/deleteConf")
	public String deleteConf(CommandMap map) {
		service.delConference(map.getMap());
		return "redirect:confList";
	}
	
	@RequestMapping(value = "/clear")
	public String clearData() {
		service.delClearData();
		return "redirect:confList";
	}
	
	
}
