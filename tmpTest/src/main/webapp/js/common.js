$(document).ready(function(){
		// opVal = option value 값
		// opTxt = option Text 값
    	$("#ss").change(function(){
    		$('.size').css({'display':'none'});
			var opTxt=["반팔","맨투맨","후드티","후드집업","셔츠","니트","가디건"];
        	var sv =  $(this).val();
        	switch(sv){
        		case "100" :
        			$('.cs').css({'display':'block'});
        			opTxt=["반팔","맨투맨","후드티","후드집업","셔츠","니트","가디건"];
        			
        			break;
        		case "200" :
        			$('.cs').css({'display':'block'});
        			opTxt=["반바지","청바지","슬랙스","트레이닝 바지","레깅스"];
        			break;
        		case "300" :
        			$('.ss').css({'display':'block'});
        			opTxt=["스니커즈","단화","슬리퍼","샌들","부츠","구두"];
        			break;
        		case "400" :
        			opTxt=["백책","크로스백","에코백"];
        			break;
        		case "500" :
        			opTxt=["볼캡","비니"];
        			break;
        		case "600" :
        			opTxt=["양말","케이스","반지","팔찌","목걸이","귀걸이","벨트","지갑"];
        			break;
        	}
        	console.log(opTxt);
        	console.log(sv);
        	$('#selectBox option').remove();
        	$("#ss option[value=0]").remove();
        	for(var i=0; i<opTxt.length;i++){
        		var opVal = parseInt(sv)+i+1;
        		$('#selectBox').append("<option value='"+opVal+"'>"+opTxt[i]+"</option>");
        		console.log(opTxt[i]);
        	}
    	});
})