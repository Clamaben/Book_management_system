package com.zhongruan.book_management_system.service.Userservice.Impl;

import com.zhongruan.book_management_system.dao.IUserDao;
import com.zhongruan.book_management_system.entity.User;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public User getUserByid(User user) {
        return userDao.getUserById(user.getId());
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 根据Spring Security传给我们的用户名去数据库中获取出该用户名对应的账号密码和角色权限信息，
        // 并将我们获取到的账号、密码、角色权限信息、构建出一个Spring Security定义好的User对象
        // Spring Security会维护我们返回的这个对象
        // Spring Security帮助我们完成登录校验的这个动作我们称之为认证
        org.springframework.security.core.userdetails.User securityUser = null;
        //UserInfo就是我们新的数据库用户表实体类
        User myUser = userDao.getByUsername(username);
        if (myUser == null) {
            throw new UsernameNotFoundException("user not found");
        }
        //此处的List存放的是数据对应的Role实体类的对象
        //此处的List存放的Spring Security定义的权限对象，因此我们要做的事情就是将上面列表中对象
        // 构造成为下面的列表中对象
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        String[] roles = myUser.getRole().split(",");
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role));
        }
        //构造的规则是将Role的name字段前面加上"ROLE_"前缀，并以此为参数创建出SimpleGrantedAUthority对象
        securityUser = new org.springframework.security.core.userdetails.User(myUser.getUsername(), myUser.getPassword(), authorities);
        return securityUser;
    }
}
