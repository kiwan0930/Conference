package conference.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.KeyMatchDAO;

@Service("keyMatchService")
public class KeyMatchService {

	@Resource(name = "keyMatchDAO")
	private KeyMatchDAO keyMatchDAO;
	
	public void insKeyMatch(Map<String, Object> map) {
		keyMatchDAO.insKeyMatch(map);
	}
	
	public void insKeyManage(Map<String, Object> map) {
		keyMatchDAO.insKeyManage(map);	
	}
	
	
	
}
