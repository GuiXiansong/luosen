package com.gxs.dao;

import com.gxs.pojo.Goods;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-18 10:20 PM
 */
public interface GoodsDao {
    List<Goods> findAll();

    void deleteGoods(Long id);

    void addGoods(Goods goods);

    void updateId();

    void deleteId();

    void addId();

    int selectCount();

    List<Goods> findByPage(HashMap<String, Object> map);

    Goods findGoodsById(Long id);

    void modifyGoodsInfo(Goods goods);
}
