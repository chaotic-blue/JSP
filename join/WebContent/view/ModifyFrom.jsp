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
    <%-- <%
        String id = session.getAttribute("sessionID").toString();
    
        memberDAO dao = memberDAO.getInstance();
        memberBean memberBean = dao.getUserInfo(id);
    %> --%>
    
    
 
    <title>회원정보 수정화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
    
        function init(){
            setComboValue("<%=member.getMail2()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>
    
</head>
<body onload="init()">
 
        <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="MemberModifyAction.do" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td id="title"><%=member.getId() %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=member.getPassword()%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
            <table>
 
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
                        <input type="text" name="mail1" maxlength="50" 
                            value="<%=member.getMail1() %>">
                        @
                        <select name="mail2" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value="<%=member.getPhone() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text"  name="address" size="60" value="<%=member.getAddress() %>"/>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="submit" value="수정">  
            <input type="button" value="취소" onclick="javascript:window.location='MainForm.do'">
            
        </form>
        
</body>
</html>

