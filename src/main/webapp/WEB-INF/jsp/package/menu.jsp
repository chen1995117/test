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
<title></title>
</head>
<script type="text/javascript">
/* var iframeHeight  = $(this).height() -50;
var lastIndex2=-1;
var isExists=false; */
var index_layout;
var index_tabs;
var index_tabsMenu;
	 $(function(){
		var menuTree;
		menuTree = $('#menuTree').tree({
			url : '<%=ctx%>/menu/treeGrid',
			lines : true,
			onClick : function(node) {
				refush(node.text,node.attributes);
			}
		}); 
		index_layout = $('#index_layout').layout({
	           fit : true
	        });
	     index_tabs = $('#index_tabs').tabs({
            fit : true,
            border : false,
            tools : [{
                iconCls : 'icon-home',
                handler : function() {
                    index_tabs.tabs('select', 0);
                   
                }
	            }, {
                iconCls : 'icon-refresh',
                handler : function() {
                    var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                    index_tabs.tabs('getTab', index).panel('open').panel('refresh');
	                }
	            }, {
                iconCls : 'icon-del',
                handler : function() {
                    var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                    var tab = index_tabs.tabs('getTab', index);
                    if (tab.panel('options').closable) {
                        index_tabs.tabs('close', index);
                    }
                }
	        }]
	    });
		function refush(text, url) {  
		     var iframe = '<iframe src="' + url+ '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
		        var t = $('#index_tabs');
		        var opts = {
		            title : text,
		            closable : true,
		            content : iframe,
		            border : false,
		            fit : true
		        };
		        if (t.tabs('exists', opts.title)) {
		            t.tabs('select', opts.title);     
		        } else {
		            t.tabs('add', opts);
		        }
		    }
	});
</script>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'west',border:true,split:true,title:'菜单列表'"
		style="width: 180px; overflow: hidden;">
		<ul id="menuTree"
			style="width: 160px; margin: 10px 10px 10px 10px">
		</ul>
	</div>
	<div data-options="region:'center',border:true">
		<div id="index_tabs" style="overflow: hidden;">
           <div title="公司信息" data-options="closable:true,border:false" style="overflow: hidden;">
               <iframe src="<%=ctx%>/concatUs/manager" style="height: 100%;width: 100%;"></iframe>
           </div>
       	</div>
	</div>
</body>
</html>