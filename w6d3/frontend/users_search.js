const APIUtil = require('./api_util.js');

class UsersSearch {
  constructor ($el, $input, $ul, renderButtons) {
    this.$el = $el;
    this.$input = $input;
    this.$ul = $ul;
    this.renderButtons = renderButtons;
  }
  handleInput() {
    APIUtil.searchUsers(this.$input.val(), this.renderResults.bind(this));
  }
  renderResults(names) {
    console.log(this);
    this.$ul.empty();

    let items = names.map((user) => {
      let ahref = `<a href='/users/${user.id}'>${user.username}</a>`;
      let state = user.followed === 'true' ? "followed" : "unfollowed";

      let button = `<button type="button" class="follow-toggle" data-user=
          '{
          "user_id": "${user.id}",
          "initial_follow_state": "${state}"
          }'>
        </button>`;

      let li = `<li>${ahref} ${button}</li>`;

      return $(li);
    });

    this.$ul.append(items);
    if (items.length > 0) this.renderButtons();
  }
}

module.exports = UsersSearch;
