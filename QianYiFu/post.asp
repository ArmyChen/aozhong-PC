<!--#include file="conn.asp"-->
<%
username = request.form("username")
username2 = request.form("username2")
money = int(request.form("money"))
paytype = request.form("paytype")


'卡类提交
cardNo = request.form("cardNo")
cardPwd = request.form("cardPwd")

'识别paytype为BANK或CARD
BC="CARD"
 
if username="" or username2="" or money="" or paytype="" then
	response.Write "缺少参数"
	response.End
end if

if username<>username2 then
	response.Write "充值帐号不一致"
	response.End
end if

if paytype="" then
	response.Write "请选择充值方式"
	response.End
end if

if BC = "" then
	response.Write "提交非法"
	response.End
end if

orderid=createOrderId()
ext=username



if BC = "BANK" then
	'调试模式
	if QY_DEBUG then		
		signs="userid="&uid_test&"&orderid="&orderid&"&bankid="&paytype&"&keyvalue="&key_test		
		
		'签名数据 32位小写的组合加密验证串
		md5_sign =ASP_MD5(signs)

		'测试环境
		urlStr="http://gateway.qianyifu.com:8881/gateway/pay_test.asp?userid="&uid_test&"&orderid="&orderid&"&money="&money&"&hrefurl="&return_url&"&url="&notify_url&"&bankid="&paytype&"&sign="&md5_sign&"&ext="&ext
	else
		signs="userid="&uid&"&orderid="&orderid&"&bankid="&paytype&"&keyvalue="&key
		
		'签名数据 32位小写的组合加密验证串
		md5_sign =ASP_MD5(signs) 
		
		'正式环境
		urlStr="http://gateway.qianyifu.com:8881/gateway/pay.asp?userid="&uid&"&orderid="&orderid&"&money="&money&"&hrefurl="&return_url&"&url="&notify_url&"&bankid="&paytype&"&sign="&md5_sign&"&ext="&ext
	end if
end if

if BC = "CARD" then
	if cardNo = "" or cardPwd = ""then
		response.Write "点卡信息填写不完整"
		response.End
	end if
	
	'调试模式
	if QY_DEBUG then	
		signs ="userid="&uid_test&"&orderid="&orderid&"&typeid="&paytype&"&productid="&paytype&money&"&cardNo="&cardNo&"&cardPwd="&cardPwd&"&money="&money&"&url="&notify_url&"&keyvalue="&key_test&""
		
		'签名数据 32位小写的组合加密验证串
		md5_sign =ASP_MD5(signs)

		'测试环境
		urlStr="http://gateway.qianyifu.com:8881/gateway/paycard_test.asp?userid="&uid_test&"&orderid="&orderid&"&money="&money&"&url="&notify_url&"&bankid="&paytype&"&cardNo="&cardNo&"&cardPwd="&cardPwd&"&productid="&paytype&money&"&sign="&md5_sign&"&ext="&ext

	else
		signs ="userid="&uid&"&orderid="&orderid&"&typeid="&paytype&"&productid="&paytype&money&"&cardNo="&cardNo&"&cardPwd="&cardPwd&"&money="&money&"&url="&notify_url&"&keyvalue="&key&""
		
		'签名数据 32位小写的组合加密验证串
		md5_sign =ASP_MD5(signs) 
		
		'正式环境
		urlStr="http://gateway.qianyifu.com:8881/gateway/paycard.asp?userid="&uid&"&orderid="&orderid&"&money="&money&"&url="&notify_url&"&bankid="&paytype&"&cardNo="&cardNo&"&cardPwd="&cardPwd&"&productid="&paytype&money&"&sign="&md5_sign&"&ext="&ext
	end if
end if

'生成本地订单
createOrder orderid,money,paytype,ext

'跳转吧
Response.Redirect urlStr
%>
