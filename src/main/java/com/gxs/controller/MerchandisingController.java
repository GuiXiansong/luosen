package com.gxs.controller;

import com.gxs.enumerate.StoreRoles;
import com.gxs.pojo.*;
import com.gxs.service.EmployeeService;
import com.gxs.service.GoodsService;
import com.gxs.service.MerchandisingService;
import com.gxs.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.gxs.controller.EmployeeController.findStoreIdBySession;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-17 1:51
 */

/**
 * 商品销售信息
 */
@Controller
@RequestMapping("/merchandising")
public class MerchandisingController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MerchandisingController.class);
    @Autowired
    private StoreService storeService;
    @Autowired
    private MerchandisingService merchandisingService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private EmployeeService employeeService;

    /**
     * 查询所有本店的销售信息
     */
    @RequestMapping("/findMerchandisingByStoreId")
    public String findMerchandisingByStoreId(HttpSession session, Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) {
        LOGGER.info("到了MerchandisingController这里了");
//        List<Merchandising> list=employeeService.findMerchandisingByStoreId();
        Long storeId = findStoreIdBySession(session);
        LOGGER.info("--------------------------------------storeId的值-----------------------------------------");
        LOGGER.info(storeId + "");
        PageBean<Merchandising> pageBean = merchandisingService.findByPage(currentPage, storeId);
        if (pageBean.getTotalCount() == 0) {
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg", pageBean);

        //查询所有的店铺（为下拉框做准备）
        List<Store> list = storeService.findAllStoreForSelect();
        model.addAttribute("selectList", list);

        String roles = findRolesByStoreId(storeId);
        return toMyMerchandisingByRoles(roles);
    }


    /**
     * 跳向添加商品销售信息页面的方法
     * 分店只能添加自己店的信息（店铺编号）
     * 只能添加自己店的员工为销售员
     * 可以添加所有的商品
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/toAddMerchandising")
    public String toAddMerchandising(HttpSession session, Model model) {
        Long storeId = findStoreIdBySession(session);
        model.addAttribute("storeId", storeId);
        model.addAttribute("storeList", storeService.findAllStoreForSelect());
        model.addAttribute("goodsList", findAllGoodsInfo());
        model.addAttribute("employeeList", findEmployeeByStoreId(storeId));

        String roles = findRolesByStoreId(storeId);
        return toMyAddMerchandisingByRoles(roles);
//        return "view/goods/merchandising/addMerchandising";
    }


    /**
     * 增加商品销售信息
     *
     * @param merchandising
     * @return
     */
    @RequestMapping("/addMerchandisingInfo")
    public String addMerchandisingInfo(Merchandising merchandising) {
        merchandisingService.addMerchandisingInfo(merchandising);
        return "redirect:findMerchandisingByStoreId.do";
    }


    /**
     * 跳到修改商品销售信息页面
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toModifyMerchandising")
    public String toModifyMerchandising(Long id, Model model, HttpSession session) {
        Merchandising merchandising = findMerchandisingById(id);
        Long storeId = findStoreIdBySession(session);
        model.addAttribute("storeId", storeId);
        model.addAttribute("goodsList", findAllGoodsInfo());
        model.addAttribute("employeeList", findEmployeeByStoreId(storeId));
        model.addAttribute("merchandising", merchandising);
        return "view/goods/merchandising/modifyMerchandising";
    }


    /**
     * 修改商品销售信息
     *
     * @param merchandising
     * @return
     */
    @RequestMapping("/modifyMerchanisingInfo")
    public String modifyMerchanisingInfo(Merchandising merchandising) {
        merchandisingService.modifyMerchanising(merchandising);
        return "redirect:findMerchandisingByStoreId.do";
    }

    /**
     * 根据id删除单条商品销售信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteMerchandising")
    public String deleteMerchandising(Long id) {
        merchandisingService.deleteMerchandising(id);
        return "redirect:findMerchandisingByStoreId.do";
    }


    /**
     * 根据id查询对应的信息
     *
     * @param id
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping("/selectMerchandisingInfoById")
    public String selectMerchandisingInfoById(Long id, Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) {
        PageBean<Merchandising> pageBean = merchandisingService.findByPage(currentPage, id);
        if (pageBean.getTotalCount() == 0) {
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg", pageBean);
        //查询所有的店铺（为下拉框做准备）
        List<Store> list = storeService.findAllStoreForSelect();
        model.addAttribute("selectList", list);
        return "head_office/goods/merchandising/merchandising";
    }


    /**
     * 统计商品销售信息
     *
     * @param session
     * @param model
     * @param year
     * @param month
     * @param currentPage
     * @return
     */
    @RequestMapping("/toCountMerchandisingInfo")
    public String toCountMerchandisingInfo(HttpSession session, Model model, Long storeIdd, @RequestParam(value = "year", defaultValue = "2020", required = false) String year, @RequestParam(value = "month", defaultValue = "04", required = false) String month, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) {
        LOGGER.info("到了MerchandisingController这里了");

        List<MerchandisingCount> merchandisingCountList = new ArrayList<>();
        //查询所有的商品信息
        List<Goods> goodsList = goodsService.findAll();
        if (storeIdd == null) {
            Long storeId = findStoreIdBySession(session);
            LOGGER.info("--------------------------------------storeId的值-----------------------------------------");
            LOGGER.info(storeId + "");
            PageBean<Merchandising> pageBean = merchandisingService.countMerchandisingInfo(currentPage, storeId, year, month);
            if (pageBean.getTotalCount() == 0) {
                pageBean.setCurrPage(0);
            }
            model.addAttribute("pagemsg", pageBean);
            String roles = findRolesByStoreId(storeId);

            //判断是不是总店
            if (roles.equals(StoreRoles.HEADOFFICE.getName())) {
                //查询所有的店铺（为下拉框做准备）
                List<Store> list = storeService.findAllStoreForSelect();
                model.addAttribute("storeList", list);
            }
            Long goodsId;
            Double count;
            Double sales;
            //根据商品id查到该商品的销售信息
            for (Goods goods : goodsList) {
                goodsId = goods.getId();
                LOGGER.info("-------------------------------------------------------------------------------------------------------------------");
                LOGGER.info("goodsId:{}", goodsId);
                //获得总销量
                count = merchandisingService.getSumCount(storeId, goodsId, year, month);
                LOGGER.info("--------------------------------------------------------------------------------------------------------------------------------------");
                //获得总销售额
                sales = merchandisingService.getSumSales(storeId, goodsId, year, month);
                if (count != null || sales != null) {
                    //将每个商品的id，总销量、总销售额放入merchandisingCount对象中
                    MerchandisingCount merchandisingCount = MerchandisingCount.setData(goodsId, count, sales);
                    //将merchandisingCount对象存入集合
                    merchandisingCountList.add(merchandisingCount);
                }
            }
            model.addAttribute("merchandisingCountList", merchandisingCountList);

            //根据角色跳到自己的页面
            return toMyCountMerchandisingInfoByRoles(roles);
        }

        LOGGER.info("总店查询店铺id为：{}的销售统计信息",storeIdd);
        String roles = StoreRoles.HEADOFFICE.getName();

        //若storeIdd不为空，则说明是总店，查询所有的店铺（为下拉框做准备）
        List<Store> list = storeService.findAllStoreForSelect();
        model.addAttribute("storeList", list);
        Long goodsId;
        Double count;
        Double sales;
        //根据商品id查到该商品的销售信息
        for (Goods goods : goodsList) {
            goodsId = goods.getId();
            LOGGER.info("-------------------------------------------------------------------------------------------------------------------");
            LOGGER.info("goodsId:{}", goodsId);
            //获得总销量
            count = merchandisingService.getSumCount(storeIdd, goodsId, year, month);
            LOGGER.info("--------------------------------------------------------------------------------------------------------------------------------------");
            //获得总销售额
            sales = merchandisingService.getSumSales(storeIdd, goodsId, year, month);
            if (count != null || sales != null) {
                //将每个商品的id，总销量、总销售额放入merchandisingCount对象中
                MerchandisingCount merchandisingCount = MerchandisingCount.setData(goodsId, count, sales);
                //将merchandisingCount对象存入集合
                merchandisingCountList.add(merchandisingCount);
            }
        }
        model.addAttribute("merchandisingCountList", merchandisingCountList);

        //根据角色跳到自己的页面
        return toMyCountMerchandisingInfoByRoles(roles);
    }


    /**
     * 根据id查询对应的商品销售信息
     *
     * @param id
     * @return
     */
    public Merchandising findMerchandisingById(Long id) {
        return merchandisingService.findMerchandisingById(id);
    }

    /**
     * 查询所有的商品基本信息
     *
     * @return
     */
    public List<Goods> findAllGoodsInfo() {
        return goodsService.findAll();
    }

    /**
     * 查询本店所有的员工信息
     *
     * @param storeId
     * @return
     */
    public List<Employee> findEmployeeByStoreId(Long storeId) {
        return employeeService.findEmployeeByStoreId(storeId);
    }


    /**
     * 根据角色跳到自己的员工界面
     *
     * @param roles
     * @return
     */
    public String toMyMerchandisingByRoles(String roles) {
        if (roles.equals(StoreRoles.HEADOFFICE.getName())) {
            LOGGER.info("跳到总店销售信息页面");
            return "head_office/goods/merchandising/merchandising";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())) {
            LOGGER.info("跳到分店销售信息页面");
            return "view/goods/merchandising/merchandising";
        }
        return "";
    }

    /**
     * 根据角色跳到自己的统计商品销售信息页面
     *
     * @param roles
     * @return
     */
    public String toMyCountMerchandisingInfoByRoles(String roles) {
        if (roles.equals(StoreRoles.HEADOFFICE.getName())) {
            LOGGER.info("跳到总店销售信息统计页面");
            return "head_office/count/merchandising/merchandisingInfoCount";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())) {
            LOGGER.info("跳到分店销售信息统计页面");
            return "view/count/merchandising/merchandisingInfoCount";
        }
        return "";
    }

    /**
     * 根据角色跳到自己的员工界面
     *
     * @param roles
     * @return
     */
    public String toMyModifyMerchandisingByRoles(String roles) {
        if (roles.equals(StoreRoles.HEADOFFICE.getName())) {
            LOGGER.info("跳到总店销售信息页面");
            return "head_office/goods/merchandising/modifyMerchandising";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())) {
            LOGGER.info("跳到分店销售信息页面");
            return "view/goods/merchandising/modifyMerchandising";
        }
        return "";
    }

    /**
     * 根据角色跳到自己的员工界面
     *
     * @param roles
     * @return
     */
    public String toMyAddMerchandisingByRoles(String roles) {
        if (roles.equals(StoreRoles.HEADOFFICE.getName())) {
            LOGGER.info("跳到总店销售信息页面");
            return "head_office/goods/merchandising/addMerchandising";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())) {
            LOGGER.info("跳到分店销售信息页面");
            return "view/goods/merchandising/addMerchandising";
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
