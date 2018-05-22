<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String ctx = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=ctx%>/static/css/common.css" rel="stylesheet" style="text/css"/>
<link href="<%=ctx%>/static/css/common2.css" rel="stylesheet" style="text/css"/>
<link href="<%=ctx%>/static/js/layui/layui/css/layui.css" rel="stylesheet" style="text/css"/>
<script type="text/javascript" src="<%=ctx%>/static/js/layui/layui/layui.js"></script>
<script type="text/javascript" src="<%=ctx%>/static/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=ctx%>/static/js/layui/layui/layui.all.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邵氏集团</title>
</head>
<script type="text/javascript">
</script>
<body>
	<!-- 头部logo -->
<div class="fixed m10">
	<div class="f1"><img alt="" src="<%=ctx%>/static/images/logo.png"  border="0" class="logo"></div>
</div>
<div class="menu m15" style="color: #FFA54F;">
	<ul>
		<li id="headMenu1"><a id="headMenu1" href="<%=ctx%>/news/firstPackage.do" style="color:#FFA54F;">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp;</a></li>
		<li id="headMenu2"><a id="headMenu2" href="" style="color: #FFA54F;">公司简介</a></li>
		<li id="headMenu3"><a id="headMenu3" href="" style="color: #FFA54F;">案例展示</a></li>
		<li id="headMenu4"><a id="teamProduce" href="<%=ctx%>/news/teamProduce" style="color: #FFA54F;">团队介绍</a></li>
		<li id="headMenu5"><a id="companny" href="<%=ctx%>/news/connectionUs" style="color: #FFA54F;">联系我们</a></li>
	</ul>
</div>
<!-- 首页中部 -->
<div class="fixed2 m10 shadow">
<div style="background:url('<%=ctx%>/static/images/bg02.jpg') repeat;padding-left:10px;">
<div id="sildeBox" style="width:980px;margin-top:-2px;">
	<div id="sildePics">
		<ul id="sildeItem" style="no-repeat scroll 87px 0px;padding-top:5px;">
			<li id="brand" class="current1" style="margin-left:5px" ><b style="font-size:13px; padding-top:8px;">推荐作品</b></li>
			<li id="brand0" style="margin-left:5px"><a href="###">鸟巢</a></li>
			<li id="brand1" style="margin-left:5px"><a href="###">布达拉宫</a></li>
			<li id="brand2" style="margin-left:5px"><a href="###">人民大会堂</a></li>
			<li id="brand3" style="margin-left:5px"><a href="###">北京博物馆</a></li>
		</ul>
	</div>
	<div class="fc"></div>
</div>
</div>
<div class="fixed2  contentBox m10">
	<div class="fixed2" style="background:url('<%=ctx%>/static/images/lin2.jpg')no-repeat bottom;height:8px;"></div>
	<div style="background:url('<%=ctx%>/static/images/bg02.jpg') repeat;padding:10px;">
	<table width="790" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="196" height="50" align="center"><a href="">数字环幕电影</a></td>
    <td width="177" align="center"><a href="">地产项目包装</a></td>
    <td width="203" align="center"><a href="">大屏幕影院工程</a></td>
    <td width="214" align="center"><a href="">大型展馆互动多媒体 </a></td>
  </tr>
  <tr>
    <td align="center"><a href=""><img src="<%=ctx%>/static/images/1.jpg" width="50" height="82" border="0"/></a> </td>
    <td align="center"><a href=""><img src="<%=ctx%>/static/images/2.jpg" width="57" height="82" border="0" /></a></td>
    <td align="center"><a href=""><img src="<%=ctx%>/static/images/3.jpg" width="106" height="82" border="0"/></a></td>
    <td align="center"><a href=""><img src="<%=ctx%>/static/images/4.jpg" width="62" height="82" border="0"/></a></td>
  </tr>
</table>
	<div class="fc"></div>
	<div class="fl titlefont1" style="margin-left:30px;"><strong>作品展示</strong></div>
	<div class="fr" style="margin-right:30px;"><a href="" style=" color:#000000">更多&gt;&gt;</a></div>
	<div class="fc"></div>
	<div id="marquee1">
		<ul>
			<li><img src="<%=ctx%>/static/images/hb.jpg" width="172px" height="100"/><p style="font-size:11px;"><a href="">上海世博会 湖北馆</a></p></li>
			<li><img src="<%=ctx%>/static/images/tj.jpg" width="172px" height="100"/><p style="font-size:11px;"><a href="">三岔河口历史复原影片</a></p></li>
			<li><img src="<%=ctx%>/static/images/bj.jpg" width="172px" height="100"/><p style="font-size:11px;"><a href="">首信银都国际广场</a></p></li>
			<li><img src="<%=ctx%>/static/images/glz.jpg" width="172px" height="100"/><p style="font-size:11px;"><a href="">襄阳古隆中</a></p></li>
			<li><img src="<%=ctx%>/static/images/tam.jpg" width="172px" height="100"/><p style="font-size:11px;"><a href="">首都天安门</a></p></li>
		</ul><div class="fc"></div>
	</div>
	<br/>
	</div>
	<div class="fixed2" style="no-repeat;height:15px;"></div>
</div>

<!-- 首页底部 -->
<table width="100%" height="84" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8f8f8" style="margin:45px 0px 0px 0px">
	<tr><td height="69"><table width="630" border="0" align="center"></tr>
	<td width="572" align="center" style="color:#4b4b4b"><span style="line-height:80%; font-family:Arial">上海市浦东区唐镇翰盛家园43栋602室</span>
	<span style="line-height:80%; font-family:Arial"">phone:17621305360&nbsp; E-mail:1053660111@qq.com</span>
	<span style="line-height:80%; font-family:Arial"">2018年5月2日</span>
	 <td width="48" align="left"><img src="<%=ctx%>/static/images/logo2.png" width="48" height="48" /></td>
</table>
</td>
</tr>
</table>
</body>

</html>