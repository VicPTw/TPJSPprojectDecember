package bean;

import java.io.Serializable;

public class SubService implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sbId, sbImg, sbTitle, sbContent, sId;

	public SubService() {
	}

	public String getSbId() {
		return sbId;
	}

	public void setSbId(String sbId) {
		this.sbId = sbId;
	}

	public String getSbImg() {
		return sbImg;
	}

	public void setSbImg(String sbImg) {
		this.sbImg = sbImg;
	}

	public String getSbTitle() {
		return sbTitle;
	}

	public void setSbTitle(String sbTitle) {
		this.sbTitle = sbTitle;
	}

	public String getSbContent() {
		return sbContent;
	}

	public void setSbContent(String sbContent) {
		this.sbContent = sbContent;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	@Override
	public String toString() {
		return "SubService [sbId=" + sbId + ", sbImg=" + sbImg + ", sbTitle=" + sbTitle + ", sbContent=" + sbContent
				+ ", sId=" + sId + "]";
	}
	

}
