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
		Calendar ycal = Calendar.getInstance();
		ycal.setTime(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy"); // 연매출
		List<Integer> salesList = new ArrayList<Integer>();
		List<Integer> ySalesList = new ArrayList<Integer>();
		
		for (int i = 0; i < 5; i++) {
			ycal.add(Calendar.YEAR, -i);
			String yearString = yyyy.format(ycal.getTime());
			int yearSales = pursv.getYearSales(yearString);
			ySalesList.add(yearSales);
			ycal.add(Calendar.YEAR, +i);
      }
		 model.addAttribute("yearSalesList", ySalesList);

		for (int i = 0; i < 7; i++) {
			cal.setTime(new Date());
			cal.add(Calendar.DATE, -i);
			String todayString = sdf.format(cal.getTime());
			int dateSales = pursv.getDateSales(todayString);
			salesList.add(dateSales);
		}
		logger.info(salesList.toString());
		model.addAttribute("dateSalesList", salesList);
	
		/*-------------- 요일 별 매출 -------------*/
	
		cal = Calendar.getInstance();
		List<Integer> weekSales = new ArrayList<Integer>();
		for (int i = 1; i <= 7; i++) {
			cal.setTime(new Date());
			sdf = new SimpleDateFormat("MM");
			String month = sdf.format(cal.getTime());
			weekSales.add(pursv.getWeekSales(month,i));
		}
		model.addAttribute("weekSales",weekSales);
		}

}

