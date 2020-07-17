package com.gxs.controller;

import com.gxs.pojo.Employee;
import com.gxs.pojo.Member;
import com.gxs.pojo.PageBean;
import com.gxs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-18 4:48 PM
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    /**
     * 跳到员工管理页面
     * @return
     */
    @RequestMapping("/toMember")
    public String toMember(){
        return "redirect:findAll.do";
    }

    /**
     * 查询所有员工
     */
    @RequestMapping("/findAll")
    public String findAll(Model model, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        PageBean<Member> pageBean=memberService.findByPage(currentPage);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);
        return "view/member/member";
    }

    /**
     * 跳转到增加会员页面
     * @return
     */
    @RequestMapping("/toAddMember")
    public String toAddMember(){
         return "view/member/addMember";
    }

    /**
     * 增加会员
     * @param member
     * @return
     */
    @RequestMapping(value = "/addMember",method = RequestMethod.POST)
    public String addMember(Member member){
        memberService.addMember(member);
        return "redirect:findAll.do";
    }


    @RequestMapping("/deleteMember")
    public String deleteMember(Long id){
        memberService.deleteMember(id);
        return "redirect:findAll.do";
    }

    @RequestMapping("/toModifyMember")
    public String toModifyMember(Long id,Model model){
        Member member=memberService.findMemberById(id);
        model.addAttribute("member",member);
        return "view/member/modifyMember";
    }

    @RequestMapping("/modifyMember")
    public String modifyMember(Member member){
        memberService.modifyMember(member);
        return "redirect:findAll.do";
    }
}
