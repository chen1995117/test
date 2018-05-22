<%String ctx = request.getContextPath();%>
<%--标签 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>资源管理</title>
</head>
<script type="text/javascript">
<%--     $(function() {

        $('#pid').combotree({
            url : '<%=ctx%>/resource/tree',
            parentField : 'pid',
            lines : true,
            panelHeight : 'auto',
            value : '${resource.pid}'
        });
        
        $('#resourceEditForm').form({
            url : '<%=ctx%>/resource/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为resource.jsp页面预定义好了
                    parent.layout_west_tree.tree('reload');
                    parent.$.modalDialog.handler.dialog('close');
                }
            }
        });

        $("#status").val('${resource.status}');
        $("#resourcetype").val('${resource.resourcetype}');
    }); --%>
</script>
<div style="padding: 3px;">
    <form id="resourceEditForm" method="post">
        <table  class="grid">
            <tr>
                <td>资源名称</td>
                <td><input name="id" type="hidden"  value="${resource.id}" >
                <input name="name" type="text" placeholder="请输入资源名称" value="${resource.name}" class="easyui-validatebox span2" data-options="required:true" ></td>
                <td>资源类型</td>
                <td><select id="resourcetype" name="resourcetype" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">菜单</option>
                            <option value="1">按钮</option>
                </select></td>
            </tr>
            <tr>
                <td>资源路径</td>
                <td><input name="url" type="text" value="${resource.url}" placeholder="请输入资源路径" class="easyui-validatebox span2" ></td>
                <td>排序</td>
                <td><input name="seq" value="${resource.seq}"  class="easyui-numberspinner" style="width: 140px; height: 29px;" required="required" data-options="editable:false"></td>
            </tr>
            <tr>
                <td>菜单图标</td>
                <td ><input  name="icon" value="${resource.icon}"/></td>
                <td>状态</td>
                <td ><select id="status" name="status" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                </select></td>
            </tr>
            <tr>
                <td>上级资源</td>
                <td colspan="3"><select id="pid" name="pid" style="width: 200px; height: 29px;"></select>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空</a></td>
            </tr>
        </table>
    </form>
    <div region="south" style="height:30px;line-height:30px;overflow: hidden;">
		<div class="toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancel();" style="float:right">取消</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="save();" style="float:right">保存</a>
		</div>
	</div>
</div>
