/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Service;

/**
 * @author VicP 2018年12月2日
 */
class ServiceDaoImp extends Common implements ServiceDao {

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IDao#save(java.lang.Object)
	 */
	@Override
	public int save(Service s) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into Service values(?,?,?,?)");
			ps.setString(1, s.getsId());
			ps.setString(2, s.getsTitle());
			ps.setString(3, s.getsContent());
			ps.setString(4, s.getsImg());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IDao#update(java.lang.Object)
	 */
	@Override
	public int update(Service s) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update Service set S_Title=?,S_Content=?,S_Img=? where S_id=?");
			ps.setString(1, s.getsTitle());
			ps.setString(2, s.getsContent());
			ps.setString(3, s.getsImg());
			ps.setString(4, s.getsId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IDao#delete(java.lang.Object)
	 */
	@Override
	public int delete(Service s) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from Service where S_id=?");
			ps.setString(1, s.getsId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IDao#getAllRecords()
	 */
	@Override
	public List<Service> getAllRecords() {
		List<Service> list = new ArrayList<Service>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Service");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Service s = new Service();
				s.setsId(rs.getString("S_id"));
				s.setsTitle(rs.getString("S_Title"));
				s.setsContent(rs.getString("S_Content"));
				s.setsImg(rs.getString("S_Img"));
				list.add(s);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IDao#getRecordById(java.lang.String)
	 */
	@Override
	public Service getRecordById(String id) {
		Service s = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from Service where S_id=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Service();
				s.setsId(rs.getString("S_id"));
				s.setsTitle(rs.getString("S_Title"));
				s.setsContent(rs.getString("S_Content"));
				s.setsImg(rs.getString("S_Img"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

}
