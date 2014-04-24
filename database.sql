-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2014 at 02:14 AM
-- Server version: 5.6.16
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `reddit`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `upvote` int(11) NOT NULL DEFAULT '1',
  `downvote` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `text`, `post_id`, `user_id`, `upvote`, `downvote`) VALUES
(1, 'Thanks for your input, Tony!', 1, 1, 1, 0),
(2, 'I was so excited for spring, too!', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL,
  `url` varchar(20000) NOT NULL,
  `title` varchar(10000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subreddit_id` int(11) NOT NULL,
  `upvote` int(11) NOT NULL DEFAULT '1',
  `downvote` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_subreddit_id` (`subreddit_id`),
  KEY `fk_user_post_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `url`, `title`, `user_id`, `subreddit_id`, `upvote`, `downvote`, `type`, `time`) VALUES
(1, 'My name is Tony Macie, and I am a retired Sergeant of the U.S. Army. I spent 15 long months in Iraq during the surge in 2006 and 2007. When I returned home from the war, I was diagnosed with post-traumatic stress disorder (PTSD) resulting from a lot of issues ranging from what I experienced during combat and some of the disconnect with my brothers in arms when I transitioned out of the military.\r\nMy symptoms of PTSD became /"treatment-resistant/" after the medication and psychotherapy that the Veterans Affairs provided was ineffective. I began to search for alternative treatment methods, and that''s when I heard about the trial of MDMA-assisted psychotherapy to treat PTSD. After being accepted as a participant and receiving the treatment, I am proud to say that I am no longer on medications, I am able to more fully live my life, and my relationship with PTSD has changed completely.\r\nI truly want anyone who is lost as a result from trauma to be able to have this tool at their disposal. MDMA-assisted psychotherapy opened the doors for me to compassion, love, and moving on. Instead of trying to forget experiences, I focus on learning from them. It also taught me to see the strength of trauma, but yet not forgetting my fellow veterans.\r\nI am only one example of how this treatment can help people overcome PTSD. Studies around the world are gathering evidence suggesting that this treatment method can help people overcome treatment-resistant PTSD.\r\nI''m doing this AMA to answer questions about my experiences, to bring attention to the need for more effective treatment methods for PTSD, and to spread awareness about how MDMA-assisted psychotherapy can help people heal trauma.\r\nI am fully open to discussing all of these things now and seeking to talk to other vets about this. I want all combat veterans to take their tours of duty with pride and not have to feel any disconnect when we come home.\r\nNow I seek to fight a different war and will stand up for all my brothers and sisters who are lost—that is what motivates me.\r\nLearn more about MDMA-assisted psychotherapy and other psychedelic research: http://maps.org and http://mdmaptsd.org\r\nProof: YouTube + reddit', 'My name is Tony Macie, and I am a retired Sergeant of the U.S. Army.', 1, 1, 4002, 958, 2, '2014-04-02 20:45:59'),
(2, 'https://i.imgur.com/qEsHxBf.jpg', 'Spring 2014. Never forget.', 1, 2, 4190, 2, 1, '2014-03-11 20:45:59'),
(3, 'https://i.imgur.com/BFdTh1z.png', 'Hey North Korea, we need to talk...', 1, 1, 4000, 122, 1, '2014-04-13 20:45:59'),
(4, 'I am Gregg Gillis aka Girl Talk. Gonna do this AMA at 4:30pm EST on 4/16.\r\nI recently released the EP "Broken Ankles" with legendary Philadelphia MC, Freeway: http://www.datpiff.com/Girl-Talk-Freeway-Broken-Ankles-EP-mixtape.594399.html\r\nWe also dropped an insane video for the single "Tolerated": http://youtu.be/ySZHeosB0rI\r\nLast Friday I played Coachella with the legends E-40, Too $hort, Juicy J, and Busta Rhymes. Playing there again this Friday with some more special guests...\r\nAsk me some questions.\r\nMy Proof: https://twitter.com/girltalk/status/456144913990578176\r\n', 'I am music producer Girl Talk--AMA!', 6, 1, 506, 11, 2, '2014-04-16 21:46:21'),
(5, 'My short bio: Discovered in the Broadway Play STOMP, I played Jar Jar Binks in the Star Wars Prequels. Since then, I''ve acted written and directed for all screens big and small.\r\nMy Proof: http://www.ahmedbest.com/blog-2/', 'IamA Ahmed Best actor/writer/director, best known for playing Jar Jar Binks in Star Wars Ep. 1,2,3. Ask me Anything!', 3, 1, 1590, 566, 2, '2014-04-21 21:46:21'),
(6, 'In 1971, I was part of a group of activists called the Citizens'' Commission to Investigate the FBI who broke into a small FBI field office in Media, PA. I trained myself as a locksmith and used tools I made to pick the lock to the office door.\r\nA new film telling our story, 1971, will premiere on Friday at the Tribeca Film Festival. You can find out more at 1971film.com (currently down due to HostGator server outage!)\r\nEdit: You can check out the film trailer here: https://movies.yahoo.com/blogs/movie-news/trailer--fbi-whistleblowers-reveal-themselves-in--1971-205728154.html\r\nProof: https://twitter.com/1971Film/status/456556492762525696 NYTimes story with photos of me: http://www.nytimes.com/2014/01/07/us/burglars-who-took-on-fbi-abandon-shadows.html?_r=0\r\nMore background: We took every document in the office, and shared the evidence we found of illegal FBI activity with the American public. The documents we found exposed COINTELPRO for the first time, a massive program of domestic surveillance intended to intimidate dissenters and infringe on our right to free speech.\r\nI''m happy to answer any questions you have. Ask me anything.\r\nEdit: I''m going to have to sign off now--thanks for the questions, everyone. Make sure to check out the film, 1971, at the Tribeca Film Festival this week and next week. It will also be at other festivals this year, and on PBS towards the winter.', 'I''m Keith Forsyth, I broke into the FBI in 1971, and helped uncover COINTELPRO and take down Hoover. Ask me anything.', 3, 1, 1344, 56, 2, '2014-04-16 21:48:27'),
(7, 'I am Gregg Gillis aka Girl Talk. Gonna do this AMA at 4:30pm EST on 4/16.\r\nI recently released the EP "Broken Ankles" with legendary Philadelphia MC, Freeway: http://www.datpiff.com/Girl-Talk-Freeway-Broken-Ankles-EP-mixtape.594399.html\r\nWe also dropped an insane video for the single "Tolerated": http://youtu.be/ySZHeosB0rI\r\nLast Friday I played Coachella with the legends E-40, Too $hort, Juicy J, and Busta Rhymes. Playing there again this Friday with some more special guests...\r\nAsk me some questions.\r\nMy Proof: https://twitter.com/girltalk/status/456144913990578176', 'I am music producer Girl Talk--AMA!', 2, 1, 6543, 20, 2, '2014-04-17 21:48:27'),
(8, 'https://i.imgur.com/LJSwuq2.jpg', 'Tried to take a selfie with my dog..turned out great', 5, 2, 5431, 234, 1, '2014-04-16 21:54:21'),
(9, 'https://i.imgur.com/sSHi4Yh.jpg', 'At dawn', 9, 2, 5432, 4633, 1, '2014-04-07 06:40:21'),
(10, 'https://i.imgur.com/bILKhVT.jpg', 'I see your shower curtain and raise you mine!', 1, 2, 8771, 644, 1, '2014-04-16 21:56:04'),
(11, 'https://i.imgur.com/fDednJY.jpg', 'I wish all women understood this', 6, 2, 4323, 543, 1, '2014-04-07 14:30:24'),
(12, 'https://i.imgur.com/K12xb7n.jpg', 'I always feel like the creepiest person when I do this...', 2, 2, 4234, 653, 1, '2014-04-23 03:36:58'),
(13, 'https://i.imgur.com/bkD0FYW.jpg', 'Reddit...meet Oliver! He''s still learning to cat...', 5, 13, 9124, 49, 1, '2014-04-21 11:18:31'),
(14, 'https://i.imgur.com/JPvwHpL.jpg', 'I''m Sorry. There is a Safe in My New House', 8, 9, 10, 0, 1, '2014-04-21 11:18:31'),
(15, 'https://i.imgur.com/uiTBfDZ.jpg', 'You are making a huge mistake dude', 9, 9, 9024, 350, 1, '2014-04-21 11:22:54'),
(16, 'https://i.imgur.com/hqDIsay.jpg', 'Just realized my open bag looks like a happy whale. Now my life is complete.', 2, 9, 7950, 463, 1, '2014-04-21 11:22:54'),
(17, 'https://i.imgur.com/Vxhe94I.png', 'You''re not as original as you think', 10, 6, 7644, 63, 1, '2014-04-21 11:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `subreddit`
--

CREATE TABLE IF NOT EXISTS `subreddit` (
  `id` int(11) NOT NULL,
  `subreddit` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subreddit`
--

INSERT INTO `subreddit` (`id`, `subreddit`) VALUES
(1, 'iAmA'),
(2, 'funny'),
(3, 'videos'),
(4, 'wtf'),
(5, 'gaming'),
(6, 'AdviceAnimals'),
(7, 'AnimalsBeingJerks'),
(8, 'movies'),
(9, 'pics'),
(10, 'mildlyinteresting'),
(11, 'todayilearned'),
(12, 'gifs'),
(13, 'aww');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'yusuf', 'yusuf'),
(2, 'albert', 'albert'),
(3, 'kanad', 'kanad'),
(4, 'karan', 'karan'),
(5, ' aakanchha', ' aakanchha'),
(6, ' ketki', ' ketki'),
(7, 'foo', 'foo'),
(8, 'bar', 'bar'),
(9, 'fizz', 'fizz'),
(10, 'anon', 'anon');

-- --------------------------------------------------------

--
-- Table structure for table `user_subreddit`
--

CREATE TABLE IF NOT EXISTS `user_subreddit` (
  `user_id` int(11) NOT NULL,
  `subreddit_id` int(11) NOT NULL,
  KEY `fk_user_subreddit_id_1` (`user_id`),
  KEY `fk_user_subreddit_id_2` (`subreddit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_subreddit`
--

INSERT INTO `user_subreddit` (`user_id`, `subreddit_id`) VALUES
(1, 3),
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(2, 8);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_subreddit_id` FOREIGN KEY (`subreddit_id`) REFERENCES `subreddit` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_user_post_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_subreddit`
--
ALTER TABLE `user_subreddit`
  ADD CONSTRAINT `fk_user_subreddit_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_user_subreddit_id_2` FOREIGN KEY (`subreddit_id`) REFERENCES `subreddit` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
