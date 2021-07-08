package com.myweb.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.MemberVO;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.member.MemberServiceRule;

@RequestMapping("/cart/*")
@Controller
public class CartController {
   private static Logger logger = LoggerFactory.getLogger(CartController.class);

   @Inject
   private CartServiceRule cartsv;
   
   @ResponseBody
   @DeleteMapping(value="/{cartno}", produces = MediaType.TEXT_PLAIN_VALUE)
   public ResponseEntity<String> remove(@PathVariable("cartno")int cartno){
	  logger.info("controller : " + cartno);
      return cartsv.remove(cartno) > 0 ? 
            new ResponseEntity<String>("1", HttpStatus.OK)
            : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }

   
   @PostMapping("/remove")
   public String remove(@RequestParam("cartno") int cartno, RedirectAttributes reAttr) {
      int isUp = cartsv.remove(cartno);
//      reAttr.addFlashAttribute("result", isUp > 0 ?
//            "회원삭제 성공~" : "회원삭제 실패!");
      return "redirect:/cart/list";
   }
   
   @GetMapping("/cart")
   public void list(Model model) {
      model.addAttribute("cartList", cartsv.getList());
   }
}