package com.gxs.service.impl;

import com.gxs.dao.GoodsDao;
import com.gxs.pojo.Goods;
import com.gxs.pojo.PageBean;
import com.gxs.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-18 10:30 PM
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;
    @Override
    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    @Override
    public void deleteGoods(Long id) {
        goodsDao.deleteGoods(id);
    }

    @Override
    public void addGoods(Goods goods) {
        goodsDao.addGoods(goods);
    }

    @Override
    public void updateId() {
        goodsDao.deleteId();
        goodsDao.addId();
    }

    @Override
    public PageBean<Goods> findByPage(int currentPage) {
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<Goods> pageBean=new PageBean<Goods>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(5);

        //封装总记录数
        int totalCount=goodsDao.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Goods> list=goodsDao.findByPage(map);
        pageBean.setLists(list);

        return pageBean;

    }

    @Override
    public Goods findGoodsById(Long id) {
        return goodsDao.findGoodsById(id);
    }

    @Override
    public void modifyGoodsInfo(Goods goods) {
        goodsDao.modifyGoodsInfo(goods);
    }
}
