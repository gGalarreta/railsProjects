(function($) {
    $(document).ready(function() {
    /* IF YOU WANT TO APPLY SOME BASIC JQUERY TO REMOVE THE VIDEO BACKGROUND ON A SPECIFIC VIEWPORT MANUALLY
     var is_mobile = false;
    if( $('.player').css('display')=='none') {
        is_mobile = true;       
    }
    if (is_mobile == true) {
        //Conditional script here
        $('.big-background, .small-background-section').addClass('big-background-default-image');
    }else{
        $(".player").mb_YTPlayer(); 
    }
    }); */

    /*  IF YOU WANT TO USE DEVICE.JS TO DETECT THE VIEWPORT AND MANIPULATE THE OUTPUT  */

        //Device.js will check if it is Tablet or Mobile - http://matthewhudson.me/projects/device.js/
        if (!device.tablet() && !device.mobile()) {
            $(".player").mb_YTPlayer();
        } else {
            //jQuery will add the default background to the preferred class 
            $('.video-background').addClass(
                'video-background-default-image');
        }
    });
})(jQuery);

function reload(fecha){
		var date = new Date(fecha);
    	var n = date.toDateString();
    	moment.lang('es');
    	var s = moment(n).format('LL');
    	document.getElementById("fechaString").innerHTML = s;
    	
    	var nextYear = moment.tz(fecha, "Mexico/General");
    	
	$('#clock').countdown(nextYear.toDate(), {elapse: true}).on('update.countdown', function(event) {
	if (event.elapsed) { // Either true or false
          location.href="/inicio";
    } else {
       var $this = $(this).html(event.strftime(''
          + '<div><span>%-w</span>semana%!w</div>'
         + '<div><span>%-d</span>dia%!d</div>'
         + '<div><span>%H</span>horas</div>'
         + '<div><span>%M</span>minutos</div>'
         + '<div><span>%S</span>segundos</div>')
        );
     }      
     });
  }     
  function get15dayFromNow() {
	    return new Date(new Date().valueOf() + 1 * 1 * 30 * 60 * 1000);
	  }
 function horario(){
	$('#clock').countdown(get15dayFromNow()).on('update.countdown', function(event) {
       var $this = $(this).html(event.strftime(''
         + '<span>%M</span>min - '
         + '<span>%S</span>seg'));
     });
}


;
