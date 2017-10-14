$(document).on('turbolinks:load', function() {
	// document attached events can be applied to future tag, which can be loaded after running these statements.

  if ($(".chat_rooms.show").length > 0) {
  	console.log('chatroom show')
  	const roomId = $("#roomId").val();
  	console.log(roomId);

  	App.roomCreator(roomId, function(data){
  		$("#messages").append(`
  			<div class="card-body">
	  			<h4 class="card-title">${data.message}</h4>
	        <p class="card-text">${data.user_name}</p>
        </div>
  			`);
  	});
  }

  $("[message-submit]").click(function(e) {
  	e.preventDefault();

  	const message = $("#message-content").val();

  	App.room.speak(message);
  });
});
