package com.gxs.dao;

import com.gxs.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-17 12:18 AM
 */
public interface UserDao {
    User login(String username);

    User findByName(String username);

    void changePasswordByUsername(@Param("username") String username,@Param("password") String password);
}
