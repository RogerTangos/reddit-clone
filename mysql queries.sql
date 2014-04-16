ALTER TABLE `post`
ADD CONSTRAINT fk_subreddit_id
FOREIGN KEY (`subreddit_id`)
REFERENCES subreddit(id);


INSERT INTO `post`(`id`, `url`, `title`, `user_id`, `subreddit_id`, `upvote`, `downvote`) VALUES (1,"My name is Tony Macie, and I am a retired Sergeant of the U.S. Army.","I'm a veteran who overcame treatment-resistant PTSD after participating in a clinical study of MDMA-assisted psychotherapy. My name is Tony Macie— Ask me anything!",1,1,4000,958)

