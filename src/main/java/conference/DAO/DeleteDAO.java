package conference.DAO;

import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("deleteDAO")
public class DeleteDAO extends AbstractDAO{

	public void delClearData() {
		delete("delete.clearData");
	}

	public void delConference(Map<String, Object> map) {
		delete("delete.delConference", map);
	}
}
