const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$( () => {
  const renderButtons = () => {
    console.log("called");
    let $buttons = $('button.follow-toggle');
    $.each($buttons, (index, button) => {
      let $button = $(button);
      let toggle = new FollowToggle($button);
      $button.on("click", event => {
        toggle.handleClick(event);
      });
    });
  };
  renderButtons();

  let $el = $('.users-search');
  let $input = $('.users-search input');
  let $ul = $('.users');
  let search = new UsersSearch($el, $input, $ul, renderButtons);
  $input.on("input", event => {
    search.handleInput();

  });

});
