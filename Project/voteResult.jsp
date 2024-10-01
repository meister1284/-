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
  
    <h2>후보자등수</h2>
    	<table>
		<thead>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
		</thead>
		<%
		ResultSet rs = null;
		
		JDBConnect jdbc = new JDBConnect();
		try{
			String sql = "SELECT M.M_NO, M.M_NAME, COUNT(V.M_NO) AS TOTAL_VOTES "
						+"FROM tbl_vote_202005 V "
						+"JOIN tbl_MEMBER_202005 M ON V.M_NO = M.M_NO "
						+"WHERE V.M_NO IN (1, 2, 3, 4, 5) "
						+"AND V.V_CONFIRM <> 'N' "
						+"group by M.M_NO, M.M_NAME "
						+"ORDER BY TOTAL_VOTES DESC";
			jdbc.stmt = jdbc.con.createStatement();
			rs = jdbc.stmt.executeQuery(sql);
			
			while(rs.next()){

				%>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
				</tr>
				<%
			}
		} catch (SQLException e){
			out.print("데이터 베이스 접속 에러");
		} finally {
			if (rs!=null) rs.close();
			if(jdbc.con !=null) jdbc.con.close();
		}
		%>
		</tbody>
	</table>
  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>