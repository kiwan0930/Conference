package conference.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("quartzDAO")
public class QuartzDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> selList() {
		return (List<HashMap<String,Object>> )selectList("quartz.selList");	
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> selStatus(Map<String, Object> map) {
		return (List<HashMap<String,Object>> )selectList("quartz.selStatus",map);	
	}
	
	
	public void setStart(Map<String, Object> map){
		update("quartz.setStart", map);
	}
	
	public void setUpdate(Map<String, Object> map){
		update("quartz.setUpdate", map);
	}
	
	public void setEnd(Map<String, Object> map){
		update("quartz.setEnd", map);
	}
	

	
}

