package com.gxs.service;

import com.gxs.pojo.PageBean;
import com.gxs.pojo.Store;

import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-03 7:20 PM
 */
public interface StoreService {
    PageBean<Store> findAllStoreInfo(int currentPage);

    void deleteStoreInfo(Long id);

    void addStoreInfo(Store store);

    Store findStoreInfoById(Long id);

    void modifyStoreInfo(Store store);

    PageBean<Store> selectStoreInfoById(int currentPage, Long id);

    List<Store> selectAllStore();

    List<Store> findAllStoreForSelect();
}
