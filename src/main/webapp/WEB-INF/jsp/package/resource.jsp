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
var iframeHeight  = $(this).height() -50;
var lastIndex2=-1;
var treeGrid;
var isExists=false;
    $(function() {
        treeGrid = $('#treeGrid').treegrid({
            url : '<%=ctx%>/resource/treeGrid',
            idField : 'id',
            treeField : 'name',
            parentField : 'pid',
            fit : true,
            fitColumns : false,
            border : false,
            frozenColumns : [ [ {
                title : '编号',
                field : 'id',
                width : 40
            } ] ],
            columns : [ [ {
                field : 'name',
                title : '资源名称',
                width : 150
            }, {
                field : 'url',
                title : '资源路径',
                width : 200
            }, {
                field : 'seq',
                title : '排序',
                width : 40
            }, {
                field : 'resourcetype',
                title : '资源类型',
                width : 80,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '菜单';
                    case 1:
                        return '按钮';
                    }
                }
            }, {
                field : 'pid',
                title : '上级资源ID',
                width : 150,
                hidden : true
            }, {
                field : 'status',
                title : '状态',
                width : 40,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '正常';
                    case 1:
                        return '停用';
                    }
                }
            }, {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                    str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
                    return str;
                }
            } ] ],
            onLoadSuccess:function(data){
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
                $('.resource-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
            },
            toolbar : '#toolbar'
        });
        //弹出框设置
        $('#editWin').window({
			title: '编辑',
			modal:true,
			closed: true,
			collapsible : false,
			minimizable : false,
			cache:false,
			top:0,
			onBeforeOpen:function(){
				$(this).css("height",iframeHeight + "px");
			},
			onClose:function(){
				$('#treeGrid').datagrid('reload');
			}
		});		
    });
	
    function edit(Id){
		var wintitle = '新增';
		var url = "<%=ctx%>/resource/loadResource?1=1";
		if(Id != "-1"){
			url = url + "&id=" + Id;
			wintitle = '编辑';
		}else{
		}
		$('#editWin').window({title:wintitle,href:url,onLoad:function(){
		}});
		$('#editWin').window("open");
		
	}
   
    function save(){
		$("#resourceEditForm").form('submit',
				{url:'<%=ctx%>/resource/addOrUpdateResource',
		        onSubmit: function(){
		        	var flag=$('#concatUsEditForm').form('validate');
		        	alert(flag);
		        	return flag;
		        },
		        success:function(result){
		        	result = $.parseJSON(result);
		        	if(result.success){
			        	$.messager.alert('','保存成功');
			        	$('#editWin').window("close");
			    		$('#treeGrid').datagrid('reload');
		        	}else{
		        		$.messager.alert('',result.msg);
		        	}
		        }
			}
		);		
	}
    //弹出框取消按钮
    function cancel(){
		$('#editWin').window("close");
		$('#treeGrid').datagrid('reload');
	}
    
    function deleteFun(id) {
        if (id != undefined) {
            treeGrid.treegrid('select', id);
        }
        var node = treeGrid.treegrid('getSelected');
        if (node) {
            parent.$.messager.confirm('询问', '您是否要删除当前资源？删除当前资源会连同子资源一起删除!', function(b) {
                if (b) {
                    progressLoad();
                    $.post('<%=ctx%>/resource/delete', {
                        id : node.id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            treeGrid.treegrid('reload');
                           
                        }
                        progressClose();
                    }, 'JSON');
                }
            });
        }
    }

    <%-- function editFun(id) {
        if (id != undefined) {
            treeGrid.treegrid('select', id);
        }
        var node = treeGrid.treegrid('getSelected');
        if (node) {
            parent.$.modalDialog({
                title : '编辑',
                width : 500,
                height : 350,
                href : '<%=ctx%>/resource/editPage?id=' + node.id,
                buttons : [ {
                    text : '确定',
                    handler : function() {
                        parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                        var f = parent.$.modalDialog.handler.find('#resourceEditForm');
                        f.submit();
                    }
                } ]
            });
        }
    }

    
    function addFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 350,
            href : '<%=ctx%>/resource/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#resourceAddForm');
                    f.submit();
                }
            } ]
        });
    } --%>
    </script>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false"  style="overflow: hidden;">
            <table id="treeGrid"></table>
        </div>
    </div>
    <div id="toolbar" style="display: none;">
        <!-- <a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a> -->
         <a onclick="edit(-1);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a> 
    </div>
     <div id="editWin"  class="easyui-window" style="width:700px;height:200px;">
	</div>
</body>
</html>