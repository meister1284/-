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
   <script src = "script.js"></script>
   <style> 
   td {
    padding-left: 10px;
    text-align:left;
    }
   </style>
  
    <h2>투표하기</h2>
<form name="frm" method="post" action="action.jsp"> 
<table>
<%
System.out.println("voteMember.jsp");
%>

    <tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="V_JUMIN" autofocus>
			예 : 8906153154726
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
				<input type="text" name="V_NAME">	
			</td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
			<select name="M_NO">
			<option value=""></option>
			<option value="1">[1]김후보</option>			
			<option value="2">[2]이후보</option>			
			<option value="3">[3]박후보</option>			
			<option value="4">[4]조후보</option>			
			<option value="5">[5]최후보</option>			
			</select>
			</td> 
		</tr>
		<tr>
			<th>투표시간</th>
			<td>
			<input type="text" name="V_TIME" placeholder="예)0930">
			</td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td>
			<input type="text" name="V_AREA" placeholder="예)제1투표장">
			</td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
			 <input type ="radio" name ="V_CONFIRM" value ="Y" checked> 확인
             <input type ="radio" name ="V_CONFIRM" value ="N"> 미확인
			</td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
			<button class="btn" type="submit" onclick="fn_submit(); return false;">투표하기</button>
			<button class="btn" type="button" onclick="fn_reset();" >다시하기</button>
			</td>			
		</tr>	
 	
</table>
</form>
  </section>
  <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>