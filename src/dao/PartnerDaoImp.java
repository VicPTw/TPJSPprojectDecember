package dao;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.Partner;

/**
 *
 * @author VicP
 */
class PartnerDaoImp extends Common implements PartnerDao {

    @Override
    public int save(Partner p) {
        int status = 0;
        //Connection test = null;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(
                        "insert into Partner values(DEFAULT,?,?,?,?)");) {
            //ps.setObject(1, p.getpId());
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpImg());
            ps.setString(3, p.getpContent());
            ps.setString(4, p.getpLink());
            status = ps.executeUpdate();
            //test = con;

        } catch (Exception e) {
            System.out.println(e);
        }
        /* ***Test if connection is closed***
        try {
            System.out.println("if connection is closed: " + test.isClosed());
        } catch (SQLException ex) {
            Logger.getLogger(PartnerDaoImp.class.getName()).log(Level.SEVERE, null, ex);
        }
         */
        return status;
    }

    @Override
    public int update(Partner p) {
        int status = 0;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(
                        "update Partner set P_Title=?,P_Img=?,P_Content=?,P_Link=? where P_id=?");) {
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpImg());
            ps.setString(3, p.getpContent());
            ps.setString(4, p.getpLink());
            ps.setString(5, p.getpId());
            status = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    @Override
    public int delete(Partner p) {
        int status = 0;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("delete from Partner where P_Title=?");) {
            ps.setString(1, p.getpTitle());
            status = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    @Override
    public List<Partner> getAllRecords() {
        List<Partner> list = new ArrayList<Partner>();

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from Partner");
                ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                Partner p = new Partner();
                p.setpId(rs.getString("P_id"));
                p.setpTitle(rs.getString("P_Title"));
                p.setpImg(rs.getString("P_Img"));
                p.setpContent(rs.getString("P_Content"));
                p.setpLink(rs.getString("P_Link"));
                list.add(p);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public Partner getRecordById(String title) {
        Partner p = null;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from Partner where P_Title=?");) {
            ps.setString(1, title);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p = new Partner();
                p.setpId(rs.getString("P_id"));
                p.setpTitle(rs.getString("P_Title"));
                p.setpImg(rs.getString("P_Img"));
                p.setpContent(rs.getString("P_Content"));
                p.setpLink(rs.getString("P_Link"));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }

}
