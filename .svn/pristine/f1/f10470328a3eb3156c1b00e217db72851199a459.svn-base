package com.gxs.controller;

import com.gxs.pojo.CommodityPurchase;
import com.gxs.pojo.Goods;
import com.gxs.pojo.PageBean;
import com.gxs.service.CommodityPurchaseService;
import com.gxs.service.GoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-24 3:04 PM
 */

/**
 * 商品采购
 */
@Controller
@RequestMapping("/commodityPurchase")
public class CommodityPurchaseController {
    private static final Logger LOGGER= LoggerFactory.getLogger(CommodityPurchaseController.class);
    @Autowired
    private CommodityPurchaseService commodityPurchaseService;
    @Autowired
    private GoodsService goodsService;
    /**
     * 跳到商品采购信息页面
     */
    @RequestMapping("/toCommodityPurchase")
    public String findAll(Model model, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        LOGGER.info("到了toCommodityPurchase方法啦");
        PageBean<CommodityPurchase> pageBean=commodityPurchaseService.findByPage(currentPage);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);
        return "head_office/goods/commodityPurchase/commodityPurchase";
    }

    /**
     * 跳向修改商品采购信息页面
     * @param id
     * @return
     */
    @RequestMapping("/toModifyCommodityPurchase")
    public String toModifyCommodityPurchase(Long id,Model model){
        //方法一：通过id从数据库中查找
        //将所有的商品信息放入goodsList中
        model.addAttribute("goodsList",findAllGoodsInfo());
        model.addAttribute("modifyCommodityPurchase",findCommodityPurchaseById(id));
        return "head_office/goods/commodityPurchase/modifyCommodityPurchase";
    }

    /**
     * 通过id查找单条商品采购信息
     * @param id 商品采购信息id
     * @return 单条商品采购信息
     */
    public CommodityPurchase findCommodityPurchaseById(Long id){
        return commodityPurchaseService.findCommodityPurchaseById(id);
    }

    /**
     * 修改商品采购信息
     * @param commodityPurchase
     * @return
     */
    @RequestMapping("/modifyCommodityPurchase")
    public String modifyCommodityPurchase(CommodityPurchase commodityPurchase){
        commodityPurchaseService.modifyCommodityPurchase(commodityPurchase);
        return "redirect:toCommodityPurchase.do";
    }

    /**
     * 跳向添加商品采购信息页面
     * @return
     */
    @RequestMapping("/toAddCommodityPurchase")
    public String toAddCommodityPurchase(Model model){
        List<Goods> goodsList=findAllGoodsInfo();
        model.addAttribute("goodsList",goodsList);
        return "head_office/goods/commodityPurchase/addCommodityPurchase";
    }


    /**
     * 添加单条商品采购信息
     * @param commodityPurchase
     * @return
     */
    @RequestMapping("/addCommodityPurchase")
    public String addCommodityPurchase(CommodityPurchase commodityPurchase){
        commodityPurchaseService.addCommodityPurchase(commodityPurchase);
        return "redirect:toCommodityPurchase.do";
    }


    @RequestMapping("/deleteCommodityPurchase")
    public String deleteCommodityPurchase(Long id){
        commodityPurchaseService.deleteCommodityPurchase(id);
        return "redirect:toCommodityPurchase.do";
    }
    /**
     * 查询所有的商品信息
     * @return
     */
    public List<Goods> findAllGoodsInfo(){
        List<Goods> goodsList=goodsService.findAll();
        return goodsList;
    }
}
