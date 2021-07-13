package com.myweb.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.domain.ProductAndFileDTO;
import com.myweb.domain.ProductCustomerPageVO;
import com.myweb.domain.ProductVO;
import com.myweb.handler.ProductCustomerPagingHandler;
import com.myweb.service.product.ProductServiceRule;

/**
 * Handles requests for the application home page.
 */
@RequestMapping("/*")
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductServiceRule psv;
	
	@GetMapping("/")
	public String home(Model model, ProductCustomerPageVO pcpgvo) {
		model.addAttribute("product_list", psv.getList(pcpgvo));
		int totalCount = psv.getTotalCount(pcpgvo);
		model.addAttribute("product_paging", new ProductCustomerPagingHandler(totalCount, pcpgvo));
		return "index";
	}
	
	@ResponseBody
	@GetMapping(value = "/select/{pno}",
				produces= {MediaType.APPLICATION_ATOM_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductAndFileDTO>> select (@PathVariable("pno") int pno) {
		
		return new ResponseEntity<List<ProductAndFileDTO>>(psv.getProductList(pno), HttpStatus.OK);
	}
}
