var HashMap=function(){
	var mapVal={};
	var pos=new Array();
	
	this.get=function(key){
		return mapVal[key];
	}
	
	this.getPos=function(n){
		return mapVal[pos[n]];
	}
	
	this.remove=function(n){
		var ary=new Array();
		for(var i=0;i<map.size();i++){
			if(i!=n){
				ary.push(pos[i]);
			}
		}
		pos=ary;
	}
	this.put=function(key, val){
		mapVal[key]=val;
		var flg=true;
		for(var i=0;i<pos.legnth;i++){
			if(key==pos[i]) flg=false;
		}
		if(flg) pos.push(key);
	}
	this.size=function(){
		return pos.length;
	}
}