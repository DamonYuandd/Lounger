// JavaScript Document
function settab(name,m,n)
{
	for(i=1;i<n+1;i++)
	{
		var menu=document.getElementById(name+i);
		var con=document.getElementById("con_"+i);
		con.style.display=i==m?"block":"none";
		menu.className=i==m?"hover":"";
	}
	
}