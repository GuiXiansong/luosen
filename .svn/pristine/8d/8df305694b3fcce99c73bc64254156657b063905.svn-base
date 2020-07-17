package com.gxs.dao;

import com.gxs.pojo.Employee;

import java.util.HashMap;
import java.util.List;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-03-16 10:18 PM
 */
public interface EmployeeDao {
    List<Employee> findAll();

    void addEmployee(Employee employee);

    void deleteEmployee(Long id);

    void deleteId();

    void addId();

    int selectCount(Long storeId);

    List<Employee> findByPage(HashMap<String, Object> map);

    void modifyEmployee(Employee data);

    Employee findEmployeeById(Long id);

    List<Employee> findEmployeeByStoreId(Long storeId);
}
