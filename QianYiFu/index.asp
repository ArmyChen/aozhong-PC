﻿<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF8">
  <title>仟易付-充值中心-收银台</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" href="assets/css/amazeui.css"/>
  <link rel="stylesheet" href="assets/css/app.css"/>
</head>
<script language="javascript">
function checkForm()
{
	if(form.username.value=="")
	{
		alert("请输入账号！");
		return false;
	}
	if(form.username2.value=="")
	{
		alert("请确认账号！");
		return false;
	}
	if(form.username.value !=form.username2.value)
	{
		alert("两次输入账号不一致！");
		return false;
	}
	
	var val=$('input:radio[name="paytype"]:checked').val();
	if(val==null){
		alert("请选择支付方式");
		return false;
	}     
			
	return true;
}
</script>
<body>
<div class="am-g am-container">
	<div class="am-u-lg-12">
		<div class="am-g ap-pay">		
			<div class="am-u-lg-8 am-u-md-8 am-u-sm-12">
				<form name="form" id="form" class="am-form ap-pay-form" onSubmit="return checkForm()" action="post.asp" method="post">	
					<label class="ap-pay-form-lable" for="username" >充值帐号：</label><input class="ap-pay-form-input" id="username" name="username" type="text" placeholder="请填写账号，必填" required/><br/>
					<label class="ap-pay-form-lable" for="username2">确认账号：</label><input class="ap-pay-form-input" id="username2" name="username2" type="text" placeholder="请再次确认，必填" required/><br/>
					<label class="ap-pay-form-lable" for="money">充值金额：</label><input class="ap-pay-form-input" id="money" name="money" type="tel" placeholder="请填写充值金额，必填" required/><br/>
					<hr>					
					 <div class="ap-pay-item">
						<div class="ap-pay-item-title">手机支付</div>
						<div class="ap-pay-item-content" style="display:none">
							<input type="radio" name="paytype" value="weixin-wap" id="weixin-wap">
							<label for="weixin-wap">微信WAP</label>
						</div>
						<div class="ap-pay-item-content" style="display:none">
							<input type="radio" name="paytype" value="zhifubao-wap"" id="zhifubao-wap">
							<label for="zhifubao-wap">支付宝WAP</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="weixin" id="weixin">
							<label for="weixin">微信扫码</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="zhifubao" id="zhifubao">
							<label for="zhifubao">支付宝扫码</label>
						</div>
					</div>
					<div class="clear"></div>
					<div class="ap-pay-item">
						<div class="ap-pay-item-title">网银在线</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ICBC-NET" id="ICBC-NET">
							<label for="ICBC-NET">工商银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CCB-NET" id="CCB-NET">
							<label for="CCB-NET">建设银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="BOC-NET" id="BOC-NET">
							<label for="BOC-NET">中国银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CMBCHINA-NET" id="CMBCHINA-NET">
							<label for="CMBCHINA-NET">招商银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ECITIC-NET" id="ECITIC-NET">
							<label for="ECITIC-NET">中信银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CIB-NET" id="CIB-NET">
							<label for="CIB-NET">兴业银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CEB-NET" id="CEB-NET">
							<label for="CEB-NET">光大银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ABC-NET" id="ABC-NET">
							<label for="ABC-NET">农业银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="POST-NET" id="POST-NET">
							<label for="POST-NET">邮政银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SDB-NET" id="SDB-NET">
							<label for="SDB-NET">深圳发展银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="GDB-NET" id="GDB-NET">
							<label for="GDB-NET">广东发展银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SPDB-NET" id="SPDB-NET">
							<label for="SPDB-NET">上海浦东发展银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CMBC-NET" id="CMBC-NET">
							<label for="CMBC-NET">民生银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="BOCO-NET" id="BOCO-NET">
							<label for="BOCO-NET">交通银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="NJCB-NET" id="NJCB-NET">
							<label for="NJCB-NET">南京银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="PINGANBANK" id="PINGANBANK">
							<label for="PINGANBANK">平安银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CBHB-NET" id="CBHB-NET">
							<label for="CBHB-NET">渤海银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="HKBEA-NET" id="HKBEA-NET">
							<label for="HKBEA-NET">东亚银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="NBCB-NET" id="NBCB-NET">
							<label for="NBCB-NET">宁波银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SHB-NET" id="SHB-NET">
							<label for="SHB-NET">上海银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CZ-NET" id="CZ-NET">
							<label for="CZ-NET">浙商银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="HZBANK-NET" id="HZBANK-NET">
							<label for="HZBANK-NET">杭州银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="NCBBANK-NET" id="NCBBANK-NET">
							<label for="NCBBANK-NET">南洋银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SCCB-NET" id="SCCB-NET">
							<label for="SCCB-NET">河北银行</label>
						</div>
					</div>
					<div class="clear"></div> 
					<div class="ap-pay-item">
						<div class="ap-pay-item-title">点卡充值</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="cm" id="cm">
							<label for="cm">移动神州行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="cmb" id="cmb">
							<label for="cmb">移动神州行(大面值)</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="cd" id="cd">
							<label for="cd">移动神州行地方卡</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="cc" id="cc">
							<label for="cc">联通充值卡</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ccb" id="ccb">
							<label for="ccb">联通充值卡(大面值)</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="dx" id="dx">
							<label for="dx">电信充值卡</label>
						</div>						
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="dxb" id="dxb">
							<label for="dxb">电信充值卡(大面值)</label>
						</div>					
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="th" id="th">
							<label for="th">天宏一卡通</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="tx" id="tx">
							<label for="tx">天下一卡通(通用卡)</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="txzx" id="txzx">
							<label for="txzx">天下一卡通(专项卡)</label>
						</div>
						
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="wm" id="wm">
							<label for="wm">完美一卡通</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="jy" id="jy">
							<label for="jy">久游一卡通</label>
						</div><div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="zt" id="zt">
							<label for="zt">征途一卡通</label>
						</div>
						
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="sd" id="sd">
							<label for="sd">盛大一卡通</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="sft" id="sft">
							<label for="sft">盛付通卡</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="qq" id="qq">
							<label for="qq">QQ卡</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="wy" id="wy">
							<label for="wy">网易一卡通</label>
						</div>
						
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="sh" id="sh">
							<label for="sh">搜狐一卡通</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="jw" id="jw">
							<label for="jw">骏网一卡通</label>
						</div>
						<div class="clear"></div>
						<hr/>
						<label class="ap-pay-form-lable" for="cardNo" >卡号：</label><input class="ap-pay-form-input" id="cardNo" name="cardNo" type="text" placeholder="请填写卡号"><br/>
						<label class="ap-pay-form-lable" for="cardPwd">卡密：</label><input class="ap-pay-form-input" id="cardPwd" name="cardPwd" type="text" placeholder="请填写卡密"><br/>
						<hr/>
					</div>
					<div class="clear"></div>
					<div class="tc m2">
						<button type="submit" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-check"></i> 提 交</button>
					</div>
					<hr/>
				</form>				
			</div>			
		</div>
	</div>
</div>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/layer/layer.js"></script>
</body>
</html>