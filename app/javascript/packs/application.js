// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap-sprockets

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {
  const notification_closer = document.getElementById('close-notification');
  const posts_tab = document.getElementById('posts-tab');
  const following_tab = document.getElementById('following-tab');
  const followers_tab = document.getElementById('followers-tab');
  const heart_buttons = document.getElementsByClassName('fa-heart');
  const comments_container = document.querySelectorAll('.comments-container');
  const messages_container = document.getElementById('messages');
  const rooms_links = document.getElementsByClassName('room-linker');

  if (messages_container) {
    messages_container.scrollTo(0,
      document.querySelector("#messages").scrollHeight);
  }

  if (comments_container) {
    Array.prototype.slice.call(comments_container).forEach(container => {
      const comments = container.querySelectorAll('.comment-container');
      
      if (comments) {
        Array.prototype.slice.call(comments).forEach(comment => {
          const trash = comment.querySelector('.fa-trash-alt');

          if (trash) {
            trash.addEventListener('click', (e) => {
              e.target.parentNode.parentNode.parentNode.remove()
            })
          }
        });
      }
    });
  }

  if (notification_closer) {
    notification_closer.addEventListener('click', (e) => {
      if (e.target.classList.contains('fas')) {
        e.target.parentElement.parentElement.style.display = 'none';
      }
    })
  }

  const switch_content = (new_page_id) => {
    showed_page = document.querySelector('.d-show');
    showed_page.classList.remove('d-show');
    showed_page.classList.add('d-none');

    selected_tab = document.querySelector('.border-base');
    selected_tab.classList.remove('border-base');

    new_page = document.getElementById(new_page_id);
    new_page.classList.add('d-show');
    new_page.classList.remove('d-none');
  }

  if (posts_tab) {
    posts_tab.addEventListener('click', (e) => {
      console.log(e.target);
      switch_content('posts-content');
      e.target.classList.add('border-base');
    })
  }

  if (following_tab) {
    following_tab.addEventListener('click', (e) => {
      switch_content('following-content');
      e.target.classList.add('border-base');
    })
  }

  if (followers_tab) {
    followers_tab.addEventListener('click', (e) => {
      switch_content('followers-content');
      e.target.classList.add('border-base');
    })
  }

  if (heart_buttons) {
    Array.prototype.slice.call(heart_buttons).forEach(like_button => {
      like_button.addEventListener('click', (e) => {
        if (e.target.classList.contains('fas')) {
          number_container = e.target.parentElement.querySelector('span');
          number_container.innerText = Number(number_container.innerText) - 1;
          e.target.classList.remove('fas');
          e.target.classList.add('far');
        }else {
          number_container = e.target.parentElement.querySelector('span');
          number_container.innerText = Number(number_container.innerText) + 1;
          e.target.classList.remove('far');
          e.target.classList.add('fas');
        }
      });
    });
  }

  window.addEventListener('hashchange', () => {
    location.reload();
    return false;
  });

  const reload_page = (e) => {
    location.hash="num=" + parseInt(Math.random()*100)
  }

  Array.prototype.slice.call(rooms_links).forEach(room_link => {
    room_link.addEventListener('click', reload_page);
  });
});
