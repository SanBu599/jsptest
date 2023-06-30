package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

import db.DBClose;
import db.DBConnection;

public class CustomerDao {

	private static CustomerDao dao = null;
	
	public CustomerDao() {
		DBConnection.initConnection();
	}
	
	public static CustomerDao getInstance() {
		if(dao == null) {
			dao = new CustomerDao();	// 1번만 실행!
		}
		return dao;
	}
	
	public boolean getId(String id) {
		String sql = "select*"
				+"		from customer"
				+"		where id=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0 ;
		
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count += rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		
	}
	return count>0?true:false;
	}
}
