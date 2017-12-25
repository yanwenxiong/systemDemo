<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String appContext = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + appContext;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap 模板</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Site CSS -->
    <link href="<%= appContext %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= appContext %>/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%= appContext %>/resources/css/site.min.css" rel="stylesheet">
    <style>
        .job-hot {
            position: absolute;
            color: #d9534f;
            right: 0;
            top: 15px;
        }

    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicons -->
    <link rel="apple-touch-icon-precomposed" href="<%= appContext %>/resources/images/apple-touch-icon-precomposed.png">
    <link rel="shortcut icon" href="<%= appContext %>/resources/images/favicon.png">

    <script>
        var _hmt = _hmt || [];
    </script>

    <link rel="canonical" href="http://www.bootcss.com/" />
    <script>
        var qqgroup = '318630708';
    </script>
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"><font><font>Toggle navigation</font></font></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand hidden-sm" href="http://www.bootcss.com" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'navbar-首页'])"><font><font>Bootstrap中文网</font></font></a>
        </div>
        <div class="navbar-collapse collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li class="hidden-sm hidden-md"><a href="http://v2.bootcss.com/" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'v2doc'])"><font><font>Bootstrap2中文文档</font></font></a></li>
                <li><a href="http://v3.bootcss.com/" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'v3doc'])"><font><font>Bootstrap3中文文档</font></font></a></li>
                <li><a href="http://v4.bootcss.com/" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'v4doc'])"><font><font>Bootstrap 4.0 预览</font></font></a></li>
                <li><a href="/p/lesscss/" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'less'])"><font><font>Less 教程</font></font></a></li>
                <li><a href="http://www.jquery123.com/" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'jquery'])"><font><font>jQuery API</font></font></a></li>
                <li><a href="http://expo.bootcss.com" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'expo'])"><font><font>网站实例</font></font></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="/about/" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'about'])"><font><font>关于</font></font></a></li>
            </ul>
        </div>
    </div>
</div>
<div style="height: 600px" class="jumbotron masthead">
    <div class="container">
        <h1><font><font>Bootstrap</font></font></h1>
        <h2><font><font>简洁、直观、强悍的前端开发框架，让web开发更迅速、简单。</font></font></h2>
        <p class="masthead-button-links">
            <a class="btn btn-lg btn-primary btn-shadow" href="http://v3.bootcss.com/" target="_blank" role="button" onclick="_hmt.push(['_trackEvent', 'masthead', 'click', 'masthead-Bootstrap3中文文档'])"><font><font>Bootstrap3中文文档(v3.3.7)</font></font></a>
        </p>
        <ul class="masthead-links">
            <li>
                <a href="http://v2.bootcss.com/" target="_blank" role="button" onclick="_hmt.push(['_trackEvent', 'masthead', 'click', 'masthead-Bootstrap2中文文档'])"><font><font>Bootstrap2中文文档(v2.3.2)</font></font></a>
            </li>
        </ul>
    </div>
</div>
<div class="bc-social">
    <div class="container">
        <ul class="bc-social-buttons">
            <li class="social-forum">
                <a class="" href="http://wenda.bootcss.com" title="Bootstrap问答社区" target="_blank" onclick="_hmt.push(['_trackEvent', 'masthead', 'click', 'masthead-Bootstrap问答社区'])">
                    <i class="fa fa-comments"></i><font><font> Bootstrap问答社区
                </font></font></a>
            </li>
            <li class="social-weibo">
                <a href="http://weibo.com/bootcss" title="Bootstrap中文网官方微博" target="_blank" onclick="_hmt.push(['_trackEvent', 'masthead', 'click', 'masthead-新浪微博'])"><i class="fa fa-weibo"></i><font><font> 新浪微博：@Bootstrap中文网</font></font></a>
            </li>
        </ul>
    </div>
</div>

<div id="masonry" class="container-fluid" style="margin-bottom: 15px">
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/1.jpg">标签：风景1</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/2.jpg">标签：风景2</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/3.jpg">标签：风景3</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/4.jpg">标签：风景4</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/5.jpg">标签：风景5</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/6.jpg">标签：风景6</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/1.jpg">标签：风景1</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/2.jpg">标签：风景2</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/3.jpg">标签：风景3</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/4.jpg">标签：风景4</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/5.jpg">标签：风景5</div>
    <div class="thumbnail"><img src="<%= appContext %>/resources/images/6.jpg">标签：风景6</div>
</div>

<!-- Placed at the end of the document so the pages load faster -->
<script src="<%= appContext %>/resources/js/jquery.js"></script>
<script src="<%= appContext %>/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="<%= appContext %>/resources/js/masonry.pkgd.min.js"></script>
<script src="<%= appContext %>/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="<%= appContext %>/resources/js/jquery.unveil.min.js"></script>
<script src="<%= appContext %>/resources/js/jquery.scrollUp.min.js"></script>
<script src="<%= appContext %>/resources/js/toc.min.js"></script>
<script src="<%= appContext %>/resources/js/jquery.matchHeight-min.js"></script>
<script src="<%= appContext %>/resources/js/site.min.js"></script>
<script type="text/javascript">
    $(function() {
        var masonryNode = $('#masonry');
        masonryNode.imagesLoaded(function(){
            masonryNode.masonry({
                itemSelector: '.thumbnail',
                isFitWidth: true
            });
        });
    });

    $(window).scroll(function() {
        if($(document).height() - $(window).height() - $(document).scrollTop() < 10) {
            loadmore();
        }
    });

    function loadmore(){
        var elements = $('<div class="thumbnail"><img src="<%= appContext %>/resources/images/1.jpg">标签：风景1</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/2.jpg">标签：风景2</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/3.jpg">标签：风景3</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/4.jpg">标签：风景4</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/5.jpg">标签：风景5</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/6.jpg">标签：风景6</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/1.jpg">标签：风景1</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/2.jpg">标签：风景2</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/3.jpg">标签：风景3</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/4.jpg">标签：风景4</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/5.jpg">标签：风景5</div>\
                    <div class="thumbnail"><img src="<%= appContext %>/resources/images/6.jpg">标签：风景6</div>');
        $('#masonry').append(elements);
        $('#masonry').masonry('appended', elements, true);
    }
</script>

</body>
</html>