import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  let room_id = null;
  const room_element = document.getElementById('room-id');  
  if(room_element) {
    room_id = Number(room_element.getAttribute('data-room-id'));
  }

  consumer.subscriptions.create({ channel: "RoomsChannel", room_id }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log('hello');
      if(data.message.body != '') {
        const user_id = Number(document.getElementById('user-id').getAttribute('data-user-id'));
  
        const messages_container = document.getElementById('messages');
        const message = `
          <div class="d-flex flex-column py-2 ${data.message.user_id == user_id ? 'align-items-end' : 'align-items-start'}">
            <div class="message-wrapper px-3 py-1 rounded-pill ${data.message.user_id == user_id ? 'bg-base' : ''} ">
              ${data.message.body}
            </div>
            <div class="text-muted">
              less than 1 minute
            </div>
          </div>`;

        if (messages_container) {
          messages_container.innerHTML = messages_container.innerHTML + message;
        }

        const message_input = document.getElementById('message_body');
        if (user_id == data.user) {
          message_input.value = '';
        }

        messages_container.scrollTo(0,
          document.querySelector("#messages").scrollHeight);
      }
    }
  });
});
