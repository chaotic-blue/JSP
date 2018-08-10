package com.member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.member.bean.memberBean;
import com.member.bean.memberDAO;

/**
 * 회원정보 수정작업을 처리하는 Action 클래스
 *
 */
public class MemberModifyAction implements Action
{
 
    @Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        request.setCharacterEncoding("UTF-8"); // 인코딩
        
        ActionForward forward = new ActionForward();
        
        memberDAO dao = memberDAO.getInstance();
        
        // 세션이 가지고있는 로그인한 ID 정보를 가져온다
        HttpSession session = request.getSession();
        String id = session.getAttribute("sessionID").toString();
        
        // 수정할 정보를 자바빈에 세팅한다.
        memberBean member = new memberBean();
        member.setId(id);
        member.setPassword(request.getParameter("password"));
        member.setMail1(request.getParameter("mail1"));
        member.setMail2(request.getParameterValues("mail2")[0]); 
        member.setPhone(request.getParameter("phone"));
        member.setAddress(request.getParameter("address"));
        
        dao.updateMember(member);
 
        forward.setRedirect(true);
           forward.setNextPath("Result.do");
        
           // 회원정보 수정 성공 메시지를 세션에 담는다.
           session.setAttribute("msg", "0");
           
        return forward;
    }
 
}

