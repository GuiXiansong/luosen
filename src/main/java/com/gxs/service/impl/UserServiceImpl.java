package com.gxs.service.impl;

import com.gxs.dao.UserDao;
import com.gxs.pojo.User;
import com.gxs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-17 12:19 AM
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User login(String username) {
        return userDao.login(username);
    }

    @Override
    public User findByName(String username) {
        return userDao.findByName(username);
    }

    @Override
    public void changePasswordByUsername(String username, String password) {
        userDao.changePasswordByUsername(username,password);
    }
}
