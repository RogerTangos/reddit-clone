global_sort = "top"
global_subreddit = "all"
global_start = 0
global_resultNum=10
global_docHeight=0
# foo = null

fetchTest = (query)->
	console.log query["subreddit"]
	console.log query["sort"]
	$.ajax({
	  type: "POST",
	  url: 'php/test.php',
	  data: {"subreddit": query["subreddit"], 
	  "sort": query["sort"]

	  },
	  	# {"subreddit": order.subreddit, "sort": order.sort},
	  success: (data)->
	  	console.log data
	  	# displayPosts(data)
	  # dataType: 'json'
	});

fetchPosts = (query) ->
	console.log "fetchPosts called"
	if !query["start"]
		query["start"] = 0
	if !query["resultNum"]
		query["resultNum"] = 10

	$.ajax({
	  type: "POST",
	  url: 'php/retrievePosts.php',
	  data: {
	  	"subreddit": query["subreddit"],
	  	"sort": query["sort"]
	  	"start": query["start"]
	  	"resultNum": query["resultNum"]},
	  success: (data)->
	  	# console.log "posts received from db"
	  	console.log data
	  	displayPosts(data)
	  	bindArrows()
	  dataType: 'json'
	});

displayPosts = (data) ->
	console.log "displayAll called"
	for post in data
		id = post['id']
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
		            	<div class='post-image-container'>
							<img class='post-image' src='"+url+"' alt='post image'>
		                </div>
		                <div class='post-text-container'>
		                	<a href='" + url + "'>" + title + "</a>
						
		                	<div></div>
			                <div class='details submission'>submitted by <a href='reddit.com/u/user'>" + username + "</a> to <a href='reddit.com/r/subreddit'>" + subreddit + "</a>
			                </div>
			                <div class='details comments'>" + 
			                Math.floor(Math.random()*100000) + "
			                comments -></div>
		            	</div>
		            </div>
		            <div class='col-md-2 col-lg-2 col-xs-2 '>
		                <div class='vote'>
		                    <span class='glyphicon glyphicon-arrow-up arrow' id='uparrow-"+id+"'></span>
		                    <span class='count' id='post-count-"+id+"'>" + (upvote-downvote) + "</span>
		                    <span class='glyphicon glyphicon-arrow-down arrow' id='downarrow-"+id+"'></span>
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
		                <div class='details comments'> " +
		                Math.floor(Math.random()*100000) + "
		                 comments -></div>
		            </div>
		            <div class='col-md-2 col-lg-2 col-xs-2 '>
		                <div class='vote'>
		                    <span class='glyphicon glyphicon-arrow-up arrow' id='uparrow-"+id+"'></span>
		                    <span class='count' id='post-count-"+id+"'>" + (upvote-downvote) + "</span>
		                    <span class='glyphicon glyphicon-arrow-down arrow' id='downarrow-"+id+"'></span>
		                </div>
		            </div>
		        </div>"
		
		if $(".postrow").last().length > 0
			$(".postrow").last().after(row)
		else
			$('#todo-row').after(row)


vote = (type, id) ->
	console.log "vote called"
	$.ajax({
		type: "POST",
		url: 'php/vote.php',
		data: {"id": id, "type":type},
		success: (data) ->
			console.log "vote success"
			console.log data,
			# console.log $('#post-count'+id)
		dataType: "json"
		})

	post = $("#post-count-" + id)
	total = parseFloat(post.html())
	switch type
		when "upvote" then post.html(total+1)
		when "downvote" then post.html(total-1)

submitPost = (data) ->
	console.log "submit post called"
	console.log data
	title = data["title"]
	url = data["url"]
	subreddit = data["subreddit"]
	type = data["type"]

	$.ajax({
		type: "POST",
		url: "php/submit.php",
		data: {"title":title, "url":url, 
		"subreddit":subreddit, "type":type},
		success: (data) ->
			console.log "submitPost success"
			console.log data
			fetchPosts({"sort":global_sort, "subreddit":global_subreddit})
		})	

bindTabs = ->
	# console.log 'bindTabs called'
	$('#hot').click ->
		$(".postrow").remove()
		$("#sortnav>li.active").removeClass("active")
		$(@).parent().addClass("active");
		global_sort = "top"
		global_subreddit = "all"
		fetchPosts({"sort":global_sort, "subreddit":global_subreddit})	


		
	$('#new').click ->
		$(".postrow").remove()
		$("#sortnav>li.active").removeClass("active")
		console.log @
		$(@).parent().addClass("active");
		global_sort = "new"
		global_subreddit = "all"
		fetchPosts({"sort":global_sort, "subreddit":global_subreddit})
	

	$('#controversial').click ->
		$(".postrow").remove()
		$("#sortnav>li.active").removeClass("active")
		$(@).parent().addClass("active");
		global_sort = "controversial"
		global_subreddit = "all"
		fetchPosts({"sort":global_sort, "subreddit":global_subreddit})

	$('#top').click ->
		$(".postrow").remove()
		$("#sortnav>li.active").removeClass("active")
		$(@).parent().addClass("active");
		global_sort = "top"
		global_subreddit = "all"
		fetchPosts({"sort":global_sort, "subreddit":global_subreddit})

bindArrows = ->
	# console.log "bindArrows called"
	$(".glyphicon-arrow-down").click ->
		$(@).toggleClass("glyphicon-arrow-down-clicked")
		id = $(@).attr('id').match('[0-9]+')[0]
		vote("downvote", id)

	
	$(".glyphicon-arrow-up").click ->
		# console.log "clicked"
		$(@).toggleClass("glyphicon-arrow-up-clicked")
		id = $(@).attr('id').match('[0-9]+')[0]
		vote("upvote", id)
	return

bindSubmit = ->
	$("#submit-link-button").click ->
		# console.log "submit link button clicked"
		title = $("#link-title").val()
		url = $("#link-url").val()
		subreddit = $("#link-subreddit").val()
		# console.log title + url + subreddit 
		submitPost({
			"title":title,
			"url":url,
			"subreddit":subreddit
			"type":1
			})


	$("#submit-text-button").click ->
		# console.log "submit text button clicked"
		title = $("#text-title").val()
		url = $("#text-url").val()
		subreddit = $("#text-subreddit").val() 
		# console.log title + url + subreddit
		submitPost({
			"title":title,
			"url":url,
			"subreddit":subreddit
			"type":2
			})


$(document).ready ->
	# $(".postrow").remove()
	fetchPosts({"sort":"top", "subreddit":"all"})
	bindTabs()
	bindSubmit()