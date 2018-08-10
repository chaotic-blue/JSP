<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.member.bean.memberDAO" %>    
<%@ page import="com.member.bean.memberBean" %>

<%
	// MemberInfoAction에서 넘긴 회원정보를 추출한다.
	memberBean member=(memberBean)request.getAttribute("memberInfo");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>현재 회원정보 </title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px dashed green;
        }
        
        td{
            border:1px solid red
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="MainForm.do";
            }else if(val == "0"){
                location.href="MemberModifyFormAction.do";
            }else if(val == "1"){
                location.href="DeleteForm.do";
            }
        }
        
    </script>
    
</head>
<body>
    <%-- <%
        String id = session.getAttribute("sessionID").toString();
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        memberDAO dao = memberDAO.getInstance();
        memberBean memberBean = dao.getUserInfo(id);
    %> --%>
 
        <br><br>
        <b><font size="6" color="gray">나의 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=member.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=member.getPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=member.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td><%=member.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
                    <%=member.getBirthyy() %>년 
                    <%=member.getBirthmm() %>월 
                    <%=member.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=member.getMail1() %>@
                    <%=member.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td>
                	<%=member.getPhone() %>
                </td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=member.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로가기" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>
