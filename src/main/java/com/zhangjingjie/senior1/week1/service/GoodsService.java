package com.zhangjingjie.senior1.week1.service;

import java.util.List;

import com.zhangjingjie.senior1.week1.domain.Brand;
import com.zhangjingjie.senior1.week1.domain.Goods;
import com.zhangjingjie.senior1.week1.domain.Kind;
import com.zhangjingjie.senior1.week1.vo.GoodsVo;

public interface GoodsService {

	List<Goods> listGoods(GoodsVo vo);

	List<Brand> selectBrand();

	List<Kind> selectKind();

	boolean addGoods(Goods goods);

	boolean updateGoods(Goods goods);

	Goods selectOneGoods(String gid);

	boolean deleteGoods(String gids);

}
