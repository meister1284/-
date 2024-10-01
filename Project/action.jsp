<%@ page import="java.sql.*"%>
<%@ page import="Common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
  <%	
		JDBConnect jdbc = new JDBConnect();
		
		System.out.print("action.jsp");
		String V_JUMIN = request.getParameter("V_JUMIN");
		String V_NAME = request.getParameter("V_NAME");
		String M_NO = request.getParameter("M_NO");
		String V_TIME = request.getParameter("V_TIME");
		String V_AREA = request.getParameter("V_AREA");
		String V_CONFIRM = request.getParameter("V_CONFIRM");
		
		int result = 0;
		
		try{
			String sql = "INSERT INTO TBL_VOTE_202005 VALUES(?,?,?,?,?,?)";
			PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
			
			pstmt.setString(1,V_JUMIN);
			pstmt.setString(2,V_NAME);
			pstmt.setString(3,M_NO);
			pstmt.setString(4,V_TIME);
			pstmt.setString(5,V_AREA);
			pstmt.setString(6,V_CONFIRM);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			if(result == 1){
				out.print("<script>alert('투표가 정상적으로 완료되었습니다!'); location.href='index.jsp';</script>");
			} else {
				out.print("<script>alert('투표 실패! \n 메인화면으로 이동합니다.'); location.href='index.jsp'; </script>");
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}

%>
  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>