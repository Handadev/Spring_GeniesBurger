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

import com.myweb.domain.CartVO;
import com.myweb.service.cart.CartServiceRule;

@RequestMapping("/cart/*")
@Controller
public class CartController {
   private static Logger logger = LoggerFactory.getLogger(CartController.class);

   @Inject
   private CartServiceRule cartsv;
   
   @GetMapping("/complete")
   public void complete() {}
   
   @GetMapping("/creditcard")
   public void creditcard() {}
   
   @GetMapping("/method")
   public void method() {} 
   
   @GetMapping("/payment")
   public void payment(@RequestParam("mno") int mno, Model model, RedirectAttributes reAttr) {
	   CartVO cvo = cartsv.payment(mno);
	   if (cvo != null) {
		   model.addAttribute("cvo", cvo);
	   }
   }
   
   @PostMapping("/register")
	public String register(CartVO cartvo, @RequestParam("pno") int pno, 
			@RequestParam("mno") int mno, RedirectAttributes reAttr, HttpSession ses) {
		boolean isExist = cartsv.dupleCheck(pno, mno);
		if(isExist) {
			int isUp = cartsv.increRegister(pno, mno);
			reAttr.addFlashAttribute("result", isUp > 0 ? "카트 수량증가 성공" : "카트 수량증가 실패");
		}else {
			int isUp = cartsv.register(cartvo);
		reAttr.addFlashAttribute("result", isUp > 0 ? "카트 등록 성공" : "카트 등록 실패");
		}
		return "redirect:/product/list";
	}

   @ResponseBody
   @PostMapping(value="/{upqty}",produces = MediaType.TEXT_PLAIN_VALUE)
   public ResponseEntity<String> up(
		   @PathVariable("upqty")int upqty, 
		   @RequestParam(value="upqty_key", required = false)String upqtystr, 
		   @RequestParam(value="downqty_key", required = false)String downqtystr){
	   logger.info("upqty String : " + upqtystr);
	   logger.info("downqty String : " + downqtystr);
	   logger.info("up : " + upqty);
	   int isUp;
	   if(upqtystr == null) {
		   isUp = cartsv.decreQty(upqty, downqtystr);
	   }else {
		   isUp = cartsv.increQty(upqty, upqtystr);
	   }
	   return isUp > 0 ?
			   new ResponseEntity<String>("1", HttpStatus.OK)
			   : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @ResponseBody
   @DeleteMapping(value="/{cartno}", produces = MediaType.TEXT_PLAIN_VALUE)
   public ResponseEntity<String> remove(@PathVariable("cartno")int cartno){
	  logger.info("controller : " + cartno);
      return cartsv.remove(cartno) > 0 ? 
            new ResponseEntity<String>("1", HttpStatus.OK)
            : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @ResponseBody
   @DeleteMapping(value="/mno/{mno}", produces=MediaType.TEXT_PLAIN_VALUE)
   public ResponseEntity<String> removeWithMno(@PathVariable("mno") int mno) {
	   logger.info(">>>>>>>>>> mno" + mno);
	   return cartsv.removeWithMno(mno) > 0 ?
			   new ResponseEntity<String>("1", HttpStatus.OK)
			   : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @GetMapping("/totalList")
   public void list() {
   }
     
   @GetMapping("/cart")
   public void list(Model model) {
      model.addAttribute("cartList", cartsv.getList());
   }
}