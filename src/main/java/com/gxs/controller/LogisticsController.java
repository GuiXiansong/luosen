package com.gxs.controller;

import com.gxs.enumerate.StoreRoles;
import com.gxs.pojo.*;
import com.gxs.service.GoodsService;
import com.gxs.service.LogisticsService;
import com.gxs.service.StoreService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import java.util.List;

import static com.gxs.controller.EmployeeController.findStoreIdBySession;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-02 2:30 PM
 */

@Controller
@RequestMapping("/logistics")
public class LogisticsController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LogisticsController.class);
    @Autowired
    private LogisticsService logisticsService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private GoodsService goodsService;
    /**
     * 跳向物流信息页面
     */
/*    @RequestMapping("/findLogisticsByStoreId")
    public String findLogisticsByStoreId(Model model,@RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        PageBean<Logistics> pageBean=logisticsService.findByPage(currentPage, storeId);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);
        return "view/logistics/logistics";
    }*/

    /**
     * 跳向添加物流信息页面
     */
    @RequestMapping("/toAddLogistics")
    public String toAddLogistics(Model model) {
        //查询所有的店铺信息
        List<Store> storeList = storeService.findAllStoreForSelect();
        List<Goods> goodsList = goodsService.findAll();
        model.addAttribute("storeList", storeList);
        model.addAttribute("goodsList", goodsList);
        return "head_office/logistics/addLogistics";
    }


    /**
     * 添加物流信息页面
     */
    @RequestMapping("/addLogistics")
    public String addLogistics(Logistics logistics, HttpSession session) {
        Long storeId = findStoreIdBySession(session);
        LOGGER.info("添加的物流信息---------------------" + logistics);
        if (logistics.getStartStoreId().equals(logistics.getEndStoreId())) {
            session.setAttribute("msg", "出发地和目的地不能为同一地点!!!!!");
            return "redirect:toAddLogistics.do";
        }
        if (logistics.getStartStoreId() != storeId & logistics.getEndStoreId() != storeId) {
            session.setAttribute("msg", "您只能添加本店物流信息!!!!!");
            return "redirect:toAddLogistics.do";
        }
        if (session.getAttribute("msg") != null) {
            session.removeAttribute("msg");
        }
        logisticsService.addLogistics(logistics);
        return "redirect:findLogisticsByStoreId.do";
    }


    @RequestMapping("/toModifyLogistics")
    public String toModifyLogistics(Long id, Model model) {
        Logistics logistics = logisticsService.findLogisticsInfoById(id);
        //查询所有的店铺信息
        List<Store> storeList = storeService.findAllStoreForSelect();
        List<Goods> goodsList=goodsService.findAll();
        model.addAttribute("logistics", logistics);
        model.addAttribute("storeList", storeList);
        model.addAttribute("goodsList",goodsList);
        return "head_office/logistics/modifyLogistics";
    }

    @RequestMapping("/modifyLogistics")
    public String modifyLogistics(Logistics logistics, HttpSession session) {
        LOGGER.info("要修改的物流信息----------------------------------" + logistics);
        if (logistics.getStartStoreId().equals(logistics.getEndStoreId())) {
            session.setAttribute("msg", "出发地和目的地不能为同一地点!!!!!");
            return "redirect:toModifyLogistics.do";
        }
        if (session.getAttribute("msg") != null) {
            session.removeAttribute("msg");
        }
//        synchronized (LogisticsController.class) {
            logisticsService.modifyLogistics(logistics);
//        }
        return "redirect:findLogisticsByStoreId.do";
    }

    /**
     * 删除单条物流信息
     */
    @RequestMapping("/deleteLogistics")
    public String deleteLogistics(Long id) {
        synchronized (LogisticsController.class) {
            logisticsService.deleteLogistics(id);
        }
        return "redirect:findLogisticsByStoreId.do";
    }

    /**
     * 查询本店所有物流信息
     */
    @RequestMapping("/findLogisticsByStoreId")
    public String findLogisticsByStoreId(HttpSession session, Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) {
        LOGGER.info("到了LogisticsController这里了");
//        List<Logistics> list=employeeService.findLogisticsByStoreId();
        Long storeId = findStoreIdBySession(session);
        LOGGER.info("storeId====================" + storeId);
        PageBean<Logistics> pageBean = logisticsService.findByPage(currentPage, storeId);
        if (pageBean.getTotalCount() == 0) {
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg", pageBean);

        //查询所有的店铺（为下拉框做准备）
        List<Store> list=storeService.findAllStoreForSelect();
        model.addAttribute("selectList",list);

        String roles = findRolesByStoreId(storeId);
        return toMyLogisticsByRoles(roles);
    }

    @RequestMapping("/selectLogisticsInfoById")
    public String selectLogisticsInfoById(Long id,Model model, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        LOGGER.info("---------------------------------------------------------------------------------------------------------------------------------------------");
        LOGGER.info("selectLogisticsInfoById:"+id);
        PageBean<Logistics> pageBean=logisticsService.findByPage(currentPage,id);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);
        //查询所有的店铺（为下拉框做准备）
        List<Store> list=storeService.findAllStoreForSelect();
        model.addAttribute("selectList",list);
        return "head_office/logistics/logistics";
    }


    /**
     * 根据角色跳到自己的员工界面
     *
     * @param roles
     * @return
     */
    public String toMyLogisticsByRoles(String roles) {
        if (roles.equals(StoreRoles.HEADOFFICE.getName())) {
            return "head_office/logistics/logistics";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())) {
            return "view/logistics/logistics";
        }
        return "";
    }


    /*    *//**
     * 根据session查询店铺id
     * @param session
     * @return
     *//*
    public Long findStoreIdBySession(HttpSession session){
        User user=(User)session.getAttribute("user");
        Long storeId=user.getStoreId();
        return storeId;
    }*/

    /**
     * 根据店铺id查询店铺角色（总店/分店）
     *
     * @param storeId
     * @return
     */
    public String findRolesByStoreId(Long storeId) {
        PageBean<Store> pageBean = storeService.selectStoreInfoById(1, storeId);
        String roles = pageBean.getLists().get(0).getRoles();
        return roles;
    }

}
