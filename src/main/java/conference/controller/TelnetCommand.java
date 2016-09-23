package conference.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcraft.jsch.JSchException;

import conference.common.argResolver.CommandMap;
import conference.common.telnet.Telnet;
import conference.service.RaspberrypiInfoService;
import conference.service.RaspberrypiManagerService;

@Controller
public class TelnetCommand { 

    @Resource(name="raspberrypiInfoService")
    private RaspberrypiInfoService serviceI;
    
    @Resource(name="raspberrypiManagerService")
    private RaspberrypiManagerService serviceM;
    
    

	@RequestMapping(value = "/allReboot")
	public String allReboot() throws  IOException {
		Telnet telnet = new Telnet();

		List<Map<String, Object>> confIpList = serviceI.selRaspberrypiInfoList();
		List<Map<String, Object>> manageIpList = serviceM.selRaspberrypimanagerList();
		
		try{
			for (int i = 0; i < confIpList.size(); i++) {
				telnet.setIp((String) confIpList.get(i).get("ipaddress"));
				telnet.command(Telnet.REBOOT);
			}
	
			for (int i = 0; i < manageIpList.size(); i++) {
				telnet.setIp((String) manageIpList.get(i).get("ipaddress"));
				telnet.command(Telnet.REBOOT);
			}
		}
		catch (Exception e){
		}

		return "redirect:confList";
	}

	@RequestMapping(value = "/allShutdown")
	public String allShutdown() throws JSchException, IOException {
		
		Telnet telnet = new Telnet();

		List<Map<String, Object>> confIpList = serviceI.selRaspberrypiInfoList();
		List<Map<String, Object>> manageIpList = serviceM.selRaspberrypimanagerList();
		
		try{
			for (int i = 0; i < confIpList.size(); i++) {
				telnet.setIp((String) confIpList.get(i).get("ipaddress"));
				telnet.command(Telnet.SHUTDOWN);
			}
	
			for (int i = 0; i < manageIpList.size(); i++) {
				telnet.setIp((String) manageIpList.get(i).get("ipaddress"));
				telnet.command(Telnet.SHUTDOWN);
			}
		}
		catch (Exception e){
		}

		return "redirect:confList";
	}

	@RequestMapping(value = "/reboot")
	public String reboot(CommandMap map, HttpServletResponse response, HttpServletRequest request) throws IOException {
		Telnet telnet = new Telnet();
		PrintWriter out = response.getWriter();

		telnet.setIp((String) map.get("ipaddress"));
		try {
			telnet.command(Telnet.REBOOT);
		} catch (JSchException e) {
			out.println("<script charset='UTF-8'>alert('" +e.getMessage() + "');"
					+ "window.location.href='"+request.getContextPath() + "/confList'</script>");
			out.flush();
		}

		return "redirect:confList";
	}

	
	@RequestMapping(value = "/shutdown")
	public String shutdown(CommandMap map, HttpServletResponse response, HttpServletRequest request) throws IOException {
		Telnet telnet = new Telnet();
		PrintWriter out = response.getWriter();

		telnet.setIp((String) map.get("ipaddress"));
		try {
			telnet.command(Telnet.SHUTDOWN);
		} catch (JSchException e) {
			out.println("<script charset='UTF-8'>alert('" +e.getMessage() + "');"
					+ "window.location.href='"+request.getContextPath() + "/confList'</script>");
			out.flush();
		}

		return "redirect:confList";
	}

}
