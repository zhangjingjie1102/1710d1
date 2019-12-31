<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index2.css">
<script type="text/javascript" src="resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function fenye(pageNum) {
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
	
	//添加
	function add() {
		location="add.jsp";
	}
	//修改
	function xg(gid) {
		location="update.jsp?gid="+gid;
	}
	//详情
	function xq(gid) {
		location="xiangqing.jsp?gid="+gid;
	}
	//单删
	function sc(gid) {
		if(confirm("确定要删除这条内容吗?")){
			$.post("deleteGoods.do",{gids:gid}, function(flag) {
				if(flag){
					alert("删除成功");
					location="listGoods.do";
				}else{
					alert("删除失败");
					location="listGoods.do";
				}
			});
		}
	}
	//批量删除
	function plsc() {
		if(confirm("确定要删除这些内容吗?")){
			var gids = $("[name=check]:checked").map(function() {
				return this.value
			}).get().join();
			$.post("deleteGoods.do",{gids:gids}, function(flag) {
				if(flag){
					alert("删除成功");
					location="listGoods.do";
				}else{
					alert("删除失败");
					location="listGoods.do";
				}
			});
		}
	}
	
	function choose(own) {
		$("[name=check]").attr("checked",own.checked);
	}
</script>
</head>
<body>
	<form action="listGoods.do" method="post">
		<input type="hidden" name="pageNum">
		商品名称：<input type="text" name="gname" value="${vo.gname }">
		<button>搜索</button>
	</form>
	<table>
		<tr>
			<th>
				<input type="checkbox" onclick="choose(this)">
			</th>
			<th>商品编号</th>
			<th>商品名称</th>
			<th>英文名称</th>
			<th>商品品牌</th>
			<th>商品种类</th>
			<th>商品尺寸</th>
			<th>商品单价</th>
			<th>商品数量</th>
			<th>商品标签</th>
			<th>商品图片</th>
			<th>操作
				<button onclick="add()">添加</button>
			</th>
		</tr>
		<c:forEach var="g" items="${list }" varStatus="count">
			<tr>
				<td>
					<input type="checkbox" name="check" value="${g.gid }">
				</td>
				<td>${count.count+page.startRow-1 }</td>
				<td>${g.gname }</td>
				<td>${g.gEnglishName }</td>
				<td>${g.brand.bname }</td>
				<td>${g.kind.kname }</td>
				<td>${g.size }</td>
				<td>${g.price }</td>
				<td>${g.gnum }</td>
				<td>${g.glabel }</td>
				<td>
					<img style="width: 80px;height: 80px;" alt="" src="load/${g.image }">
				</td>
				<td>
					<button onclick="xq(${g.gid})">商品详情</button> 
					<button onclick="xg(${g.gid})">商品编辑</button>
					<button onclick="sc(${g.gid})">商品删除</button>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td	colspan="13">
				<button onclick="fenye(1)">首页</button>
				<button onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</button>
				<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
				<button onclick="fenye(${page.pages})">尾页</button>&nbsp;&nbsp;&nbsp;
				当前${page.pageNum }/${page.pages }页,共${page.total }条数据
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button onclick="plsc()">批量删除</button>
			</td>
		</tr>
	</table>
</body>
</html>