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
  
    <h2>투표검수조회</h2>
	<table>
		<thead>
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
		</thead>
		<%
		ResultSet rs = null;
		
		JDBConnect jdbc = new JDBConnect();
		try{
			String sql = "SELECT V_NAME, "
						+"TO_CHAR(TO_DATE('19'||SUBSTR(V_JUMIN, 1, 6), 'YYYYMMDD'),'YYYYMMDD') AS BIRTHDATE, "
						+"FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19'||SUBSTR(V_JUMIN, 1, 6), 'YYYYMMDD')) / 12) AS AGE, "
						+"CASE "
					    +"WHEN SUBSTR(V_JUMIN, 7, 1) IN '1' THEN '남' "
					    +"WHEN SUBSTR(V_JUMIN, 7, 1) IN '2' THEN '여' "
						+"END AS GENDER, "
						+"M_NO, V_TIME,V_CONFIRM FROM tbl_vote_202005 "
						+"WHERE V_AREA = '제1투표장'";
			jdbc.stmt = jdbc.con.createStatement();
			rs = jdbc.stmt.executeQuery(sql);
			
			while(rs.next()){
				String birthdate = rs.getString(2);
				String b_date = birthdate.substring(0, 4)+"년"+birthdate.substring(4,6)+"월"+birthdate.substring(6,8)+"일";
				String v_time = rs.getString(6);
				String time = v_time.substring(0,2)+":"+v_time.substring(2,4);
				String v_confirm = rs.getString(7);
				switch(v_confirm){
				case "Y":
					v_confirm = "확인";
					break;
				case "N":
					v_confirm = "미확인";
					break;
				}
				%>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= b_date %></td>
					<td>만 <%= rs.getString(3) %>세</td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><%= time %></td>
					<td><%= v_confirm %></td>
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