package conference.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import conference.DAO.BeaconInfoDAO;

@Service("beaconInfoService")
public class BeaconInfoService{

    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="beaconInfoDAO")
    private BeaconInfoDAO beaconInfoDAO;
     
	
	public List<Map<String, Object>> selBeaconInfoList() {
		return beaconInfoDAO.selBeaconInfoList();
	}
	

	public void insBeaconInfo(Map<String, Object> map) {
		beaconInfoDAO.insBeaconInfo(map);
	}
	
	
	
}
