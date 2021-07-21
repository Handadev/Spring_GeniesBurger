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
	public void salesDate(Model model) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<Integer> salesList = new ArrayList<Integer>();

		for (int i = 0; i < 7; i++) {
			cal.add(Calendar.DATE, -i);
			String todayString = sdf.format(cal.getTime());
			int dateSales = pursv.getDateSales(todayString);
			salesList.add(dateSales);
		}
		logger.info(salesList.toString());
		model.addAttribute("dateSalesList", salesList);
	}

//	@GetMapping("sales_detail")
//	public void salesMonth(Model model) {
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(new Date());
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
//		List<Integer> salesList = new ArrayList<Integer>();
//		String todayString = sdf.format(cal.getTime());
//		logger.info("오늘날짜!!!!!!!!!!!" + todayString);
//
//		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
//		for (int i = 0; i < 7; i++) {
//			cal.add(Calendar.DATE, -i);
//			String todayString2 = sdf2.format(cal.getTime());
//			int dateSales = pursv.getDateSales(todayString2);
//			salesList.add(dateSales);
//		}
//		model.addAttribute("MonthSalesList", salesList);
//	}

}
