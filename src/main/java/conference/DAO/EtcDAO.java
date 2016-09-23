package conference.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("etcDAO")
public class EtcDAO extends AbstractDAO {

	public void insKeyMap(Map<String, Object> map) {
		insert("etc.insKeyMap", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> selLogList() {
		return (List<HashMap<String,Object>> )selectList("etc.selLogList");
	}

	public void delLogList(){
		delete("etc.delLogList");
	}

	public void insKeyManage(Map<String, Object> map) {
		insert("etc.insKeyManage", map);
	}

	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> selKeyList() {
		return (List<HashMap<String,Object>> )selectList("etc.selKeyList");
	}

	public void clearData() {
		delete("etc.clearData");
		
	}

	
	
}
