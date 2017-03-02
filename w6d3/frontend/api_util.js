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
