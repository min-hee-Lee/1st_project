package common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import easyusers.dto.AuthInfo;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
	
	public AuthCheckInterceptor() {

	}
	
	//로그인 후 화면 보이기
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	
	//로그인 돼있는지 체크(인증됐는지 확인)
	HttpSession session = request.getSession(false);
	
		if(session != null) {
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
			if(authInfo != null) {
				return true;  //로그인 된 상태
			}
		}
		
		//로그인이 안돼있을 경우 다시 로그인 화면이 보이도록 출력
			response.sendRedirect(request.getContextPath() + "/easyuser/login.do");
			return false;
}

@Override
public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
	// TODO Auto-generated method stub
	super.postHandle(request, response, handler, modelAndView);
}

@Override
public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
		throws Exception {
	// TODO Auto-generated method stub
	super.afterCompletion(request, response, handler, ex);
}

}
