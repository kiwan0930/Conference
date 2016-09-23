package conference.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.QuartzDAO;

@Service("quartzService")
public class QuartzService {
	
	@Resource(name = "quartzDAO")
	private QuartzDAO quartzDAO;
	
	public List<HashMap<String,Object>> selList() {
		return quartzDAO.selList();
	}
	
	public List<HashMap<String,Object>> selStatus(Map<String, Object> map) {
		return quartzDAO.selStatus(map);
	}
	
	
	public void setStart(Map<String, Object> map) {
		quartzDAO.setStart(map);
	}
	
	public void setEnd(Map<String, Object> map) {
		quartzDAO.setEnd(map);
	}
	public void setUpdate(Map<String, Object> map) {
		quartzDAO.setUpdate(map);
	}
	
}
