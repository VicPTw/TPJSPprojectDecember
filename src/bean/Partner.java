package bean;

import java.io.Serializable;

public class Partner implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String pId, pTitle, pImg, pContent, pLink;

	public Partner() {
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		if (pContent == null) {
			this.pContent = pContent;
		} else {
			this.pContent = pContent.replace("\n", "<br>");
		}
	}

	public String getpLink() {
		return pLink;
	}

	public void setpLink(String pLink) {
		this.pLink = pLink;
	}

	@Override
	public String toString() {
		return "Partner [pId=" + pId + ", pTitle=" + pTitle + ", pImg=" + pImg + ", pContent=" + pContent + ", pLink="
				+ pLink + "]";
	}

}
