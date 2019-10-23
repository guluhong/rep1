package com.turing.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.logging.log4j2.Log4j2Impl;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ImportResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.github.pagehelper.PageInterceptor;

import org.springframework.context.annotation.ComponentScan.Filter;

/**
 * 全局配置项 
 * 扫描项目的所有包，
 * 但是需要把SpringMVC已经扫描过的列外掉
 * @author 段凌杰
 *
 */

@Configuration
@ComponentScan(basePackages = {"com.turing"},excludeFilters = {
		@Filter(type = FilterType.ANNOTATION,
				value= {EnableWebMvc.class,Controller.class}
				)
})//扫描Mapper所在包
//事务
@ImportResource("classpath:spring-transaction.xml")
@MapperScan(basePackages = {"com.turing.mapper"})
public class RootConfig {

	
	/**
	 * 配置数据源
	 * @return
	 */
	@Bean 
	public DataSource dataSource() {
		BasicDataSource source=new BasicDataSource();
		//连接四要素
		source.setUrl("jdbc:mysql://localhost:3306/crm");
		source.setDriverClassName("com.mysql.jdbc.Driver");
		source.setUsername("root");
		source.setPassword("123456");
		//连接池的属性
		source.setInitialSize(20);
		source.setMaxIdle(10);
		source.setMinIdle(2);
		source.setMaxTotal(50);
		source.setMaxWaitMillis(5000);
		
		return source;
	}
	
	/**
	 * 加入sqlsessionfactory,类似之前的mybaits-config.xml
	 * @throws Exception 
	 */
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean=new SqlSessionFactoryBean();
		//设置数据源
		factoryBean.setDataSource(source);
		
		//配置一个配置对象
		org.apache.ibatis.session.Configuration configuration=new org.apache.ibatis.session.Configuration();
		//设置日志框架的实现类
		configuration.setLogImpl(Log4j2Impl.class);
		//设置配置项--等同于配置文件中的settings
		factoryBean.setConfiguration(configuration);
		
		
		//设置分页的拦截器 
		PageInterceptor pageInterceptor = new PageInterceptor();
		//创建插件需要的参数集合 
		Properties properties = new Properties(); 
		//配置数据库方言 为mysql
		properties.setProperty("helperDialect", "mysql"); 
		//配置分页的合理化数据
		properties.setProperty("reasonable", "true");
		pageInterceptor.setProperties(properties); 
	    //将拦截器设置到sqlSessionFactroy中
		factoryBean.setPlugins(new Interceptor[] {pageInterceptor}); 
		return factoryBean.getObject();
	}
	
	//配置事务
	@Bean
	public DataSourceTransactionManager transactionManager(DataSource dataSource) {
		 return new DataSourceTransactionManager(dataSource);
		 }
	
}
