package com.gxs.service;

import com.gxs.pojo.Employee;
import com.gxs.pojo.PageBean;

import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-16 10:17 PM
 */
public interface EmployeeService {

    List<Employee> findAll();

    void addEmployee(Employee employee);

    void deleteEmployee(Long id);

    PageBean<Employee> findByPage(int currentPage, Long storeId);

    void modifyEmployee(Employee data);

    Employee findEmployeeById(Long id);

    List<Employee> findEmployeeByStoreId(Long storeId);
}
