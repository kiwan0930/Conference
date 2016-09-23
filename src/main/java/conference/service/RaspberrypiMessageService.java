package conference.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import conference.DAO.RaspberrypiMessageDAO;
import conference.common.dao.AbstractDAO;

@Service("raspberrypiMessageService")
public class RaspberrypiMessageService extends AbstractDAO {

	@Resource(name = "raspberrypiMessageDAO")
	private RaspberrypiMessageDAO raspberrypiMessageDAO;

	public List<Map<String, Object>> selRaspberrypiMessage() {
		return raspberrypiMessageDAO.selRaspberrypiMessage();
	}
	
	public void delRaspberrypiMessage(){
		raspberrypiMessageDAO.delRaspberrypiMessage();
	}
}
