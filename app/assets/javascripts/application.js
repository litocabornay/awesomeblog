// require jquery3

//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
// require jquery.turbolinks
//= require_tree .
//= require bootstrap




	function entryChange1(){
		radio = document.getElementsByName('type_machine') 
		if(radio[0].checked) {
			//フォーム
			document.getElementById('firstBox').style.display = "block";
			document.getElementById('secondBox').style.display = "none";
			//特典
			document.getElementById('firstNotice').style.display = "block";
		}else if(radio[1].checked) {
			//フォーム
			document.getElementById('firstBox').style.display = "none";
			document.getElementById('secondBox').style.display = "block";
			//特典
			document.getElementById('firstNotice').style.display = "none";
		}else {
			//フォーム
			document.getElementById('firstBox').style.display = "none";
			document.getElementById('secondBox').style.display = "none";
			//特典
			document.getElementById('firstNotice').style.display = "none";
		}
	}
	//オンロードさせ、リロード時に選択を保持
	window.onload = entryChange1;
