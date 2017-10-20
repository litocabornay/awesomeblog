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
			document.getElementById('secondNotice').style.display = "none";
		}else if(radio[1].checked) {
			//フォーム
			document.getElementById('firstBox').style.display = "none";
			document.getElementById('secondBox').style.display = "block";
			//特典
			document.getElementById('firstNotice').style.display = "none";
			document.getElementById('secondNotice').style.display = "block";
		}else {
			//フォーム
			document.getElementById('firstBox').style.display = "block";
			document.getElementById('secondBox').style.display = "none";
			//特典
			document.getElementById('firstNotice').style.display = "block";
			document.getElementById('secondNotice').style.display = "none";
			
			
		}
	}
	//オンロードさせ、リロード時に選択を保持
	window.onload = entryChange1;




// :javascript
//   $(function() {
//     $('#micropost_content').autocomplete({
//       source: "/users/auto_complete.json",
//       delay: 500,
//       minLength: 2,
//       focus: function(event, ui) {
//         $("#micropost_content").val(ui.item.nickname);
//         return false;
//       },
//       select: function(event, ui) {
//         $('#micropost_content').val(ui.item.nickname);
//         return false;
//       }
//     }).data("ui-autocomplete")._renderItem = function(ul, item) {
//       return $("<li>").attr("data-value", item.nickname).data("ui-autocomplete-item", item).append("<a>" + item.nickname + "</a>").appendTo(ul);
//     };
//   });