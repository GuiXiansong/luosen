package com.gxs.controller;

import com.gxs.pojo.PageBean;
import com.gxs.pojo.StockInfo;
import com.gxs.service.StockInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import static com.gxs.controller.EmployeeController.findStoreIdBySession;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-27 19:39
 */
@RequestMapping("/stockInfo")
@Controller
public class StockInfoController {
    @Autowired
    private StockInfoService stockInfoService;

    /**
     * 跳向盘点页面并查询出所有的库存信息
     * @param session
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping("/toInventoryInfoPage")
    public String toInventoryInfoPage(HttpSession session, Model model, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        Long storeId=findStoreIdBySession(session);
        PageBean<StockInfo> pageBean=stockInfoService.toInventoryInfoPage(currentPage,storeId);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);

        return "view/goods/stock/inventory";
    }


    /**
     * 商品入库操作
     * @param sum 入库总量
     */
    public void warehousing(Double sum,Long storeId,Long goodsId){
        stockInfoService.warehousing(sum, storeId, goodsId);
    }

}
