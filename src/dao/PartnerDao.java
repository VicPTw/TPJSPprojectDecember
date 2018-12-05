/**
 * 
 */
package dao;

import java.util.List;

import bean.Partner;

/**
 * @author VicP
 * 2018年12月2日
 */
public interface PartnerDao extends IDao<Partner> {

	/* (non-Javadoc)
	 * @see dao.IDao#save(java.lang.Object)
	 */
	@Override
	public int save(Partner p);

	/* (non-Javadoc)
	 * @see dao.IDao#update(java.lang.Object)
	 */
	@Override
	public int update(Partner p);

	/* (non-Javadoc)
	 * @see dao.IDao#delete(java.lang.Object)
	 */
	@Override
	public int delete(Partner p);

	/* (non-Javadoc)
	 * @see dao.IDao#getAllRecords()
	 */
	@Override
	public List<Partner> getAllRecords();
	/* (non-Javadoc)
	 * @see dao.IDao#getRecordById(java.lang.String)
	 */
	@Override
	public Partner getRecordById(String id);

}
