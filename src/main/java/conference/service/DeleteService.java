package conference.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.DeleteDAO;

@Service("deleteService")
public class DeleteService {
	
	@Resource(name = "deleteDAO")
	private DeleteDAO deleteDAO;

	
	public void delClearData() {
		deleteDAO.delClearData();
	}

	public void delConference(Map<String, Object> map) {
		deleteDAO.delConference(map);
	}
	
}
