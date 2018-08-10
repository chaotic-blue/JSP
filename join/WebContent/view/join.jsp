<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원가입</title>
    
	<style type="text/css">
		
		table{

			margin-left:auto; 
			margin-right:auto;
			border:3px dashed Green;
			text-align : center;
		}
		
		td{
			text-align : left;
			border:2px solid red;
		}
		
		#title{
			background-color:#aaaadd;
		}
    </style>
    
    
    <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
        
        function goMainForm() { /* 취소버튼 누르면 MainForm화면으로 가는 함수 정의 */
            location.href="MainForm.jsp";
        }

    </script>
    
</head>
<body>
    <div id="wrap">
        <br><br>
        <p style="text-align:center; color: gray; font-size: 40px">회원가입</p>
 
        
        <form method="post" action="MemberJoinAction.do" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="15">&nbsp;&nbsp;&nbsp;
                        <!-- <input type="button" value="중복확인" >  -->
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="25">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(ex:1990)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1월</option>
                            <option value="02" >2월</option>
                            <option value="03" >3월</option>
                            <option value="04" >4월</option>
                            <option value="05" >5월</option>
                            <option value="06" >6월</option>
                            <option value="07" >7월</option>
                            <option value="08" >8월</option>
                            <option value="09" >9월</option>
                            <option value="10" >10월</option>
                            <option value="11" >11월</option>
                            <option value="12" >12월</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="30">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" />
                         	<font size="2" color="gray">( - 제외 입력 ) </font>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address"/>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입">  
            <input type="button" value="취소" onclick="goMainForm()">
        </form>
    </div>
</body>
</html>