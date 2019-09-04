<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
	String name = request.getParameter("name");
	// name 이라는 값을 데이터베이스에 연결을 하여 저장을 해야함!!!
	 // 위 데이터를 데이터 베이스에 넣기
     Connection conn = null;                        
     Boolean connect = false;
                        
     try {        
           Context init = new InitialContext();
           DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
           conn = ds.getConnection();
                        
           String sql = "INSERT INTO test (name) VALUES(?)";
           PreparedStatement pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, name);
           pstmt.executeUpdate();
      } catch (Exception e) {
    	  e.getStackTrace();
      }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %> 님의 데이터를 저장하였습니다.<br>
<a href="view.jsp">입력된 데이터들 보기</a>
</body>
</html>