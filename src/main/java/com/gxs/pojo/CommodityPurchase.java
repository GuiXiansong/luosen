package com.gxs.pojo;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-24 1:37 PM
 */

/**
 * 商品采购
 */
public class CommodityPurchase {
    //编号
    private Long id;
    //商品id
    private Long goodsId;
    //数量/重量
    private double quantity;
    //采购日期
    private String purchaseDate;
    //总进价
    private double totalPurchasePrice;
    //供应商信息
    private String supplierInformation;

    public void setId(Long id) {
        this.id = id;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public void setTotalPurchasePrice(double totalPurchasePrice) {
        this.totalPurchasePrice = totalPurchasePrice;
    }

    public void setSupplierInformation(String supplierInformation) {
        this.supplierInformation = supplierInformation;
    }

    public Long getId() {
        return id;
    }

    public double getQuantity() {
        return quantity;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public double getTotalPurchasePrice() {
        return totalPurchasePrice;
    }

    public String getSupplierInformation() {
        return supplierInformation;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    @Override
    public String toString() {
        return "CommodityPurchase{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", purchaseDate='" + purchaseDate + '\'' +
                ", totalPurchasePrice=" + totalPurchasePrice +
                ", supplierInformation='" + supplierInformation + '\'' +
                '}';
    }
}
