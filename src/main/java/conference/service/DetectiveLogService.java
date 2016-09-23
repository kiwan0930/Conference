package conference.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.DetectiveLogDAO;

@Service("detectiveLogService")
public class DetectiveLogService {
	
	@Resource(name = "detectiveLogDAO")
	private DetectiveLogDAO detectiveLogDAO;

	
	public List<Map<String, Object>> selConfBeaconList(Map<String, Object> map) {
		return detectiveLogDAO.selConfBeaconList(map);
	}
	
	public void delDetectiveLog() {
		detectiveLogDAO.delDetectiveLog();
	}
	


	
}
