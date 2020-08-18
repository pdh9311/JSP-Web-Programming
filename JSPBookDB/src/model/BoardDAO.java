package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	// board에 기록된 게시글의 개수 가져오기
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT count(*) FROM board";
		} else {
			sql = "SELECT count(*) FROM board WHERE " + items + " like '%" + text + "%'";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getListCount() 에러: " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return count;
	}
		
	// board에 기록된 게시글 가져오기
	public ArrayList<BoardDTO> getBoardList(int page,int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int totalCount = getListCount(items,text);
		int start = (page -1) * limit;
		int index = start + 1;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT * FROM board ORDER BY num DESC";
		} else {
			sql = "SELECT * FROM board WHERE " + items + " like '%" + text + "%' ORDER BY num DESC";
		}
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// ResultSet의 absolute(int row) 메소드는 지정한 매개값의 위치로 커서가 이동한다.
			while(rs.absolute(index)) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegist_day(rs.getString("regist_day"));
				dto.setIp(rs.getString("ip"));
				list.add(dto);
			
				if(index < (start + limit) && index <= totalCount) { 
					index++; 
				} else {
					break;
				}
			}
			return list;
		} catch (Exception e1) {
			System.out.println("getBoardList() 에러 :" + e1);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				throw new RuntimeException(e2.getMessage());
			}
		}
		
		return null;
	}

	// jsp_member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String name = null;
		String sql = "SELECT name FROM jspbook_member WHERE id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
			if(name != null) { 
				return name;
			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			System.out.println("getLoginNameById() 에러 : " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return null;
	}
	
	// 새 게시글 등록
	public void insertBoard(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO board(id,name,subject,content,hit,regist_day,ip) VALUES(?,?,?,?,?,?,?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getHit());
			pstmt.setString(6, dto.getRegist_day());
			pstmt.setString(7, dto.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBoard() 에러 : " + e.getMessage()); 
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
	}

	// 게시글 상세 페이지 가져오기
	public BoardDTO getBoardByNum(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardDTO board = null;
		
		String sql = "SELECT * FROM board WHERE num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException();
			}
		}
		return null;
	}

	
	// 게시글 수정
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE board SET subject = ?, content = ? WHERE num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1,board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e1) {
				throw new RuntimeException();
			}
			System.out.println("updateBoard() 에러 : "+ e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException();
			}
		}
	}

	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM board WHERE num = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteBoard() 에러 : " + e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException();
			}
		}
		
	}
	
}
