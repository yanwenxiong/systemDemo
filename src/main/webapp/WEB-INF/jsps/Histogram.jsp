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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.addFruit{
		padding: 10px;
		width:250px;
		text-align: center;
		float: left;
	}
	.change{
		padding-left: 100px;
		padding-top: 10px;
		width:250px;
		float: left;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="addFruit">
		<div class="input-group">
			<span class="input-group-addon" >水果名称</span>
		 	<input type="text" class="form-control" id="fruitSort">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">销量</span> 
			<input type="text" class="form-control" id="value">
			<span class="input-group-addon">kg</span> 
		</div>
		<br>
		<div class="input-group">
			<input type="button" onclick="addFruit()" value="添加水果">
		</div>
	</div>
	
	<div class="change">
		<div class="input-group">
		<span>水果:</span>
		<select id="fruit">
			<option>苹果</option>
			<option>香蕉</option>
			<option>草莓</option>
			<option>柠檬</option>
			<option>菠萝</option>
			<option>西瓜</option>
			<option>李子</option>
			<option>葡萄</option>
			<option>木瓜</option>
			<option>芒果</option>
			<option>石榴</option>
			<option>樱桃</option>
			<option>猕猴桃</option>
			<option>荔枝</option>
			<option>枇杷</option>
			<option>无花果</option>
			<option>杨桃</option>
			<option>椰子</option>
			<option>杏子</option>
			<option>柚子</option>
		</select>
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">销量</span> 
			<input type="text" class="form-control" placeholder="仅支持两位小数"  id="changeVal">
			<span class="input-group-addon">kg</span> 
		</div>
		<br>
		<div class="input-group">
			<input type="button" onclick="changeValue()" value="更改">
		</div>
	</div>
	<div id="container" style="min-width: 400px; height: 400px"></div>
</body>
<script src="<%=appContext%>/resources/js/jquery.js"></script>
<script src="<%=appContext%>/resources/bootstrap/js/bootstrap.js"></script>
<script src="<%=appContext%>/resources/js/highcharts.js"></script>
<script src="<%=appContext%>/resources/js/exporting.js"></script>
<script type="text/javascript">
		var chart,series;
		var chartData = [ [ '苹果', 24.25 ], [ '香蕉', 23.50 ],
							[ '草莓', 21.51 ], [ '柠檬', 16.78 ],
							[ '菠萝', 16.06 ], [ '西瓜', 15.20 ],
							[ '李子', 14.16 ], [ '葡萄', 13.51 ],
							[ '木瓜', 13.08 ], [ '芒果', 12.44 ],
							[ '石榴', 12.19 ], [ '樱桃', 12.03 ],
							[ '猕猴桃', 10.46 ], [ '荔枝', 10.07 ],
							[ '枇杷', 10.05 ], [ '无花果', 9.99 ],
							[ '杨桃', 9.78 ], [ '椰子', 9.73 ],
							[ '杏子', 9.27 ], [ '柚子', 8.87 ] ];
		chart =Highcharts.chart('container',{
							chart : {
								type : 'column'
							},
							title : {
								text : '水果销量数据'
							},
							subtitle : {
								text : '数据截止 2017-07，来源: <a href="https://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
							},
							xAxis : {
								type : 'category',
								labels : {
									rotation : -45,
									style : {
										fontSize : '13px',
										fontFamily : 'Verdana, sans-serif'
									}
								}
							},
							yAxis : {
								min : 0,
								title : {
									text : '销量 (kg)'
								}
							},
							legend : {
								enabled : false
							},
							tooltip : {
								pointFormat : '销量: <b>{point.y:.2f} kg</b>'
							},
							series : [ {
								name : '水果销量',
								data : chartData,
								dataLabels : {
									enabled : true,
									rotation : -90,
									color : '#FFFFFF',
									align : 'right',
									format : '{point.y:.1f}', // one decimal
									y : 10, // 10 pixels down from the top
									style : {
										fontSize : '13px',
										fontFamily : 'Verdana, sans-serif'
									}
								}
							} ]
						});
	series = chart.series[0];
	function activeLastPointToolip(chart,i) {
        /* var points = chart.series[0].points;
        chart.tooltip.refresh(points[i]); */
    }

	function changeValue(){
		var fruitName = $("#fruit").val();
		var value = $("#changeVal").val();
		var i = 0;
		for(i = 0; i < series.data.length; i++){
			var tempName = series.data[i].name;
			if(tempName == fruitName){	
				break;
			}
		} 

		series.data[i].y = parseFloat(value);

		chart.series[0].setData(series.data,true);
		activeLastPointToolip(chart, i);
	}
	
	function addFruit(){
		var fruitName = $("#fruitSort").val();
		var value = $("#value").val();
		if(!ifExist(fruitName)){
			$("#fruit").append("<option>"+ fruitName + "</option>");
			series.addPoint([ fruitName , parseFloat(value) ], true, false);
		}else{
			alert("水果已经存在");
			/* var i = 0;
			for(i = 0; i < series.data.length; i++){
				var tempName = series.data[i].name;
				if(tempName == fruitName){	
					break;
				}
			} 
			series.data[i].y = parseFloat(value);

			chart.series[0].setData(series.data,true);
			activeLastPointToolip(chart, i); */
		}
	}
	
	function ifExist(value){
		var res = false;
		$("#fruit option").each(function(){
			if($(this).val() == value){
				res = true;
			}
		});
		return res;
	}
</script>
</html>