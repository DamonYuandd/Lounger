function getobj(id){
	return document.getElementById(id);	
}

function selecttab(obj, act, def, special, areaname){
	var node = childs(obj.parentNode.parentNode.childNodes);
	for(var i=0;i<node.length;i++){
		if(node[i].className != special){
			node[i].className = def;	
			if(getobj(areaname + "_" + i))
				getobj(areaname + "_" + i).style.display = "none";
		}
	}
	obj.parentNode.className = act;
	for(var i=0;i<node.length;i++){
		if(node[i].className != special){
			if(node[i].className == act){
				if(getobj(areaname + "_" + i))
					getobj(areaname + "_" + i).style.display = "";
			}
		}
	}
}
//å…¼å®¹FFä¸‹çš„childNodes
function childs(nodes)
{
    if(!nodes.length) 
        return [];
    var ret=[];
    for(var i=0;i<nodes.length;i++)
    {
        if(nodes[i].nodeType!=1) 
            continue;
        ret.push(nodes[i]);
    }
    return ret;
}

//ÑéÖ¤Âë
function ChangeVerifyImgNew(url){
	document.getElementById("verifyimg").src = url + 'member/verifyimg.aspx?d=' + Date();
}
