foo = null;
displayPosts = (data) ->
	for post in data
		title = post['title']
		url = post['url']
		subreddit = post['subreddit']
		upvote = post['upvote']
		downvote = post['downvote']
		type = post['type']
		user_id = post['user_id']

		if type == "1" #link
			row = 	
				"<div class='row postrow'>
		            <div class='col-md-10 col-lg-10 col-xs-10 reddit-link'>
		                <a href='" + url + "'>" + title + "</a>
		                <div></div>
		                <div class='details submission'>submitted by <a href='reddit.com/u/user'>" + user_id + "</a> to <a href='reddit.com/r/subreddit'>" + subreddit + "</a>
		                </div>
		                <div class='details comments'>109234 comments -></div>
		            </div>
		            <div class='col-md-2 col-lg-2 col-xs-2 '>
		                <div class='vote'>
		                    <span class='glyphicon glyphicon-arrow-up arrow'></span>
		                    <span class='count'>" + (upvote-downvote) + " </span>
		                    <span class='glyphicon glyphicon-arrow-down arrow'></span>
		                </div>
		            </div>
		        </div>"	
			$('#todo-row').after(row)

		
		console.log row;

clearPosts = ->


	





$(document).ready ->
	console.log "working"
	
	$.ajax({
	  type: "POST",
	  url: 'php/retrievePosts.php',
	  data: {subreddit:'*', sort:"hot"},
	  success: (data)->
	  	# displayPosts(data)
	  	console.log(data)
	  dataType: 'json'
	});