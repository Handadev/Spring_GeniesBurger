package com.myweb.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.handler.ProductCustomerPagingHandler;
import com.myweb.service.product.ProductServiceRule;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductServiceRule psv;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, ProductCustomerPageVO pcpgvo) {
		model.addAttribute("product_list", psv.getList(pcpgvo));
		int totalCount = psv.getTotalCount(pcpgvo);
		model.addAttribute("product_paging", new ProductCustomerPagingHandler(totalCount, pcpgvo));
		return "index";
	}
}
