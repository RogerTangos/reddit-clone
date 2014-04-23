// Generated by CoffeeScript 1.6.3
var bindArrows, bindAutoScroll, bindSubmit, bindSubreddits, bindTabs, displayPosts, fetchPosts, fetchTest, foo, getDocumentHeight, global_resultNum, global_sort, global_start, global_subreddit, global_title, submitPost, vote;

global_sort = "top";

global_subreddit = "all";

global_start = 0;

global_resultNum = 5;

global_title = null;

foo = null;

getDocumentHeight = function() {
  var D, global_docHeight;
  D = document;
  return global_docHeight = Math.max(Math.max(D.body.scrollHeight, D.documentElement.scrollHeight), Math.max(D.body.offsetHeight, D.documentElement.offsetHeight), Math.max(D.body.clientHeight, D.documentElement.clientHeight));
};

fetchTest = function(query) {
  console.log(query["subreddit"]);
  console.log(query["sort"]);
  return $.ajax({
    type: "POST",
    url: 'php/test.php',
    data: {
      "subreddit": query["subreddit"],
      "sort": query["sort"]
    },
    success: function(data) {
      return console.log(data);
    }
  });
};

fetchPosts = function(query, fun) {
  console.log("fetchPosts called");
  if (!query["start"]) {
    query["start"] = 0;
  }
  if (!query["resultNum"]) {
    query["resultNum"] = global_resultNum;
  }
  if (!query["resultNum"]) {
    query["resultNum"] = global_resultNum;
  }
  if (!query["subreddit"]) {
    query["subreddit"] = global_subreddit;
  }
  if (!query["sort"]) {
    query["sort"] = "top";
  }
  return $.ajax({
    type: "POST",
    url: 'php/retrievePosts.php',
    data: {
      "subreddit": query["subreddit"],
      "sort": query["sort"],
      "start": query["start"],
      "resultNum": query["resultNum"]
    },
    success: function(data) {
      console.log(data);
      displayPosts(data);
      bindArrows();
      if (fun) {
        return fun();
      }
    },
    dataType: 'json'
  });
};

displayPosts = function(data) {
  var downvote, id, post, row, subreddit, title, type, upvote, url, username, _i, _len, _results;
  console.log("displayAll called");
  _results = [];
  for (_i = 0, _len = data.length; _i < _len; _i++) {
    post = data[_i];
    id = post['id'];
    title = post['title'];
    url = post['url'];
    subreddit = post['subreddit'];
    upvote = post['upvote'];
    downvote = post['downvote'];
    type = post['type'];
    username = post['username'];
    row = null;
    if (type === "1") {
      row = "<div class='row postrow'>		            <div class='col-md-10 col-lg-10 col-xs-10 reddit-link'>		            	<div class='post-image-container img-rounded'>							<img class='post-image' src='" + url + "' alt='post image'>		                </div>		                <div class='post-text-container'>		                	<a href='" + url + "'>" + title + "</a>								                	<div></div>			                <div class='details submission'>submitted by <a href='reddit.com/u/user'>" + username + "</a> to <a href='reddit.com/r/subreddit'>" + subreddit + "</a>			                </div>			                <div class='details comments'> <a href='#top-nabar' data-toggle='modal' data-target='#comments-modal'> " + Math.floor(Math.random() * 100000) + "			                comments -></a></div>		            	</div>		            </div>		            <div class='col-md-2 col-lg-2 col-xs-2 '>		                <div class='vote'>		                    <span class='glyphicon glyphicon-arrow-up arrow' id='uparrow-" + id + "'></span>		                    <span class='count' id='post-count-" + id + "'>" + (upvote - downvote) + "</span>		                    <span class='glyphicon glyphicon-arrow-down arrow' id='downarrow-" + id + "'></span>		                </div>		            </div>		        </div>";
    } else if (type === '2') {
      row = "<div class='row postrow'>		            <div class='col-md-10 col-lg-10 col-xs-10 reddit-link'>" + title + "<div></div>		                <div class='details submission'>submitted by <a href='reddit.com/u/user'>" + username + "</a> to <a href='reddit.com/r/subreddit'>" + subreddit + "</a>		                </div>		                <div class='details comments'> <a href='#top-nabar' data-toggle='modal' data-target='#comments-modal'		                onclick='$(\"#comment-title\").val(" + title + ")'> " + Math.floor(Math.random() * 100000) + "			                comments -></a></div>		            </div>		            <div class='col-md-2 col-lg-2 col-xs-2 '>		                <div class='vote'>		                    <span class='glyphicon glyphicon-arrow-up arrow' id='uparrow-" + id + "'></span>		                    <span class='count' id='post-count-" + id + "'>" + (upvote - downvote) + "</span>		                    <span class='glyphicon glyphicon-arrow-down arrow' id='downarrow-" + id + "'></span>		                </div>		            </div>		        </div>";
    }
    if ($(".postrow").last().length > 0) {
      _results.push($(".postrow").last().after(row));
    } else {
      _results.push($('#todo-row').after(row));
    }
  }
  return _results;
};

