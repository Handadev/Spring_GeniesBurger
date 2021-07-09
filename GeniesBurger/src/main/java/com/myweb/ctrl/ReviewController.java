package com.myweb.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.domain.ReviewVO;
import com.myweb.orm.ReviewFileProcessor;
import com.myweb.service.review.ReviewServiceRule;

@RequestMapping("/review/*")
@Controller
public class ReviewController {
	private static Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	private ReviewServiceRule rsv;

	@Inject
	private ReviewFileProcessor fp;

	@PostMapping
	public String register(ReviewVO rvo, @RequestParam(name = "files", required = false) MultipartFile[] files) {
		if (files[0].getSize() > 0) {
			int isUp = rsv.ReviewAdd(rvo);
			if (isUp > 0) {
				int rno = rsv.ReviewCurrRno();
				isUp = fp.upload_file(files, rno);
			}
		} else {
			int isUp = rsv.ReviewAdd(rvo);
		}
		return "redirect:/review/list";
	}

	@GetMapping("/register")
	public void register() {

	}

	@GetMapping("/list")
	public void list(Model model) {
		int rno = 17;
		model.addAttribute("list", rsv.ReviewList());
		model.addAttribute("clist", rsv.commentList(rno));

	}
}
