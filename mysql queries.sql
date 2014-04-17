ALTER TABLE `post`
ADD CONSTRAINT fk_subreddit_id
FOREIGN KEY (`subreddit_id`)
REFERENCES subreddit(id);


INSERT INTO `post`(`id`, `url`, `title`, `user_id`, `subreddit_id`, `upvote`, `downvote`) VALUES (1,"My name is Tony Macie, and I am a retired Sergeant of the U.S. Army.","I'm a veteran who overcame treatment-resistant PTSD after participating in a clinical study of MDMA-assisted psychotherapy. My name is Tony Macie— Ask me anything!",1,1,4000,958)


-- USER PAGE -------------------------
	SELECT p.url, p.title, p.upvote, p.downvote, p.type, p.time, u.username, s.subreddit FROM 
	`post` as p
	INNER JOIN `user` as u on user_id = u.id
	INNER JOIN `subreddit` as s on subreddit_id = s.id
    WHERE u.id =1
	ORDER BY p.time DESC;


	select c.text, c.upvote, c.downvote
	FROM comment as c
	where c.user_id=1


-- MAIN PAGE -------------------------
	-- query for top
	SELECT `url`, `title`, `upvote`, `downvote`, `type`, `time`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	ORDER BY (upvote-downvote)
	LIMIT 25;

	-- query for controversial
	SELECT distinct `url`, `title`, `upvote`, `downvote`, `time`, `type`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	ORDER BY (upvote + downvote)
	LIMIT 25;

	-- query for NEW
	SELECT distinct `url`, `title`, `upvote`, `downvote`, `time`, `type`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	ORDER BY time DESC
	LIMIT 25;


-- SUBREDDIT PAGE -------------------------
-- query for top
	SELECT `url`, `title`, `upvote`, `downvote`, `type`, `time`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	WHERE subreddit = 'iAmA'
	ORDER BY (upvote-downvote) DESC
	LIMIT 25;

	-- query for controversial
	SELECT `url`, `title`, `upvote`, `downvote`, `time`, `type`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	WHERE subreddit = 'iAmA'
	ORDER BY (upvote + downvote) DESC
	LIMIT 25;

	-- query for NEW
	SELECT `url`, `title`, `upvote`, `downvote`, `time`, `type`, `username`, `subreddit` FROM 
	`post` 
	INNER JOIN `user` on user_id = user.id
	INNER JOIN `subreddit` on subreddit_id = subreddit.id
	WHERE subreddit = 'iAmA'
	ORDER BY time DESC
	LIMIT 25;

-- COMMENTS PAGE -------------------------
	SELECT text, title, c.upvote, c.downvote, u.username 
	FROM `comment` as c 
	INNER JOIN `post` AS p 
	ON post_id = p.id
	INNER JOIN 	`user` as u
	on u.id = c.id
	ORDER BY (c.upvote-c.downvote) DESC












-- query for promoted (need to eliminate guilded section)


url
title
upvote
downvote
type
username
subreddit