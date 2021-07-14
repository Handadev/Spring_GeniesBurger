package com.myweb.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.myweb.domain.StockVO;
import com.myweb.service.stock.StockServiceRule;

@RequestMapping("/stock/*")
@RestController
@Controller
public class StockController {
	private static Logger logger = LoggerFactory.getLogger(StockController.class);

	@Inject
	private StockServiceRule ssv;

	@RequestMapping(value = "/sno/{sno}/qty/{qty}", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = MediaType.TEXT_PLAIN_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modifyStockQty(@PathVariable("sno") int sno, @PathVariable("qty") int qty) {
		return ssv.modifyStockQty(sno, qty) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{sno}", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@PathVariable("sno") int sno, @RequestBody StockVO svo) {
		return ssv.modify(svo) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping(value = "/{sno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("sno") int sno) {
		return ssv.remove(sno) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/sname/{sname}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeAll(@PathVariable("sname") String sname) {
		return ssv.removeAll(sname) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/presentList")
	public ModelAndView presentList() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/stock/stock_present");
		return view;
	}

//	@GetMapping(value = "/list", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
//			MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<List<StockVO>> list() {
//		return new ResponseEntity<List<StockVO>>(ssv.getList(), HttpStatus.OK);
//	}

	@GetMapping(value = "/totalCntList", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<StockVO>> totalCntList() {
		return new ResponseEntity<List<StockVO>>(ssv.getTotalCntList(), HttpStatus.OK);
	}

	@GetMapping(value = "/oneList/{sname}", produces = { MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<StockVO>> oneList(@PathVariable("sname") String sname) {
		return new ResponseEntity<List<StockVO>>(ssv.getOneList(sname), HttpStatus.OK);
	}

	@PostMapping(value = "/register", consumes = "application/json", produces = "application/text; charset=utf-8")
	public ResponseEntity<String> register(@RequestBody StockVO svo) {
		int isUp = ssv.register(svo);
		return isUp > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
