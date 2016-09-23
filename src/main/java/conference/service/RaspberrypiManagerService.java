package conference.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.RaspberrypiManagerDAO;

@Service("raspberrypiManagerService")
public class RaspberrypiManagerService {

	@Resource(name = "raspberrypiManagerDAO")
	private RaspberrypiManagerDAO raspberrypiManagerDAO;

	public List<Map<String, Object>> selManageList() {
		return raspberrypiManagerDAO.selManageList();
	}
	
	public List<Map<String, Object>> selRaspberrypimanagerList() {
		return raspberrypiManagerDAO.selRaspberrypimanagerList();
	}
	
	public void insRaspberrypimanager(Map<String, Object> map) {
		raspberrypiManagerDAO.insRaspberrypimanager(map);
	}
	
}
