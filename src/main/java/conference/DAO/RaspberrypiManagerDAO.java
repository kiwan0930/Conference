package conference.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("raspberrypiManagerDAO")
public class RaspberrypiManagerDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selManageList() {
		return selectList("raspberrypiManager.selManageList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selRaspberrypimanagerList() {
		return (List<Map<String, Object>> ) selectList("raspberrypiManager.selRaspberrypimanagerList");
	}
	
	public void insRaspberrypimanager(Map<String, Object> map) {
		insert("raspberrypiManager.insRaspberrypimanager", map);
	}
	
}
