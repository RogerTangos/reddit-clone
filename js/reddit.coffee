foo = null;


fetchTest = ->
	$.ajax({
	  type: "POST",
	  url: 'php/test.php',
	  data: {"foo":"narf"} 
	  	# {"subreddit": order.subreddit, "sort": order.sort},
	  success: (data)->
	  	console.log data
	  	# displayPosts(data)
	  # dataType: 'json'
	});


fetchPosts = (query) ->
	console.log query.subreddit
	$.ajax({
	  type: "POST",
	  url: 'php/retrievePosts.php',
	  data: {"subreddit": query.subreddit, "sort": query.sort},

	  success: (data)->
	  	console.log data
	  	displayPosts(data)
	  dataType: 'json'
	});

displayPosts = (data) ->
	console.log "displayAll called"

	for post in data
		title = post['title']
		url = post['url']
		subreddit = post['subreddit']
		upvote = post['upvote']
		downvote = post['downvote']
		type = post['type']
		username = post['username']

		row = null;

		if type == "1" #link
			row = 	
				"<div class='row postrow'>
		            <div class='col-md-10 col-lg-10 col-xs-10 reddit-link'>
		                <a href='" + url + "'>" + title + "</a>
		                <div></div>
		                <div class='details submission'>submitted by <a href='reddit.com/u/user'>" + username + "</a> to <a href='reddit.com/r/subreddit'>" + subreddit + "</a>
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
		else if type == '2' #text
			row = 	
				"<div class='row postrow'>
		            <div class='col-md-10 col-lg-10 col-xs-10 reddit-link'>" + 
		                title + 
		               "<div></div>
		                <div class='details submission'>submitted by <a href='reddit.com/u/user'>" + username + "</a> to <a href='reddit.com/r/subreddit'>" + subreddit + "</a>
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


		
		# console.log row;

clearPosts = ->




$(document).ready ->
	console.log "working"
	fetchPosts({sort:"top", subreddit:"all"})
	