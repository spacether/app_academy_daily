/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(0);
const UsersSearch = __webpack_require__(3);

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      type: "POST",
      url: `/users/${id}/follow`,
      dataType: 'json',
      data: {user_id: `${id}`},
    });
  },

  unfollowUser: id => {
    return $.ajax({
      type: "DELETE",
      url: `/users/${id}/follow`,
      dataType: 'json',
      data: {user_id: `${id}`},
    });
  },
  searchUsers: (queryVal, success) => {
    return $.ajax({
      type: "GET",
      url: `/users/search`,
      dataType: 'json',
      data: {query: queryVal},
      success: success
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map