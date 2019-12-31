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
	$(function() {
		$.post("selectOneGoods.do",{gid:gid}, function(obj) {
			$("[name=gid]").val(obj.gid);
			$("[name=gname]").val(obj.gname);
			$("[name=gEnglishName]").val(obj.gEnglishName);
			$("[name=bid]").val(obj.bid);
			$("[name=kid]").val(obj.kid);
			$("[name=size]").val(obj.size);
			$("[name=price]").val(obj.price);
			$("[name=gnum]").val(obj.gnum);
			$("[name=glabel]").val(obj.glabel);
			$("#tp").append("<img disabled='disabled' style='width:80px;heigth:80px;' alt='' src='load/"+obj.image+"'>")
		},"json");
	})
	
	$(function() {
		var msg = "${msg}";
		var mmg = "${mmg}";
		if(msg!=null && msg!=""){
			alert(msg);
			location="listGoods.do";
		}
		if(mmg!=null && mmg!=""){
			alert(mmg);
			location="update.jsp";
		}
	});
	
	function fanhui() {
		location="listGoods.do";
	}

	var gid = "${param.gid}";
	$(function() {
		$.post("selectBrand.do", function(arr) {
			for ( var i in arr) {
				$("#bid").append("<option value='"+arr[i].bid+"'>"+arr[i].bname+"</option>");
			}
		},"json");
		$.post("selectKind.do", function(arr) {
			for ( var i in arr) {
				$("#kid").append("<option value='"+arr[i].kid+"'>"+arr[i].kname+"</option>");
			}
		},"json");
	});
</script>
</head>
<body>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th colspan="2">商品添加</th>
			</tr>
			<tr>
				<th>商品名称</th>
				<td>
					<input type="hidden" name="gid" disabled="disabled">
					<input type="text" name="gname" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>英文名称</th>
				<td>
					<input type="text" name="gEnglishName" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>商品品牌</th>
				<td>
					<select name="bid" id="bid" disabled="disabled">
						<option value="">请选择品牌</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>商品种类</th>
				<td>
					<select name="kid" id="kid" disabled="disabled">
						<option value="">请选择种类</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>商品尺寸</th>
				<td>
					<input type="text" name="size" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>商品单价</th>
				<td>
					<input type="text" name="price" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>商品数量</th>
				<td>
					<input type="text" name="gnum" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>商品标签</th>
				<td>
					<input type="text" name="glabel" disabled="disabled">
				</td>
			</tr>
			<tr>
				<th>商品图片</th>
				<td id="tp">
					
				</td>
			</tr>
			<tr>
				<th>返回</th>
				<td>
					<input type="button" value="返回" onclick="fanhui()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>