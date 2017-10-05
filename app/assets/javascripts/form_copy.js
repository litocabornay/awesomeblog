


function copyFormValue(moto,sore){
var om=moto.elements;
var os=document.getElementById(sore).elements;
for(var i=0,m=om.length;i<m;i++){
var f=om[i].type;
if(f!='button') if(f!=os[i].type) { alert('ちがう');return;}
switch(f){
case 'text': case 'textarea': case 'hidden': os[i].value=om[i].value;break;
case 'checkbox': case 'radio': os[i].checked=om[i].checked; break;
case 'select-one': os[i].options[om[i].selectedIndex].selected=true;
}
}
}

