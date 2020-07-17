package com.gxs.service;

import com.gxs.pojo.PageBean;
import com.gxs.pojo.StockInfo;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 19:40
 */
public interface StockInfoService {

    PageBean<StockInfo> toInventoryInfoPage(int currentPage, Long storeId);

    void warehousing(Double sum, Long storeId, Long goodsId);

    Double getSumByGoodsId(Long storeId, Long goodsId);

    StockInfo getThisStockInfoByGoodsId(Long storeId, Long goodsId);

    void modifyStockWarning(String stockWarning, Long storeId, Long goodsId);
}
