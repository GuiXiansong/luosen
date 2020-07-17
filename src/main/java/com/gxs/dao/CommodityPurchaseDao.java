package com.gxs.dao;

import com.gxs.pojo.CommodityPurchase;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-24 3:05 PM
 */
public interface CommodityPurchaseDao {
    List<CommodityPurchase> findAll();

    CommodityPurchase findCommodityPurchaseById(Long id);

    void modifyCommodityPurchase(CommodityPurchase commodityPurchase);

    void addCommodityPurchase(CommodityPurchase commodityPurchase);

    int selectCount();

    List<CommodityPurchase> findByPage(HashMap<String, Object> map);

    void deleteCommodityPurchase(Long id);
}