vote = function(type, id) {
  var post, total;
  console.log("vote called");
  $.ajax({
    type: "POST",
    url: 'php/vote.php',
    data: {
      "id": id,
      "type": type
    },
    success: function(data) {
      console.log("vote success");
      return console.log(data);
    },
    dataType: "json"
  });
  post = $("#post-count-" + id);
  total = parseFloat(post.html());
  switch (type) {
    case "upvote":
      return post.html(total);
    case "downvote":
      return post.html(total);
  }
};

submitPost = function(data) {
  var subreddit, title, type, url;
  console.log("submit post called");
  title = data["title"];
  url = data["url"];
  subreddit = data["subreddit"];
  type = data["type"];
  return $.ajax({
    type: "POST",
    url: "php/submit.php",
    data: {
      "title": title,
      "url": url,
      "subreddit": subreddit,
      "type": type
    },
    success: function(data) {
      console.log("submitPost success");
      $(".postrow").remove();
      return fetchPosts({
        "sort": global_sort,
        "subreddit": subreddit
      });
    }
  });
};

bindTabs = function() {
  $('#hot').click(function() {
    $(".postrow").remove();
    $("#sortnav>li.active").removeClass("active");
    $(this).parent().addClass("active");
    global_sort = "top";
    global_start = 0;
    return fetchPosts({
      "sort": global_sort,
      "subreddit": global_subreddit
    });
  });
  $('#new').click(function() {
    $(".postrow").remove();
    $("#sortnav>li.active").removeClass("active");
    console.log(this);
    $(this).parent().addClass("active");
    global_sort = "new";
    global_start = 0;
    return fetchPosts({
      "sort": global_sort,
      "subreddit": global_subreddit
    });
  });
  $('#controversial').click(function() {
    $(".postrow").remove();
    $("#sortnav>li.active").removeClass("active");
    $(this).parent().addClass("active");
    global_sort = "controversial";
    global_start = 0;
    return fetchPosts({
      "sort": global_sort,
      "subreddit": global_subreddit
    });
  });
  return $('#top').click(function() {
    $(".postrow").remove();
    $("#sortnav>li.active").removeClass("active");
    $(this).parent().addClass("active");
    global_sort = "top";
    global_start = 0;
    return fetchPosts({
      "sort": global_sort,
      "subreddit": global_subreddit
    });
  });
};

bindArrows = function() {
  $(".glyphicon-arrow-down").click(function() {
    var id;
    $(this).toggleClass("glyphicon-arrow-down-clicked");
    id = $(this).attr('id').match('[0-9]+')[0];
    return vote("downvote", id);
  });
  $(".glyphicon-arrow-up").click(function() {
    var id;
    $(this).toggleClass("glyphicon-arrow-up-clicked");
    id = $(this).attr('id').match('[0-9]+')[0];
    return vote("upvote", id);
  });
};

bindSubmit = function() {
  $("#submit-link-button").click(function() {
    var subreddit, title, url;
    title = $("#link-title").val();
    url = $("#link-url").val();
    subreddit = $("#link-subreddit").val();
    return submitPost({
      "title": title,
      "url": url,
      "subreddit": subreddit,
      "type": 1
    });
  });
  return $("#submit-text-button").click(function() {
    var subreddit, title, url;
    title = $("#text-title").val();
    url = $("#text-url").val();
    subreddit = $("#text-subreddit").val();
    return submitPost({
      "title": title,
      "url": url,
      "subreddit": subreddit,
      "type": 2
    });
  });
};

bindAutoScroll = function() {
  console.log("autoscroll binding now");
  return $(window).scroll(function() {
    if ($(window).scrollTop() + $(window).height() === getDocumentHeight()) {
      global_start += 5;
      fetchPosts({
        "subreddit": global_subreddit,
        "sort": global_sort,
        "start": global_start,
        "resultNum": global_resultNum
      });
      return console.log("bottom!");
    }
  });
};

bindSubreddits = function() {
  $("#subreddit-front").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $("#subreddit-all").parent().addClass("active");
    global_subreddit = 'all';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-all").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'all';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-adviceAnimals").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'adviceAnimals';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-animalsbeingjerks").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'animalsbeingjerks';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-aww").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'aww';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-funny").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'funny';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-gaming").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'gaming';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-gifs").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'gifs';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-iAmA").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'iAmA';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-mildlyinteresting").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'mildlyinteresting';
    global_start = 0;
    return fetchPosts({});
  });
  $("#subreddit-movies").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'movies';
    global_start = 0;
    return fetchPosts({});
  });
  return $("#subreddit-pics").click(function() {
    $('.postrow').remove();
    $("#subreddit-menu").children().removeClass("active");
    $(this).parent().addClass("active");
    global_subreddit = 'pics';
    global_start = 0;
    return fetchPosts({});
  });
};

$(document).ready(function() {
  fetchPosts({
    "sort": "top",
    "subreddit": "all"
  }, function() {
    return bindAutoScroll();
  });
  bindTabs();
  bindSubmit();
  bindSubreddits();
  return $('#comments-modal').modal('toggle');
});
