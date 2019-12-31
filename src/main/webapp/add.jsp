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
<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
<script type="text/javascript">

	$(function() {
		var msg = "${msg}";
		var mmg = "${mmg}";
		if(msg!=null && msg!=""){
			alert(msg);
			location="listGoods.do";
		}
		if(mmg!=null && mmg!=""){
			alert(mmg);
			location="add.jsp";
		}
	});
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
	
	$(function() {
		$("form").validate({
			rules:{
				gname:{required:true},
				gEnglishName:{required:true},
				bid:{required:true},
				kid:{required:true},
				size:{required:true},
				price:{required:true},
				gnum:{required:true},
				glabel:{required:true},
				myFile:{required:true}
			},
			messages:{
				gname:{required:"<font color='red'>商品名称必填</font>"},
				gEnglishName:{required:"<font color='red'>英文名称必填</font>"},
				bid:{required:"<font color='red'>商品品牌必选</font>"},
				kid:{required:"<font color='red'>商品种类必选</font>"},
				size:{required:"<font color='red'>商品尺寸必填</font>"},
				price:{required:"<font color='red'>商品单价必填</font>"},
				gnum:{required:"<font color='red'>商品数量必填</font>"},
				glabel:{required:"<font color='red'>商品标签必填</font>"},
				myFile:{required:"<font color='red'>商品图片必选</font>"}
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
	});
</script>
</head>
<body>
	<form action="add.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th colspan="2">商品添加</th>
			</tr>
			<tr>
				<th>商品名称</th>
				<td>
					<input type="text" name="gname">
				</td>
			</tr>
			<tr>
				<th>英文名称</th>
				<td>
					<input type="text" name="gEnglishName">
				</td>
			</tr>
			<tr>
				<th>商品品牌</th>
				<td>
					<select name="bid" id="bid">
						<option value="">请选择品牌</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>商品种类</th>
				<td>
					<select name="kid" id="kid">
						<option value="">请选择种类</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>商品尺寸</th>
				<td>
					<input type="text" name="size">
				</td>
			</tr>
			<tr>
				<th>商品单价</th>
				<td>
					<input type="text" name="price">
				</td>
			</tr>
			<tr>
				<th>商品数量</th>
				<td>
					<input type="text" name="gnum">
				</td>
			</tr>
			<tr>
				<th>商品标签</th>
				<td>
					<input type="text" name="glabel">
				</td>
			</tr>
			<tr>
				<th>商品图片</th>
				<td>
					<input type="file" name="myFile">
				</td>
			</tr>
			<tr>
				<th>商品添加</th>
				<td>
					<input type="submit" value="添加">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>