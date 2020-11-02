package cn.edu.hstc.core.realm;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;

public class UserRealmTest {

    @Test
    public void doGetAuthenticationInfo() {
        //加密方式
        String algorithmName = "MD5";
        //明文密码
        Object source = "123456";
        //盐值
        ByteSource salt = ByteSource.Util.bytes("mingoxu");
        int hashIterations = 1024;
        //加密后的密码
        String pwd = new SimpleHash(algorithmName, source, salt, hashIterations).toHex();
        System.out.println(pwd);
    }
}