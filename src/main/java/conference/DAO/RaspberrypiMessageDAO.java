package conference.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import conference.common.dao.AbstractDAO;

@Repository("raspberrypiMessageDAO")
public class RaspberrypiMessageDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selRaspberrypiMessage() {
		return selectList("raspberrypiMessage.selRaspberrypiMessage");
	}
	
	public void delRaspberrypiMessage(){
		delete("raspberrypiMessage.delRaspberrypiMessage");
	}
	
}
