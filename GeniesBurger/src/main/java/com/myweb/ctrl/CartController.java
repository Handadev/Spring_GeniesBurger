package com.myweb.ctrl;

import java.util.List;

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
import com.myweb.domain.MemberPageVO;
import com.myweb.domain.ProductStockVO;
import com.myweb.domain.PurchaseVO;
import com.myweb.handler.MemberPagingHandler;
import com.myweb.service.cart.CartServiceRule;
import com.myweb.service.coupon.CouponServiceRule;
import com.myweb.service.product_stock.ProductStockServiceRule;
import com.myweb.service.purchase.PurchaseServiceRule;
import com.myweb.service.stock.StockServiceRule;

@RequestMapping("/cart/*")
@Controller
public class CartController {
	private static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	private CartServiceRule cartsv;

	@Inject
	private CouponServiceRule cpsv;

	@Inject
	private PurchaseServiceRule pursv;

	@Inject
	private ProductStockServiceRule pssv;

	@Inject
	private StockServiceRule ssv;

	@GetMapping("/complete")
	public void complete() {
	}

	@GetMapping("/creditcard")
	public void creditcard() {
	}

	@GetMapping("/method")
	public void method() {
	}

	@GetMapping("/payment")
	public void payment(@RequestParam("mno") int mno, Model model, RedirectAttributes reAttr) {
		List<CartVO> list = cartsv.payment(mno);
		model.addAttribute("myCpList", cpsv.myCouponList(mno));
		if (list != null) {
			model.addAttribute("list", list);
		}
	}

	@PostMapping("/register")
	public String register(CartVO cartvo, @RequestParam("pno") int pno, @RequestParam("mno") int mno,
			RedirectAttributes reAttr, HttpSession ses) {
		boolean isExist = cartsv.dupleCheck(pno, mno);
		if (isExist) {
			int isUp = cartsv.increRegister(pno, mno);
			reAttr.addFlashAttribute("result", isUp > 0 ? "카트 수량증가 성공" : "카트 수량증가 실패");
		} else {
			int isUp = cartsv.register(cartvo);
			reAttr.addFlashAttribute("result", isUp > 0 ? "카트 등록 성공" : "카트 등록 실패");
		}
		return "redirect:/product/list";
	}

	@ResponseBody
	@PostMapping(value = "/{upqty}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> up(@PathVariable("upqty") int upqty,
			@RequestParam(value = "upqty_key", required = false) String upqtystr,
			@RequestParam(value = "downqty_key", required = false) String downqtystr) {
		logger.info("upqty String : " + upqtystr);
		logger.info("downqty String : " + downqtystr);
		logger.info("up : " + upqty);
		int isUp;
		if (upqtystr == null) {
			isUp = cartsv.decreQty(upqty, downqtystr);
		} else {
			isUp = cartsv.increQty(upqty, upqtystr);
		}
		return isUp > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ResponseBody
	@DeleteMapping(value = "/{cartno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("cartno") int cartno) {
		logger.info("controller : " + cartno);
		return cartsv.remove(cartno) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ResponseBody
	@PostMapping(value = "/mno/", produces = MediaType.TEXT_PLAIN_VALUE)
	public String removeWithMno(@RequestParam("mno") int mno) {
		logger.info(">>> mno : " + mno);
		List<CartVO> cartvo = cartsv.getOrderList(mno);
		logger.info(">>> cartvo : " + cartvo);
		int isUp = 0;
		int isUp2 = 0;
		if (cartvo != null) {
			for (int i = 0; i < cartvo.size(); i++) {
				PurchaseVO purvo = new PurchaseVO(cartvo.get(i).getMno(), cartvo.get(i).getCartno(),
						cartvo.get(i).getPno(), cartvo.get(i).getTitle(), cartvo.get(i).getPrice(),
						cartvo.get(i).getQuantity());
				isUp = pursv.register(purvo);
				isUp *= isUp;
			}
		}
		if (isUp > 0) {
			isUp2 = cartsv.removeWithMno(mno);
		}
		return isUp2 > 0 ? "redirect:/" : "/cart/complete";
	}

	@GetMapping("/cart")
	public void list(Model model) {
		model.addAttribute("cartList", cartsv.getList());
	}

	@GetMapping("/purchaseList")
	public void purList(Model model, MemberPageVO mpgvo) {
		model.addAttribute("purchaseList", pursv.getList(mpgvo));
		int totalCount = pursv.getTotalCount(mpgvo);
		model.addAttribute("pghdl", new MemberPagingHandler(totalCount, mpgvo));
	}

	@GetMapping("/purchaseListMember")
	public void purList(Model model, MemberPageVO mpgvo, @RequestParam("mno") int mno) {
		int totalCount = pursv.getTotalCount(mpgvo, mno);
		model.addAttribute("purchaseListMember", pursv.getList(mpgvo, mno));
		model.addAttribute("pghdl", new MemberPagingHandler(totalCount, mpgvo, mno));
		logger.info("model : " + model);
	}

}