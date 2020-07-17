package com.gxs.service.impl;

import com.gxs.dao.StockInfoDao;
import com.gxs.pojo.PageBean;
import com.gxs.pojo.StockInfo;
import com.gxs.service.StockInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 19:40
 */
@Service
public class StockInfoServiceImpl implements StockInfoService {

    @Autowired
    private StockInfoDao stockInfoDao;

    @Override
    public PageBean<StockInfo> toInventoryInfoPage(int currentPage, Long storeId) {
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<StockInfo> pageBean=new PageBean<>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount=stockInfoDao.toInventoryInfoPageSelectCount(storeId);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());
        map.put("storeId",storeId);

        //封装每页显示的数据
        List<StockInfo> list=stockInfoDao.toInventoryInfoPageFindByPage(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public void warehousing(Double sum, Long storeId, Long goodsId) {
        stockInfoDao.warehousing(sum,storeId,goodsId);
    }

    @Override
    public Double getSumByGoodsId(Long storeId, Long goodsId) {
        return stockInfoDao.getSumByGoodsId(storeId,goodsId);
    }

    @Override
    public StockInfo getThisStockInfoByGoodsId(Long storeId, Long goodsId) {
        return stockInfoDao.getThisStockInfoByGoodsId(storeId,goodsId);
    }

    @Override
    public void modifyStockWarning(String stockWarning, Long storeId, Long goodsId) {
        stockInfoDao.modifyStockWarning(stockWarning,storeId,goodsId);
    }
}
