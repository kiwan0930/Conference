package conference.DAO;

import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("keyMatchDAO")
public class KeyMatchDAO extends AbstractDAO{
	
	public void insKeyMatch(Map<String, Object> map) {
		insert("keyMatch.insKeyMatch",map);	
	}
	
	public void insKeyManage(Map<String, Object> map) {
		insert("keyMatch.insKeyManage",map);	
	}
	
	
}
