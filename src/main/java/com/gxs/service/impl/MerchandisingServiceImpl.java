package com.gxs.service.impl;

import com.gxs.dao.MerchandisingDao;
import com.gxs.pojo.Merchandising;
import com.gxs.pojo.PageBean;
import com.gxs.service.MerchandisingService;
import org.apache.ibatis.annotations.Param;
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
 * @create 2020-04-17 1:53
 */
@Service
public class MerchandisingServiceImpl implements MerchandisingService {


    private static final Logger LOGGER= LoggerFactory.getLogger(MerchandisingServiceImpl.class);
    @Autowired
    private MerchandisingDao merchandisingDao;
    @Override
    public PageBean<Merchandising> findByPage(int currentPage, Long storeId) {
        LOGGER.info("到了MerchandisingServiceImpl里面了");
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<Merchandising> pageBean=new PageBean<Merchandising>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount=merchandisingDao.selectCount(storeId);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());
        map.put("storeId",storeId);

        //封装每页显示的数据
        List<Merchandising> list=merchandisingDao.findByPage(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public void addMerchandisingInfo(Merchandising merchandising) {
        merchandisingDao.addMerchandisingInfo(merchandising);
    }

    @Override
    public Merchandising findMerchandisingById(Long id) {
        return merchandisingDao.findMerchandisingById(id);
    }

    @Override
    public void modifyMerchanising(Merchandising merchandising) {
        merchandisingDao.modifyMerchanising(merchandising);
    }

    @Override
    public void deleteMerchandising(Long id) {
        merchandisingDao.deleteMerchandising(id);
    }

    @Override
    public PageBean<Merchandising> countMerchandisingInfo(int currentPage, Long storeId, String year, String month) {
        LOGGER.info("到了MerchandisingServiceImpl里面了");
        HashMap<String,Object> map=new HashMap<String, Object>();
        PageBean<Merchandising> pageBean=new PageBean<Merchandising>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的条数
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        map.put("storeId",storeId);
        map.put("salesDate",year+"-"+month+"%");
        //封装总记录数
        int totalCount=merchandisingDao.countMerchandisingInfoSelectCount(storeId);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Merchandising> list=merchandisingDao.countMerchandisingInfoFindByPage(map);
        pageBean.setLists(list);

        return pageBean;
    }

    @Override
    public Double getSumCount(Long storeId, Long goodsId, String year, String month) {
        String salesDate=year+"-"+month+"%";
        return merchandisingDao.getSumCount(storeId,goodsId,salesDate);
    }

    @Override
    public Double getSumSales(Long storeId, Long goodsId, String year, String month) {
        String salesDate=year+"-"+month+"%";
        return merchandisingDao.getSumSales(storeId,goodsId,salesDate);
    }

}
