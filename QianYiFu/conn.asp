<!--#include file="md5.asp"-->
<% Response.CodePage=65001%>  
<% Response.Charset="UTF-8" %>
<%
'调试模式
const QY_DEBUG=false

BANKS = Array(Array("ICBC-NET","工商银行"),Array("CCB-NET","建设银行"),Array("CCB-NET","中国银行"),Array("CMBCHINA-NET","招商银行"),Array("ECITIC-NET","中信银行"),Array("CIB-NET","兴业银行"),Array("CEB-NET","光大银行"),Array("ABC-NET","农业银行"),Array("POST-NET","邮政银行"),Array("SDB-NET","深圳发展银行"),Array("GDB-NET","广东发展银行"),Array("SPDB-NET","上海浦东发展银行"),Array("CMBC-NET","民生银行"),Array("BOCO-NET","交通银行"),Array("NJCB-NET","南京银行"),Array("PINGANBANK","平安银行"),Array("CBHB-NET","渤海银行"),Array("HKBEA-NET","东亚银行"),Array("NBCB-NET","宁波银行"),Array("SHB-NET","上海银行"),Array("CZ-NET","浙商银行"),Array("HZBANK-NET","杭州银行"),Array("NCBBANK-NET","南洋银行"),Array("SCCB-NET","河北银行"),Array("ZJTLCB-NET","泰隆银行"),Array("zhifubao","支付宝扫码"),Array("weixin","微信扫码"),Array("zhifubao-wap","支付宝WAP"),Array("weixin-wap","微信WAP"))
CARDS = Array(Array("cm","移动神州行"),Array("cmb","移动神州行(大面值)"),Array("cd","移动神州行地方卡"),	Array("cc","联通充值卡"),Array("ccb","联通充值卡(大面值)"),Array("dx","电信充值卡"),Array("dxb","电信充值卡(大面值)"),Array("th","天宏一卡通"),Array("tx","天下一卡通(通用卡)"),Array("txzx","天下一卡通(专项卡)"),Array("wm","完美一卡通"),Array("jy","久游一卡通"),Array("zt","征途一卡通"),Array("sd","盛大一卡通"),Array("sft","盛付通卡"),Array("qq","QQ卡"),Array("wy","网易一卡通"),Array("sh","搜狐一卡通"),Array("jw","骏网一卡通"))

'商户号
uid = "44219"
'商户密钥
key = "6SUYYt79QVqY0jUtQXDY25WxCkUY81V2EBz0PiUX"

'测试商户号
uid_test = "1000" 
'测试密钥
key_test = "uy6UJer7Gerijq2lIY7kasD41HD44Sddg6"

'充值比例
rate = "1"
'货币名称
currencyName = "游戏币"

'同步通知地址
notify_url="http://www.aozo78.com/QianYiFu/notify.asp" 
'异步通知地址
return_url="http://www.aozo78.com/QianYiFu/return.asp"

'数据库连接
connStr="Driver={SQL Server}; server=218.90.200.44,65530;uid=sky88#88#;pwd=abbucket=20#detail;database=CXGameUserDB;"
set conn1=server.createobject("ADODB.CONNECTION")
conn1.open connStr

connStrs="Driver={SQL Server}; server=218.90.200.44,65530;uid=sky88#88#;pwd=abbucket=20#detail;database=CXTreasureDB;"
set conn2=server.createobject("ADODB.CONNECTION")
conn2.open connStrs
 
'connStrs="Driver={SQL Server}; server=218.90.200.44,65530;uid=sky88#88#;pwd=abbucket=20#detail;database=CXNews;"
'set conn3=server.createobject("ADODB.CONNECTION")
'conn3.open connStrs

'业务处理部分---将订单插入数据库
'createOrder orderid,88,"weixin","qianyi"
sub createOrder(orderid,money,paytype,ext)
set rs=server.CreateObject("adodb.recordset")
sql1="select * from AccountsInfo where Accounts ='" &ext& "'"
rs.Open sql1,conn1,1,1
if not rs.eof then 
	SET rs2=server.CreateObject("adodb.recordset")
	sql2="select * from [OnLineOrder]"
	rs2.open sql2,conn2,3,3
	rs2.addnew
	rs2("UserID")=rs("UserID")
	rs2("OperUserID")= rs("UserID")
	rs2("ShareID")= 1
	rs2("GameID")= 1
	rs2("Accounts")=rs("Accounts")
	rs2("OrderID")=orderid
	rs2("CardTypeID")=0
	rs2("CardPrice")=money
	rs2("CardGold")=money*100
	rs2("CardTotal")=1
	rs2("OrderAmount")=money
	rs2("DiscountScale")=0
	rs2("PayAmount")=money
	rs2("orderStatus")=0
	rs2("IPAddress")=getClientIP()
	rs2("ApplyDate")=now()
	rs2.update
	rs2.close:set rs2=nothing
else
	response.write("输入帐号错误!")
	response.end()	
end if
'生成本地订单
set rs=nothing
set rs2=nothing
end sub 

