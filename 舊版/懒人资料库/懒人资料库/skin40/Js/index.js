	var left = 0;
		var start = 0;
		var end = 0;
		var obj = document.getElementById("movepart");
		var speed = 20;
		var maxindex = 6;
		var index = 6;
			
		function MoveLeft(){
			if(CheckStatus("left")){
				speed = 16;
				start = left;
				end = left - 125;
				Movel();
				left = left - 125;
			}
		}
		
		function MoveRight(){
			if(CheckStatus("right")){
				speed = 16;
				start = left;
				end = left + 125;
				Mover();
				left = left + 125;
			}
		}
		
		function CheckStatus(dir){
			if(dir == "left"){
				if(index > 0){
					index--;
					if(index == 0){
						document.getElementById("rightbutton").src = "images/index/key_next0.gif";
					}else{
						document.getElementById("leftbutton").src = "images/index/key_pre.gif";
					}
					return true;
				}else
					return false;
			}else if(dir == "right"){
				if(index < maxindex){
					index++;
					if(index == maxindex){
						document.getElementById("leftbutton").src = "images/index/key_pre0.gif";
					}else{
						document.getElementById("rightbutton").src = "images/index/key_next.gif";
					}
					return true;
				}else
					return false;
			}
		}
		
		function Movel(){
			start = start - speed
			speed--;
			obj.style.marginLeft = start + "px";
			if(start > end)
				setTimeout("Movel()",6);
		}
		function Mover(){
			start = start + speed
			speed--;
			obj.style.marginLeft = start + "px";
			if(start < end)
				setTimeout("Mover()",6);
		}