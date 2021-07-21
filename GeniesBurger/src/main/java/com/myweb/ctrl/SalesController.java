package com.myweb.ctrl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.service.purchase.PurchaseServiceRule;

@RequestMapping("/sales/*")
@Controller
public class SalesController {
	private static Logger logger = LoggerFactory.getLogger(SalesController.class);

	@Inject
	private PurchaseServiceRule pursv;

	@GetMapping("sales_detail")
	public void salesDetail(Model model) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Integer> salesList = new ArrayList<Integer>();
		
		for (int i = 0; i < 7; i++) {
			int sales = 0;
			cal.add(Calendar.DATE, -i);
			String todayString = sdf.format(cal.getTime());
			List<Integer> dateSalesList = pursv.getDateSalesList(todayString);
			for (int price : dateSalesList) {
				if (dateSalesList.size() != 0) {
					sales += price;
				}
			}
			salesList.add(sales);
		}
		logger.info(salesList.toString());
		model.addAttribute("dateSalesList", salesList);
	}

}
