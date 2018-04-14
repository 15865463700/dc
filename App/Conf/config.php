<?php
return array(
    //'配置项'=>'配置值'
    'APP_GROUP_LIST'    => 'Website,Admin,User,M',//分组
    'DEFAULT_GROUP'     =>'Website',//默认分组
    'DEFAULT_THEME'     =>'theme',//使用的模板
    'TMPL_DETECT_THEME' => true, // 自动侦测模板主题
    'LANG_SWITCH_ON'	=>true,//开启语言包
    'URL_MODEL'=>2, // 如果你的环境不支持PATHINFO 请设置为3,设置为2时配合放在项目入口文件一起的rewrite规则实现省略index.php/
    'URL_CASE_INSENSITIVE'=>true,//关闭大小写为true.忽略地址大小写
    'TMPL_CACHE_ON'    => true,        // 是否开启模板编译缓存,设为false则每次都会重新编译
    'TMPL_STRIP_SPACE'      => false,       // 是否去除模板文件里面的html空格与换行

    'APP_ROOT'=>str_replace(array('\\','Conf','config.php','//'), array('/','/','','/'), dirname(__FILE__)),//APP目录物理路径
    'WEB_ROOT'=>str_replace("\\", '/', substr(str_replace('\\Conf\\', '/', dirname(__FILE__)),0,-8)),//网站根目录物理路径
    'WEB_URL'=>"http://".$_SERVER['HTTP_HOST'],//网站域名
    'URL_HTML_SUFFIX'=>".html",//静态文件后缀
    'TMPL_ACTION_ERROR' =>str_replace("\\", '/', substr(str_replace('\\Conf\\', '/', dirname(__FILE__)),0,-8))."/Style/tip/tip.html",//操作错误提示
    'TMPL_ACTION_SUCCESS' =>str_replace("\\", '/', substr(str_replace('\\Conf\\', '/', dirname(__FILE__)),0,-8))."/Style/tip/tip.html",//操作正确提示
    'ERROR_PAGE'	=>'/Public/error.html',

    //数据库配置
    'DB_TYPE'           => 'mysql',
    'DB_HOST'           => '127.0.0.1',
    'DB_NAME'           => 'runze',
    'DB_USER'           => 'root',
    'DB_PWD'            => 'root',
    'DB_PORT'           => '3306',
    'DB_PREFIX'         => 'shang_',
    //'DB_PARAMS'			=>array('persist'=>true),
    //数据库配置
    //子域名配置
    'URL_ROUTER_ON'		=>true,//开启路由规则
    'URL_ROUTE_RULES'	=>array(
        '/^operational$/' => 'Website/tool/finanz',//实时财务
        '/^login$/' => 'User/login/index',
        '/^register/' => 'User/register/index',
        '/^borrow\/post\/([a-zA-z]+)\.html$/' => 'Website/borrow/post?type=:1',//文章栏目页
        '/^tools\/tool.html$/' => 'Website/tool/index',//文章栏目页
        '/^tools\/tool(\d+).html$/' => 'Website/tool/tool:1',//文章栏目页
        '/^invest\/index.html\?(.*)$/' => 'Website/invest/index?:1',//文章栏目页
        '/^invest\/(\d+).html$/' => 'Website/invest/detail?id=:1',//文章栏目页
        '/^invest\/(\d+).html\?(.*)$/' => 'Website/invest/detail?id=:1:2',//文章栏目页
        '/^fund\/index.html\?(.*)$/' => 'Website/fund/index?:1',//基金理财列表页
        '/^fund\/(\d+).html$/' => 'Website/fund/tdetail?id=:1',//基金理财内页
        '/^fund\/(\d+).html\?(.*)$/' => 'Website/fund/tdetail?id=:1:2',//基金理财详情页

        '/^([a-zA-z]+)\/([a-zA-z]+).html(.*)$/' => 'Website/help/index:3',//文章栏目页
        '/^([a-zA-z]+)\/(\d+).html$/' => 'Website/help/view?id=:2',//文章内容页
        '/^([a-zA-z]+)\/id\-(\d+).html$/' => 'Website/help/view?id=:2&type=subsite',//文章内容页
        '/^([a-zA-z]+)\/([a-zA-z]+)\/(\d+).html$/' => 'Website/help/view?id=:3',//文章内容页

    ),

    'SYS_URL'	=>array('admin','service','app'),
    //友情链接
    'FRIEND_LINK'=>array(
        1=>'首页',
        2=>'内页',
    ),
    //友情链接
    'TYPE_SET'=>array(
        1=>'列表页',
        2=>'单页',
        3=>'跳转',
    ),
    'XMEMBER_TYPE'=>array(
        1=>'普通借款者',
        2=>'优良借款者',
        3=>'风险借款者',
        4=>'黑名单',
    ),
    //收费类型
    'MONEY_LOG'=>array(
        2=>'会员操作',//201,202被占用
        3=>'会员充值',
        4=>'充值手续费',
        5=>'申请vip',
        6=>'vip审核通过',
        7=>'vip驳回',
        8=>'投标冻结',
        9=>'投标成功本金解冻',
        10=>'投标成功待收利息',
        11=>'偿还借款(本金)',
        12=>'偿还借款(利息)',
        13=>'还款入账(本金)',
        14=>'还款入账(利息)',

        17=>'借款入账',
        18=>'借款管理费',
        19=>'借款保证金',
        20=>'借款服务费',

        21=>'提现冻结',
        22=>'提现成功',
        23=>'提现撤销',
        24=>'提现失败',

        26=>'解冻保证金',

        30=>'流标返还',
        31=>'复审未通过返还',

        41=>'购买债权',
        42=>'转让债权',
        43=>'债权转让手续费',
        44=>'购买债权,增加待收',
        45=>'转让债权,减少待收',

        50=>'推广奖励',
        51=>'续投奖励(预奖励)',
        52=>'续投奖励',
        53=>'续投奖励(取消)',
        54=>'投标奖励',
        55=>'支付投标奖励',
        56=>'线下充值奖励',
        57=>'加息奖励',
        58=>'特权金收益',

        60=>'优计划投标',
        61=>'优计划待收(本金)',
        62=>'优计划待收(利息)',
        63=>'优计划续投奖励',
        64=>'优计划回购(本金)',
        65=>'优计划回购(利息)',

        71=>'逾期罚息',
        72=>'催收费',
        73=>'利息管理费',

    ),

    'PAYLOG_TYPE'=>array(
        '0'=>'充值未完成',
        '1'=>'充值成功',
        '2'=>'签名不符',
        '3'=>'充值失败'
    ),

    'WITHDRAW_STATUS'=>array(
        '0'=>'待审核',
        '1'=>'审核通过,处理中',
        '2'=>'已提现',
        '3'=>'审核未通过'
    ),

    //积分类型
    'INTEGRAL_LOG'=>array(
//        1=>'还款积分',
        2=>'投资积分',
        3=>'消费积分'
    ),
    //信用积分类型
    'CREDIT_LOG'=>array(
        1=>'上传资料审核',
        2=>'实名认证通过',
        7=>'视频认证通过',
        8=>'现场认证通过',
    ),
    'MARKET_LOG'=>array(
        1=>'积分兑换',
        2=>'积分抽奖',
    ),

    'MARKET_WAY'=>array(
        0=>'虚拟发放',
        1=>'折现',
        2=>'快递',
    ),

    'MARKET_TYPE'=>array(
        0=>'未发放',
        1=>'正在发送中',
        2=>'已发放',
        3=>'领取失败',
    ),
);
?>