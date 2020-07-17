package com.gxs.service.impl;

import com.gxs.dao.LogisticsDao;
import com.gxs.pojo.Logistics;
import com.gxs.pojo.PageBean;
import com.gxs.service.LogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-02 2:31 PM
 */
@Service
public class LogisticsServiceImpl implements LogisticsService {
    @Autowired
    private LogisticsDao logisticsDao;

    @Override
    public PageBean<Logistics> findByPage(int currentPage, Long storeId) {
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<Logistics> pageBean=new PageBean<Logistics>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount=logisticsDao.selectCount(storeId);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());
        map.put("storeId",storeId);

        //封装每页显示的数据
        List<Logistics> list=logisticsDao.findByPage(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public void addLogistics(Logistics logistics) {
        logisticsDao.addLogistics(logistics);
    }

    @Override
    public void deleteLogistics(Long id) {
        logisticsDao.deleteLogistics(id);
    }

    @Override
    public void modifyLogistics(Logistics logistics) {
        logisticsDao.modifyLogistics(logistics);
    }

    @Override
    public Logistics findLogisticsInfoById(Long id) {
        return logisticsDao.findLogisticsInfoById(id);
    }
}
