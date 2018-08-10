package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import com.member.bean.memberDAO;


//회원삭제를 처리하는 Action 클래스 부분!!
public class MemberDeleteAction implements Action
{
 
    @Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        ActionForward forward = new ActionForward();
        
        // 세션이 가지고있는 로그인한 ID 정보를 가져온다
        HttpSession session = request.getSession();
        String id = session.getAttribute("sessionID").toString();
        String password = request.getParameter("password");
        
        memberDAO dao = memberDAO.getInstance();
        int check = dao.deleteMember(id, password);
        
        if(check == 1){
            session.invalidate(); // 회원정보 담긴 세션 삭제
            forward.setRedirect(true);
            forward.setNextPath("Result.do");
        }
        else{
            System.out.println("회원 삭제 실패");
            return null;
        }
        
        return forward;
    }
}
