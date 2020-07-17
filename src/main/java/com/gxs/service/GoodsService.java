package com.gxs.service;

import com.gxs.pojo.Goods;
import com.gxs.pojo.PageBean;

import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-18 10:30 PM
 */
public interface GoodsService {
    List<Goods> findAll();

    void deleteGoods(Long id);

    void addGoods(Goods goods);

    void updateId();

    PageBean<Goods> findByPage(int currentPage);

    Goods findGoodsById(Long id);

    void modifyGoodsInfo(Goods goods);
}
