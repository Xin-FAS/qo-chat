package com.fas.controller;

import com.fas.dto.EmailLoginDto;
import com.fas.dto.ForgetDto;
import com.fas.dto.LoginDto;
import com.fas.dto.RegisterDto;
import com.fas.my_interface.HavePack;
import com.fas.service.UserService;
import com.fas.util.ValidUtil;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import java.util.HashMap;

@HavePack
@RestController
public class PublicController {

    @Resource
    private UserService userService;

    /**
     * 登录
     *
     * @param loginDto      用户名，密码
     * @param bindingResult
     * @return
     */
    @PostMapping("/login")
    public HashMap<String, String> login(@Valid @RequestBody LoginDto loginDto, BindingResult bindingResult) {
        ValidUtil.handler(bindingResult);
        return userService.login(loginDto);
    }

    /**
     * 获取验证码
     * @return
     */
    @GetMapping("/captcha")
    public HashMap<String, String> getCode() {
        return userService.getCode();
    }

    /**
     * 注册用户
     * @param registerDto
     * @param bindingResult
     */
    @PostMapping("/register")
    public void register (@Valid @RequestBody RegisterDto registerDto, BindingResult bindingResult) {
        ValidUtil.handler(bindingResult);
        userService.register(registerDto);
    }

    /**
     * 获取邮箱验证码
     *
     * @param email 邮箱
     * @return 六位验证码
     */
    @GetMapping("/email")
    public void sendEmail(@RequestParam @Email String email) {
        userService.sendEmail(email);
    }

    /**
     * 邮箱登录
     * @param emailLoginDto
     * @param bindingResult
     * @return
     */
    @PostMapping("/email")
    public HashMap<String, String> emailLogin (@Valid @RequestBody EmailLoginDto emailLoginDto, BindingResult bindingResult) {
        ValidUtil.handler(bindingResult);
        return userService.emailLogin(emailLoginDto);
    }

    /**
     * 更新密码
     * @param forgetDto
     * @param bindingResult
     */
    @PostMapping("/forget")
    public void forget (@Valid @RequestBody ForgetDto forgetDto, BindingResult bindingResult) {
        ValidUtil.handler(bindingResult);
        userService.forget(forgetDto);
    }
}
