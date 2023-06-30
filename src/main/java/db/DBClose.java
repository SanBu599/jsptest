package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBClose {
	public static void close(PreparedStatement psmt, Connection conn, ResultSet rs) {
		//PreparedStatement 연결상태 체크
			try {
				if(psmt != null) { //객체를 가지고 있다면
					psmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

