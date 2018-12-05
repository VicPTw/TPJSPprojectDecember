/**
 * 
 */
package dao;


/**
 * @author VicP
 * 2018年12月2日
 */
public class DaoManager {
	private static volatile DaoManager instance;
	private final AdminDao adminDao;
	private final MainPageDao mainPageDaoImp;
	private final PartnerDao partnerDaoImp;
	private final ServiceDao serviceDaoImp;
	private final SubServiceDao subServiceDaoImp;
	
	// Constructor
	private DaoManager() {
		adminDao = new AdminDao();
		mainPageDaoImp = new MainPageDaoImp();
		partnerDaoImp = new PartnerDaoImp();
		serviceDaoImp = new ServiceDaoImp();
		subServiceDaoImp = new SubServiceDaoImp();
	}
	// 限制在單一執行緒運作
	public static DaoManager getInstance() {
		if (instance == null) {
			synchronized (DaoManager.class) {
				if (instance == null ) {
					instance = new DaoManager();
				}
			}
		}
		return instance;
	}
	/*--- Dao Getter ---*/
	public AdminDao getAdminDao() {
		return adminDao;
	}
	public MainPageDao getMainPageDaoImp() {
		return mainPageDaoImp;
	}
	public PartnerDao getPartnerDaoImp() {
		return partnerDaoImp;
	}
	public ServiceDao getServiceDaoImp() {
		return serviceDaoImp;
	}
	public SubServiceDao getSubServiceDaoImp() {
		return subServiceDaoImp;
	}
	
	
}
