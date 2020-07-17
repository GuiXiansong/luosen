package com.gxs.enumerate;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 21:04
 */
public enum StockWarning {
    LESS("过少",-1),
    EXCESSIVE("过多",-2),
    NORMAL("正常",0);

    private String name;
    private Integer value;

    StockWarning(String name,Integer value){
        this.name=name;
        this.value=value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
