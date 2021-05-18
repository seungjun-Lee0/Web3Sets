<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%

   String DRV = "org.mariadb.jdbc.Driver";
   String URL = "jdbc:mariadb://bigdata.cnuqv3vtwjri.ap-northeast-2.rds.amazonaws.com:3306/playground";
   String USR = "playground";
   String PWD = "bigdata2020";

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   String sql = " SELECT DISTINCT sido FROM zipcode ";
   StringBuffer sb = new StringBuffer();

    try {
        Class.forName(DRV);
        conn = DriverManager.getConnection(URL, USR, PWD);
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        while (rs.next()){
            String sido = rs.getString(1);
            sb.append(sido).append(',');
        }
    } catch (Exception ex){
        ex.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) rs.close();
        if(conn != null) rs.close();
    }

    out.write(sb.toString());
%>
