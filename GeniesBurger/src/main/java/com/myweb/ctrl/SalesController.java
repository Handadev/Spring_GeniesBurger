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
		Calendar ycal = Calendar.getInstance();
		cal.setTime(new Date());
		ycal.setTime(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy"); // 연매출
		
		List<Integer> salesList = new ArrayList<Integer>();
		List<Integer> ySalesList = new ArrayList<Integer>();
		
		for (int i = 0; i < 5; i++) {
			ycal.add(Calendar.YEAR, -i);
			String yearString = yyyy.format(ycal.getTime());
			logger.info("****************************** 연도  " + yearString);
			int yearSales = pursv.getYearSales(yearString);
			logger.info("****************** 연매출" + yearSales);
			ySalesList.add(yearSales);
			ycal.add(Calendar.YEAR, +i);
		}
		logger.info(ySalesList.toString());
		model.addAttribute("yearSalesList", ySalesList);
		
		for (int i = 0; i < 7; i++) {
	         cal.add(Calendar.DATE, -i);
	         String todayString = sdf.format(cal.getTime());
	         int dateSales = pursv.getDateSales(todayString);
	         salesList.add(dateSales);
	      }
	      logger.info(salesList.toString());
	      model.addAttribute("dateSalesList", salesList);
	}
	

}