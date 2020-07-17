package com.gxs.dao;

import com.gxs.pojo.Member;
import com.gxs.pojo.PageBean;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-18 4:48 PM
 */
public interface MemberDao {
    List<Member> findAll();

    void addMember(Member member);

    void deleteMember(Long id);

    void deleteId();

    void addId();

    int selectCount();

    List<Member> findByPage(HashMap<String, Object> map);

    Member findMemberById(Long id);

    void modifyMember(Member member);
}