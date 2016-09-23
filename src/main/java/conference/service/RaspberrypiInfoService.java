package conference.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.RaspberrypiInfoDAO;

@Service("raspberrypiInfoService")
public class RaspberrypiInfoService {
	
	@Resource(name = "raspberrypiInfoDAO")
	private RaspberrypiInfoDAO raspberrypiInfoDAO;

	public List<Map<String, Object>> selConferenceList() {
		return raspberrypiInfoDAO.selConferenceList();
	}
	public List<Map<String, Object>> selRaspberrypiInfoList() {
		return raspberrypiInfoDAO.selRaspberrypiInfoList();
	}
	
	public void insRaspberrypiInfo(Map<String, Object> map) {
		raspberrypiInfoDAO.insRaspberrypiInfo(map);
	}
	
}
