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
    public int add(User user) { return userDao.add(user); }

    @Override
    public int deleteById(Integer id) { return userDao.deleteById(id); }

    @Override
    public int updateById(User user) { return userDao.updateById(user); }

    @Override
    public User queryById(User user) { return userDao.queryById(user); }

    @Override
    public User getUserByname(String name) {
        return userDao.getByUsername(name);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        org.springframework.security.core.userdetails.User securityUser;
        User myUser = userDao.getByUsername(username);
        if (myUser == null) {
            throw new UsernameNotFoundException("user not found");
        }
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + myUser.getRole()));
        securityUser = new org.springframework.security.core.userdetails.User(myUser.getUsername(), myUser.getPassword(), authorities);
        return securityUser;
    }
}
