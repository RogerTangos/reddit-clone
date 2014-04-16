ALTER TABLE `post`
ADD CONSTRAINT fk_subreddit_id
FOREIGN KEY (`subreddit_id`)
REFERENCES subreddit(id);