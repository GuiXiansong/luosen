package com.gxs.service;

import com.gxs.pojo.PageBean;
import com.gxs.pojo.Stock;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-17 3:00
 */
public interface StockService {
    PageBean<Stock> findByPage(int currentPage, Long storeId);

    void addStockInfo(Stock stock);

    PageBean<Stock> countInStockInfoPage(int currentPage, Long storeId, String year, String month);

    PageBean<Stock> countOutStockInfoPage(int currentPage, Long storeId, String year, String month);

    PageBean<Stock> toWarehousing(int currentPage, Long storeId);

    PageBean<Stock> toOutOfStock(int currentPage, Long storeId);

    void addOutOfStock(Stock stock);

    Double findAllStockInfoByStoreIdAndGoodsId(Long storeId, Long id, String yearMonth);

    Double countAllStockInfoSumByStoreIdAndGoodsId(Long storeId, Long id, String yearMonth);
}