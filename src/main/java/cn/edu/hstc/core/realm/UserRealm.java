package cn.edu.hstc.core.realm;

import cn.edu.hstc.modular.entity.User;
import cn.edu.hstc.modular.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Description 系统管理员登录认证授权realm类
 * @author mingoxu
 * @date 2020-10-26
 */
public class UserRealm extends AuthenticatingRealm {

    //注入UserService类
    @Autowired
    private UserService userService;

    /**
     * 认证
     */
    @Override
    public AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取登录用户的账号名
        String loginName = (String) token.getPrincipal();
        User user = new User();
        user.setLoginName(loginName);

        //根据用户账户名获取用户信息
        List<User> list = userService.getUserInfo(user);
        //待会要返回认证的用户信息
        SimpleAuthenticationInfo info = null;

        //当当前用户信息不为空时才能进行信息认证
        if(list != null && list.size() == 1) {
            user = list.get(0);
            //生成盐值
            ByteSource salt = ByteSource.Util.bytes(user.getLoginName());

            //根据查询到的用户得到相对应的密码
            //Object credentials = user.getPassword();
            //将数据库中的明文密码进行MD5加密
            //SimpleHash sh = new SimpleHash("MD5", credentials, salt, 1024);

            info = new SimpleAuthenticationInfo(user, user.getPassword(), salt, this.getName());
        }

        return info;
    }

    /**
     * 清除缓存
     */
    public void clearCache() {
        PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
        super.clearCache(principals);
    }
}