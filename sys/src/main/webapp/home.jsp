<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   
    <link href="<c:url value='/resources/hplus/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/animate.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/style.css'/>" rel="stylesheet">
</head>
<body>

<body class="gray-bg">
    <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-warning" style="font-size:14px">您是否需要自己做一款后台、会员中心等等的，但是又缺乏html等前端知识…
                <br>您是否一直在苦苦寻找一款适合自己的后台主题…
                <br>您是否想做一款自己的web应用程序…
                <br>…………
                <h4 class="text-danger">那么，现在xxxxxx</h4>
            </blockquote>

            <hr>
        </div>
        <div class="col-sm-3">
            <h2>Hello,Guest</h2>
            <small>移动设备访问请扫描以下二维码：</small>
            <br>
            <br>
            <img src="img/qr_code.png" width="100%" style="max-width:264px;">
            <br>
        </div>
        <div class="col-sm-5">
            <h2>
                            后台管理系统
                        </h2>
            <p>xxx是一个完全响应式，基于Bootstrap3.3.4最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.1)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如<b>网站管理后台</b>，<b>网站会员中心</b>，<b>CMS</b>，<b>CRM</b>，<b>OA</b>等等，当然，您也可以对她进行深度定制，以做出更强系统。</p>
            <p>
                <b>当前版本：</b>v3.0.0
            </p>
            <p>
                <b>定价：</b><span class="label label-warning">&yen;768（不开发票）</span>
            </p>
            <br>
            <p>
                <a class="btn btn-success btn-outline" href="xxx" target="_blank">
                    <i class="fa fa-qq"> </i> 联系我
                </a>
                <a class="btn btn-white btn-bitbucket" href="xxx" target="_blank">
                    <i class="fa fa-home"></i> 访问博客
                </a>
            </p>
        </div>
        <div class="col-sm-4">
            <h4>具有以下特点：</h4>
            <ol>
                <li>完全响应式布局（支持电脑、平板、手机等所有主流设备）</li>
                <li>基于最新版本的Bootstrap 3.3.4</li>
                <li>提供3套不同风格的皮肤</li>
                <li>支持多种布局方式</li>
                <li>使用最流行的的扁平化设计</li>
                <li>提供了诸多的UI组件</li>
                <li>集成多款国内优秀插件，诚意奉献</li>
                <li>提供盒型、全宽、响应式视图模式</li>
                <li>采用HTML5 & CSS3</li>
                <li>拥有良好的代码结构</li>
                <li>更多……</li>
            </ol>
        </div>

    </div>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="alert alert-info alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <span class="label label-danger">注意</span> xxxxxx，带有注释、说明和开发文档，方便阅读和二次开发。
                </div>
            </div>
            <div class="col-sm-4">

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>二次开发</h5>
                    </div>
                    <div class="ibox-content">
                        <p>xxxxxx二次开发服务，具体费用请联系作者。</p>
                        <p>同时，我们也提供以下服务：</p>
                        <ol>
                            <li>基于WordPress的网站建设和主题定制</li>
                            <li>PSD转WordPress主题</li>
                            <li>PSD转XHTML</li>
                            <li>Html页面（CSS+XHTML+jQuery）制作</li>
                        </ol>
                    </div>
                </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>联系信息</h5>

                    </div>
                    <div class="ibox-content">
                        <p><i class="fa fa-send-o"></i> 博客：<a href="xxxx" target="_blank">xxxx</a>
                        </p>
                        <p><i class="fa fa-qq"></i> QQ：<a href="xxxxx" target="_blank">xxxx</a>
                        </p>
                        <p><i class="fa fa-weixin"></i> 微信：<a href="javascript:;">xxxx</a>
                        </p>
                        <p><i class="fa fa-credit-card"></i> 支付宝：<a href="javascript:;" class="支付宝信息">xxx / *xxxx</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>更新日志</h5>
                    </div>
                    <div class="ibox-content no-padding">
                        <div class="panel-body">
                            <div class="panel-group" id="version">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v30">v3.0</a><code class="pull-right">2015.08.20更新</code>
                                            </h5>
                                    </div>
                                    <div id="v30" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                                <li>xxxxxxxxxxxxx，感谢你们的不离不弃，一路相伴！ <a href="#" class="viewlog"><i class="fa fa-eye"></i> 查看升级日志</a>
                                                </li>
                                                <li><span class="text-danger">注意：</span>本次更新调整较大，不建议直接覆盖升级！</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v22">v2.2</a>
                                            </h5>
                                    </div>
                                    <div id="v22" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>xxxxxx；
                                                </li>
                                                <li>升级Bootstrap到最新版本v3.3.4；
                                                </li>
                                                <li>修改了style.css，修复了其中的一些bug；
                                                </li>

                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v21">v2.1</a>
                                            </h5>
                                    </div>
                                    <div id="v21" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>增加cdn服务支持，cdn节点使用阿里云服务，可保证您的项目随时使用最新版本的H+，免去反复升级的麻烦；
                                                </li>
                                                <li>修复一些问题；</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v20">v2.0</a>
                                            </h5>
                                    </div>
                                    <div id="v20" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>增加RTL布局及RTL支持，可点击右上角齿轮按钮选择RTL模式查看；
                                                </li>
                                                <li>增加上下布局； <a href="index_4.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>在360浏览器6.0以上版本中强制以webkit内核解析，体验更佳；
                                                </li>
                                                <li>增加<a href="toastr_notifications.html">Toastr通知</a>、<a href="nestable_list.html">嵌套列表</a>、<a href="timeline_v2.html">时间轴</a>、<a href="forum_main.html">论坛</a>、<a href="code_editor.html">代码编辑器</a>、<a href="modal_window.html">模态窗口</a>、<a href="validation.html">表单验证</a>、<a href="tree_view_v2.html">树形视图</a>、<a href="chat_view.html">聊天窗口</a>等页面；
                                                </li>
                                                <li>升级<a href="icons.html">Font Awesome</a>，<a href="form_simditor.html">Simditor</a>等到最新版本；
                                                </li>
                                                <li>优化部分内容
                                                </li>

                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v18">v1.8</a>
                                            </h5>
                                    </div>
                                    <div id="v18" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>修复一些错误；
                                                </li>
                                                <li>修复了WebUploader中的一些问题； <a href="form_webuploader.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v17">v1.7</a>
                                            </h5>
                                    </div>
                                    <div id="v17" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>更新jquery版本到官方最新版v2.1.1；
                                                </li>
                                                <li>更新Bootstrap版本到官方最新版v3.3.0；
                                                </li>
                                                <li>增加jqGrid组件； <a href="table_jqgrid.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>修复Summernote编辑器中的一个严重错误； <a href="form_editors.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>修改了一些已知的bug，并修复了演示示例中的一些错误；
                                                </li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v16">v1.6</a>
                                            </h5>
                                    </div>
                                    <div id="v16" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>优化资源文件路径，删除多余文件
                                                </li>
                                                <li>增加Markdown编辑器 <a href="form_markdown.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>增加拾色器ColorPicker <a href="form_advanced.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>优化部分页面代码
                                                </li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v15">v1.5</a>
                                            </h4>
                                    </div>
                                    <div id="v15" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>增加了Bootstrap3表单构建器，表单设计更轻松； <a href="form_builder.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>修改了webim的高度；
                                                </li>
                                                <li>修复了因缺少jquery.min.map文件而导致页面加载进度条速度过慢的问题；
                                                </li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#version" href="#v14">v1.4</a>
                                            </h4>
                                    </div>
                                    <div id="v14" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>修复了百度ECharts图表显示不正确的问题； <a href="graph_echarts.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>新增表单验证示例，使用jQuery Validate插件实现； <a href="form_validate.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>新增树形视图示例； <a href="tree_view.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>修复弹框遮罩的Bug；
                                                </li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v13">v1.3</a>
                                            </h4>
                                    </div>
                                    <div id="v13" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>加入阿里巴巴团队的字体图标库，字体图标可以自定义啦； <a href="iconfont.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>新增头像裁剪上传组件FullAvatareditor； <a href="form_avatar.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>集成网页弹层插件layer； <a href="layer.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>集成日期选择器layerDate； <a href="layerdate.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li class="text-danger"><b>增加web即时通讯功能，可以在系统内在线聊天了；</b> <a href="webim.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>增加主题预览功能，点击右上侧齿轮图标预览；</li>
                                                <li>增加左侧边栏固定功能；</li>
                                                <li>修复了多处问题。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v12">v1.2</a>
                                            </h4>
                                    </div>
                                    <div id="v12" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>新增百度WebUploader拖动上传文件组件；<a href="form_webuploader.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>新增国产优秀富文本编辑器插件Simditor；<a href="form_simditor.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>新增百度ECharts统计图表插件；<a href="form_simditor.html" title="去看看"><i class="fa fa-eye"></i></a>
                                                </li>
                                                <li>修复了几处问题。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v11">v1.1</a>
                                            </h4>
                                    </div>
                                    <div id="v11" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>修复了几处问题。</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>购买说明</h5>
                    </div>
                    <div class="ibox-content">
                        <p>购买后我可以获得什么？</p>
                        <ol>
                            <li>所有源码(未压缩、带注释版本)；</li>
                            <li>说明文档；</li>
                            <li>终身免费升级服务；</li>
                            <li>必要的技术支持；</li>
                            <li>付费二次开发服务；</li>
                            <li>授权许可；</li>
                            <li>……</li>
                        </ol>
                        <hr>
                        <p>如果需要购买H+主题，可直接付款到支付宝：<a href="javascript;">xxxxx</a>，收款人：<a href="javascript;">*xx</a>。也可以使用手机支付宝或者微信扫码支付：</p>
                        <div class="alert alert-warning">
                            付款完成后请及时联系作者，或在付款备注中留下邮箱或QQ，方便作者及时联系您。
                            <br>如果图片太小，可以点击图片放大。
                        </div>
                        <p id="pay-qrcode">
                            <a href="javascript:;"><img src="xxx" width="100%" alt="请使用手机支付宝或者微信扫码支付">
                            </a>
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </div>


 <script src="<c:url value='/resources/hplus/js/jquery-2.1.1.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/layer/layer.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/content.min.js'/>"></script>
</body>
</html>