<%String ctx = request.getContextPath();%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--标签 --%>
<%@ page isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <!-- [jQuery] -->
    <script type="text/javascript" src="<%=ctx%>/static/js/easyui/jquery.min.js"></script>
    <!-- [EasyUI] -->
   	<link rel="stylesheet" type="text/css" href="<%=ctx%>/static/js/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="<%=ctx%>/static/js/easyui/themes/icon.css"/>
    <script type="text/javascript" src="<%=ctx%>/static/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=ctx%>/static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="<%=ctx%>/static/js/easyui/plugins/jquery.datebox.js"></script>
    <!-- [扩展JS] -->
    <script type="text/javascript" src="<%=ctx%>/static/js/extJs.js" charset="utf-8"></script>
    <!-- [扩展样式] -->
    <link rel="stylesheet" type="text/css" href="<%=ctx%>/static/css/dreamlu.css" />
	<!-- [提交表单] -->
	<script type="text/javascript" src="<%=ctx%>/static/js/jquery.form.js"></script>
	<!-- [扩展window] -->
	<script type="text/javascript" src="<%=ctx%>/static/js/BaseWindow.js"></script>
	<!-- 自定义 -->
	<script type="text/javascript" src="<%=ctx%>/static/js/public.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>Insert title here</title>
</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="concatUsEditForm"  method="post">
           <table>
				<tr>
					
					<td><label for="name">公司名称:</label></td>
					<td><input class="easyui-textbox"  data-options="required:true" name="companyName" style="width:100%" value="${concatUs.companyName}"/></td>
					<td>pid:</td>
					<td><input class="easyui-textbox "  name="pid" style="width:100%" value="${concatUs.pid}"/></td>
					
				</tr>
				<tr>
					<script type="text/javascript">
						$.extend($.fn.validatebox.defaults.rules,{ 
		  						phone : {// 验证电话号码 
		        					validator : function(value) { 
		            					return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
		        				}, 
		        				message:'格式不正确,请使用下面格式:020-88888888' 
		    					}, 
						});
					</script>
					<td>电话号码:</td>
					<td><input class="easyui-textbox validatebox"   data-options="required:true, validType:'phone'" name=phoneNumber style="width:100%" value="${concatUs.phoneNumber}"></td>
					
					<td>传真:</td>
					<td><input class="easyui-textbox validatebox"  data-options="required:true,validType:'phone'"  name=fax style="width:100%" value="${concatUs.fax}"></td>
				</tr>
				<tr>
					<td>微信公众号:</td>
					<td><input class="easyui-textbox"  name="officialAccounts" style="width:100%" value="${concatUs.officialAccounts}"></td>
					<td>7*24小时服务电话:</td>
					<td><input class="easyui-textbox validatebox"   data-options="validType:'phone'"  name="allDayServcePhone" style="width:100%" value="${concatUs.allDayServcePhone}"></td>
				</tr>
				<tr>
					<td><label for="email">邮箱:</label></td>
					<td><input class="easyui-textbox validatebox"  data-options="required:true,validType:'email'" name="email" style="width:100%" value="${concatUs.email}"/></td>
					<td>公司成立时间:</td>
					<td><input class="easyui-datebox"   data-options="required:true" name="establishedTime" style="width:100%" value="${concatUs.establishedTime}"></td>
				</tr>
				<tr>
					<td>联系地址:</td>
					<td><input class="easyui-textbox"  data-options="required:true"  name="address" style="width:100%" value="${concatUs.address}"/></td>
					<td style="display:none;"><input class="easyui-textbox"  name="id"  value="${concatUs.id}"/></td>
				</tr>
			</table>
        </form>
			</div>
			<div region="south" style="height:30px;line-height:30px;overflow: hidden;">
				<div class="toolbar">
					<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel();" style="float:right">取消</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="save();" style="float:right">保存</a>
				</div>
			</div>
    </div>
</body>
</html>