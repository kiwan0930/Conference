package conference.common.migration;


import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.googlecode.flyway.core.Flyway;

public class DbMigration {
    private Log log = LogFactory.getLog(DbMigration.class);
    
    @Resource
    private Flyway flyway;
    
    @PostConstruct
    public void run() {
        log.info("[Start] DbMigration run .. ");
        flyway.migrate();
        log.info("[End] DbMigration run .. ");
    }
    
    
	public Flyway getFlyway() {
		return flyway;
	}
	
	public void setFlyway(Flyway flyway) {
		this.flyway = flyway;
	}
}
