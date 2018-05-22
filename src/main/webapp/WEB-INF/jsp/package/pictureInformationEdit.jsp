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
<title>Insert title here</title>
</head>
<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules, {  
	call: {  
	        validator: function(value, param){  
	            var callback = param[0];  
	            if(callback){  
	            return callback(value);  
	            }  
	            return false;  
	        },  
	        message: '{1}'   
	    }  
	});
var image = '';
function selectImage(file){
	var importFile = $("#myfiles").val();
		if(importFile !=''){
			var ext = importFile.toLowerCase().substr(importFile.lastIndexOf(".")+1);
			if(ext != 'png' && ext != 'jpg' && ext != 'jpeg' && ext != 'bmp' && ext != 'gif'){
				$("#image").src="";
				$("#myfiles").val("");
				return false;
			}
		}
	var reader = new FileReader();
 	reader.onload = function(evt){
 	var img=evt.target.result;
	document.getElementById('image').src = evt.target.result;
 	image = evt.target.result;
	}
	reader.readAsDataURL(file.files[0]);
}
</script>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="pictureInformationEditForm" enctype="multipart/form-data" method="post">
            <table class="grid" border="none" cellspacing="0">
                <tr height="150px">
	    			 <tr height="150px">
	    			<td style="text-align: right;">图片大全</td>
	    			<td colspan="3" align="left"><img id="image" src="<c:if test="${not empty pictureInformation.picture}"><%=ctx%></c:if>${pictureInformation.picture}" style="width:auto;height:130px"/><br>
	    			<input type="file" id="myfiles" name="myfiles" onchange="selectImage(this);" style="width:auto;height:20px"/></td>
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