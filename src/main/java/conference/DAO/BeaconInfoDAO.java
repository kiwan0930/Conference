package conference.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("beaconInfoDAO")
public class BeaconInfoDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selBeaconInfoList() {
		return selectList("beaconInfo.selBeaconInfoList");
	}

	public void insBeaconInfo(Map<String, Object> map) {
		insert("beaconInfo.insBeaconInfo", map);
	}

}
