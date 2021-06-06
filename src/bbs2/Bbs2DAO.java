package bbs2;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;



public class Bbs2DAO {

		// dao : 데이터베이스 접근 객체의 약자

	

		private Connection conn; // connection:db에접근하게 해주는 객체

		//private PreparedStatement pstmt;

		private ResultSet rs;



		// mysql 처리부분

		public Bbs2DAO() {

			// 생성자를 만들어준다.

			try {

				String dbURL = "jdbc:mysql://localhost:3306/tomato?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";;

				String dbID = "root";

				String dbPassword = "qnrqjrm03";

				Class.forName("com.mysql.jdbc.Driver");

				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		

		//현재의 시간을 가져오는 함수

		public String getDate() { 

			String SQL = "SELECT NOW()";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				rs = pstmt.executeQuery();

				if(rs.next()) {

					return rs.getString(1);

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

			return ""; //데이터베이스 오류

		}

		

		//bbsID 게시글 번호 가져오는 함수

			public int getNext() { 

				String SQL = "SELECT bbs2ID FROM BBS2 ORDER BY bbs2ID DESC";

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					rs = pstmt.executeQuery();

					if(rs.next()) {

						return rs.getInt(1) + 1;

					}

					return 1;//첫 번째 게시물인 경우

				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; //데이터베이스 오류

			}

			

			//실제로 글을 작성하는 함수

			public int write(String bbs2Title, String userID, String userContent) { 

				String SQL = "INSERT INTO BBS2 VALUES(?, ?, ?, ?, ?, ?)";

				try {

					

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setInt(1, getNext());

					pstmt.setString(2, bbs2Title);                                              //여기 고쳐야함함함 bbs2Title로

					pstmt.setString(3, userID);

					pstmt.setString(4, getDate());

					pstmt.setString(5, userContent);

					pstmt.setInt(6,1);

					

					return pstmt.executeUpdate();

					

				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; //데이터베이스 오류

			}
			
			
			
			


			
			public ArrayList<Bbs2> getList(int pageNumber){ 

				String SQL = "SELECT * FROM BBS2 WHERE bbs2ID < ? and bbs2Available = 1 ORDER BY bbs2ID DESC LIMIT 10";

				ArrayList<Bbs2> list = new ArrayList<Bbs2>();

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);

					rs = pstmt.executeQuery();

					while (rs.next()) {

						Bbs2 bbs2 = new Bbs2();

						bbs2.setBbs2ID(rs.getInt(1));

						bbs2.setBbs2Title(rs.getString(2));

						bbs2.setUserID(rs.getString(3));

						bbs2.setBbs2Date(rs.getString(4));

						bbs2.setBbs2Content(rs.getString(5));

						bbs2.setBbs2Available(rs.getInt(6));

						list.add(bbs2);

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return list; 

			}
			
			//10 단위 페이징 처리를 위한 함수

			public boolean nextPage (int pageNumber) {

				String SQL = "SELECT * FROM BBS2 WHERE bbs2ID < ? and bbs2Available = 1 ORDER BY bbs2ID DESC LIMIT 10";

				ArrayList<Bbs2> list = new ArrayList<Bbs2>();

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);

					rs = pstmt.executeQuery();

					if (rs.next()) {

						return true;

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return false; 		

			}
			
			public Bbs2 getBbs2(int bbs2ID) {

				String SQL = "SELECT * FROM BBS2 WHERE bbs2ID = ?";

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setInt(1, bbs2ID);

					rs = pstmt.executeQuery();

					if (rs.next()) {

						Bbs2 bbs2 = new Bbs2();

						bbs2.setBbs2ID(rs.getInt(1));

						bbs2.setBbs2Title(rs.getString(2));

						bbs2.setUserID(rs.getString(3));

						bbs2.setBbs2Date(rs.getString(4));

						bbs2.setBbs2Content(rs.getString(5));

						bbs2.setBbs2Available(rs.getInt(6));



						return bbs2;

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return null;



			}
			
			//수정 함수

			public int update(int bbs2ID, String bbs2Title, String bbs2Content) {

					String SQL = "UPDATE BBS2 SET bbs2Title = ?, bbs2Content = ? WHERE bbs2ID = ?";

					try {

						PreparedStatement pstmt = conn.prepareStatement(SQL);

						pstmt.setString(1, bbs2Title);

						pstmt.setString(2, bbs2Content);

						pstmt.setInt(3, bbs2ID);

						return pstmt.executeUpdate();



					} catch (Exception e) {

						e.printStackTrace();

					}

					return -1; // 데이터베이스 오류

				}
			//삭제 함수

			public int delete(int bbs2ID) {

				String SQL = "UPDATE BBS2 SET bbs2Available = 0 WHERE bbs2ID = ?";

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);   

					pstmt.setInt(1, bbs2ID);

					return pstmt.executeUpdate();



				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; // 데이터베이스 오류

			}
			
		
			
	}

