package com.zhangjingjie.senior1.week1.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangjingjie.senior1.week1.dao.GoodsMapper;
import com.zhangjingjie.senior1.week1.domain.Brand;
import com.zhangjingjie.senior1.week1.domain.Goods;
import com.zhangjingjie.senior1.week1.domain.Kind;
import com.zhangjingjie.senior1.week1.service.GoodsService;
import com.zhangjingjie.senior1.week1.vo.GoodsVo;
@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper mapper;

	@Override
	public List<Goods> listGoods(GoodsVo vo) {
		return mapper.listGoods(vo);
	}

	@Override
	public List<Brand> selectBrand() {
		return mapper.selectBrand();
	}

	@Override
	public List<Kind> selectKind() {
		return mapper.selectKind();
	}

	@Override
	public boolean addGoods(Goods goods) {
		return mapper.addGoods(goods)>0;
	}

	@Override
	public boolean updateGoods(Goods goods) {
		return mapper.updateGoods(goods)>0;
	}

	@Override
	public Goods selectOneGoods(String gid) {
		return mapper.selectOneGoods(gid);
	}

	@Override
	public boolean deleteGoods(String gids) {
		return mapper.deleteGoods(gids)>0;
	}
}
