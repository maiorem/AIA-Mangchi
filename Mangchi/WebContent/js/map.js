		var boardLoc = {};
		var listt = new Array();
		var userlist = new Array();


		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다t

		var geocoder = new kakao.maps.services.Geocoder();
		
		
		console.log(userAddr);
		
		var userfunc = function(){
			
		geocoder.addressSearch(userAddr,function(result, status) {
				// 정상적으로 검색이 완료됐으면
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y,
							result[0].x);

					var marker1 = new daum.maps.Marker({
						map : map,
						position : coords
					});

					var requestMessage = '<div style="padding:5px; background-color:white; border: 1px solid #DDD;">요청자 위치</div>';

					var overlay1 = new daum.maps.CustomOverlay({
						content : requestMessage,
						map : map,
						position : marker1.getPosition()
					});

					var coordXY = document.getElementById("result"); // 검색 지도
																		// 경도위도
																		// 알아내기

					var html = "";

					 html += '<input  id="user_latitude" type="hidden" value="';
					 html += result[0].y;
					 html += ' "> ';
					 html += '<input id="user_longitude" type="hidden" value="';
					 html += result[0].x;
					 html += ' "> <br>';

					$("#result").append(html);
					
					userlist.push(result[0].y);
					userlist.push(result[0].x);

				}
				requestfunc();
			});

		
		};
		
		var counter = 0;
	    var total = locationList.length;
		
		var geocoder = new daum.maps.services.Geocoder();

		var requestfunc = function(){
			
			locationList.forEach(function(addr, index) {
				
					geocoder.addressSearch(addr, function(result, status) {
						
							var coords = new daum.maps.LatLng(
									result[0].y, result[0].x);
							
							counter++; // 비동기 콜백이 수행되었으면 하나 업 카운트
							var lat = result[0].y;
							var lon = result[0].x;
							
							boardLoc = {
								lat:lat,
								lon:lon,
								idx:index
							};
							
							listt.push(boardLoc);
							
						   if (total === counter) { // 모든 비동기 콜백이 수행되었다면
						        doSomething(); // 다음 로직으로 넘어갑니다.
					        }
								
				});
			}); // 포문끝
			
			
		};
		
		
		var distanceList = [];
		
		 function doSomething(index) {
			
			 console.log(listt);
   
				var linePath = [];
				var calDistance= new Array();
				
			    var sortingField = "idx";

			    listt.sort(function(a, b) { // 오름차순
			        return a[sortingField] - b[sortingField];
			    });
			    
			    
			    var locPosition = new kakao.maps.LatLng(userlist[0], userlist[1]);
			    map.setCenter(locPosition);
			    

			    
		    for(var i=0;i<listt.length;i++){
		    	
		    	var na1 = new daum.maps.LatLng(listt[i].lat, listt[i].lon);
		    	var na2 = new daum.maps.LatLng(userlist[0], userlist[1])
		    	
					linePath.push(na1);
					linePath.push(na2);
		    }
		    
		    
		  for(var j=0; j<linePath.length; j++){
		    	
		    	
		    	if(j%2 == 0){
		    		
		    		console.log(j);

		    		calDistance.push(linePath[j]);
		    		calDistance.push(linePath[j+1]);
		    		

		    		var polyline = new kakao.maps.Polyline({
						path : calDistance, // 선을 구성하는 좌표배열 입니다
						strokeWeight : 5, // 선의 두께 입니다
						strokeColor : '#FFAE00', // 선의 색깔입니다
						strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에
												// 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});
		
					polyline.setMap(map);
		
					var distance = polyline.getLength();
					var distance = Math.round(distance);
		
					console.log('거리 계산 :' +distance);	
		    		
		    		
		    		calDistance.pop(linePath[j]);
					calDistance.pop(linePath[j+1]);
					
					distanceList.push(distance);
						
		    	}
		    	
		    }// for문
		  
		  var tbd = $('#tbd');
		    var tbd_tr = $('#tbd>tr');
		    
		    for (i=0; i<tbd_tr.length; i++) {
		        td = document.createElement('td');
		        td= tbd_tr[i].appendChild(td);
		        
		        var listdistance = 'listdistance'+i+'';
		        
		        td.setAttribute('class', listdistance);
		        
		        $('.listdistance'+[i]).text(distanceList[i]);
		   }
		  
		    
		 
		 }
		 
		
			
		
var init= function(){
	
	userfunc();
};	
		
init();
