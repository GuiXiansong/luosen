package com.gxs.pojo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 13:41
 */
public class MerchandisingCount {
    //商品id
    private Long goodsId;
    //总销售数量/质量
    private Double count;
    //总销售额
    private Double sales;

    public static MerchandisingCount setData(Long goodsId,Double count,Double sales){
        ApplicationContext context=new ClassPathXmlApplicationContext("bean/bean.xml");
        MerchandisingCount merchandisingCount=(MerchandisingCount) context.getBean("merchandisingCount");

        merchandisingCount.goodsId=goodsId;
        merchandisingCount.count=count;
        merchandisingCount.sales=sales;

        return merchandisingCount;
    }


    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Double getCount() {
        return count;
    }

    public void setCount(Double count) {
        this.count = count;
    }

    public Double getSales() {
        return sales;
    }

    public void setSales(Double sales) {
        this.sales = sales;
    }
}
