package socialapp.src;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Friend {
	@XmlAttribute(name = "userId")
	private int userId;
	@XmlAttribute(name = "accepted")
	private boolean accepted;
	
	public Friend() {
		
	}
	
	public Friend(int id)
	{
		this.userId = id;
		accepted = false;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public boolean isAccepted() {
		return accepted;
	}
	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}
}
