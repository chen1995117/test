<%--标签 --%>
<%String ctx = request.getContextPath();%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=ctx%>/static/css/common2.css" rel="stylesheet" style="text/css"/>
	<link href="<%=ctx%>/static/css/common.css" rel="stylesheet" style="text/css"/>
    <!-- [jQuery] -->
    <script type="text/javascript" src="<%=ctx%>/static/js/easyui/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<div>
		<div>
			<h2>我们期待与您联系</h2>
			<p class="fsize18">我们重视并珍惜每一次与您沟通的机会，无论您有任何疑问或者建议，请随时根据下面提供的信息与我们联系。<br />
				 我们的服务网络已经覆盖全国的大部分区域，选择本地化的服务将会有更好的体验。</p>
		</div>
		<div>
			<c:forEach items="${concatUsList}" var="items" varStatus="index">
			<div ${index} } class="div_left div_right">
			
				<h2 class="fsize18">${items.companyName}</h2>
				<c:if test="${not empty items.phoneNumber }"><span  id="one"> <strong>电话：</strong></span><span id="email">${items.phoneNumber}</span><br /></c:if>
				<c:if test="${not empty items.fax}"><span  id="two"><strong>传真：</strong></span><span id=fax>${items.fax}</span><br /></c:if>
				<c:if test="${not empty items.email}"><span  id="three"><strong>邮箱：</strong></span><span id="email">${items.email}</span><br /></c:if>
			    <c:if test="${not empty items.address}"><span  id="four"><strong>地址：</strong></span><span id="address">${items.address}</span><br /></c:if>
				<c:if test="${not empty items.officialAccounts}"><span  id="five"><strong>微信公众号：</strong></span><span id="officialAccounts">${items.officialAccounts}</span><br /></c:if>
				<c:if test="${not empty items.allDayServcePhone}"><span  id="six"><strong>7*24小时服务电话：</strong></span><span id="allDayServcePhone">${items.allDayServcePhone}</span></c:if>
			
			</div>
			</c:forEach>
		</div>
	</div>	
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