'生成成功订单并入库
sub insertOrder(ext)
set rs=server.CreateObject("adodb.recordset")
sql1="select * from OnLineOrder where Accounts ='" &ext& "'"
rs.Open sql1,conn2,1,1
if not rs.eof then 
	SET rs2=server.CreateObject("adodb.recordset")
	sql2="select * from ShareDetailInfo"
	SET rs3=server.CreateObject("adodb.recordset")
	sql3="select score from accountsinfo where Accounts ='" &ext& "'"
	rs2.open sql2,conn2,3,3
	rs3.open sql3,conn1,1,1
	rs2.addnew
	rs2("OperUserID")= rs("UserID")
	rs2("UserID")=rs("UserID")
	rs2("ShareID")= 1
	rs2("GameID")= 1
	rs2("Accounts")=rs("Accounts")
	rs2("OrderID")=rs("orderid")
	rs2("CardTypeID")=0
	rs2("CardPrice")=rs("CardPrice")
	rs2("CardGold")=rs("CardGold")
	rs2("BeforeGold")=rs3("score")
	rs2("CardTotal")=1
	rs2("OrderAmount")=rs("OrderAmount")
	rs2("DiscountScale")=0
	rs2("PayAmount")=rs("PayAmount")
	rs2("IPAddress")=rs("IPAddress")
	rs2("ApplyDate")=rs("ApplyDate")
	rs2.update
	rs2.close:set rs2=nothing
	rs3.close:set rs3=nothing
else
	response.write("输入帐号错误!")
	response.end()	
end if
'生成成功订单
set rs=nothing
set rs2=nothing
set rs3=nothing
end sub 

sub checkOrder(orderid,money,ext)
	set rs1=server.createobject("adodb.recordset")
		sql2222="select * from [OnLineOrder] where Orderid='"&orderid&"'"
		rs1.open sql2222,conn2,1,1
		if rs1.eof then
			response.write("此订单不存在！")					
			Response.End
		else
			flag=rs1("OrderStatus")
			if flag=0 then								
				conn2.execute("update OnLineOrder set OrderStatus=1,ApplyDate='"&now()&"' where Orderid='"&orderid&"'")				
				conn1.execute("update accountsinfo set Score=Score+"&clng(money*100)&" where UserID="&rs1("UserID")&"") 
				Response.Write("success")
				response.write("充值成功，请进入游戏查看，若未到帐，可联系客服，可根据定单号追加！")
			else
				Response.Write("success")
				response.write("支付成功！")
			end if 	
		
		end if
end sub

'生成订单号
function createOrderId
	randomize timer
	kk=int(999*rnd)
	y=Year(now)
	m=month(now)
	if m<10 then m="0"&m
	d=day(now)
	if d<10 then d="0"&d
	h=hour(now)
	if h<10 then h="0"&h
	m2=minute(now)
	if m2<10 then m2="0"&m2
	s=second(now)
	if s<10 then s="0"&s
	s2=right(timer()*100,1)
	createOrderId=y&m&d&h&m2&s&s2&kk
end function

'检测提交方式 返回BANK或CARD
function checkBankOrCard(payType)
	dim BC	
	for i=0 to ubound(BANKS)
		tempArr=BANKS(i)
		if BANKS(i)(0) = payType then 
			BC="BANK"
			exit for
		end if
	next	
	for i=0 to ubound(CARDS)
		tempArr=CARDS(i)
		if CARDS(i)(0) = payType then 
			BC="CARD"
			exit for			
		end if
	next
	checkBankOrCard = BC
end function
'根据BANK或者CARD输出汉字
function changeName(checkName,paytype)
	dim NAME
	if checkName = "BANK" THEN
		NAME = "网银支付"
		if paytype="weixin" or paytype="weixin-wap" THEN
			NAME = "微信支付"
		elseif paytype="alipay" or paytype="alipay-wap" THEN
			NAME = "支付宝"
		end if
	end if
	if checkName = "CARD" THEN
		NAME = "点卡支付"
	end if
	changeName = NAME
end function
'根据提交方式，获取中文
function getPayName(payType)
	dim payName	
	for i=0 to ubound(BANKS)
		tempArr=BANKS(i)
		if BANKS(i)(0) = payType then 
			payName = BANKS(i)(1)
			exit for
		end if
	next	
	for i=0 to ubound(CARDS)
		tempArr=CARDS(i)
		if CARDS(i)(0) = payType then 
			payName = CARDS(i)(1)
			exit for			
		end if
	next
	getPayName = payName
end function

function getClientIP()
	Dim strIPAddr 
	If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then 
		strIPAddr = Request.ServerVariables("REMOTE_ADDR") 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then 
		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1) 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then 
		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1) 
	Else 
		strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
	End If 
	getClientIP = Trim(Mid(strIPAddr, 1, 30)) 
End Function
%>
<script language="JScript" runat="Server">
function ToObject(json) {
    var o;
    eval("o=" + json);
    return o;
}
</script>

<%
On Error Resume Next 
Server.ScriptTimeOut=9999999

ip = getClientIp()
'url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip="&ip
url = "http://ip.taobao.com/service/getIpInfo.php?ip="&ip
'POST方式获取
'res = PostHTTPPage(PostUrl,"?ip="&ip)
'response.write res

