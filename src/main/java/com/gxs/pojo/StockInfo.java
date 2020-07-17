package com.gxs.pojo;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 19:23
 */

/**
 * 商品库存信息表
 */
public class StockInfo {
    //编号
    private Long id;
    //店铺编号
    private Long storeId;
    //商品编号
    private Long goodsId;
    //库存量
    private Double sum;
    //库存预警值
    private Double warningValue;
    //库存警告
    private String stockWarning;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
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

    public Double getWarningValue() {
        return warningValue;
    }

    public void setWarningValue(Double warningValue) {
        this.warningValue = warningValue;
    }

    public String getStockWarning() {
        return stockWarning;
    }

    public void setStockWarning(String stockWarning) {
        this.stockWarning = stockWarning;
    }
}
