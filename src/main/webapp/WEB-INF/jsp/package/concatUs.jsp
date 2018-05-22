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
var iframeHeight  = $(this).height() -50;
var lastIndex2=-1;
var datagrid;
/* var menuTree; */
var isExists=false;
	 $(function(){
		var dataGrid;
		 dataGrid = $('#dataGrid').datagrid({
	        	url : '<%=ctx%>/concatUs/dataGrid',
	        	pagination : true,
				rownumbers:true,
				singleSelect: false,
				loadMsg: "正在努力加载数据，请稍后...",
				pageSize : 20,
				pageList : [ 50, 40, 30, 20, 10 ],
				CheckBox:true,
				columns : [
				            [{
								width : '80',
								field : 'sort',
								sortable : true,
								checkbox:true	
								},{
								width : '13%',
								title : '公司名称',
								field : 'companyName',
								sortable : true
							},{
								width : '13%',
								title : '电话',
								field : 'phoneNumber',
							},{
								width : '13%',
								title : 'pid',
								field : 'pid',
								hidden:true,
							},{
								width : '8%',
								title : '邮箱',
								field : 'email',
								sortable : true ,
							},{
								width : '13%',
								title : '传真',
								field : 'fax',
								sortable : true,
							},{
								width:'13%',
								title:'地址',
								field:'address',
							},{
								width:'13%',
								title:'微信公众号',
								field:'officialAccounts',
							},{
								width:'13%',
								title:'7×24h服务电话',
								field:'allDayServcePhone',
							},{
								width:'13%',
								title:'公司成立时间',
								field:'establishedTime',
								formatter:function(value){
									var testdate = new Date(value);
									return testdate.format("yyyy-MM-dd");
								}
							},{
							field : 'action',
							title : '操作',
							width : 130,
							formatter : function(value, row, index) {
								 var str = '';
			                        str += $
									.formatString(
											'<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="edit(\'{0}\');" >编辑</a>',
											row.id);
			                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
			                            str += $
										.formatString(
											'<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>',
											row.id);
			                    return str;
			                }
						} ] ],
				onLoadSuccess : function(data) {
					 $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
		             $('.user-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'icon-del'});
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
					$('#dataGrid').datagrid('reload');
				}
			});		
	});
	 function edit(Id){
			var wintitle = '新增';
			var url = "<%=ctx%>/concatUs/loadConcatUs?1=1";
			if(Id != "-1"){
				url = url + "&id=" + Id;
				wintitle = '编辑';
			}else{
			}
			$('#editWin').window({title:wintitle,href:url,onLoad:function(){
			}});
			$('#editWin').window("open");
			
		}
	    
	    function deleteFun(id){
			$.messager.confirm('提示','确认删除该记录?',function(r){
				if(r){
					$.post("<%=ctx%>/concatUs/delete",{id:id},function(r){
						if (r.success) {
	                        $.messager.alert('提示', r.msg, 'info');
	                        $('#dataGrid').datagrid('reload');
	                    }else{
	                    	$.messager.alert('提示', r.msg, 'info');
	                    }
	                    progressClose();
	                }, 'JSON');
				}//r等于true或者false
			});
		}
	    //保存按钮
	    function save(){
			$("#concatUsEditForm").form('submit',
					{url:'<%=ctx%>/concatUs/saveOrUpdateConcatUs',
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
				    		$('#dataGrid').datagrid('reload');
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
			$('#dataGrid').datagrid('reload');
		}
	    //查询
	    function searchFun() {
	    	$("#dataGrid").datagrid('load', $.serializeObject($('#searchForm')));
	    }
	    //重置
	    function cleanFun() {
	        $('#searchForm input').val('');
	        $("#dataGrid").datagrid('load', {});
	    }
	    /* function refush(url){
	    	window.location=url;
	    } */
</script>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',border:false" 
    	style="height: 30px;overflow: hidden; background-color: #fff">
        <form id="searchForm">
            <table>
                <tr>
                    <td>公司成立时间:</td>
                    <td><input name="establishedTime1" class="easyui-datebox" type="text"></input></td>
                    <td>
                    <td>到</td>
                    <td><input name="establishedTime2" class="easyui-datebox" type="text"></input></td>
                    <td>
                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="searchFun();">查询</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true" onclick="cleanFun();">重置</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
	<div data-options="region:'center',border:true">
		 <table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" style="display: none;">
         <a onclick="edit(-1);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>    
    </div>
    <div id="editWin"  class="easyui-window" style="width:700px;height:200px;">
	</div>
</body>
</html>