package conference.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.ConfigValDAO;

@Service("configValService")
public class ConfigValService {
	
	@Resource(name = "configValDAO")
	private ConfigValDAO configValDAO;
	
	public List<HashMap<String,Object>> selConfigVal(){
		return configValDAO.selConfigVal();
	}
	
	public void setConfigVal(Map<String, Object> map) {
		configValDAO.setConfigVal(map);
	}	
}
