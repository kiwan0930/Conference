package conference.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("raspberrypiInfoDAO")
public class RaspberrypiInfoDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selConferenceList() {
		return selectList("raspberrypiInfo.selConferenceList");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selRaspberrypiInfoList() {
		return selectList("raspberrypiInfo.selRaspberrypiInfoList");
	}
	
	public void insRaspberrypiInfo(Map<String, Object> map) {
		insert("raspberrypiInfo.insRaspberrypiInfo", map);
	}
}
