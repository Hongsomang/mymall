/**
 * 
 */
 
 $(document).ready(function() {
$(".search").on('click',function(){
			console.log("on");
			$(".search_box").removeClass("close");
			//window.scrollTo(0,0);
			$("body").addClass("fix");
		});
		
		$(".bi-x-lg").on('click',function(){
			console.log("off");
			$(".search_box").addClass("close");
			
			$("body").removeClass("fix");
		});
		
});