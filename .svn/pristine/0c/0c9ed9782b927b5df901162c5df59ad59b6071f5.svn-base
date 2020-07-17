package com.gxs.controller;

import com.gxs.enumerate.StoreRoles;
import com.gxs.pojo.Employee;
import com.gxs.pojo.PageBean;
import com.gxs.pojo.Store;
import com.gxs.pojo.User;
import com.gxs.service.EmployeeService;
import com.gxs.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-16 10:16 PM
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    private final static Logger LOGGER= LoggerFactory.getLogger(EmployeeController.class);
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private StoreService storeService;

    /**
     * 跳到员工管理页面
     * @return
     */
    @RequestMapping("/toEmployee")
    public String toEmployee(){
        return "redirect:findEmployeeByStoreId.do";
    }

    /**
     * 查询所有员工
     */
    @RequestMapping("/findEmployeeByStoreId")
    public String findEmployeeByStoreId(HttpSession session,Model model, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
//        List<Employee> list=employeeService.findEmployeeByStoreId();
        Long storeId=findStoreIdBySession(session);
        PageBean<Employee> pageBean=employeeService.findByPage(currentPage,storeId);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);

        //查询所有的店铺（为下拉框做准备）
        List<Store> list=storeService.findAllStoreForSelect();
        model.addAttribute("selectList",list);

        String roles=findRolesByStoreId(storeId);
        return toMyEmployeeByRoles(roles);
    }


    /**
     * 根据角色跳到自己的员工界面
     * @param roles
     * @return
     */
    public String toMyEmployeeByRoles(String roles){
        if (roles.equals(StoreRoles.HEADOFFICE.getName())){
            return "head_office/employee/employee";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())){
            return "view/employee/employee";
        }
        return "";
    }

    /**
     * 根据角色跳到自己的修改员工界面
     * @param roles
     * @return
     */
    public String toMyModifyEmployeePageByRoles(String roles){
        if (roles.equals(StoreRoles.HEADOFFICE.getName())){
            return "head_office/employee/modifyEmployee";
        }
        if (roles.equals(StoreRoles.BRANCH.getName())){
            return "view/employee/modifyEmployee";
        }
        return "";
    }


    /**
     * 总店跳到增加员工界面
     * @return
     */
    @RequestMapping("/toAddEmployee")
    public String toAddEmployee(Model model){
        List<Store> storeList=storeService.findAllStoreForSelect();
        model.addAttribute("storeList",storeList);
        return "head_office/employee/addEmployee";
    }

    /**
     * 分店跳到增加员工界面
     * @return
     */
    @RequestMapping("/toAddEmployee2")
    public String toAddEmployee2(Model model,HttpSession session){
        Long storeId=findStoreIdBySession(session);
        PageBean<Store> pageBean=storeService.selectStoreInfoById(1,storeId);
        Store store=pageBean.getLists().get(0);
        model.addAttribute("store",store);
//        List<Store> storeList=storeService.findAllStoreForSelect();
//        model.addAttribute("storeList",storeList);
        return "view/employee/addEmployee";
    }

    /**
     * 增加员工信息
     * @param employee
     * @return
     */
    @RequestMapping("/addEmployee")
    public String addEmployee(Employee employee){
        LOGGER.info("添加的员工信息："+employee);
        employeeService.addEmployee(employee);
        return "redirect:findEmployeeByStoreId.do";
    }

    /**
     * 删除员工
     * @param id
     * @return
     */
    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(Long id) throws InterruptedException {
        employeeService.deleteEmployee(id);
        return "redirect:findEmployeeByStoreId.do";
    }


    /**
     * 跳到修改员工信息页面
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toModifyEmployee")
    public String toModifyEmployee(Long id,Model model,HttpSession session){
        Employee employee=findEmployeeById(id);
        LOGGER.info("得到要修改的employee的值："+employee);
        model.addAttribute("modifyEmployee",employee);
        return toMyModifyEmployeePageByRoles(findRolesByStoreId(findStoreIdBySession(session)));
    }

    private Employee findEmployeeById(Long id) {
        return employeeService.findEmployeeById(id);
    }

    /**
     * 修改员工信息
     * @param session
     * @param data
     * @return
     */
    @RequestMapping("/modifyEmployee")
    public String modifyEmployee(HttpSession session,Employee data){
        employeeService.modifyEmployee(data);
        return "redirect:findEmployeeByStoreId.do";
    }

    /**
     * 根据id查询对应的信息
     * @param id
     * @param model
     * @param currentPage
     * @return
     */
    @RequestMapping("/selectEmployeeInfoById")
    public String selectEmployeeInfoById(Long id,Model model, @RequestParam(value = "currentPage",defaultValue = "1",required = false) int currentPage){
        PageBean<Employee> pageBean=employeeService.findByPage(currentPage,id);
        if (pageBean.getTotalCount()==0){
            pageBean.setCurrPage(0);
        }
        model.addAttribute("pagemsg",pageBean);
        //查询所有的店铺（为下拉框做准备）
        List<Store> list=storeService.findAllStoreForSelect();
        model.addAttribute("selectList",list);
        return "head_office/employee/employee";
    }



    /**
     * 根据session查询店铺id
     * @param session
     * @return
     */
    public static Long findStoreIdBySession(HttpSession session){
        User user=(User)session.getAttribute("user");
        Long storeId=user.getStoreId();
        return storeId;
    }

    /**
     * 根据店铺id查询店铺角色（总店/分店）
     * @param storeId
     * @return
     */
    public String findRolesByStoreId(Long storeId){
        PageBean<Store> pageBean=storeService.selectStoreInfoById(1,storeId);
        String roles=pageBean.getLists().get(0).getRoles();
        return roles;
    }
}
