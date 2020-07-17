package com.gxs.dao;

import com.gxs.pojo.StockInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 19:41
 */
public interface StockInfoDao {
    int toInventoryInfoPageSelectCount(Long storeId);

    List<StockInfo> toInventoryInfoPageFindByPage(HashMap<String, Object> map);

    void warehousing(@Param("sum") Double sum, @Param("storeId") Long storeId, @Param("goodsId") Long goodsId);

    Double getSumByGoodsId(@Param("storeId") Long storeId, @Param("goodsId") Long goodsId);

    StockInfo getThisStockInfoByGoodsId(@Param("storeId") Long storeId, @Param("goodsId") Long goodsId);

    void modifyStockWarning(@Param("stockWarning") String stockWarning, @Param("storeId") Long storeId, @Param("goodsId") Long goodsId);
}
