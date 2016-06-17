// JavaScript Document
function changeURL()
{
	if(document.getElementById('SearchType').options[0].selected)
	{
		document.getElementById('searchform').action=spath + 'list.aspx';
	}
	if(document.getElementById('SearchType').options[1].selected)
	{
		document.getElementById('searchform').action=spath + 'articlelist.aspx';
	}
	if(document.getElementById('SearchType').options[2].selected)
	{
		document.getElementById('searchform').action=spath + 'shippingadvice.aspx';
	}
}

function ChooseSelect()
{

	var url=document.URL;
	if(url.indexOf("list.aspx")!=-1)
	{
		document.getElementById('SearchType').selectedIndex=0;
	}
	else if(url.indexOf("articlelist.aspx")!=-1)
	{
		document.getElementById('SearchType').selectedIndex=1;
	}
	else if(url.indexOf("shippingadvice.aspx")!=-1)
	{
		document.getElementById('SearchType').selectedIndex=2;
	}
}
