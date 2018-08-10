<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.member.bean.memberBean" %> 
<%@ page import="com.member.bean.memberDAO" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %> <!-- 인코딩 -->
<html>
<head>

    <title>회원가입 정보확인</title>
    <style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px dashed green
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    
    <script type="text/javascript"> /* 회원정보확인 화면에서 확인버튼 누르면 메인화면으로 가기위해 goMainForm()메소드 작성  */
    
    	function goMainForm() {
       		 location.href="../MainForm.jsp";
  		  }
    
    </script> 
    
    
</head>
<body>

<jsp:useBean id="memberBean" class="com.member.bean.memberBean" />
<jsp:setProperty property="*" name="memberBean"/> 

<% 
	memberDAO dao = memberDAO.getInstance();
	dao.insertMember(memberBean);
%>


    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보확인</font></b>
        <br><br>
        <font color="blue"><%=memberBean.getName() %></font>&nbsp;님의 가입을 축하드립니다.
        <br><br>
        
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=memberBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=memberBean.getPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=memberBean.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td>
               		<%=memberBean.getGender() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
               		 <%=memberBean.getBirthyy() %>년 
                	 <%=memberBean.getBirthmm() %>월 
               		 <%=memberBean.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=memberBean.getMail1()%>@
                    <%=memberBean.getMail2()%>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=memberBean.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=memberBean.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="확인" onclick="goMainForm()">
    </div>
</body>
</html>
