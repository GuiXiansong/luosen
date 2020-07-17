package com.gxs.test;

import com.gxs.pojo.Store;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;

/**
 * @author 皮皮桂
 * @site guixiansong.com
 * @company 皮皮桂软件开发科技有限公司
 * @create 2020-04-06 1:20 AM
 */
public class Test_redis {
    @Autowired
    private RedisTemplate redisTemplate;

    private static final Logger LOGGER=LoggerFactory.getLogger(Test_redis.class);
    @Test
    public void testJedisTemplate(){
        BeanFactory beanFactory=new ClassPathXmlApplicationContext("spring/spring-dao.xml");
        Store store= (Store) beanFactory.getBean("store");
        Store store1=(Store)(new ClassPathXmlApplicationContext("spring/spring-dao.xml")).getBean("store");
        store.setId(222l);
        store.setName("锦州");
        store.setAddress("黄石");
        store.setRoles("总店");
        LOGGER.info("store::::::::::"+store);
        LOGGER.info("store1::::::::::::::"+store1);
//        redisTemplate.opsForValue().set(store.getId(),store);
    }

    @Test
    public void test2(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/spring-dao.xml");
        Store store=applicationContext.getBean("store",Store.class);
        store.setName("hfdfdf");
        LOGGER.info("hhhh"+store);
    }
}
