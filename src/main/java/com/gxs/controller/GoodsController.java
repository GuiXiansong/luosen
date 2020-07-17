package com.gxs.controller;

import com.gxs.enumerate.StoreRoles;
import com.gxs.pojo.Goods;
import com.gxs.pojo.PageBean;
import com.gxs.pojo.Store;
import com.gxs.pojo.User;
import com.gxs.service.GoodsService;
import com.gxs.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-18 10:19 PM
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    private static final Logger LOGGER= LoggerFactory.getLogger(GoodsController.class);
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private StoreService storeService;

    /**
     * 跳到商品管理页面
     * @return
     */
    @RequestMapping("/toGoods")
    public String toGoods(){
        return "redirect:findAll.do";
    }

    /**
     * 查询所有商品并分页
     */
    @RequestMapping("/findAll")
    public String findAll(Model model,HttpSession session, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        PageBean<Goods> pageBean=goodsService.findByPage(currentPage);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);

        Long storeId=findStoreIdBySession(session);
        String roles=findRolesByStoreId(storeId);
        return toMyGoodsByRoles(roles);
    }


    /**
     * 删除商品信息
     * @param id
     * @return
     */
    @RequestMapping("/deleteGoods")
    public String deleteGoods(Long id){
        goodsService.deleteGoods(id);
//        updateId();
        return "redirect:findAll.do";
    }

    /**
     * 跳向添加商品信息页面
     * @return
     */
    @RequestMapping("/toAddGoods")
    public String toAddGoods(){
        return "view/goods/addGoods";
    }

    /**
     * 添加商品信息
     * @param goods 商品信息
     * @return 商品信息列表页面
     */
    @RequestMapping("/addGoods")
    public String addGoods(Goods goods){
        goodsService.addGoods(goods);
        return "redirect:findAll.do";
    }

    /**
     * 跳向修改商品基本信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/toModifyGoodsInfo")
    public String toModifyGoodsInfo(Long id,Model model){
        Goods goods=findGoodsById(id);
        model.addAttribute("goods",goods);
        return "head_office/goods/modifyGoods";
    }

    /**
     * 修改商品基本信息
     * @param goods
     * @return
     */
    @RequestMapping("/modifyGoodsInfo")
    public String modifyGoodsInfo(Goods goods){
        LOGGER.info("传进来的goods的值为："+goods);
        goodsService.modifyGoodsInfo(goods);
        return "redirect:findAll.do";
    }

    public Goods findGoodsById(Long id){
        return goodsService.findGoodsById(id);
    }

    /**
     * 查询所有的商品信息
     * @return
     */
    public List<Goods> findAllGoodsInfo(){
        return goodsService.findAll();
    }


    public void updateId(){
        goodsService.updateId();
    }

    /**
     * 根据session查询店铺id
     * @param session
     * @return
     */
    public Long findStoreIdBySession(HttpSession session){
        User user=(User)session.getAttribute("user");
        Long storeId=user.getStoreId();
        return storeId;
    }

    /**
     * 根据店铺id查询店铺角色（总店/分店）
     * @param storeId 店铺编号
     * @return roles 店铺角色
     */
    public String findRolesByStoreId(Long storeId){
        PageBean<Store> pageBean=storeService.selectStoreInfoById(1,storeId);
        String roles=pageBean.getLists().get(0).getRoles();
        return roles;
    }

    /**
     * 根据角色跳到自己的商品基本信息界面
     * @param roles 角色
     * @return 根据角色返回的路径
     */
    public String toMyGoodsByRoles(String roles){
        if (roles.equals(StoreRoles.HEADOFFICE.getName())){
            return "head_office/goods/goods";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())){
            return "view/goods/goods";
        }
        return "";
    }
}
