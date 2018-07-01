package com.neusoft.hr.sys.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.neusoft.hr.sys.Convertor.DateConverter;
import com.neusoft.hr.sys.interceptor.AuthInterceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.text.SimpleDateFormat;
import java.util.List;

@Configuration
@EnableWebMvc //相当于 <mvc:annotation-driven/>
@PropertySource("classpath:app.properties") //相当于<context:property-placeholder location="classpath:app.properties"/>
@ComponentScan("com.neusoft.hr.app") //相当于<context:component-scan base-package="com.neusoft.hr.app"
@EnableTransactionManagement // <tx:annotation-driven />
@MapperScan("com.neusoft.hr.app.dao")//Mybatis mapper.class的位置
public class AppConfig extends WebMvcConfigurerAdapter {


    @Autowired
    private Environment environment;

    /**
     * 配置试图解析器，这里的视图解析器是相当于servlet内部解析器，调用了forward方法
     *
     * @param registry
     */
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/view/");
        viewResolver.setSuffix(".jsp");
        registry.viewResolver(viewResolver);
    }

    /**
     * 配置公用字符串转日期
     * @param registry
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new DateConverter());
    }


    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder()
                .indentOutput(true)
                .dateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        converters.add(new MappingJackson2HttpMessageConverter(builder.build()));
    }

    /**
     * 配置静态资源映射
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/").setCachePeriod(31536000);
        super.addResourceHandlers(registry);
    }

    /**
     * 其他找不到的资源就交给默认的servlet处理
     *
     * @param configurer
     */
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
        super.configureDefaultServletHandling(configurer);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor())
                .addPathPatterns("/**").excludePathPatterns("/static/**", "/login.*", "/login/**");
    }

    @Bean
    public DataSource dataSource() {
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setUrl(environment.getProperty("jdbc.url"));
        druidDataSource.setUsername(environment.getProperty("jdbc.username"));
        druidDataSource.setPassword(environment.getProperty("jdbc.password"));
        return druidDataSource;
    }

    /**
     * 配置sqlSessionFactory
     *
     * @return
     * @throws Exception
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        //设置数据库连接池
        factoryBean.setDataSource(dataSource());
        //设置mapper.xml文件的位置，如果不设置的话，你需要把mapper.xml放置在于mapper.class相同的位置
        //factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml"));

        factoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:/mybatis-config.xml"));
        return factoryBean.getObject();
    }

    /**
     * 配置事物管理器
     *
     * @return
     */
    @Bean
    public DataSourceTransactionManager transactionManager() {
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
        dataSourceTransactionManager.setDataSource(dataSource());
        return dataSourceTransactionManager;
    }


}
