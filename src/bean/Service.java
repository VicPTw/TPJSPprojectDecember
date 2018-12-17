package bean;

import java.io.Serializable;

public class Service  implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sId, sTitle, sContent, sImg;

	public Service() {
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		if (sTitle == null) {
			this.sTitle = sTitle;
		} else {
			this.sTitle = EncodeUtil.HTMLEncode(sTitle);
		}
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		if (sContent == null) {
			this.sContent = sContent;
		} else {
			this.sContent = EncodeUtil.HTMLEncode(sContent);
		}
	}

	public String getsImg() {
		return sImg;
	}

	public void setsImg(String sImg) {
		this.sImg = sImg;
	}

	@Override
	public String toString() {
		return "Service [sId=" + sId + ", sTitle=" + sTitle + ", sContent=" + sContent + ", sImg=" + sImg + "]";
	}
	
}
