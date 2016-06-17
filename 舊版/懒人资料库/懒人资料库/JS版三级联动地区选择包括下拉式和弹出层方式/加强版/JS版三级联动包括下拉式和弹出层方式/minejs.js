 $(document).ready(function() {
	sel(root3, "departure_one");
});
var opop1;
var opop2;
var opop3;
var n = new Array();
var m = new Array();
function sel(root, id) {
	var gk = new Array("one", "two", "three");
	var k = root.childCategorys;
	var bt = parseInt($("#" + id).attr("bt"));
	var t = $("#" + id).attr("title");
	if (t == "departure") {
		
		n[bt] = new Array();
		n[bt] = k
	} else {
		
		m[bt] = new Array();
		m[bt] = k
	}
	for (var i = 0; i < k.length; i++) {
		$("#" + id ).find("ul").append("<li class = 'list' opop='" + k[i].id + "' id='" + t + "_" + k[i].id + "' bt=" + i + ">" + k[i].title + "</li>");
	}
	
	
//这里需要把click 方法写在函数脸面重注册	
	
	
		$("#"+t+"_"+gk[bt]+" ul li").click(function() {
	/*	var gk = new Array("one", "two", "three"); */
	   
		var t = $(this).parent("ul").parent("div").attr("title");
	    var k = parseInt($(this).parent("ul").parent("div").attr("bt"));
			for(var i = k+1 ; i<=3 ;i++)
			{
				if( i == 1)
				{   
					$("#" + t + "_"+ gk[i]).show(0,function(){
						 var n = i + 1;
					     $("#" + t + "_"+ gk[n]).hide(0);				
						});
					$("#" + t + "_"+ gk[i]).find("ul").html("");
					$("#nimei").val($(this).attr("opop"));	
					opop1 = $(this).attr("opop");
					break;				
				}
				if( i == 2)
				{    
				    
					if(opop2 === ""){
						opop2 = $(this).attr("opop");
						
						$("#nimei").val(opop1 + "-" + opop2);
						}else {
								opop2 = $(this).attr("opop");
								$("#nimei").val(opop1 + "-" + opop2);
							} 			
						
					$("#" + t + "_"+ gk[i]).show();
					$("#" + t + "_"+ gk[i]).find("ul").html("");
					break;
				}
				if(i == 3)
				{
					 if(opop3 == ""){
						
						 opop3 = $(this).attr("opop");
						$("#nimei").val(opop1 + "-" + opop2 + "-" + opop3);
						 }else{
						 opop3 = $(this).attr("opop");
						$("#nimei").val(opop1 + "-" + opop2 + "-" + opop3);
						}
				}
			}
		if ($(this).attr("opop") != "") {
			if (t == "departure") {
				var root = n[k][$("#" + t + "_" + $(this).attr("opop")).attr("bt")];
			} else {
				var root = m[k][$("#" + t + "_" + $(this).attr("opop")).attr("bt")];
				alert(bt);
			}
			sel(root, t + "_" + gk[k + 1]);
		} 
	});
} 