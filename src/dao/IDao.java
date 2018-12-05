package dao;

import java.util.List;

/**
 *
 * @author VicP
 * @param <T>
 */
public interface IDao<T> {
    int save (T t);
    int update (T t);
    int delete (T t);
    List<T> getAllRecords();
    T getRecordById(String id);
}
