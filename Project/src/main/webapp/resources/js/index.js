var sock = null;

$(document).ready(function(){
	   connectWs();		
});


function connectWs(){
	sock = new SockJS( '<c:url value="/echo">');
	socket = sock;
	
	sock.onopen = function(){
		console.log('info: connection opened.');
	};
	
	sock.send = function send(){
		var message = true;
		console.log('전송');
	}
	
	 sock.onclose = function() {
	      	console.log('connect close');
	      	/* setTimeout(function(){conntectWs();} , 1000); */
	    };
	 
	    sock.onerror = function (err) {console.log('Errors : ' , err);};
	 
	   }
