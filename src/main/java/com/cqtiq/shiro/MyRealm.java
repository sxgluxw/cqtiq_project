package com.cqtiq.shiro;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.cqtiq.pojo.User;
import com.cqtiq.pojo.TPermission;
import com.cqtiq.pojo.TRole;
import com.cqtiq.service.RealmService;
import com.cqtiq.service.LoginService;

public class MyRealm extends AuthorizingRealm {
	
	@Autowired
	private RealmService realmService;
	
	@Autowired
	private LoginService loginService;
	
    /**
     * 授权
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
    	System.out.println("授权管理······");
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		
		//根据当前用户登录查询角色和权限
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		
		List<TRole> roles = realmService.findByUser(user);
		for (TRole role : roles) {
			simpleAuthorizationInfo.addRole(role.getRolename());
		}
		
		List<TPermission> permissions = realmService.findByPermission(user);
		for (TPermission permission : permissions) {
			simpleAuthorizationInfo.addStringPermission(permission.getPermissionname());
		}
		return simpleAuthorizationInfo;
    }
    /**
     * 认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) authenticationToken;
		
		User user = loginService.findByUsername(usernamePasswordToken.getUsername());
		
		if(user == null){
			//用户不存在
			System.out.println("用户不存在");
			return null;
		}else{
			//用户存在
			System.out.println("用户存在");
			//第一个参数：如果登录成功后 ， 保存在subject中的信息，
			//第三个参数是realm的名称
			return new SimpleAuthenticationInfo(user, user.getPassword(),getName());
		}
    }
}
