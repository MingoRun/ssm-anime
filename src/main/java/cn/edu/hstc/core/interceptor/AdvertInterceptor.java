package cn.edu.hstc.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.hstc.modular.entity.User;

/**
 * 广告拦截器
 * @author Runming
 *
 */
public class AdvertInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		// 判断session中是否有用户数据，如果有，则返回true，继续向下执行
		if(user!=null) {
			return true;
		}
		
		// 不符合条件的转发到登录页面
		request.getRequestDispatcher("/toFrontIndex.action").forward(request, response);
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
