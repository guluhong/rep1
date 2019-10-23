package com.turing.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.turing.entity.SysUser;
import com.turing.service.IWxplogin;

@Controller
public class wxpLoginController {

	@Autowired
	private IWxplogin iWxplogin;

	/**
	 * 试验品
	 * @param user
	 * @param response
	 * @return
	 * @throws IOException
	 */
	//注册验证
	@RequestMapping("/registerCheck")
	public String check(SysUser user,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		System.out.println(iWxplogin.registerCheck(user));
		if(!iWxplogin.registerCheck(user)) {
			out.print("false");
			return null;
		}else {
			return "forward:/register";
		}
	}
	
	// 注册
	@RequestMapping("/register")
	public void register(SysUser user, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		int i = iWxplogin.register(user);
		if (i > 0) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('注册成功~');location.href='login.jsp'</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 登录
	@RequestMapping("/login")
	public void login(SysUser sysUser, HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("texthtml;charset=utf-8");
			SysUser sysUserl = iWxplogin.wpxlogin(sysUser);
			if (sysUserl != null) {
				request.getSession().setAttribute("sysUserl", sysUserl);
				out.print("<script>location.href='Main.jsp';</script>");
			} else {
				out.print("<script>alert('账号或密码错误，登录失败!');location.href='login.jsp';</script>");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
