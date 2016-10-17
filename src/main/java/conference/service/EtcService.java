package conference.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.EtcDAO;

@Service("etcService")
public class EtcService {
	
	@Resource(name = "etcDAO")
	private EtcDAO etcDAO;
	
	public List<HashMap<String,Object>> selLogList() {
		return etcDAO.selLogList();
	}
	
	public void delLogList() {
		etcDAO.delLogList();
	}
	
	public void insKeyMap(Map<String, Object> map) {
		etcDAO.insKeyMap(map);
	}

	public void insKeyManage(Map<String, Object> map) {
		etcDAO.insKeyManage(map);
	}

	public List<HashMap<String,Object>> selKeyList() {
		return etcDAO.selKeyList();
	}

	public void clearData() {
		etcDAO.clearData();
	}

	
}
