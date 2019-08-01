package com.zhongruan.book_management_system.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        //根据用户的不同身份跳转到不同的页面
        if (roles.contains("ROLE_ADMIN")) {
            response.sendRedirect(basePath + "admin/mainpage");
            return;
        }
        if (roles.contains("ROLE_BORROWER")) {
            response.sendRedirect(basePath + "borrower/mainpage");
            return;
        }
        if (roles.contains("ROLE_LIBRARIAN")) {
            response.sendRedirect(basePath + "librarian");
            return;
        }
        response.sendRedirect(basePath + "toIndex");
    }
}
