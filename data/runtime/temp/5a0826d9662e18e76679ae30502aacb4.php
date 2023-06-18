<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:30:"./template/pc/lists_single.htm";i:1654564148;s:52:"/Users/hengji/开发/yangyidemo/template/pc/head.htm";i:1686991424;s:54:"/Users/hengji/开发/yangyidemo/template/pc/footer.htm";i:1687059629;}*/ ?>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<title><?php echo $eyou['field']['seo_title']; ?>_<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_name"); echo $__VALUE__; ?></title>
<meta name="keywords" content="<?php echo $eyou['field']['seo_keywords']; ?>"/>
<meta name="description" content="<?php echo html_msubstr($eyou['field']['seo_description']); ?>"/>
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
  <div class="page-header page-header-about" style="background: url(<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/images/about.jpg) no-repeat center top;">
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
  <style>
	.about-section{padding: 60px 0;}
	.about-section .title{ height: 40px; line-height: 40px; margin-bottom: 30px; text-align: center; font-size: 26px;}
	.about-us .s{ background:#f6f7fc;}
	.about-us .m{width: 500px;}
	.about-us .m img{width: 100%; height: 280px;}
	.about-us .des{ width: 636px; padding: 20px;}
	.about-us .des p{font-size:14px; line-height: 24px; margin-bottom: 15px; color:#777;}
	.about-us .line{ margin-top: 20px; height:2px; width: 80px; background: #0595c7;}
	.about-team{min-width: 1200px;background: #f6f7fc;}
	.about-team p{padding: 0 80px;  font-size: 14px; line-height: 25px;color:#777;}
	.about-result{min-width: 1200px;}
	.about-result p{padding: 0 80px;  font-size: 14px; line-height: 25px;color:#777;}
	.about-future{min-width: 1200px;background: #f6f7fc;}
	.about-future p{padding: 0 80px;  font-size: 14px; line-height: 25px;color:#777;}
</style>
  <div class="about-us about-section">
    <div class="title wp"><?php echo $eyou['field']['typename']; ?></div>
    <div class="about-team about-section">
      <div class="wp">
        <div class="s wps">
          <p><?php echo $eyou['field']['content']; ?></p>
        </div>
      </div>
    </div>
  </div>
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
    <li class="top"><em></em></li>
  </ul>
</div>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/all.js"></script> 
<!-- 应用插件标签 start --> 
 <?php  $tagWeapp = new \think\template\taglib\eyou\TagWeapp; $__VALUE__ = $tagWeapp->getWeapp("default"); echo $__VALUE__; ?> 
<!-- 应用插件标签 end -->
</body>
</html>