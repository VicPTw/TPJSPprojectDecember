package dao;

import bean.MainPage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VicP
 */
class MainPageDaoImp extends Common implements MainPageDao {

    @Override
    public int save(MainPage mp) {
        int status = 0;
        try {
            try (
                    Connection con = getConnection();
                    PreparedStatement ps = con.prepareStatement(
                            "insert into MainPage values(?,?,?)");) {
                ps.setString(1, mp.getMainTitle());
                ps.setString(2, mp.getMainImg());
                ps.setString(3, mp.getMainContent());
                status = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    @Override
    public int update(MainPage mp) {
        int status = 0;
        try {
            try (
                    Connection con = getConnection();
                    PreparedStatement ps = con.prepareStatement(
                            "update MainPage set MainImg=?,MainContent=? where MainTitle=?");) {
                ps.setString(1, mp.getMainImg());
                ps.setString(2, mp.getMainContent());
                ps.setString(3, mp.getMainTitle());

                status = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    @Override
    public int delete(MainPage mp) {
        int status = 0;
        try {
            try (
                    Connection con = getConnection();
                    PreparedStatement ps = con.prepareStatement("delete from MainPage where MainTitle=?");) {
                ps.setString(1, mp.getMainTitle());
                status = ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    @Override
    public List<MainPage> getAllRecords() {
        List<MainPage> list = new ArrayList<MainPage>();

        try {
            try (
                    Connection con = getConnection();
                    PreparedStatement ps = con.prepareStatement("select * from MainPage");
                    ResultSet rs = ps.executeQuery();) {
                while (rs.next()) {
                    MainPage mp = new MainPage();
                    mp.setMainTitle(rs.getString("MainTitle"));
                    mp.setMainImg(rs.getString("MainImg"));
                    mp.setMainContent(rs.getString("MainContent"));
                    list.add(mp);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public MainPage getRecordById(String id) {
        MainPage mp = null;
        try {
            try (
                    Connection con = getConnection();
                    PreparedStatement ps = con.prepareStatement("select * from MainPage where MainTitle=?");) {
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    mp = new MainPage();
                    mp.setMainTitle(rs.getString("MainTitle"));
                    mp.setMainImg(rs.getString("MainImg"));
                    mp.setMainContent(rs.getString("MainContent"));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mp;
    }
}
