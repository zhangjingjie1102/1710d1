package com.zhangjingjie.senior1.week1.dao;

import java.util.List;

import com.zhangjingjie.senior1.week1.domain.Brand;
import com.zhangjingjie.senior1.week1.domain.Goods;
import com.zhangjingjie.senior1.week1.domain.Kind;
import com.zhangjingjie.senior1.week1.vo.GoodsVo;

public interface GoodsMapper {

	List<Goods> listGoods(GoodsVo vo);
	
	Brand findByBid(Integer bid);
	
	Kind findByKid(Integer kid);

	List<Brand> selectBrand();

	List<Kind> selectKind();

	int addGoods(Goods goods);

	int updateGoods(Goods goods);

	Goods selectOneGoods(String gid);

	int deleteGoods(String gids);

}
