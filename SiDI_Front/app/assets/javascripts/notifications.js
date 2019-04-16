function notification(arrNoti,type) {

if(type==1){
	var htmlList = '<a data-toggle="dropdown" href="" class="name"><img src="/assets/globe.png" height="25px" style="margin-left:-12px;"/></a><ul class="dropdown-menu dm-icon pull-right" >';
}else{
	var htmlList = '<img src="/assets/globe.png" height="25px"/><ul class="dropdown-menu dm-icon pull-right" >';
}
// ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
        $('#noti_Counter')
            .css({ opacity: 0 })
            .text(arrNoti.length)
            .css({ top: '-10px' })
            .animate({ top: '-2px', opacity: 1 }, 500);

		for(var i=0;i<arrNoti.length;i++){
			if(type==1){
				htmlList+='<li><a class="masterTooltip" title="'+arrNoti[i]+'" style="color: #fff;"><i class="material-icons" style="font-size:16px;" >&#xE88F;</i> '+arrNoti[i]+'</a></li>';
			}else{
				htmlList+='<li><a class="masterTooltip" title="'+arrNoti[i]+'" style="color: #000;"><i class="md md-info-outline"></i> '+arrNoti[i]+'</a></li>';
			}
		}

	htmlList+='</ul>';
	$('#noti_Button').html(htmlList);
	}

$('.masterTooltip').hover(function(){
		// Hover over code
		var title = $(this).attr('title');
		$(this).data('tipText', title).removeAttr('title');
		$('<p class="tooltip"></p>')
		.text(title)
		.appendTo('body')
		.fadeIn('slow');
	}, function() {
		// Hover out code
		$(this).attr('title', $(this).data('tipText'));
		$('.tooltip').remove();
	}).mousemove(function(e) {
		var mousex = e.pageX + 20; //Get X coordinates
		var mousey = e.pageY + 10; //Get Y coordinates
		$('.tooltip')
		.css({ top: mousey, left: mousex })
});

