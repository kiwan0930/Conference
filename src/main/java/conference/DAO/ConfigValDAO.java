package conference.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("configValDAO")
public class ConfigValDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> selConfigVal(){
		return (List<HashMap<String,Object>>) selectList("configVal.selConfigVal");
	}
	
	
	public void setConfigVal(Map<String, Object> map) {
		insert("configVal.setConfigVal", map);
	}
}
