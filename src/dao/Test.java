/**
 * 
 */
package dao;

import bean.*;

/**
 * @author VicP
 * 2018年12月2日
 */
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		DaoManager.getInstance().getMainPageDaoImp().delete(new MainPage());
		TestBean testBean = new TestBean();
		testBean.getMainPage().getMainTitle();

	}

}
