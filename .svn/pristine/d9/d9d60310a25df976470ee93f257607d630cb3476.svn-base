package com.gxs.service.impl;

import com.gxs.dao.StoreDao;
import com.gxs.pojo.PageBean;
import com.gxs.pojo.Store;
import com.gxs.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-03 7:20 PM
 */
@Service
public class StoreServiceImpl implements StoreService {
    private static final Logger LOGGER= LoggerFactory.getLogger(StoreService.class);

    @Autowired
    private StoreDao storeDao;

    @Override
    public PageBean<Store> findAllStoreInfo(int currentPage) {
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<Store> pageBean=new PageBean<Store>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount= storeDao.selectCountFindAllStoreInfo();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Store> list=storeDao.findByPageFindAllStoreInfo(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public void deleteStoreInfo(Long id) {
        storeDao.deleteStoreInfo(id);
    }

    @Override
    public void addStoreInfo(Store store) {
        storeDao.addStoreInfo(store);
    }

    @Override
    public Store findStoreInfoById(Long id) {
        return storeDao.findStoreInfoById(id);
    }

    @Override
    public void modifyStoreInfo(Store store) {
        storeDao.modifyStoreInfo(store);
    }

    @Override
    public PageBean<Store> selectStoreInfoById(int currentPage, Long id) {
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<Store> pageBean=new PageBean<Store>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount= storeDao.selectCountById(id);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());
        map.put("id",id);

        //封装每页显示的数据
        List<Store> list=storeDao.findByPageById(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public List<Store> selectAllStore() {
        return storeDao.selectAllStore();
    }

    @Override
    public List<Store> findAllStoreForSelect() {
        return storeDao.findAllStoreForSelect();
    }
}
