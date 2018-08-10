<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="FirstView.jsp";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>메인 화면</title>
    
    <style>
       /* 
      	 레이아웃 전체 가운데 정렬 태그  - margin:0 auto 0 auto;(시계방향으로 위, 오른쪽, 아래, 왼쪽)
       	 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬이 된다. 
     	 전체를 감싸주는 태그 #wrap 
        */
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        
        #header {
            text-align: center;
            width: 800px;
            height: 40px;
            background-color: #D0A9F5;
            padding: 30px 0px;
        }
        
        #main {
            float: left;
            width: 800px;
            height: 700px;
            background-color: #FFCA6C;
            text-align:center;
            vertical-align: middle;
        }
        #footer {
            clear: left;
            width: 800px;
            height: 60px;
            background-color: #E6E6E6;
        }
    </style>
    
</head>

<body>
 
    <div id="wrap">
        <div id="header"> <!-- 상단부분  -->
            <jsp:include page="Header.jsp" />
        </div>
        <div id="main"> <!-- 중간 메인부분 -->
            <jsp:include page="<%=contentPage%>" />
        </div>
        <div id="footer"> 준우 바보 </div>
    </div>
    
</body>
</html>


