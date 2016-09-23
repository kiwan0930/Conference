package conference.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import conference.common.argResolver.CommandMap;
import conference.service.BeaconInfoService;
import conference.service.ConfigValService;
import conference.service.KeyMatchService;
import conference.service.RaspberrypiInfoService;
import conference.service.RaspberrypiManagerService;

@Controller
public class LogicController {
	Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name="beaconInfoService")
    private BeaconInfoService serviceB;

    @Resource(name="raspberrypiInfoService")
    private RaspberrypiInfoService serviceI;
    
    @Resource(name="raspberrypiManagerService")
    private RaspberrypiManagerService serviceM;
    
    @Resource(name="keyMatchService")
    private KeyMatchService serviceK;
    
    @Resource(name="configValService")
    private ConfigValService serviceC;
    
    
    
	@RequestMapping(value = "/confAdd" ,  method=RequestMethod.POST )
	public void insRaspberrypiInfo(CommandMap map, HttpServletResponse response) throws IOException {
		serviceI.insRaspberrypiInfo(map.getMap());
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();  
        out.println("<script charset='UTF-8'>alert('追加されました。 ');  window.close(); window.opener.location.reload();</script>"); 
        out.flush(); 
	}
	
	//
	@RequestMapping(value = "/keyAdd" ,  method=RequestMethod.POST )
	public void insBeaconInfo(CommandMap map, HttpServletResponse response) throws IOException {
		
		map.getMap().replace("major", Integer.parseInt( (String) map.getMap().get("major")));
		map.getMap().replace("minor", Integer.parseInt( (String) map.getMap().get("minor")));
	
		serviceB.insBeaconInfo(map.getMap());
		
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();  
        out.println("<script charset='UTF-8'>alert('追加されました。 ');  window.close(); window.opener.location.reload();</script>"); 
        out.flush(); 
	}
	
	
	@RequestMapping(value = "/keyMapAdd" ,  method=RequestMethod.POST )
	public void insKeyMatch(CommandMap map, HttpServletResponse response) throws IOException {
		
		serviceK.insKeyMatch(map.getMap());
		
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();  
        out.println("<script charset='UTF-8'>alert('追加されました。');  window.close(); window.opener.location.reload();</script>"); 
        out.flush(); 
	}
	
	
	@RequestMapping(value = "/keyManageAdd" ,  method=RequestMethod.POST )
	public void keyManageAdd(CommandMap map, HttpServletResponse response) throws IOException {
		serviceK.insKeyManage(map.getMap());
		
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();  
        out.println("<script charset='UTF-8'>alert('追加されました。 ');  window.close(); window.opener.location.reload();</script>"); 
        out.flush(); 
	}
	
	
	@RequestMapping(value = "/manageAdd" ,  method=RequestMethod.POST)
	public void insRaspberrypimanager(CommandMap map, HttpServletResponse response ,HttpServletRequest request) throws IOException {
		
		serviceM.insRaspberrypimanager(map.getMap());

		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();  
        out.println("<script charset='UTF-8'>alert('追加されました。 ');  window.close(); window.opener.location.reload();</script>"); 
        out.flush(); 
	}
	
	@RequestMapping(value = "/setConfigVal" ,  method=RequestMethod.POST)
	public void setConfigVal(CommandMap map, HttpServletResponse response ,HttpServletRequest request) throws IOException {
		
		int val = Integer.parseInt((String) map.get("confrssi"));
		map.put("confrssi", val);
		
		int val2 = Integer.parseInt((String) map.get("managerssi"));
		map.put("managerssi", val2);
		
		
		
		serviceC.setConfigVal(map.getMap());
		
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();  
        out.println("<script charset='UTF-8'>alert('修正されました。 ');  window.close(); window.opener.location.reload();</script>"); 
        out.flush(); 
	}
	
	
	
	
}