'GET方式获取
'res=getHTTPPage(url)
'Set resJson = ToObject(res)
'Function getPosition 
	dim a,b,c,d
	a = resJson.data.region
	b = resJson.data.city 
	c = " "
	d = resJson.data.isp
	getPosition = a&b&c&d
'end Function


'GET方式获取页面内容
Function getHTTPPage(Path) 
	t = GetBody(Path) 
	getHTTPPage=BytesToBstr(t,"GB2312") 
End function 

Function Newstring(wstr,strng) 
	Newstring=Instr(lcase(wstr),lcase(strng)) 
	if Newstring<=0 then Newstring=Len(wstr) 
End Function 

Function BytesToBstr(body,Cset) 
	dim objstream 
	set objstream = Server.CreateObject("adodb.stream") 
	objstream.Type = 1 
	objstream.Mode =3 
	objstream.Open 
	objstream.Write body 
	objstream.Position = 0 
	objstream.Type = 2 
	objstream.Charset = Cset 
	BytesToBstr = objstream.ReadText 
	objstream.Close 
	set objstream = nothing 
End Function 

Function GetBody(url) 
	on error resume next 
	Set Retrieval = CreateObject("Microsoft.XMLHTTP") 
	With Retrieval 
	.Open "Get", url, False, "", "" 
	.Send 
	GetBody = .ResponseBody 
	End With 
	Set Retrieval = Nothing 
End Function 

'模拟POST提交
function PostHTTPPage(url,data) 
	dim Http 
	set Http=server.createobject("MSXML2.SERVERXMLHTTP.3.0")
	Http.open "POST",url,false 
	Http.setRequestHeader "CONTENT-TYPE", "application/x-www-form-urlencoded" 
	Http.send(data) 
	if Http.readystate<>4 then 
	exit function 
	End if
	PostHTTPPage=bytesToBSTR(Http.responseBody,"GB2312") 
	set http=nothing 
	if err.number<>0 then err.Clear 
End function

function BytesToBstr(body,Cset) 
	dim objstream 
	set objstream = Server.CreateObject("adodb.stream")
	objstream.Type = 1 
	objstream.Mode =3 
	objstream.Open 
	objstream.Write body 
	objstream.Position = 0 
	objstream.Type = 2 
	objstream.Charset = Cset 
	BytesToBstr = objstream.ReadText 
	objstream.Close 
	set objstream = nothing 
End function

'JSON解析
Dim sc4Json
Sub InitScriptControl
Set sc4Json = Server.CreateObject("MSScriptControl.ScriptControl")
    sc4Json.Language = "JavaScript"
    sc4Json.AddCode "var itemTemp=null;function getJSArray(arr, index){itemTemp=arr[index];}"
End Sub

Function getJSONObject(strJSON)
    sc4Json.AddCode "var jsonObject = " & strJSON
    Set getJSONObject = sc4Json.CodeObject.jsonObject
End Function

Sub getJSArrayItem(objDest,objJSArray,index)
    On Error Resume Next
    sc4Json.Run "getJSArray",objJSArray, index
    Set objDest = sc4Json.CodeObject.itemTemp
    If Err.number=0 Then Exit Sub
    objDest = sc4Json.CodeObject.itemTemp
End Sub

'转换中文为unicode
function URLEncoding(vstrIn)
    dim i
    dim strReturn,ThisChr,innerCode,Hight8,Low8
    strReturn = ""
    for i = 1 to Len(vstrIn)
        ThisChr = Mid(vStrIn,i,1)
        If Abs(Asc(ThisChr)) < &HFF then
            strReturn = strReturn & ThisChr
        else
            innerCode = Asc(ThisChr)
            If innerCode < 0 then
                innerCode = innerCode + &H10000
            end If
            Hight8 = (innerCode  and &HFF00)\ &HFF
            Low8 = innerCode and &HFF
            strReturn = strReturn & "%" & Hex(Hight8) &  "%" & Hex(Low8)
        end If
    next
    URLEncoding = strReturn
end function
'转换unicode到正常文本
function bytes2BSTR(vIn)
    dim i
    dim strReturn,ThisCharCode,nextCharCode
    strReturn = ""
    for i = 1 to LenB(vIn)
        ThisCharCode = AscB(MidB(vIn,i,1))
        If ThisCharCode < &H80 then
            strReturn = strReturn & Chr(ThisCharCode)
        else
            nextCharCode = AscB(MidB(vIn,i+1,1))
            strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(nextCharCode))
            i = i + 1
        end If
    next
    bytes2BSTR = strReturn
end function
function getText(oReq,url)
    on error resume next
    '创建XMLHTTP对象
    if oReq is nothing then
        set oReq=CreateObject("MSXML2.XMLHTTP")
    end if
    if    not oReq is nothing then
        oReq.open "get",url,false
        oReq.send
        if oReq.status = 200 then
            getText = bytes2BSTR(oReq.responseBody)
        else
            getText = ""
        end if
    else
        getText = ""
    end if
end function
%>