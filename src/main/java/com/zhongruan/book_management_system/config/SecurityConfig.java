package com.zhongruan.book_management_system.config;

import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    IUserService userService;

    @Bean
    public static NoOpPasswordEncoder passwordEncoder() {
        return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //测试的时候用这个
        //http.authorizeRequests().anyRequest().permitAll().and().csrf().disable();
        //实际运行的时候用这个
        http
                .authorizeRequests()//配置权限
                .antMatchers("/toRegister", "/register").permitAll()
                .antMatchers("/admin/*").hasRole("ADMIN")
                .antMatchers("/librarian/*").hasRole("LIBRARIAN")
                .antMatchers("/borrower/*").hasRole("BORROWER")
                .anyRequest().authenticated()//任意请求需要登录
                .and()
                .formLogin()//开启formLogin默认配置
                .loginPage("/toLogin").permitAll()//请求时未登录跳转接口
                .failureUrl("/toLogin?error=true")//用户密码错误跳转接口
                .defaultSuccessUrl("/index", true)//登录成功之后的页面
                .successHandler(new LoginSuccessHandler())//设置自定义处理规则，根据身份跳转到不同页面
                .loginProcessingUrl("/login")//处理表单请求的url
                .usernameParameter("username")//表单提交的参数
                .passwordParameter("password")
                .and()
                .logout()//注销配置
                .logoutUrl("/logout")//注销页面地址
                .logoutSuccessUrl("/user/logout")//注销成功后的跳转页面
                .deleteCookies("myCookie")//删除cookie
                .and()
                .csrf()
                .disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService);
    }

    @Override
    public void configure(WebSecurity web) {
        //解决静态资源被SpringSecurity拦截的问题
        web.ignoring().antMatchers("/static/**");
    }
}
