import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const post = document.getElementById(`post-${data.post.id}`);

    if (post) {
      const text_input = post.querySelector('#comment_text');
      text_input.value = '';

      const comment = `
        <div class="comment-container w-100">
          <div class="w-100 d-flex py-3">
            <a href="/users/${data.user.id}">
            <img class="user-image" src="${data.avatar}">
            </a>
            <div class="w-100 pl-2">
              <div class="font-weight-bold text-capitalize">
                <a class="text-dark text-decoration-none" href="/users/1">
                ${data.user.fullname}
                </a>
              </div>
              <div class="text-muted">
                ${data.comment.text}
              </div>
            </div>
          </div>
          <div class="d-flex justify-content-end pr-4">
            <a class="text-decoration-none text-base" rel="nofollow" data-method="delete" href="/posts/${data.post.id}/comments/${data.comment.id}">
              <i class="fas fa-trash-alt"></i>
            </a>
          </div>
        </div>
      `;

      const comments_container = post.querySelector('.comments-container');
      comments_container.innerHTML = comments_container.innerHTML + comment;

      const comments = comments_container.querySelectorAll('.comment-container');
      Array.prototype.slice.call(comments).forEach(comment => {
        const trash = comment.querySelector('.fa-trash-alt');

        trash.addEventListener('click', (e) => {
          e.target.parentNode.parentNode.parentNode.remove()
        })
      });
    }
  }
});
