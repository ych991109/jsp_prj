<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String responseMsg = "error";
	/*
	if(id != null){
		//DAO 객체화
		DAO dao = new DAO();
		
		try{
			boolean isDup = DAO.selectId(id);
			responseMsg = isDup?"duplicate":"available";	//id중복확인
		} catch(SQLException se){
			se.printStackTrace();
		}//try~ca
	}//if
	*/
	out.print(responseMsg);
%>
<%--
//DAO안 코드
public class DAO{
	public DBConnection dbCon = DBConnection.getInstance();
	
	public boolean selectId(String id) throws SQLException{
		boolean resultFlag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = dbCon.getConn();
			String sqlQuery = "select count(*) from tableName where id=?";
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){	//id가 있다면
				resultFlag = rs.getInt(1)>0;
			}//if
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}//try~fi
		
		return resultFlag;
	}
}
--%>
