
package dao;

import bean.SubService;
import java.util.List;

/**
 *
 * @author VicP
 */
public interface SubServiceDao extends IDao<SubService> {
    List<SubService> getAllRecordsByRef(String sId);
}
