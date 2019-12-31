package com.zhangjingjie.senior1.week1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhangjingjie.senior1.week1.domain.Brand;
import com.zhangjingjie.senior1.week1.domain.Goods;
import com.zhangjingjie.senior1.week1.domain.Kind;
import com.zhangjingjie.senior1.week1.service.GoodsService;
import com.zhangjingjie.senior1.week1.vo.GoodsVo;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	
	@RequestMapping("listGoods.do")
	public String listGoods(Model m,GoodsVo vo) {
		if(vo.getPageNum()==null) {
			vo.setPageNum(1);
		}
		
		PageHelper.startPage(vo.getPageNum(), 4);
		
		List<Goods> list = service.listGoods(vo);
		
		PageInfo<Goods> page = new PageInfo<>(list);
		
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		m.addAttribute("vo", vo);
		
		return "list";
	}
	
	
	
	@ResponseBody
	@RequestMapping("selectBrand.do")
	public Object selectBrand() {
		List<Brand> list = service.selectBrand();
		return list;
		
	}
	
	
	@ResponseBody
	@RequestMapping("selectKind.do")
	public Object selectKind() {
		List<Kind> list = service.selectKind();
		return list;
		
	}
	
	
	
	@RequestMapping("add.do")
	public String addGoods(Model m,Goods goods,MultipartFile myFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String realName = myFile.getOriginalFilename();
		String endName = realName.substring(realName.lastIndexOf("."));
		String realPath = request.getRealPath("/load/");
		String startName = UUID.randomUUID().toString();
		
		File file = new File(realPath+startName+endName);
		myFile.transferTo(file);
		goods.setImage(startName+endName);
		
		boolean flag = service.addGoods(goods);
		if(flag) {
			m.addAttribute("msg", "添加成功");
			return "forward:add.jsp";
		}else {
			m.addAttribute("mmg", "添加失败");
			return "forward:add.jsp";
		}
	}
	
	@RequestMapping("update.do")
	public String updateGoods(Model m,Goods goods,MultipartFile myFile,HttpServletRequest request) throws IllegalStateException, IOException {
		System.err.println(goods);
		if(!"".equals(myFile.getOriginalFilename())) {
			String realName = myFile.getOriginalFilename();
			String endName = realName.substring(realName.lastIndexOf("."));
			String realPath = request.getRealPath("/load/");
			String startName = UUID.randomUUID().toString();
			
			File file = new File(realPath+startName+endName);
			myFile.transferTo(file);
			goods.setImage(startName+endName);
		}
		
		boolean flag = service.updateGoods(goods);
		if(flag) {
			m.addAttribute("msg", "修改成功");
			return "forward:update.jsp";
		}else {
			m.addAttribute("mmg", "修改失败");
			return "forward:update.jsp";
		}
	}
	
	@ResponseBody
	@RequestMapping("selectOneGoods.do")
	public Object selectOneGoods(String gid) {
		Goods goods = service.selectOneGoods(gid);
		System.out.println(goods);
		return goods;
	}
	
	
	@ResponseBody
	@RequestMapping("deleteGoods.do")
	public Object deleteGoods(String gids) {
		
		boolean flag = service.deleteGoods(gids);
		
		return flag;
	}
}
