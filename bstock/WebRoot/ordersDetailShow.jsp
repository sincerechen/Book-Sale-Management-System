<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的订单明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/store.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	
</script>
<style type="text/css">
 body,td,div
 {
   font-size:12px;
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div id="middle">
	 <jsp:include page="leftMenu.jsp"></jsp:include>
	 <!--  购物车 -->
	 <div id="product_info">
			<div class="title">个人中心  &gt;&gt;  我的订单明细</div>
			<div style="margin-top:5px">
				 <table class="ptable" style="margin-bottom:5px;">
				 	<tr>
					     <td colspan="6" align="left">
					     	订单编号：<s:property value="#attr.orders_no"/>&nbsp;&nbsp;
					     	订单总额：<s:property value="#attr.orders_money"/>元
					     </td>
					</tr>
					<tr class="head_text">
					     <td width="40" align="center">序号</td>
					     <td width="" align="center">图书书号</td>
					     <td width="" align="center">图书名称</td>
					     <td width="" align="center">图书单价</td>
					     <td width="" align="center">图书数量</td>
					     <td width="" align="center">图书总额</td>
					</tr>
					<s:if test="#attr.ordersDetails!=null && #attr.ordersDetails.size()>0">
					   <s:iterator value="#attr.ordersDetails" id="ordersDetail" status="status">
					   <tr class="<s:if test='(#status.index + 1)%2==0'>list1</s:if><s:else>list0</s:else>" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
					     <td width="" align="center"><s:property value="#status.index+1"/></td>
					     <td width="" align="center"><s:property value="#ordersDetail.book_no"/></td>
					     <td width="" align="center"><s:property value="#ordersDetail.book_name"/></td>
					     <td width="" align="center">￥<s:property value="#ordersDetail.book_price"/></td>
					     <td width="" align="center"><s:property value="#ordersDetail.book_count"/></td>
					     <td width="" align="center">￥<s:property value="#ordersDetail.book_money"/></td>
					   </tr> 
					   </s:iterator>
					</s:if>
				    <s:else>
				    <tr>
				      <td height="60" colspan="6" align="center"><b>&lt;不存在订单明细信息&gt;</b></td>
				    </tr>
				    </s:else>
				 </table>
			</div>
			<div class="pages">
				<jsp:include page="page.jsp"></jsp:include>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
    var orders_no = '<s:property value="#attr.orders_no"/>';
	function GoPage()
	{
	  var pagenum=document.getElementById("goPage").value;
	  var patten=/^\d+$/;
	  if(!patten.exec(pagenum))
	  {
	    alert("页码必须为大于0的数字");
	    return false;
	  }
	  window.location.href="page_listMyOrdersDetails.action?pageNo="+pagenum+"&paramsOrdersDetail.orders_no="+orders_no;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMyOrdersDetails.action?pageNo="+pagenum+"&paramsOrdersDetail.orders_no="+orders_no;
	}
</script>
</body>
</html>