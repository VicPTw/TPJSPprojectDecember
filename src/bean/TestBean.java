/**
 * 
 */
package bean;

import dao.DaoManager;


/**
 * @author VicP
 * 2018年12月3日
 */
public class TestBean {
	private MainPage mainPage;
	private Partner partner;
	private Service service;
	private SubService subService;
	
	// Constructor
	public TestBean () {
		mainPage = new MainPage();
		partner = new Partner();
		service = new Service();
		subService = new SubService();
	}
	
	public void setInitValue () {
		mainPage.setMainTitle("TestMainTitle");
		mainPage.setMainContent("TestMainContent");
		mainPage.setMainImg("TestMainImg.jpg");
		//partner.setpId(UUID.randomUUID().toString());
		partner.setpTitle("TestpTitle");
		partner.setpContent("TestpContent");
		partner.setpImg("TestpImg.jpg");
		partner.setpLink("TestpLink.com");
		service.setsId("TestsId");
		service.setsTitle("TestsTitle");
		service.setsContent("TestsContent");
		service.setsImg("TestsImg.jpg");
		//subService.setSbId(UUID.randomUUID().toString());
		subService.setSbTitle("TestSbTitle");
		subService.setSbContent("TestSbContent");
		subService.setSbImg("TestSbImg");
		subService.setsId(service.getsId());
	}
	
	public void setUpdateValue () {
		// PK
		mainPage.setMainTitle(getMainPage().getMainTitle());
		mainPage.setMainContent("TestMainContentUpdate");
		mainPage.setMainImg("TestMainImg.jpgUpdate");
		// PK
		partner.setpId(DaoManager.getInstance().getPartnerDaoImp().getRecordById(getPartner().getpTitle()).getpId());
		partner.setpContent("TestpContentUpdate");
		partner.setpImg("TestpImg.jpgUpdate");
		partner.setpLink("TestpLink.comUpdate");
		// PK
		service.setsId(getService().getsId());
		service.setsTitle("TestsTitleUpdate");
		service.setsContent("TestsContentUpdate");
		service.setsImg("TestsImg.jpgUpdate");
		//PK
		subService.setSbId(DaoManager.getInstance().getSubServiceDaoImp().getRecordById(getSubService().getSbTitle()).getSbId());		
		subService.setSbContent("TestSbContentUpdate");
		subService.setSbImg("TestSbImgUpdate");
		subService.setsId(service.getsId());
	}
	
	// bean Getter
	public MainPage getMainPage() {
		return mainPage;
	}

	public Partner getPartner() {
		return partner;
	}

	public Service getService() {
		return service;
	}

	public SubService getSubService() {
		return subService;
	}
	
	// bean setters
	public void setMainPage(MainPage mainPage) {
		this.mainPage = mainPage;
	}

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public void setSubService(SubService subService) {
		this.subService = subService;
	}
	
	
	
}
