var picTxt;
$("#register-link").click(function(){
	$(".u-register").show();
	picTxt = drawPic();
});
$("#register-close").click(function(){
	/*隐藏注册框*/
	$(".u-register").hide();
	/*清空注册框input里面的值*/
	$("#loginName").val("");
	$("#userName").val("");
	$("#userPhone").val("");
	$("#userMail").val("");
	$("#register_password").val("");
	$("#comform_password").val("");
	$("#register_captcha").val("");
	/*清空错误提示框里面的值*/
	$("#login-name-error").html("");
	$("#user-name-error").html("");
	$("#user-phone-error").html("");
	$("#user-phone-error").html("");
	$("#register-password-error").html("");
	$("#comform-password-error").html("");
	$("#errormsg").html("");
});

/*注册框随机生成验证码*/
//生成随机数
function randomNum(min,max){
    return Math.floor(Math.random()*(max-min)+min);
}
    //生成随机颜色RGB分量
function randomColor(min,max){
    var _r = randomNum(min,max);
    var _g = randomNum(min,max);
    var _b = randomNum(min,max);
    return "rgb("+_r+","+_g+","+_b+")";
}
//先阻止画布默认点击发生的行为再执行drawPic()方法
document.getElementById("canvas").onclick = function(e){
    e.preventDefault();
    picTxt = drawPic();
};
function drawPic(){
    //获取到元素canvas
    var $canvas = document.getElementById("canvas");
    var _str = "0123456789abcdefghijklmnopqrstuvwxyz";//设置随机数库
    var _picTxt = "";//随机数
    var _num = 4;//4个随机数字
    var _width = $canvas.width;
    var _height = $canvas.height;
    var ctx = $canvas.getContext("2d");//获取 context 对象
    ctx.textBaseline = "bottom";//文字上下对齐方式--底部对齐
    ctx.fillStyle = randomColor(180,240);//填充画布颜色
    ctx.fillRect(0,0,_width,_height);//填充矩形--画画
    for(var i=0; i<_num; i++){
        var x = (_width-10)/_num*i+10;
        var y = randomNum(_height/2,_height);
        var deg = randomNum(-45,45);
        var txt = _str[randomNum(0,_str.length)];
        _picTxt += txt;//获取一个随机数
        ctx.fillStyle = randomColor(10,100);//填充随机颜色
        ctx.font = randomNum(15,25)+"px SimHei";//设置随机数大小，字体为SimHei
        ctx.translate(x,y);//将当前xy坐标作为原始坐标
        ctx.rotate(deg*Math.PI/180);//旋转随机角度
        ctx.fillText(txt, 0,0);//绘制填色的文本
        ctx.rotate(-deg*Math.PI/180);
        ctx.translate(-x,-y);
    }
    for(var i=0; i<_num; i++){
        //定义笔触颜色
        ctx.strokeStyle = randomColor(90,180);
        ctx.beginPath();
        //随机划线--4条路径
        ctx.moveTo(randomNum(0,_width), randomNum(0,_height));
        ctx.lineTo(randomNum(0,_width), randomNum(0,_height));
        ctx.stroke();
    }
    for(var i=0; i<_num*10; i++){
        ctx.fillStyle = randomColor(0,255);
        ctx.beginPath();
        //随机画原，填充颜色
        ctx.arc(randomNum(0,_width),randomNum(0,_height), 1, 0, 2*Math.PI);
        ctx.fill();
    }
    return _picTxt;//返回随机数字符串
}

/*注册框表单验证*/
function register_check(){
	if($("#loginName").val()==""){
		$("#login-name-error").html("登录名不能为空");
		return false;
	}else if(!/[\u4e00-\u9fa5a-zA-Z]{3,}/.test($("#loginName").val())){
		$("#login-name-error").html("至少3个中文或英文");
		return false;
	}else if($("#userName").val()==""){
		$("#user-name-error").html("姓名不能为空");
		return false;
	}else if(!/[\u4e00-\u9fa5a]{2}/.test($("#userName").val())){
		$("#user-name-error").html("只能中文，至少2个字符");
		return false;
	}else if($("#userPhone").val()==""){
		$("#user-phone-error").html("手机号不能为空");
		return false;
	}else if(!/^1[0-9]{10}$/.test($("#userPhone").val())){
		$("#user-phone-error").html("手机号必须11位");
		return false;
	}else if($("#userMail").val()==""){
		$("#user-mail-error").html("邮箱不能为空");
		return false;
	}else if(!/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test($("#userMail").val())){
		$("#user-mail-error").html("邮箱不正确");
		return false;
	}else if($("#register_password").val()==""){
		$("#register-password-error").html("密码不能为空");
		return false;
	}else if(!/^[0-9a-zA-Z]{6,16}$/.test($("#register_password").val())){
		$("#register-password-error").html("6-16个字符，不包括空格");
		return false;
	}else if($("#comform_password").val()==""){
		$("#comform-password-error").html("请再次确认密码");
		return false;
	}else if($("#comform_password").val()!=$("#register_password").val()){
		$("#comform-password-error").html("密码不一致");
		return false;
	}else if($("#register_captcha").val()==""){
		$("#errormsg").html("验证码不为空");
		return false;
	}else if($("#register_captcha").val()!=picTxt){
		$("#errormsg").html("验证码不一致");
		return false;
	}
	/*alert("注册成功");*/
	return true;
}