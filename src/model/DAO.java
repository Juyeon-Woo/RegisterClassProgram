package model;

import java.sql.*;
import java.util.ArrayList;

public class DAO extends DBConnection {
	private static DAO instance = new DAO();

	public static DAO getInstance() {
		return instance;
	}

	private DAO() {
	}
	
	public String countId() {
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql=null;
		String id=null;
		ResultSet rs = null;
		try {
			conn=getConnection();
			sql="select count(*) from course_tbl";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				id=rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeDBResource(rs,pstmt,conn);
		}
		return id;
	}
	
	
	public ArrayList<lecVO> getLecturer(){
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<lecVO> leclist = new ArrayList<lecVO>();
		try {
			conn=getConnection();
			sql="select idx, name from lecturer_tbl";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			lecVO vo = new lecVO();
			vo.setIdx(Integer.parseInt(rs.getString(1)));
			vo.setName(rs.getString(2));
			leclist.add(vo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		closeDBResource(rs,pstmt,conn);
	}
		return leclist;
	}
	
	public int insertSub(JoinVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int rs = 0;
		try {
			conn = getConnection();
			sql = "insert into course_tbl values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getCredit());
			pstmt.setString(4, vo.getLecturer());
			pstmt.setString(5, vo.getWeek());
			pstmt.setInt(6, vo.getStart_hour());
			pstmt.setInt(7, vo.getEnd_end());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		return rs;
	}
		
	public ArrayList<JoinVO> listall(){
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<JoinVO> listvo = new ArrayList<JoinVO>();
		try {
			conn=getConnection();
			sql="select id,course_tbl.name,course_tbl.credit,"
					+ " lecturer_tbl.name,course_tbl.week,course_tbl.start_hour,"
					+ " course_tbl.end_end from course_tbl JOIN lecturer_tbl "
					+ " ON course_tbl.lecturer=lecturer_tbl.idx order by course_tbl.id asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			JoinVO vo = new JoinVO();
			vo.setId(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setCredit(rs.getInt(3));
			vo.setLecturer(rs.getString(4));
//			vo.setWeek(rs.getInt(5));
			if(rs.getInt(5)==1)
				vo.setWeek("월");
			else if(rs.getInt(5)==2)
				vo.setWeek("화");
			else if(rs.getInt(5)==3)
				vo.setWeek("수");
			else if(rs.getInt(5)==4)
				vo.setWeek("목");
			else
				vo.setWeek("금");
			vo.setStart_hour(rs.getInt(6));
			vo.setEnd_end(rs.getInt(7));
			listvo.add(vo);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		closeDBResource(rs,pstmt,conn);
	}
	return listvo;
}
	
	public JoinVO getSubid(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JoinVO vo = new JoinVO();
		try {
			conn = getConnection();
			sql="select id,course_tbl.name,course_tbl.credit,"
					+ " lecturer_tbl.name,course_tbl.week,course_tbl.start_hour,"
					+ " course_tbl.end_end from course_tbl JOIN lecturer_tbl "
					+ " ON course_tbl.lecturer=lecturer_tbl.idx and id=? ";
					//+ " where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				vo.setId(Integer.parseInt(rs.getString(1)));
				vo.setName(rs.getString(2));
				vo.setCredit(Integer.parseInt(rs.getString(3)));
				vo.setLecturer(rs.getString(4));
				vo.setWeek(rs.getString(5));
				vo.setStart_hour(Integer.parseInt(rs.getString(6)));
				vo.setEnd_end(Integer.parseInt(rs.getString(7)));
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		return vo;
	}
	
	public int updateSub(JoinVO vo) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int rs = 0;
		try {
			conn=getConnection();
			sql="update course_tbl set id=?, name=?, lecturer=?,"
					+ " credit=?, week=?, start_hour=?, end_end=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getLecturer());
			pstmt.setInt(4, vo.getCredit());
			pstmt.setString(5, vo.getWeek());
			pstmt.setInt(6, vo.getStart_hour());
			pstmt.setInt(7, vo.getEnd_end());
			rs=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt,conn);
		}
		return rs;
	}
	public int deleteSub(JoinVO vo) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql=null;
		int rs = 0;
		try {
			conn=getConnection();
			sql="delete from course_tbl where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getId());
			rs=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt,conn);
		}
		return rs;
	}
}
