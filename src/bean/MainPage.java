package bean;

import java.io.Serializable;

public class MainPage implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mainTitle, mainImg, mainContent;

	public MainPage() {
	}

	public String getMainTitle() {
		return mainTitle;
	}

	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getMainContent() {
		return mainContent;
	}

	public void setMainContent(String mainContent) {
		this.mainContent = mainContent.replace("\n", "<br>");
	}

	@Override
	public String toString() {
		return "MainPage [mainTitle=" + mainTitle + ", mainImg=" + mainImg + ", mainContent=" + mainContent + "]";
	}
	
	
	
}
