package dao;

import java.util.List;

import bean.MainPage;

/**
*
* @author VicP
*/

public interface MainPageDao extends IDao<MainPage> {

	int save(MainPage t);
	int update(MainPage t);
	int delete(MainPage t);
	List<MainPage> getAllRecords();
	MainPage getRecordById(String id);

}
