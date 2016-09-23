package conference.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("detectiveLogDAO")
public class DetectiveLogDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selConfBeaconList(Map<String, Object> map) {
		return selectList("detectiveLog.selConfBeaconList",map);
	}

	public void delDetectiveLog() {
		delete("detectiveLog.delDetectiveLog");
	}
	
}
