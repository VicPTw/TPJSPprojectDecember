/**
 *
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SubService;

/**
 * @author VicP 2018年12月2日
 */
class SubServiceDaoImp extends Common implements SubServiceDao {

    /* (non-Javadoc)
	 * @see dao.IDao#save(java.lang.Object)
     */
    @Override
    public int save(SubService ss) {
        int status = 0;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(
                        "insert into SubService values(DEFAULT,?,?,?,?,DEFAULT)");) {
            //ps.setObject(1, ss.getSbId());
            ps.setString(1, ss.getSbImg());
            ps.setString(2, ss.getSbTitle());
            ps.setString(3, ss.getSbContent());
            ps.setString(4, ss.getsId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    /* (non-Javadoc)
	 * @see dao.IDao#update(java.lang.Object)
     */
    @Override
    public int update(SubService ss) {
        int status = 0;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(
                        "update SubService set Sb_Img=?,Sb_Title=?,Sb_Content=?,S_id=? where Sb_id=?");) {
            ps.setString(1, ss.getSbImg());
            ps.setString(2, ss.getSbTitle());
            ps.setString(3, ss.getSbContent());
            ps.setString(4, ss.getsId());
            ps.setString(5, ss.getSbId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    /* (non-Javadoc)
	 * @see dao.IDao#delete(java.lang.Object)
     */
    @Override
    public int delete(SubService ss) {
        int status = 0;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("delete from SubService where Sb_Title=?");) {
            ps.setString(1, ss.getSbTitle());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    /* (non-Javadoc)
	 * @see dao.IDao#getAllRecords()
     */
    @Override
    public List<SubService> getAllRecords() {
        List<SubService> list = new ArrayList<SubService>();

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from SubService Order By Sb_Date");
                ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                SubService ss = new SubService();
                ss.setSbId(rs.getString("Sb_id"));
                ss.setSbImg(rs.getString("Sb_Img"));
                ss.setSbTitle(rs.getString("Sb_Title"));
                ss.setSbContent(rs.getString("Sb_Content"));
                ss.setsId(rs.getString("S_id"));
                list.add(ss);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /* (non-Javadoc)
	 * @see dao.IDao#getRecordById(java.lang.String)
     */
    @Override
    public SubService getRecordById(String title) {
        SubService ss = null;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from SubService where Sb_Title=?");) {
            ps.setString(1, title);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ss = new SubService();
                ss.setSbId(rs.getString("Sb_id"));
                ss.setSbImg(rs.getString("Sb_Img"));
                ss.setSbTitle(rs.getString("Sb_Title"));
                ss.setSbContent(rs.getString("Sb_Content"));
                ss.setsId(rs.getString("S_id"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return ss;
    }

    @Override
    public List<SubService> getAllRecordsByRef(String sId) {
        List<SubService> list = new ArrayList<SubService>();
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from SubService where S_id=? Order By Sb_Date");) {
            ps.setString(1, sId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubService ss = new SubService();
                ss.setSbId(rs.getString("Sb_id"));
                ss.setSbImg(rs.getString("Sb_Img"));
                ss.setSbTitle(rs.getString("Sb_Title"));
                ss.setSbContent(rs.getString("Sb_Content"));
                ss.setsId(rs.getString("S_id"));
                list.add(ss);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
