package com.gxs.service;

import com.gxs.pojo.CommodityPurchase;
import com.gxs.pojo.Member;
import com.gxs.pojo.PageBean;

import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-24 3:06 PM
 */
public interface CommodityPurchaseService {
    List<CommodityPurchase> findAll();

    CommodityPurchase findCommodityPurchaseById(Long id);

    void modifyCommodityPurchase(CommodityPurchase commodityPurchase);

    void addCommodityPurchase(CommodityPurchase commodityPurchase);

    PageBean<CommodityPurchase> findByPage(int currentPage);

    void deleteCommodityPurchase(Long id);
}
