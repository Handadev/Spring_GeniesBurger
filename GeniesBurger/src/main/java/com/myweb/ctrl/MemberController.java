package com.myweb.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.MemberVO;
import com.myweb.service.member.MemberServiceRule;

@RequestMapping("/member/*")
@Controller
public class MemberController {
   private static Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Inject
   private MemberServiceRule msv;
   
   @GetMapping("/logout")
   public String logout(RedirectAttributes reAttr, HttpSession ses) {
      ses.invalidate();
      reAttr.addFlashAttribute("result", "로그아웃 되었습니다!");
      return "redirect:/";
   }
   
   @PostMapping("/modify")
   public String modify(MemberVO mvo, RedirectAttributes reAttr, HttpSession ses) {
      int isUp = msv.modify(mvo);
      if (isUp > 0) ses.setAttribute("ses", mvo);
      reAttr.addFlashAttribute("result", ses.getAttribute("ses") != null ?
            "회원정보 수정 성공~" : "회원정보 수정 실패!");
      return "redirect:/";
//      return "redirect:/member/list";
   }
   
   @GetMapping("/modify")
   public void modify(@RequestParam("mno") int mno, Model model) {
      model.addAttribute("mvo", msv.detail(mno));
   }
   
   @PostMapping("/remove")
   public String remove(@RequestParam("mno") int mno, RedirectAttributes reAttr, HttpSession ses) {
      int isUp = msv.remove(mno);
      if (isUp > 0) ses.invalidate();
      reAttr.addFlashAttribute("result", isUp > 0 ?
            "회원삭제 성공~" : "회원삭제 실패!");
      return "redirect:/";
//      return "redirect:/member/list";
   }
   
   @GetMapping("/detail")
   public void detail(@RequestParam("mno") int mno, Model model) {
      model.addAttribute("mvo", msv.detail(mno));
   }
   
   @PostMapping("/login")
   public String login(MemberVO mvo, HttpSession ses, RedirectAttributes reAttr) {
      MemberVO loginAccount = msv.login(mvo);
      if (loginAccount != null) {
         ses.setAttribute("ses", loginAccount );
         ses.setMaxInactiveInterval(10*60);
      }
      reAttr.addFlashAttribute("result", ses.getAttribute("ses") != null ? 
            "로그인 성공~" : "로그인 실패!");
      return ses.getAttribute("ses") != null ? "redirect:/" : "redirect:/member/login";
   }
   
   @GetMapping("/login")
   public void login() {
      logger.info("WEB-INF/views/member/login.jsp - GET");
   }
   
   @GetMapping("/list")
   public void list(Model model) {
      model.addAttribute("mList", msv.getList());
   }
   
   @ResponseBody
   @PostMapping("/checkEmail")
   public String emailCheck(@RequestParam("email") String email) {
      int isExist = msv.checkEmail(email);
      return isExist > 0 ? "1" : "0";
   }
   
   @PostMapping("/register")
   public String register(MemberVO mvo, RedirectAttributes reAttr) {
      int isUp = msv.register(mvo);
      reAttr.addFlashAttribute("result", isUp > 0 ? "회원가입 성공~" : "회원가입 실패!");
      return isUp > 0 ? "redirect:/" : "redirect:/member/register";
   }
   
   @GetMapping("/register")
   public void register() {
      logger.info("WEB-INF/views/member/register.jsp - GET");
   }
}