package com.gxs.view;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-28 2:26
 */
public class StockInfoCount {
    //商品编号
    private Long goodsId;
    //总入库出库量
    private Double sum;

    public static StockInfoCount createData(Long goodsId,Double sum){
        ApplicationContext context=new ClassPathXmlApplicationContext("bean/bean.xml");
        StockInfoCount stockInfoCount = (StockInfoCount) context.getBean("stockInfoCount");
        stockInfoCount.goodsId=goodsId;
        stockInfoCount.sum=sum;

        return stockInfoCount;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }
}
