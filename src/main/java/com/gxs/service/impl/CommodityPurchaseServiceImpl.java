package com.gxs.service.impl;

import com.gxs.dao.CommodityPurchaseDao;
import com.gxs.pojo.CommodityPurchase;
import com.gxs.pojo.PageBean;
import com.gxs.service.CommodityPurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-24 3:07 PM
 */
@Service("CommodityPurchaseService")
public class CommodityPurchaseServiceImpl implements CommodityPurchaseService {

    @Autowired
    private CommodityPurchaseDao commodityPurchaseDao;

    @Override
    public List<CommodityPurchase> findAll() {
        return commodityPurchaseDao.findAll();
    }

    @Override
    public CommodityPurchase findCommodityPurchaseById(Long id) {
        return commodityPurchaseDao.findCommodityPurchaseById(id);
    }

    @Override
    public void modifyCommodityPurchase(CommodityPurchase commodityPurchase) {
        commodityPurchaseDao.modifyCommodityPurchase(commodityPurchase);
    }

    @Override
    public void addCommodityPurchase(CommodityPurchase commodityPurchase) {
        commodityPurchaseDao.addCommodityPurchase(commodityPurchase);
    }

    @Override
    public PageBean<CommodityPurchase> findByPage(int currentPage) {
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<CommodityPurchase> pageBean=new PageBean<CommodityPurchase>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount=commodityPurchaseDao.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<CommodityPurchase> list=commodityPurchaseDao.findByPage(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public void deleteCommodityPurchase(Long id) {
        commodityPurchaseDao.deleteCommodityPurchase(id);
    }
}
