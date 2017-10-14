App.roomCreator = function(roomId, onReceived) {
  App.room = App.cable.subscriptions.create({ channel: "RoomChannel", roomId: roomId }, {
    connected: function() {
      // Called when the subscription is ready for use on the server
      console.log('connected to room channel' + roomId);
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
      console.log('disconnected to room channel');
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      // debugger
      // alert(JSON.stringify(data));
      console.log(JSON.stringify(data));
      onReceived(data);
    },

    speak: function(message) {
      return this.perform('speak', { message: message });
    }
  });
}