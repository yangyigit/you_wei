$(function(){
//导航
	   $(".header .nav li").hover(function(){
			var $this =$(this);
		   	$this.addClass("hover");
			if($this.is(":has(ul)")){
				var $subNav =$this.find("ul");
				var $subNavItem =$subNav.find("li");
				var subNavHeight =$subNavItem.length*36;
			    $subNav.stop().animate({height:subNavHeight});
			}
		},function(){
			var $this =$(this);
			if($this.is(":has(ul)")){
				var $subNav =$this.find("ul");
			   $subNav.stop().animate({height:0},400,function(){
				   $this.removeClass("hover");
				});
			}else{
			   $this.removeClass("hover");
			}
		});
 //获取IE浏览器版本
function getIEVersion(){
	var rv = -1;
	if (navigator.appName == 'Microsoft Internet Explorer')
	{
		var ua = navigator.userAgent;
		var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
		if (re.exec(ua) != null)
			rv = parseFloat( RegExp.$1 );
	}
	else if (navigator.appName == 'Netscape')
	{
		var ua = navigator.userAgent;
		var re  = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");  //for IE 11
		if (re.exec(ua) != null)
			rv = parseFloat( RegExp.$1 );
	}
	return rv;
}

//导航缩放
 $('.header').each(function(){
	var top = 1; //
	var ie_v = getIEVersion();//获取IE版本
	var elementh = $(this);
	if(!(ie_v == 8 || ie_v==7 || ie_v==6)){
		$(window).scroll(function() {
			var scrolls = $(this).scrollTop();
			if (scrolls >= top) {
				elementh.addClass('s-header');
			}else {
				elementh.removeClass('s-header');
			}
		});
	}
	elementh.find(".close-ico").click(function(event){
		elementh.remove();
		event.preventDefault();
	})
}); 



/*客服*/
$(".footer-kefu .qq").hover(function() {
		if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
			$(this).stop(true, false).animate({
				"width": "110px",
				"left": "-65px"
			}, 300)
		} else {
			$(this).stop(true, false).animate({
				"width": "110px"
			}, 300)
		}
	}, function() {
		if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
			$(this).stop(true, false).animate({
				"width": "45px",
				"left": "0"
			}, 300)
		} else {
			$(this).stop(true, false).animate({
				"width": "45px"
			}, 300)
		}
});

$(".footer-kefu .wx").hover(function(){
		$('.wx .code').fadeIn();
	},function(){
		$('.wx .code').hide();
});

$(".footer-kefu .m").hover(function(){
		$('.m .code').fadeIn();
	},function(){
		$('.m .code').hide();
});

$(".footer-kefu .tel").hover(function() {
	if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
		$(this).stop(true, false).animate({
			"width": "180px",
			"left": "-135px"
		}, 300)
	} else {
		$(this).stop(true, false).animate({
			"width": "180px"
		}, 300)
	}
	}, function() {
		if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE7.0") {
			$(this).stop(true, false).animate({
				"width": "45px",
				"left": "0"
			}, 300)
		} else {
			$(this).stop(true, false).animate({
				"width": "45px"
			}, 300)
		}
	});



$(".footer-kefu .top").hide();
$(window).scroll(function(){
	if ($(window).scrollTop()>300){
		$(".footer-kefu .top").fadeIn();
	}else{
		$(".footer-kefu .top").fadeOut();
	}
});

$(".footer-kefu .top").click(function(){
	$('body,html').animate({scrollTop:0},500);
	return false;
});






});