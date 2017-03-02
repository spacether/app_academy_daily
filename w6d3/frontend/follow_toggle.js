const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor ($el) {
    this.userId = $el.data("user").user_id;
    this.followState = $el.data("user").initial_follow_state;
    this.$el = $el;
    this.render(); //$el is NOT the instance of FollowToggle, tis an attribute
  }
  render() {
    let txt = "";
    switch (this.followState) {
      case "followed":
        txt = "Unfollow!";
        break;
      case "unfollowed":
        txt = "Follow!";
        break;
      case "following":
        txt = "Following...";
        break;
      case "unfollowing":
        txt = "Unfollowing...";
        break;
    }
    this.$el.text(txt);
  }
  handleClick(event) {
    event.preventDefault();

    this.$el.attr("disabled", 'disabled');
    if (this.followState === "followed") {
      this.followState = "unfollowing";
    } else {
      this.followState = "following";
    }
    this.render();

    let caller = APIUtil.unfollowUser;
    if (this.followState === "following") caller = APIUtil.followUser;
    caller(this.userId)
      .then( () => this.swap() )
      // .then( this.swap.bind(this) )
      .fail( e => alert(e.statusText) );
  }

  swap() {
    if (this.followState === "unfollowing") {
      this.followState = "unfollowed";
    } else {
      this.followState = "followed";
    }
    this.$el.removeAttr("disabled");
    this.render();
  }

}

module.exports = FollowToggle;











// $.ajax(hash).then( (res) => {
//   this.swap().bind(this);
//   this.render().bind(this);
// });
