package com.gxs.dao;

import com.gxs.pojo.Store;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-03 7:20 PM
 */
public interface StoreDao {
    int selectCountFindAllStoreInfo();

    List<Store> findByPageFindAllStoreInfo(HashMap<String, Object> map);

    void deleteStoreInfo(Long id);

    void addStoreInfo(Store store);

    Store findStoreInfoById(Long id);

    void modifyStoreInfo(Store store);

    int selectCountById(Long id);

    List<Store> findByPageById(HashMap<String, Object> map);

    List<Store> selectAllStore();

    List<Store> findAllStoreForSelect();
}
