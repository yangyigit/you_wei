<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:37:"./template/pc/lists_single_weixin.htm";i:1654563712;s:52:"/Users/hengji/开发/yangyidemo/template/pc/head.htm";i:1686991424;s:52:"/Users/hengji/开发/yangyidemo/template/pc/down.htm";i:1654564114;s:54:"/Users/hengji/开发/yangyidemo/template/pc/footer.htm";i:1654564300;}*/ ?>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<title><?php echo $eyou['field']['seo_title']; ?>_<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_name"); echo $__VALUE__; ?></title>
<meta name="keywords" content="<?php echo $eyou['field']['seo_keywords']; ?>" />
<meta name="description" content="<?php echo html_msubstr($eyou['field']['seo_description']); ?>" />
<link  href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/css/common.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/jquery.min.js"></script>
<link href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_ico"); echo $__VALUE__; ?>" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
<div  class="header">
  <div class="wp">
    <div class="wps cl">
      <h1>
        <a href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_basehost"); echo $__VALUE__; ?>" rel="home">
          <?php if($web_logo != ''): ?>
           <img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_logo"); echo $__VALUE__; ?>" alt="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_name"); echo $__VALUE__; ?>"  height="60"/>
          <?php else:  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_name"); echo $__VALUE__; endif; ?>
        </a>
      </h1>
      <div class="header-tel y"> <span><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_1"); echo $__VALUE__; ?></span> </div>
      <div class="nav">
        <ul id="menu-csweigounv" class="cl">
          <li><a href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_basehost"); echo $__VALUE__; ?>">首页</a></li>
          <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 5; endif; $tagChannel = new \think\template\taglib\eyou\TagChannel; $_result = $tagChannel->getChannel($typeid, "top", "active", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["typename"] = text_msubstr($field["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
          <li><a href="<?php echo $field['typeurl']; ?>"><?php echo $field['typename']; ?></a></li>
          <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="main">
  <link rel='stylesheet' type='text/css'  href='<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/css/page.css'/>
  <div class="page-header page-header-jianzhan" style="background: url(<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/service.jpg) no-repeat center top;">
    <div class="s">
      <div class="wp">
        <div class="wps">
          <h1><?php echo gettoptype($eyou['field']['typeid'],'typename'); ?></h1>
          <div class="line"></div>
          <p><?php echo $eyou['field']['seo_description']; ?></p>
        </div>
      </div>
    </div>
  </div>
  <div class="page-service">
    <div class="page-title">
      <div class="title"><?php echo $eyou['field']['typename']; ?></div>
      <div class="title-line"></div>
      <div class="tips"><?php echo $eyou['field']['seo_description']; ?></div>
    </div>
    <div class="wp">
      <div class="s cl">
        <div class="data"> <a href="javascript:">
          <div class="title">微信官网</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/gw.png" width="45" height="45"></div>
          <p class="des">利用微信开发能力结合原生技术开发用于微信浏览的网站</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">小程序</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/xcx.png" width="45" height="45"></div>
          <p class="des">免安装、易推广，拥有丰富组件及API能力</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">微信商城</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/shop.png" width="45" height="45"></div>
          <p class="des">基于微信支付、微信登录等能力的电子商务商城</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">微信活动</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/wx-action.png" width="45" height="45"></div>
          <p class="des">基于微信开发能力使用户更加便捷参与活动</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">微信报名</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/wx-bm.png" width="45" height="45"></div>
          <p class="des">基于微信开放能力方便用户快速参与报名</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">微信投票</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/wx-tp.png" width="45" height="45"></div>
          <p class="des">基于微信开放能力限制微信投票刷票等行为</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">微信O2O</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/wx-o2o.png" width="45" height="45"></div>
          <p class="des">基于微信支付、LBS的开发能力开放本地化O2O平台</p>
          </a> </div>
        <div class="data"> <a href="javascript:">
          <div class="title">更多应用</div>
          <div class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/all.png" width="45" height="45"></div>
          <p class="des">扫码购物、微订单等更多基于微信开放能力应用</p>
          </a> </div>
      </div>
    </div>
  </div>
  <div class="page-advantage">
  <div class="cover"></div>
  <div class="page-title">
    <div class="title">这也许是您即将选择我们的理由</div>
    <div class="title-line"></div>
    <div class="tips">纵然我们已经拥有无数让您选择的理由，但我们期待更多</div>
  </div>
  <div class="wp">
    <div class="s cl">
      <div class="data">
        <dl>
          <dt><span>个性定制<em></em></span></dt>
          <dd class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/ly-dz.png"/></dd>
          <dd class="des">您的想法加上我们的专业技术及服务能力产出您想想要的产品,绝非生搬硬套式开发。</dd>
        </dl>
      </div>
      <div class="data">
        <dl>
          <dt><span>开发规范<em></em></span></dt>
          <dd class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/ly-gf.png"/></dd>
          <dd class="des">采用SVN/GIT等工具进行代码版本控制可以溯源代码历史，技术文档更加规范。</dd>
        </dl>
      </div>
      <div class="data">
        <dl>
          <dt><span>极速响应<em></em></span></dt>
          <dd class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/ly-js.png"/></dd>
          <dd class="des">不管项目开发中，还是售后维护阶段；工程师快速响应，紧急问题下班时间照常响应。</dd>
        </dl>
      </div>
      <div class="data">
        <dl>
          <dt><span>安全稳定<em></em></span></dt>
          <dd class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/ly-aq.png"/></dd>
          <dd class="des">实时监测服务器集群运行状态、资源占用率；程序自动进行数据库数据备份。</dd>
        </dl>
      </div>
      <div class="data">
        <dl>
          <dt><span>完整交付<em></em></span></dt>
          <dd class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/ly-jf.png"/></dd>
          <dd class="des">域名/空间/备案等账号、源代码、技术文档等所有的输出物全部交付给甲方。</dd>
        </dl>
      </div>
      <div class="data">
        <dl>
          <dt><span>完善售后<em></em></span></dt>
          <dd class="m"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/ly-sh.png"/></dd>
          <dd class="des">不少于一年售后服务期，包含故障修复、备案、备份、安全防护、问题咨询等。</dd>
        </dl>
      </div>
    </div>
  </div>
</div>
<div class="page-case">
  <div class="page-title">
    <div class="title">这是过去我们跟合作伙伴的故事</div>
    <div class="title-line"></div>
    <div class="tips">也许这并不是你想要的，没关系！我们来讲新的故事</div>
  </div>
  <div class="wp">
    <div class="s">
      <ul class="title-do cl">
        <li class="on"><span>红网图文直播</span></li>
        <li ><span>至上租车官网</span></li>
        <li ><span>国防科学技术大学</span></li>
      </ul>
      <ul class="conts">
        <li class="n-k-t current">
          <div class="data cl">
            <div class="m z"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/rednet.png" width="568" height="480" /></div>
            <div class="info y">
              <h6>湖南红网新媒体集团</h6>
              <p class="des">本直播系统为图文直播+网友互动系统，红网有一个时刻新闻app，网页版也包含图文直播系统，但之前的系统不包含网友互动功能，仅活动发起者单个的在那发布信息，这样互动度不够。因此，在红网论坛添加一个图片直播系统、并且带用户互动功能。</p>
              <p class="tips">本项目的主要难点是红网千万级甚至更大数据量情况下的性能问题，以及无缝对接主系统的的各个环节，比如主系统内容审核分了三级审核机制，同时还需要保障系统稳定性（顺利通过高考直播考验）。</p>
              <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = "5"; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $tagType = new \think\template\taglib\eyou\TagType; $_result = $tagType->getType($typeid, "self", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator):  $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: $field = $__LIST__;?> <a href="<?php echo $field['typeurl']; ?>" class="more btn-a"><em></em><span>查看更多案例</span></a><?php endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?> </div>
          </div>
        </li>
        <li class="n-k-t ">
          <div class="data cl">
            <div class="m z"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/zszc.png" width="568" height="480" /></div>
            <div class="info y">
              <h6>长沙至上汽车租赁有限公司</h6>
              <p class="des">本项目为至上租车公司PC端官网，包括自驾租车和代驾租车信息浏览及预约、企业租车申请及预约、公司业务介绍等，同时打通网站与手机短信，用户填写预约信息后管理员的手机能够实时获取一条通知信息，可以马上联系预约客户，运营管理根本不需要坐在电脑前</p>
              <p class="tips">本项目的是企业官方网站，只是在展示及营销基础上，增加了在线预约功能，我们针对性的对UI设计、界面编写、用户体验上进行优化，比如实时的通知功能帮助客户节省大量的管理时间，同时让网站用户体验更好，转化率提高50%以上。</p>
              <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = "5"; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $tagType = new \think\template\taglib\eyou\TagType; $_result = $tagType->getType($typeid, "self", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator):  $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: $field = $__LIST__;?> <a href="<?php echo $field['typeurl']; ?>" class="more btn-a"><em></em><span>查看更多案例</span></a><?php endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?> </div>
          </div>
        </li>
        <li class="n-k-t ">
          <div class="data cl">
            <div class="m z"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/gfkd.png" width="568" height="480" /></div>
            <div class="info y">
              <h6>国防科学技术大学</h6>
              <p class="des">本项目为国防科学技术大学科研部网站，分多期完成，后续还会有新的功能模块出现；目前主要包含门户网站、作品发布、师生交流论坛、活动创建、活动报名、活动投票、论文及作品评审系统等，整个系统运行在军网内网中，采用mtn域名。</p>
              <p class="tips">本项目一个非常重要的要求就是要保障系统的稳定性和安全性，军队院校对信息保密是有非常高的要求的，电脑等设备都不允许与互联网通信；如果稳定性不够好，不管多小的问题都必须去现场进行修复；在线评审系统大大提高校方工作效率。</p>
              <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = "5"; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $tagType = new \think\template\taglib\eyou\TagType; $_result = $tagType->getType($typeid, "self", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator):  $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: $field = $__LIST__;?> <a href="<?php echo $field['typeurl']; ?>" class="more btn-a"><em></em><span>查看更多案例</span></a><?php endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?> </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>
<script>
//tab切换
$(".title-do li").mouseover(function(){
	var index = $(this).index();
	$(this).addClass("on").siblings().removeClass("on");
	$(".conts li.n-k-t").eq(index).addClass("current").siblings().removeClass("current");
});
</script>
<div class="page-contact">
  <div class="wp">
    <div class="s">
      <div class="your-ask">
        <h6>我猜您现在可能存在如下疑问：</h6>
        <ul class="cl">
          <li>你们能做什么？</li>
          <li>需要多少钱？</li>
          <li>需要多久？</li>
          <li>我需要做什么?</li>
          <li>需要提供什么资料？</li>
          <li>售后服务怎么样？</li>
        </ul>
      </div>
      <div class="info-box"> <?php  $typeid = "33"; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $tagGuestbookform = new \think\template\taglib\eyou\TagGuestbookform; $_result = $tagGuestbookform->getGuestbookform($typeid, "default", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $i= intval($key) + 1;$mod = ($i % 2 ); ?>
        <form action="<?php echo $field['action']; ?>" enctype="multipart/form-data" method="post">
          <input type="text"  name="<?php echo $field['attr_5']; ?>" value="" placeholder="<?php echo $field['itemname_5']; ?>" class="username"/>
          <input type="text"  name="<?php echo $field['attr_6']; ?>" value="" placeholder="<?php echo $field['itemname_6']; ?>" class="telephone"/>
          <input type="text"  name="<?php echo $field['attr_7']; ?>" value="" placeholder="您的问题或者需求~" class="content"/>
          <a class="post">
          <button type="submit" class="post">提交您的需求</button>
          </a> <a href="https://wpa.qq.com/msgrd?v=3&uin=<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_5"); echo $__VALUE__; ?>&site=qq&menu=yes" class="btn">点击在线咨询</a> <?php echo $field['hidden']; ?>
        </form>
        <?php ++$e; endforeach;endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
        <p class="war">同样的问题每个人侧重点不同，很难有标准的答案；请认真填写表单信息或直接在线联系，我们会给您最合适的答案！</p>
      </div>
    </div>
  </div>
</div>

  <div class="showmsg"></div>
</div>
<div class="footer">
  <div class="wp">
    <div class="wps cl"> <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = "11"; endif; if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 10; endif; $tagChannelartlist = new \think\template\taglib\eyou\TagChannelartlist; $_result = $tagChannelartlist->getChannelartlist($typeid, "self",""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$channelartlist): $channelartlist["typename"] = text_msubstr($channelartlist["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $channelartlist;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
      <dl class="about">
        <dt><?php  $__VALUE__ = isset($channelartlist["typename"]) ? $channelartlist["typename"] : "变量名不存在"; echo $__VALUE__; ?></dt>
        <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 6; endif; $tagChannel = new \think\template\taglib\eyou\TagChannel; $_result = $tagChannel->getChannel($typeid, "son", "", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["typename"] = text_msubstr($field["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
        <dd><a href="<?php echo $field['typeurl']; ?>"  title="<?php echo $field['typename']; ?>" ><?php echo $field['typename']; ?></a></dd>
        <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
      </dl>
      <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $typeid = $row = ""; unset($channelartlist);  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = "5"; endif; if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 10; endif; $tagChannelartlist = new \think\template\taglib\eyou\TagChannelartlist; $_result = $tagChannelartlist->getChannelartlist($typeid, "self",""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$channelartlist): $channelartlist["typename"] = text_msubstr($channelartlist["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $channelartlist;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
      <dl class="solution">
        <dt><?php  $__VALUE__ = isset($channelartlist["typename"]) ? $channelartlist["typename"] : "变量名不存在"; echo $__VALUE__; ?></dt>
        <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 6; endif; $tagChannel = new \think\template\taglib\eyou\TagChannel; $_result = $tagChannel->getChannel($typeid, "son", "", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["typename"] = text_msubstr($field["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
        <dd><a href="<?php echo $field['typeurl']; ?>"  title="<?php echo $field['typename']; ?>" ><?php echo $field['typename']; ?></a></dd>
        <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
      </dl>
      <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $typeid = $row = ""; unset($channelartlist); ?>
      <dl class="contact">
        <dt>联系我们</dt>
        <dd>电话：<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_1"); echo $__VALUE__; ?></dd>
        <dd>邮箱：<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_4"); echo $__VALUE__; ?></dd>
        <dd>地址：<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_3"); echo $__VALUE__; ?></dd>
        <dd>手机：<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_2"); echo $__VALUE__; ?></dd>
      </dl>
      <dl class="flow">
        <dt></dt>
        <div class="ma cl">
          <div class="m"> <img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_6"); echo $__VALUE__; ?>"/>
            <p>微信二维码</p>
          </div>
        </div>
      </dl>
    </div>
  </div>
  <div class="footer-link wp">
    <ul class="wps cl">
      <li class="fisrt">友情链接</li>
      <?php  $tagFlink = new \think\template\taglib\eyou\TagFlink; $_result = $tagFlink->getFlink("text", "0,20", "1"); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["title"] = text_msubstr($field["title"], 0, 20, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
      <li> <a href="<?php echo $field['url']; ?>" target="_blank"><?php echo $field['title']; ?></a> </li>
      <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
    </ul>
  </div>
</div>
<div  class="bot-footer" >
  <div class="wp">
    <p class="wps"> <em><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_copyright"); echo $__VALUE__; ?></em> <em>备案号：<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_recordnum"); echo $__VALUE__; ?></em> <em></p>
  </div>
</div>
<div class="footer-kefu">
  <ul>
    <li class="qq"><a href="https://wpa.qq.com/msgrd?v=3&uin=<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_5"); echo $__VALUE__; ?>&site=qq&menu=yes"><em></em>在线咨询</a></li>
    <li class="tel"><a href="JavaScript:"><em></em><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_1"); echo $__VALUE__; ?></a></li>
    <li class="wx"> <em></em>
      <div class="code"> <img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_6"); echo $__VALUE__; ?>"/>
        <p>微信二维码</p>
      </div>
    </li>
    <li class="m"> <em></em>
      <div class="code"> <img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_6"); echo $__VALUE__; ?>"/>
        <p>移动版官网</p>
      </div>
    </li>
    <li class="top"><em></em></li>
  </ul>
</div>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/all.js"></script> 
<!-- 应用插件标签 start --> 
 <?php  $tagWeapp = new \think\template\taglib\eyou\TagWeapp; $__VALUE__ = $tagWeapp->getWeapp("default"); echo $__VALUE__; ?> 
<!-- 应用插件标签 end -->
</body>
</html>