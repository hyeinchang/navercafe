      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
		
		var dataArray = [['DATE', '방문자 전체', '멤버 전체', '비멤버']];
	
		var selectedDates = ['5일', '6일', '7일', '8일']
		var allVisitors = [10, 10, 6, 10];
		var allMembers = [4,4,11,5];
		var nonMembers = [5,6,7,8];
		
		for( var n = 0; n < allVisitors.length; n++ ) {
			dataArray.push([selectedDates[n], allVisitors[n], allMembers[n], nonMembers[n]])
		}
		
		
      function drawChart() {
        var data = google.visualization.arrayToDataTable(dataArray);
        var options = {
          title: '',
          curveType: 'function',
          legend: { position: 'top' }
        };
        

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
		chart.draw(data, options);
	}