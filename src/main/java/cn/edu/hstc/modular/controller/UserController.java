package cn.edu.hstc.modular.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.edu.hstc.core.common.Constants;
import cn.edu.hstc.core.common.Result;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.hstc.modular.entity.User;
import cn.edu.hstc.modular.service.UserService;

/**
 * 用户控制器类
 * @author xurunming
 * @date 2020-10-26
 */
@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger log = Logger.getLogger(UserController.class);

	//注入依赖
	@Autowired
	private UserService userService;

    /**
     * 后台管理 - 登录
     * @param loginName
     * @param password
     * @param session
     * @return
     */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Result login(String loginName,String password,HttpSession session) {

		try {
			// 1.创建令牌
			UsernamePasswordToken token = new UsernamePasswordToken(loginName, password);
			// 2.获取主题subject
			Subject subject = SecurityUtils.getSubject();
			// 3.执行login方法
			subject.login(token);
			User user = (User) subject.getPrincipal();
			session.setAttribute("user", user);
			return Result.build(Constants.SUCCESS, "OK");
		}catch (AuthenticationException e) {
			log.error("用户登录异常：" + e);
			e.printStackTrace();
			return Result.error("账号或密码错误",null);
		}
	}

    /**
     * 后台管理 - 首页跳转
     * @return
     */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
    public String toIndex() {

	    return "bgsystem/admin/index";
    }
	
	/**
	 * 展示所有用户信息
	 */
	/*@RequestMapping("/showUserList.action")
	public String showUserList(User user,
			@RequestParam(value="sex",defaultValue="")String sex,
			@RequestParam(value="loginname",defaultValue="")String loginname,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize,
			HttpServletRequest request,
			HttpSession session,
			Model model) {
		user.setLoginName(loginname);
		user.setUserSex(sex);
		
		PageHelper.startPage(pageNum,pageSize);
		List<User> userList = userService.selectUserAll(user);
		PageInfo pageInfo = new PageInfo<>(userList);
		
		session = request.getSession();
		session.setAttribute("userPageInfo", pageInfo);
		
		//参数回显
		model.addAttribute("loginname", loginname);
		model.addAttribute("sex", sex);
		
		return "bgsystem/admin/user/user-list";
	}*/
	
	/**
	 * 根据id查询用户
	 */
	@RequestMapping("/selectUserById.action")
	public String showUserById(@RequestParam("userId")int userId,Model model) {
		User user = userService.selectUserById(userId);
		if(user!=null) {
			model.addAttribute("user", user);
			return "bgsystem/admin/user/user-info";
		}else {
			return "bgsystem/admin/404";
		}
	}
	
	/**
	 * 根据id删除用户
	 */
	@RequestMapping("/deleteUserById.action")
	@ResponseBody
	public String deleteUserById(@RequestParam("userId")int userId) {
		
		int rows = userService.deleteUserById(userId);
		
		if(rows>0) {
			return "OK";
		}else {
			return "FAIL";
		}
		
	}
	
	/**
	 * 前台用户注册
	 */
	@RequestMapping("/registerUser.action")
	public String registerUser(User user,Model model) {
		//加密方式
		String algorithmName = "MD5";
		//明文密码
		Object source = user.getPassword();
		//盐值
		ByteSource salt = ByteSource.Util.bytes(String.valueOf(user.getLoginName()));
		int hashIterations = 1024;
		//加密后的密码
		String pwd = new SimpleHash(algorithmName, source, salt, hashIterations).toHex();
		user.setPassword(pwd);
		
		int rows = userService.addUser(user);
		
		if(rows>0) {
			model.addAttribute("msg", "注册成功");
			return "redirect:/fg/index.action";
		}else {
			model.addAttribute("msg", "注册失败");
			return "redirect:/toFrontIndex.action";
		}
		
	}
	
	/**
	 * 前台用户登录
	 */
	/*@RequestMapping("/userLogin.action")
	@ResponseBody
	public JSONObject userLogin(@RequestParam("loginname")String loginname,@RequestParam("password")String password,HttpServletRequest request,HttpSession session,Model model) {
		//要返回的json格式对象
		JSONObject js = new JSONObject();
		//封装前台用户传过来的值
		User user = new User();
		//登录名验证规则
		String regLoginName = "[\\u4e00-\\u9fa5a-zA-Z]{3,}";
		//手机号验证规则
		String regUserPhone = "^1[0-9]{10}$";
		//邮箱验证规则
		String regUserMail = "^[A-Za-z\\d]+([-_.][A-Za-z\\d]+)*@([A-Za-z\\d]+[-.])+[A-Za-z\\d]{2,4}$";
 		boolean loginNameRegEx = loginname.matches(regLoginName);
 		boolean userPhoneRegEx = loginname.matches(regUserPhone);
 		boolean userMailRegEx = loginname.matches(regUserMail);
		//判断是否是登录名
		if(loginNameRegEx) {
			user.setLoginName(loginname);
		}else if(userPhoneRegEx) {
			user.setUserPhone(loginname);
		}else if(userMailRegEx) {
			user.setUserMail(loginname);
		}
		//加密方式
		String algorithmName = "MD5";
		//明文密码
		Object source = password;
		//盐值
		ByteSource salt;
		int hashIterations = 1024;
		//校验用户
		User user1 = userService.checkUser(user);
		if(user1==null) {
			js.put("FLAG", 1);
			return js;
		}else{
			salt = ByteSource.Util.bytes(String.valueOf(user1.getLoginName()));
			//加密后的密码
			String pwd = new SimpleHash(algorithmName, source, salt, hashIterations).toHex();
			if(!user1.getPassword().equals(pwd)){
				js.put("FLAG", 2);
				return js;
			}else {
				session = request.getSession();
				session.setAttribute("user", user1);
				js.put("FLAG", 0);
				return js;
			}
		}
	}*/
	
	/**
	 * 前台用户退出
	 */
	@RequestMapping("/userLogout.action")
	public String userLogout(HttpServletRequest request,HttpSession session) {
		session.removeAttribute("user");
		/*session.invalidate();*/
		return "redirect:/toFrontIndex.action";
	}
	
	/**
	 * 更新用户信息后重新刷新用户信息
	 */
	@RequestMapping(value="/toGetUser.action",method=RequestMethod.GET)
	public ModelAndView toGetUser(int userId,HttpServletRequest request,HttpSession session) {
		User user = userService.selectUserById(userId);
		session = request.getSession();
		session.setAttribute("user", user);
		return  new ModelAndView("redirect:/user_toCenter.action?userId="+userId);
	}
	
	/**
	 * 删除本地用户头像
	 */
	public void delUserPortrait(int userId) {
		String url = userService.selectPortraitById(userId);
		String path = "E:/images"+url;
		
		File file = new File(path);
		//判断图片文件是否存在
		if(file.exists()&&file.isFile()) {
			Boolean successDel = file.delete();
			if(successDel) {
				System.out.println("删除用户头像成功！");
			}else {
				System.out.println("删除用户头像失败！");
			}
		}else {
			System.out.println("删除用户头像失败！");
		}
	}
	
	/**
	 * 更新用户信息
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	/*@RequestMapping("/updateUser.action")
	@ResponseBody
	public JSONObject updateUser(User user,@RequestParam("file")MultipartFile file,@RequestParam("newPassword")String password) throws IllegalStateException, IOException {
		JSONObject js = new JSONObject();
		//判断密码不为空
		if(password!=null&&!"".trim().equals(password)) {
			//加密密码
			//加密方式
			String algorithmName = "MD5";
			//明文密码
			Object source = password;
			//盐值
			ByteSource salt = ByteSource.Util.bytes(String.valueOf(user.getLoginName()));;
			int hashIterations = 1024;
			//加密后的密码
			String pwd = new SimpleHash(algorithmName, source, salt, hashIterations).toHex();
			user.setPassword(pwd);
		}
		//判断上传头像图片是否存在
		if(!file.isEmpty()&&file.getSize()>0) {
			//删除本地原先用户头像
			delUserPortrait(user.getUserId());
			//获取上传图片的原始名字
			String originalFilename = file.getOriginalFilename();
			//设置上传图片的图片服务器地址
			String dirPath = "E:\\images\\user\\";
			
			//使用UUID重新命名上传头像图片名字
			String newFilename = UUID.randomUUID()+"_"+originalFilename;
			//使用MultipartFile接口的方式上传到指定的目录
			file.transferTo(new File(dirPath+newFilename));
			
			user.setUserPortraitUrl("/user/"+newFilename);
		}
		
		int rows = userService.updateUser(user);
		
		if(rows>0) {
			if(password!=null&&!"".trim().equals(password)) {
				js.put("FLAG", 2);
			}else {
				js.put("FLAG", 1);
			}
			return js;
		}else {
			js.put("FLAG", 0);
			return js;
		}
	}*/
}
