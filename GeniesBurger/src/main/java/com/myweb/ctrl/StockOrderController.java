package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.CouponPageVO;
import com.myweb.domain.StockOrderVO;
import com.myweb.handler.CouponPagingHandler;
import com.myweb.service.stock_order.StockOrderServiceRule;

@RequestMapping("/stockOrder/*")
@Controller
public class StockOrderController {
	private static Logger logger = LoggerFactory.getLogger(StockOrderController.class);

	@Inject
	private StockOrderServiceRule sosv;
	
	@GetMapping("/list")
	public void list(Model model, CouponPageVO cpgvo) {
		model.addAttribute("list", sosv.getList(cpgvo));
		int totalCount = sosv.getTotalCount(cpgvo);
		model.addAttribute("spghdl", new CouponPagingHandler(totalCount, cpgvo));
	}
	
	@PostMapping("/register")
	public String register(StockOrderVO sovo, RedirectAttributes reAttr) {
		int isUp = sosv.register(sovo);
		reAttr.addFlashAttribute("result", isUp > 0 ? "재고 주문 O" : "재고 주문 X");
		return "redirect:/stockOrder/list";
	}
	
	@GetMapping("/register")
	public void register() {
		logger.info("/WEB_INF/views/stock_order/register.jsp - GET");
	}
	
}
