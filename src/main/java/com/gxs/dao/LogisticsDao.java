package com.gxs.dao;

import com.gxs.pojo.Logistics;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-02 2:31 PM
 */
public interface LogisticsDao {
    int selectCount(Long storeId);

    List<Logistics> findByPage(HashMap<String, Object> map);

    void addLogistics(Logistics logistics);

    void deleteLogistics(Long id);

    void modifyLogistics(Logistics logistics);

    Logistics findLogisticsInfoById(Long id);
}
