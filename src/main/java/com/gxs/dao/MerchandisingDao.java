package com.gxs.dao;

import com.gxs.pojo.Merchandising;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-17 1:52
 */
public interface MerchandisingDao {
    int selectCount(Long storeId);

    List<Merchandising> findByPage(HashMap<String, Object> map);

    void addMerchandisingInfo(Merchandising merchandising);

    Merchandising findMerchandisingById(Long id);

    void modifyMerchanising(Merchandising merchandising);

    void deleteMerchandising(Long id);

    int countMerchandisingInfoSelectCount(Long storeId);

    List<Merchandising> countMerchandisingInfoFindByPage(HashMap<String, Object> map);

    Double getSumCount(@Param("storeId") Long storeId, @Param("goodsId") Long goodsId, @Param("salesDate") String salesDate);

    Double getSumSales(@Param("storeId") Long storeId, @Param("goodsId") Long goodsId, @Param("salesDate") String salesDate);
}
