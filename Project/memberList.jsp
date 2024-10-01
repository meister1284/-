<%@page import="Common.JDBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>투표소관리 프로그램</title>
</head>
<body>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
  
    <h2>후보조회</h2>
    <table>
    	<thead>
    		<tr>
    			<th>후보번호</th>
    			<th>성명</th>
    			<th>소속정당</th>
    			<th>학력</th>
    			<th>주민번호</th>
    			<th>지역구</th>
    			<th>대표전화</th>
    		</tr>
    	</thead>
    	<tbody>
    	<%
    	ResultSet rs = null;
    	Statement stmt = null;
    	
    	JDBConnect jdbc = new JDBConnect();
    	
    	try{
    		String sql = "SELECT M.M_NO, M.M_NAME, P.P_NAME, M.P_SCHOOL, M.M_JUMIN, M.M_CITY, "
					+ "COALESCE(P.P_TEL1, '') || '-' || COALESCE(P.P_TEL2, '') || '-' || COALESCE(P.P_TEL3, '') AS TEL_NUMBER "
					+ "FROM TBL_PARTY_202005 P "
					+ "JOIN tbl_member_202005 M ON P.P_CODE = M.P_CODE";
    		stmt = jdbc.con.createStatement();
			rs = stmt.executeQuery(sql);
    		
    		while(rs.next()){
    			String p_school = rs.getString(4);
    			String Jumin = rs.getString(5);
    			String M_jumin = Jumin.substring(0, 6)+"-"+Jumin.substring(6, 12);
    			switch(p_school){
    			case "1":
    				p_school = "고졸";
    				break;
    			case "2":
    				p_school = "학사";
    				break;
    			case "3":
    				p_school = "석사";
    				break;
    			}
	    	%>
    			<tr>
    				<td><%= rs.getString(1) %></td>
    				<td><%= rs.getString(2) %></td>
    				<td><%= rs.getString(3) %></td>
    				<td><%= p_school %></td>
    				<td><%= M_jumin %></td>
    				<td><%= rs.getString(6) %></td>
    				<td><%= rs.getString(7) %></td>
    			</tr>
    			<% 
    		}
    	} catch (SQLException e){
    		e.printStackTrace();
			out.print("데이터 베이스 접속 에러");
		} finally {
			if (rs!=null) rs.close();
			if (stmt != null) stmt.close();
			if(jdbc.con !=null) jdbc.con.close();
		}
    	%>
    	</tbody>
    </table>
    
  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>