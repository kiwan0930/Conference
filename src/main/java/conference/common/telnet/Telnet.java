package conference.common.telnet;

import java.io.IOException;
import java.io.InputStream;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

import conference.common.configure.ConfigVal;

public class Telnet {
	String host;
	String user = ConfigVal.rasp_ID;
	String password = ConfigVal.rasp_Pass;

	public static final String REBOOT = "sudo python /home/pi/conf/reboot.py";
	public static final String SHUTDOWN = "sudo python /home/pi/conf/shutdown.py";

	public void setIp(String host_ip) {
		this.host = host_ip;
	}

	public void command(String cmd) throws JSchException, IOException {
		java.util.Properties config = new java.util.Properties();
		config.put("StrictHostKeyChecking", "no");
		JSch jsch = new JSch();
		Session session = jsch.getSession(user, host, 22);
		session.setPassword(password);
		session.setConfig(config);
		session.connect();

		Channel channel = session.openChannel("exec");
		((ChannelExec) channel).setCommand(cmd);
		channel.setInputStream(null);
		((ChannelExec) channel).setErrStream(System.err);

		InputStream in = channel.getInputStream();
		channel.connect();

		byte[] tmp = new byte[1024];
		while (true) {
			while (in.available() > 0) {
				int i = in.read(tmp, 0, 1024);
				if (i < 0)
					break;
				System.out.print(new String(tmp, 0, i));
			}
			if (channel.isClosed()) {
				System.out.println("exit-status: " + channel.getExitStatus());
				break;
			}
			try {
				Thread.sleep(1000);
			} catch (Exception ee) {
			}
		}
		channel.disconnect();
		session.disconnect();

	}
}
