<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String appContext = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ appContext;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>

<link rel="stylesheet" type="text/css"
	href="<%=appContext%>/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=appContext%>/resources/css/jquery-ui.css" />
<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}
</style>
</head>
<body>
	<div class="container">
		<h1 style="text-align: center;">HighCharts点线图</h1>
		<div>
			<input id="spinner" name="value" style="width: 20px"><span>s</span> <input id="changeCron"
				onclick="ChangeCron()" type="button" value="确定">
		</div>
		<div id="container" style="min-width: 400px; height: 400px"></div>
	</div>
</body>
<script src="<%=appContext%>/resources/js/jquery.js"></script>
<script src="<%=appContext%>/resources/js/jquery-ui.js"></script>
<script src="<%=appContext%>/resources/js/select.js"></script>
<script src="<%=appContext%>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=appContext%>/resources/js/highcharts.js"></script>
<script src="<%=appContext%>/resources/js/exporting.js"></script>
<script type="text/javascript">	
	$("#spinner").spinner({
		icons: { down: "ui-icon-triangle-2-s", up: "ui-icon-triangle-2-n" },
		min: 1,
		max: 59
	});
	$("#spinner").spinner("value",2);
    var cron_js = $("#spinner").spinner("value") * 1000;
	
	/*点线图绘制前准备基础数据*/
	var preDate = "1996-03-01 12:20:23";
	var firstDate;
	var data = [];
	var chart,series;
	function activeLastPointToolip(chart) {
        var points = chart.series[0].points;
        chart.tooltip.refresh(points[points.length -1]);
    }
	$.post({
		url: "<%=appContext%>/logined/curveGraph/getGenData",
    	data: JSON.stringify({"date" : preDate}),
    	success: function(data){
    		if(data != null && data != ""){
    			var jsonObj = JSON.parse(data);
        		firstDate = parseInt(jsonObj.date);
        		
        		/*highCharts点线图绘制*/
        	    Highcharts.setOptions({
        	        global: {
        	            useUTC: false
        	        }
        	    });
        	    chart = Highcharts.chart('container',{
        	        chart: {
        	            type: 'spline',
        	            animation: Highcharts.svg, // don't animate in old IE
        	            marginRight: 10,
        	            events: {
        	                load: function () {
        	                    // set up the updating of the chart each second
        	                    var series = this.series[0],
        	                        chart = this;
        	                }
        	            }
        	        },
        	        title: {
        	            text: '动态模拟实时数据'
        	        },
        	        xAxis: {
        	            type: 'datetime',
        	            tickPixelInterval: 150
        	        },
        	        yAxis: {
        	            title: {
        	                text: 'value'
        	            },
        	            min: 1000,
        	            max: 10000,
        	            plotLines: [{
        	                value: 0,
        	                width: 1,
        	                color: '#808080'
        	            }]
        	        },
        	        tooltip: {
        	            formatter: function () {
        	                return '<b>' + this.series.name + '</b><br/>' +
        	                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
        	                    Highcharts.numberFormat(this.y, 2);
        	            }
        	        },
        	        legend: {
        	            enabled: false
        	        },
        	        exporting: {
        	            enabled: false
        	        },
        	        series: [{
        	            name: '随机数据',
        	            data: (function () {
        	                // generate an array of random data
        	                var data = [],
        	                    i;
        	                var test_x,test_y;
        	                for (i = -20; i < 0; i += 1) {
        	                	test_x = firstDate + i * 1000;
        	                	test_y = Math.random() * 10000;
        	                    data.push({
        	                        x: test_x,
        	                        y: test_y
        	                    });
        	                }
        	                return data;
        	            }())
        	        }]
        	    }, function(c) {
        	        activeLastPointToolip(c)
        	    });
        	    series = chart.series[0];
    		}
    	}
	});
	
	window.setInterval(function () {
        $.post({
        	url: "<%= appContext%>/logined/curveGraph/getGenData",
			data : JSON.stringify({
				"date" : preDate
			}),
			success : function(data2) {
				if (data2 != null && data2 != "") {
					var jsonObj = JSON.parse(data2);
					var dateTime = jsonObj.date;
					var val = jsonObj.value;
					
					preDate = formatDateTime(dateTime);
					series.addPoint([ dateTime, val ], true, true);
					activeLastPointToolip(chart);
				}
			}
		});

	}, 1000);
    
    /*变更获取数据时间间隔的点击函数*/
    function ChangeCron(){
		var cron = $("#spinner").spinner("value");
		$.post({
			url: "<%=appContext%>/logined/curveGraph/changeCron",
			data: JSON.stringify({"cron": + cron}),
			success: function(data1){
					
			}
		});
	}
    
    function formatDateTime(inputTime) {    
        var date = new Date(inputTime);  
        var y = date.getFullYear();    
        var m = date.getMonth() + 1;    
        m = m < 10 ? ('0' + m) : m;    
        var d = date.getDate();    
        d = d < 10 ? ('0' + d) : d;    
        var h = date.getHours();  
        h = h < 10 ? ('0' + h) : h;  
        var minute = date.getMinutes();  
        var second = date.getSeconds();  
        minute = minute < 10 ? ('0' + minute) : minute;    
        second = second < 10 ? ('0' + second) : second;   
        return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;    
    };  
</script>
</html>